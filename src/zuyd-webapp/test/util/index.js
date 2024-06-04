const sinon = require("sinon");

const mockAsync = (model, module, result = null) => {
  return sinon.stub(model, module).resolves(result);
};

const RESPONSE = {
  json: function (data) {
    return data;
  },
};
const USER = {
  id: 1,
  name: "Kizzy",
  email: "teste@gmail.com",
  password: "123456",
};



module.exports = {
  mockAsync,
  RESPONSE,
  USER,
};