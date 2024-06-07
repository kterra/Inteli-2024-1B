const sinon = require('sinon');

module.exports = {
  mockAsync(obj, method, returnValue) {
    return sinon.stub(obj, method).resolves(returnValue);
  },
  mockReject(obj, method, error) {
    return sinon.stub(obj, method).rejects(error);
  },
  RESPONSE: {
    status: function(code) {
      this.statusCode = code;
      return this;
    },
    json: function(data) {
      this.body = data;
    },
  },
  USER: {
    name: 'John Doe',
    email: 'john.doe@example.com',
    password: 'password123'
  },

  USER_ID: {
    id: 11,
  }

};
