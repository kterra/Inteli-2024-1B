/**
 * Grupo.js
 *
 * @description :: A model definition represents a database table/collection.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
  attributes: {
    color: {
      type: 'string',
      required: true
    },

    id_tutor: {
      model: 'usuario',
      required: true,
    }
  },

};

