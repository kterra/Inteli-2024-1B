/**
 * UsuarioController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */


// api/controllers/UsuarioController.js
module.exports = {
  showUserForm: function (req, res) {
    return res.view('pages/crudUserForm');
  },

  create: async function (req, res) {
    try {

      // Formata os dados
      let formattedUserData = {
        name: await sails.helpers.formatInput(req.body.name),
        email: await sails.helpers.formatEmail(req.body.email),
        password: req.body.password
      };

      const newUser = await Usuario.create(formattedUserData);
      
      return res.status(200).json({
        message: 'Usuario criado com sucesso.',
      });
    } catch (err) {
      sails.log(err)
      res.status(500).json({ error: 'Erro ao criar usuário' });
    }
  },

  read: async function (req, res) {
    try {
      const user = await Usuario.findOne({ id: req.params.id });
      if (!user) {
        throw new Error('Usuário não encontrado.');
      }
      res.json(user);
    } catch (err) {
      sails.log(err);
      res.status(404).json({ message: 'Usuário não encontrado.' });
    }
  },

  list: async (req, res) => {
    const user = await Usuario.find();
    return res.json(user);
  },

  update: async function (req, res) {
    try {
      const updatedUser = await Usuario.updateOne({ id: req.params.id }).set(req.body);
      if (!updatedUser) {throw new Error('Usuário não encontrado');}
      res.json(updatedUser);
  
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  },

  delete: async function (req, res) {
    try {
      const deletedUser = await Usuario.destroyOne({ id: req.params.id });
      if (!deletedUser) {throw new Error('Usuário não encontrado');}
      res.json({ message: 'Usuário excluído com sucesso' });
    
    } catch (err) {
      res.status(500).json({ error: err.message });
    }
  }
};

