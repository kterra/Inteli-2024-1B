const sinon = require('sinon');

module.exports = {
  mockAsync(obj, method, returnValue) {
    return sinon.stub(obj, method).resolves(returnValue);
  },
  mockReject(obj, method, error) {
    return sinon.stub(obj, method).rejects(error);
  },
  RESPONSE: {
    status: sinon.stub().returnsThis(),
    json: sinon.stub()
  },
  USER: {
    id: 1,
    name: 'John Doe',
    email: 'john.doe@example.com',
    password: 'password123'
  }
};
