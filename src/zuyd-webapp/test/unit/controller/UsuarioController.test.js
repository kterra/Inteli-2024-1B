/* eslint-disable linebreak-style */
// test/unit/UsuarioController.test.js
const assert = require('assert');
const controller = require('../../../api/controllers/UsuarioController');
const sails = require('sails');

const { mockAsync, mockReject, RESPONSE, USER, USER_ID } = require('../../util');

describe('UsuarioController', () => {
  

  describe('create', () => {
    it('Deve criar usuário com sucesso', async () => {
      const req = { body: USER };
      const formatInputStub = mockAsync(sails.helpers, 'formatInput', USER.name);
      const formatEmailStub = mockAsync(sails.helpers, 'formatEmail', USER.email);
      
      const createStub = mockAsync(Usuario, 'create', USER);

      await controller.create(req, RESPONSE);

      //Assert
      assert.strictEqual(formatInputStub.calledOnceWith(req.body.name), true);
      assert.strictEqual(formatEmailStub.calledOnceWith(req.body.email), true);
      
      assert.strictEqual(createStub.calledOnceWith({ name: USER.name, email: USER.email, password: USER.password }), true);
      assert.strictEqual(RESPONSE.statusCode, 200);
      assert.deepStrictEqual(RESPONSE.body, { message: 'Usuario criado com sucesso.' });

      formatInputStub.restore();
      formatEmailStub.restore();
      createStub.restore();

    });
  });

  describe('read', () => {
    it('Deve retornar um usuário quando encontrado', async () => {
      const req = { params: { id: USER_ID.id } };
      const findOneStub = mockAsync(sails.models.usuario, 'findOne', USER);

     await controller.read(req, RESPONSE);

      assert.strictEqual(findOneStub.calledOnceWith({ id: USER_ID.id }), true);
      assert.strictEqual(RESPONSE.body, USER);

      findOneStub.restore();
    });

    it('Deve retornar um erro 404 quando o usuário não for encontrado', async () => {
      const req = { params: { id: USER_ID.id } };
      const errMessage = 'Usuário não encontrado.';
      const error = new Error(errMessage);
      const findOneStub = mockReject(Usuario, 'findOne', error);

      await controller.read(req, RESPONSE);

      assert.strictEqual(findOneStub.calledOnceWith({ id: USER_ID.id }), true);
      assert.strictEqual(RESPONSE.statusCode, 404);
      assert.deepStrictEqual(RESPONSE.body, { message: errMessage });

      findOneStub.restore();
    });
  });

});

