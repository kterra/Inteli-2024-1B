/* eslint-disable linebreak-style */
// test/unit/UserController.test.js
const assert = require('assert');
const controller = require('../../api/controllers/UsuarioController');
const sinon = require('sinon');
const sails = require('sails');
const { mockAsync, RESPONSE, USER } = require('../util');
// eslint-disable-next-line linebreak-style

describe('UsuarioController', () => {

  it('Deve criar usuário com sucesso', async () => {
    // Mock request and response objects
    const req = {
      body: {
        name: 'John Doe',
        email: 'john.doe@example.com',
        password: 'password123'
      }
    };

    const res = {
      status: sinon.stub().returnsThis(),
      json: sinon.stub()
    };

    // Mock helpers
    const formatInputStub = sinon.stub(sails.helpers, 'formatInput').resolves('John Doe');
    const formatEmailStub = sinon.stub(sails.helpers, 'formatEmail').resolves('john.doe@example.com');

    // Mock Usuario model
    const newUser = {
      id: 1,
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: 'password123'
    };
    const createStub = sinon.stub(Usuario, 'create').resolves(newUser);

    // Call the create function
    await controller.create(req, res);

    // Assertions
    assert.strictEqual(formatInputStub.calledOnceWith(req.body.name), true, 'formatInput should be called with the correct name');
    assert.strictEqual(formatEmailStub.calledOnceWith(req.body.email), true, 'formatEmail should be called with the correct email');
    assert.strictEqual(createStub.calledOnceWith({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: req.body.password
    }), true, 'create should be called with the correctly formatted data');

    assert.strictEqual(res.status.calledOnceWith(201), true, 'status should be called with 201');
    assert.strictEqual(res.json.calledOnceWith(newUser), true, 'json should be called with the new user');

    // Restore stubs
    formatInputStub.restore();
    formatEmailStub.restore();
    createStub.restore();
  });


});
