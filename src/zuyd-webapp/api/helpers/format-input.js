module.exports = {


  friendlyName: 'Format input',


  description: '',


  inputs: {
    text:{
      type: 'string',
      example: 'Ami',
      description: 'Any text input.',
      required: true
    }
  },


  exits: {

    success: {
      description: 'All done.',
    },

  },


  fn: async function (inputs) {
    return inputs.text.trim();
  }


};

