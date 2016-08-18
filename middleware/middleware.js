/**
 * Created by behnamhajian on 2016-08-17.
 */
var expressSession = require('express-session');
var RedisStore = require('connect-redis')(expressSession);
var redis = require('redis');
var client = redis.createClient();

var session = expressSession({
  secret: 'ssshhhhh',
  store: new RedisStore({
    host: 'localhost',
    port: 6379,
    client: client,
    ttl: 260
  }),
  saveUninitialized: false,
  resave: false,
});

module.exports.session = session;

module.exports.authenticationMiddleware = function authenticationMiddleware () {
  return function (req, res, next) {
    if (req.isAuthenticated()) {
      return next()
    }
    res.redirect('/')
  }
};
