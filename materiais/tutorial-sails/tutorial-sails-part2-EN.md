# Creating a helper with Sails.js 

[Get instructions Part 1 here.](https://github.com/kterra/Inteli-2024-1B/tree/main/materiais/tutorial-sails/tutorial-sails-part1-EN.md)

Creating a helper function to format email input:
## Step 1: Generating a helper
In the terminal, use the command `sails generate helper format-email`.

## Step 2
Read the instructions returned in the terminal on how to call the function.
`await sails.helpers...`

## Step 3: Implement the helper function in file `api/helpers/format-email.js`
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

## Step 4: Update the create function in file `api/controllers/UsuarioController.js`
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

## Step 5: Validate the site's functionality
Use the command `sails lift` in the terminal to render the website updated version.





