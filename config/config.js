
'use strict';

var configs = require('./config.json');
var path = require('path');

module.exports.getconfig = function () {
  configs.mongoDB = process.env.MONGODB_URL || configs.mongoDB;
  configs.logLevel = process.env.LOG_LEVEL || 'ERROR';
  return configs;
};
