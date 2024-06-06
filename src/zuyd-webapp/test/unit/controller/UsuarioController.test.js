/* eslint-disable linebreak-style */
// test/unit/UsuarioController.test.js
const assert = require('assert');
const controller = require('../../../api/controllers/UsuarioController');
const sails = require('sails');

const { mockAsync, mockReject, RESPONSE, USER } = require('../../util');

describe('UsuarioController', () => {
  
  beforeEach(() => {
    RESPONSE.status.resetHistory();
    RESPONSE.json.resetHistory();
  });

  describe('create', () => {
    it('Deve criar usuário com sucesso', async () => {
      const req = { body: USER };
      const formatInputStub = mockAsync(sails.helpers, 'formatInput', USER.name);
      const formatEmailStub = mockAsync(sails.helpers, 'formatEmail', USER.email);
      const createStub = mockAsync(sails.models.usuario, 'create', USER);

      await controller.create(req, RESPONSE);

      assert.strictEqual(formatInputStub.calledOnceWith(req.body.name), true);
      assert.strictEqual(formatEmailStub.calledOnceWith(req.body.email), true);
      assert.strictEqual(createStub.calledOnceWith({ name: USER.name, email: USER.email, password: USER.password }), true);
      assert.strictEqual(RESPONSE.status.calledOnce, true);
      assert.strictEqual(RESPONSE.json.calledOnce, true);

      formatInputStub.restore();
      formatEmailStub.restore();
      createStub.restore();

    });
  });

  describe('read', () => {
    it('Deve retornar um usuário quando encontrado', async () => {
      const req = { params: { id: USER.id } };
      const findOneStub = mockAsync(sails.models.usuario, 'findOne', USER);

      await controller.read(req, RESPONSE);

      assert.strictEqual(findOneStub.calledOnceWith({ id: USER.id }), true);
      assert.strictEqual(RESPONSE.json.calledOnceWith(USER), true);

      findOneStub.restore();
    });

    it('Deve retornar um erro 404 quando o usuário não for encontrado', async () => {
      const req = { params: { id: USER.id } };
      const error = new Error('Usuário não encontrado');
      const findOneStub = mockReject(sails.models.usuario, 'findOne', error);

      await controller.read(req, RESPONSE);

      assert.strictEqual(findOneStub.calledOnceWith({ id: USER.id }), true);
      assert.strictEqual(RESPONSE.status.calledOnceWith(404), true);
      assert.strictEqual(RESPONSE.json.calledOnceWith({ error: error.message }), true);

      findOneStub.restore();
    });
  });

});

