# Testes Unitários com Mocha no Sails.js: Um Guia Prático
Crie testes robustos para sua aplicação Sails.js e garanta a qualidade do seu código.

## Materiais Necessários
1. Mocha: Framework de testes para JavaScript.
2. Sinon: Biblioteca para criar mocks e stubs.
3. Supertest: Biblioteca para testes de integração HTTP.

## Passos
1. Instalando as Ferramentas:
`npm install mocha sinon supertest --save-dev`
2. Organizando os Testes:
Crie a pasta test na raiz do seu projeto Sails.js.
Dentro de test, crie uma subpasta chamada unit para os testes unitários.

3. Configurando o Ambiente de Testes (lifecycle.test.js):
```
// test/lifecycle.test.js
var sails = require("sails");

before(function (done) {
  this.timeout(5000);

  sails.lift(
    {
      hooks: { grunt: false, csrf: false },
      log: { level: "warn" },
    },
    function (err) {
      if (err) {
        return done(err);
      }

      return done();
    }
  );
});

after(function (done) {
  sails.lower(done);
});
```

4. Criando Testes de Controller e Integração:
Exemplo de Teste de Controller (UserController.test.js)
```
// test/unit/UserController.test.js
const assert = require('assert');
const controller = require('../../api/controllers/UserController');
const { mockAsync, RESPONSE, USER, FILE } = require('../util/');

describe('UserController', () => {
    it('Deve criar usuário com sucesso', async () => {
        // ... (seu teste completo)
    });

    it('Deve logar usuário com sucesso', async () => {
        // ... (seu teste completo)
    });
});
```

5. Executando os Testes:
`mocha test/unit/**/*.test.js`