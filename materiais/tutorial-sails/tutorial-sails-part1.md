# Tutorial de implementação de CRUD com Sails.js do Backend ao Frontend - Parte 1

Para executar este tutorial, você precisa ter um projeto Sails criado. Caso ainda não tenha, crie utilizando o comando: 
```
sails new nome-projeto 
```
Em seguida, escolha a opção 2, Empty.

## Passo 1: Configurar conexão com banco de dados

1. Configure a conexão com o banco de dados:
- Abra o arquivo `config/datastores.js`. Adicione as informações de conexão, como:
```
adapter: ‘sails-postgresql’,
url: '**Insira aqui a URL Externa do host do seu banco de dados criado no Render entre aspas simples **',
ssl: true
```
2. Instale a biblioteca do **PostgreSQL** no seu projeto. 
  - Utilize o comando **dentro da pasta do seu projeto** usando o terminal:
  ```npm install sails-postgresql```
  - Quando terminar, vá no arquivo **package.json** para verificar se a biblioteca instalada foi adicionada como dependência.
  - Caso queira acessar a documentação [https://www.npmjs.com/package/sails-postgresql](https://www.npmjs.com/package/sails-postgresql).
3. Configure as opções do modelo:
   - Abra o arquivo `config/models.js`.
   - Configure `migrate: 'alter'` para que as alterações no modelo sejam automaticamente refletidas no banco de dados.
4. Crie um novo modelo:
    - Execute o comando `sails generate model nome-model`.
    - Isso criará um novo modelo com o nome especificado.
5. Edite o arquivo do modelo criado para adicionar os atributos necessários.


## Passo 2: Criar model `api/models/Usuario.js`
Este model representará a entidade Usuário com campos para nome, email e senha, todos obrigatórios. 

Utilize o comando para criar o model `sails generate model usuario`.

Edite o arquivo `Usuario.js` gerado em `api/models`:
```
module.exports = {
  attributes: {
    name: {
      type: 'string',
      required: true
    },
    email: {
      type: 'string',
      required: true,
      unique: true
    },
    password: {
      type: 'string',
      required: true
    }
  },

};
```
Os desenhos Sails que estão em forma de comentários, você pode apagar.

### Passo 3: Criar Controller `api/controllers/UsuarioController.js` 
Este  controller incluirá métodos para criar e ler usuários.

Utilize o comando para criar o controller `sails generate controller usuario`.

Edite o arquivo `UsuarioController.js` gerado em `api/controllers`.
```
module.exports = {
  showUserForm: function (req, res) {
    return res.view('pages/crudUserForm');
  },

  create: async function (req, res) {
    try {
      const newUser = await Usuario.create(req.body).fetch();
      res.status(201).json(newUser);
    } catch (err) {
      res.status(500).json({ error: 'Erro ao criar usuário' });
    }
  },
read: async function (req, res) {
    try {
      const user = await Usuario.findOne({ id: req.params.id });
      if (!user) {throw new Error('Usuário não encontrado');}
      res.json(user);
    } catch (err) {
      res.status(404).json({ error: err.message });
    }
  },

}; 
```
Os desenhos Sails que estão em forma de comentários, você pode apagar.

## Passo 4: Configurar Rotas em `config/routes.js` 

Adicione as seguintes rotas para manipular os métodos definidos no `UsuarioController`: 
```
'GET /user/create': 'UsuarioController.showUserForm',
'POST /user/create': 'UsuarioController.create',
'GET /user/:id': 'UsuarioController.read',
```


## Passo 5: Criar Interface Front-End 

Crie uma view `crudUserForm.ejs` na pasta `views/pages` com formulário para criar e deletar itens, e  com JavaScript para fazer requisições à API:
```
<!-- views/pages/crudUserForm.ejs -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD de Usuário</title>
</head>
<body>
    <h1>CRUD de Usuário</h1>

    <!-- Formulário de criação de usuário -->
    <h2>Criar Novo Usuário</h2>
    <form action="/user/create" method="post">
        <label for="name">Nome:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Criar Usuário</button>
    </form>

    <!-- Formulário de leitura de usuário -->
    <h2>Buscar Usuário</h2>
    <form id="searchForm">
        <label for="userId">ID do Usuário:</label>
        <input type="text" id="userId" name="id" required><br>
        <button type="button" onclick="searchUser()">Buscar Usuário</button>
    </form>


   <script>
   function searchUser() {
      var userId = document.getElementById("userId").value;
            window.location.href = "/user/" + userId; }
         
        
    </script>
</body>
</html>
```

## Passo 6: Configurar Políticas em `config/policies.js` 
Configure as políticas de acesso para o controlador `ItemController`, permitindo acesso  irrestrito aos métodos definidos: 
```
module.exports.policies = { 
   'UsuarioController': {
    '*': true, // Permite acesso a todos os métodos de UsuarioController sem restrições
  }
}; 
```

## Passo 7: Configurar Segurança em `config/security.js` 
Configure as definições de segurança para permitir requisições de diferentes origens e  desabilitar CSRF por padrão: 
```
module.exports.security = { 
 cors: { 
 allRoutes: true,
 allowOrigins: '*', 
 allowCredentials: false, 
 allowRequestMethods: 'GET, POST, PUT, DELETE, OPTIONS', 
 allowRequestHeaders: 'content-type, Authorization' 
 } 
 //csrf: true 
}; 
```

## Passo 8: Teste o site
Execute o comando `sails lift`.

## Agora, adicione a operação de atualização de usuário (Update)
1. Atualizar  Controller `UsuarioController.js` . Adicione a função update.
```
update: async function (req, res) {
    try {
      const updatedUser = await Usuario.updateOne({ id: req.params.id }).set(req.body);
      if (!updatedUser) {throw new Error('Usuário não encontrado');}
      res.json(updatedUser);
  
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  },
```

2. Configure a rota de atualização em `config/routes.js` (Atente-se aos casos em que é necessário especificar o tipo de requisição HTTP na rota).
```
'PUT /user/:id': 'UsuarioController.update'
```
3. Atualize a View `crudUserForm.ejs.` com o formulário de atualização.
```
<!-- Formulário de atualização de usuário -->
    <h2>Atualizar Usuário</h2>
    <form id="updateForm">
        <label for="updateId">ID do Usuário:</label>
        <input type="text" id="updateId" name="id" required><br>
        <label for="updateName">Novo Nome:</label>
        <input type="text" id="updateName" name="name" required><br>
        <label for="updateEmail">Novo Email:</label>
        <input type="email" id="updateEmail" name="email" required><br>
        <label for="updatePassword">Nova Senha:</label>
        <input type="password" id="updatePassword" name="password" required><br>
        <button type="button" onclick="updateUser()">Atualizar Usuário</button>
    </form>

    <script>
        function updateUser() {
        var userId = document.getElementById("updateId").value;
        var newName = document.getElementById("updateName").value;
        var newEmail = document.getElementById("updateEmail").value;
        var newPassword = document.getElementById("updatePassword").value;
        
        fetch('/user/' + userId, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: newName,
                email: newEmail,
                password: newPassword
            })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Erro ao atualizar usuário');
            }
           window.location.href = "/user/" + userId;
        })
        .then(result => console.log('Usuário atualizado com sucesso: ', result)) 
        .catch(error => {
            console.error('Erro:', error);
           
        });
        
    }

        
    </script>
```

4. Valide a comunicação com o servidor observando o console no navegador.
