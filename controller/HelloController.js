
'use strict';

var helloService = require('../lib/hello-service');
var config = require('../config/config');
var options = config.getconfig();

module.exports.helloWorldService = function helloWorldService(req, res) {
  helloService.getSomeInfo({
    x: 1,
    y:2,
  }, function(err, result){
    if (err){
      return res.json({success: false, error: err.message});
    }
    return res.json({success: true,result: result});
  });
};
