var express = require('express');
var router = express.Router();
var Comment = require('../dao/comment');

router.get('/:id', function(req, res) {
  Comment.get(req.params.id, function (err, comment) {
    res.render('comments/comment', {comment: comment});
  })
})

module.exports = router;
