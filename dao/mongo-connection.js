
'use strict';

var mongoose = require('mongoose');
var config = require('../config/config').getconfig();

function connect(){
  mongoose.Promise = global.Promise;
  mongoose.connect(config.mongoDB);
}

module.exports.connect = connect;
module.exports.mongoose = mongoose;
