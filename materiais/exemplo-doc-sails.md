Documentação da Aplicação Sails.js
==================================

Descrição Geral
---------------

Esta documentação fornece uma visão geral da configuração e do uso de uma aplicação Sails.js, incluindo a descrição das bibliotecas utilizadas, a versão do Node.js, e os comandos necessários para migrar tabelas e iniciar a aplicação.

Bibliotecas Utilizadas
----------------------

### Dependências Principais

* **sails**: O framework principal usado para construir a aplicação.
* **sails-disk**: Adaptador de banco de dados para armazenamento local em disco (usado para desenvolvimento).
* **sails-mysql**: Adaptador de banco de dados MySQL.
* **sails-hook-orm**: Hook que gerencia a ORM do Sails.js.
* **lodash**: Biblioteca JavaScript para manipulação de arrays, objetos, etc.
* **async**: Biblioteca para gerenciamento de operações assíncronas.

### Dependências de Desenvolvimento

* **mocha**: Estrutura de testes para Node.js.
* **chai**: Biblioteca de asserção para testes.
* **supertest**: Biblioteca para testes de APIs.

Versão do Node.js
-----------------

A aplicação foi testada e é recomendada para uso com a seguinte versão do Node.js:

* **Node.js v14.x**

Instalação
----------

Para instalar as dependências da aplicação, execute o seguinte comando:

```bash
npm install
```

Configuração do Banco de Dados
------------------------------

Para configurar o banco de dados MySQL, edite o arquivo `config/datastores.js` com suas credenciais de banco de dados:

```javascript
module.exports.datastores = {
  default: {
    adapter: 'sails-mysql',
    url: 'mysql://usuario:senha@host:porta/nome_do_banco',
  },
};
```

Migração de Tabelas
-------------------

Para migrar as tabelas do banco de dados, utilize o comando de sincronização de modelos do Sails.js:

```bash
sails lift
```

Se precisar recriar as tabelas, você pode usar o comando abaixo para reiniciar o banco de dados (cuidado: este comando irá apagar todos os dados):

```bash
sails db:reset
```

Iniciando a Aplicação
---------------------

Para iniciar a aplicação Sails.js, execute o comando:

```bash
sails lift
```

Ou, se preferir, você pode usar o comando do Node.js diretamente:

```bash
node app.js
```

Testes
------

Para executar os testes, use o comando:

```bash
npm test
```

Estrutura de Diretórios
-----------------------

Abaixo está a estrutura básica de diretórios da aplicação Sails.js:

```bash
/api
  /controllers
  /models
  /policies
  /services
/assets
/config
  datastores.js
  routes.js
/views
app.js
package.json
```
