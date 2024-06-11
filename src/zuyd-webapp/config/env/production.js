// config/env/production.js
require('dotenv').config();
module.exports = {
  port: process.env.PORT || 1337,
  datastores: {
    default: {
      adapter: 'sails-postgresql',
      url: process.env.DATABASE_URL,
    },
  },
  sockets: {
    onlyAllowOrigins: [
      "https://inteli-2024-1b-1.onrender.com",
    ],
  },
  session: {
    cookie: {
      secure: true,
    }
  },
  http: {
    trustProxy: true,
  }
};

