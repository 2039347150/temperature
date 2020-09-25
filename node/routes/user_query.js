var express = require('express');
var router = express.Router();
const conn = require('../db');

// 获取某个用户信息
router.get('/', function (req, res, next) {
    conn.query('select* from user where id=?', req.query.id,
        function (err, r) {
            if (err) throw err
            res.send(r)
    })
});
 
module.exports = router;
