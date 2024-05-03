/**
 * UsuarioController
 *
 * @description :: Server-side actions for handling incoming requests.
 * @help        :: See https://sailsjs.com/docs/concepts/actions
 */

  
// api/controllers/UserController.js
module.exports = {
    showCreateForm: function (req, res) {
      return res.view('pages/createUserForm');
    },
  
    create: async function (req, res) {
      try {
        const newUser = await Usuario.create(req.body).fetch();
        res.status(201).json(newUser);
      } catch (err) {
        res.status(500).json({ error: 'Erro ao criar usuário' });
      }
    },
    // Outras funções do controller...
  };

