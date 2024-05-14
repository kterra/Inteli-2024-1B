# Tutorial for Implementing CRUD with Sails.js from Backend to Frontend - Part 1

To follow this tutorial, you need to have a Sails project created. If you don't have one yet, create it using the command:
```
sails new project-name 
```
Then, choose option 2, Empty.

## Step 1: Configure Database Connection

1. Configure the database connection:
- Open the `config/datastores.js` file. Add the connection details, such as:
```
adapter: ‘sails-postgresql’,
url: **Insert your database host URL here**,
ssl: true
```
2. Install the **PostgreSQL** library in your project:
- Use the command **inside your project** folder using the terminal: `npm install sails-postgresql`
- When finished, go to the `package.json` file to check if the installed library has been added as a dependency.
- If you want to access the documentation, visit: [https://www.npmjs.com/package/sails-postgresql](https://www.npmjs.com/package/sails-postgresql).

3. Configure model options:
- Open the `config/models.js` file.
- Set `migrate: 'alter'` so that model changes are automatically reflected in the database.

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
    'showUserForm': true,
    'create': true,
	‘read’: true,
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

## Step 8: Teste o site
Execute o comando `sails lift`.