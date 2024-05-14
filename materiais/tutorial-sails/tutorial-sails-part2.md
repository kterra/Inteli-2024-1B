# Tutorial de implementação de CRUD com Sails.js do Backend ao Frontend - Parte 2

Acesse a [parte 1 do tutorial](https://github.com/kterra/Inteli-2024-1B/tree/main/materiais/tutorial-sails/tutorial-sails-part1.md).

Criando uma função helper para formatar entrada de e-mail:

## Passo 1: Gerando um helper
No terminal, utilize o comando `sails generate helper format-email`.

## Passo 2
Leia as instruções retornadas no terminal sobre como chamar a função.
`await sails.helpers...`

## Passo 3: Implemente a função helper no arquivo `api/helpers/format-email.js`
```
module.exports = {

  friendlyName: 'Format email',
  description: 'Format email to lower case and remove spaces.',

  inputs: {
    email: {
      type: 'string',
      example: 'myemail@site.com',
      description: 'The email of the user.',
      required: true
    }

  },

  fn: async function (inputs) {
    return inputs.email.toLowerCase().trim();
  },

  exits: {
    success: {
      description: 'All done.',
    },

  }

};
```

## Passo 4: Atualize a função create no arquivo  `api/controllers/UsuarioController.js`
```
create: async function (req, res) {
    try {

      // Formata os dados
      let formattedUserData = {
        name: req.body.name,
        email: await sails.helpers.formatEmail(req.body.email),
        password: req.body.password
      };

      const newUser = await Usuario.create(formattedUserData).fetch();
      res.status(201).json(newUser);
    } catch (err) {
      res.status(500).json({ error: 'Erro ao criar usuário' });
    }
  },
```

## Passo 5: Valide a funcionalidade do site
Utilize o comando `sails lift` no terminal para renderizar a versão atualizada do site.






