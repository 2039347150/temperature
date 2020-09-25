const { log } = require('debug');
var express = require('express');
var router = express.Router();
const conn = require('../db');

//登录
router.get('/', function (req, res, next) {
    conn.query('select * from user where username=? and password=?',
        [req.query.username,req.query.password],function (err, r) {
            if (err) throw err
            if (r=='') {
                res.send({ status: 'error' })
            } else {
                res.send({ data: r, status: 'success', token: r[0].id})
            }
  })
});

module.exports = router;
