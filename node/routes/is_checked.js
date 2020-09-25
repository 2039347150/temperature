var express = require('express');
var router = express.Router();
const conn = require('../db');

// 打卡成功,并返回该用户信息
router.get('/', function (req, res, next) {
  if ([req.query.checked_days.split(',')][0].indexOf(req.query.checked_time.substr(-2, 2)) !== -1) {
    res.send({status: 'err'})
  } else {
    conn.query(`update user set checked_time = ?, checked_days = "${req.query.checked_days},${req.query.checked_time.substr(-2, 2)}" where id = ?`,
        [req.query.checked_time, req.query.id], function (err, r) {
          if (err) throw err
          if (r.affectedRows > 0) {
            conn.query('select * from user where id = ?', req.query.id, function (err, ret) {
              if (err) throw err
              res.send({data: ret, status: 'success'})
            })
          } else {
            res.send({data: err, status: 'failed'})
          }
        })
  }
})

module.exports = router
