/**
 * Created by behnamhajian on 2016-06-16.
 */

var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('landing', { title: 'Express' });
});

module.exports = router;
