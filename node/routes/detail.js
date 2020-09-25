var express = require('express');
var router = express.Router();
const conn = require('../db');

//显示某一用户打卡详情
router.get('/', function (req, res, next) {
    conn.query('select * from detail where id=?', req.query.id, function (err, r) {
        if (err) throw err
        res.send(r)
  })
});
  
module.exports = router;
