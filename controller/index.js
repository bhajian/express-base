/**
 * Created by behnamhajian on 2016-06-16.
 */

'use strict';


var express = require('express');
var router = express.Router();

router.use('/comments', require('./comments'));
router.use('/users', require('./users'));
router.use('/landing', require('./landing'));

// router.get('/', function(req, res) {
//   res.render('landing');
// })

module.exports = router;