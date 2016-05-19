var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// instructions page
router.get('/instructions', function(req, res, next) {
    res.render('instructions', { title: 'Express' });
});

module.exports = router;
