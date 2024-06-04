// test/unit/UserController.test.js
const assert = require('assert');
const controller = require('../../api/controllers/UsuarioController');
const { mockAsync, RESPONSE, USER } = require('../util');

describe('UsuarioController', () => {

    it('Deve ler usuário com sucesso', async () => {
        const findOneStub = mockAsync(Users, "findOne", USER);
        
        const req = {
          body: {
            id: "1",
          },
        };
    
        const result = await controller.read(req, RESPONSE);
        assert.strictEqual(findOneStub.calledOnce, true);
    
        assert.ok(result.access_token);
});