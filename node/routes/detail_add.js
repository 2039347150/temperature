var express = require('express');
var router = express.Router();
const conn = require('../db');

//添加某一用户打卡信息,并返回该用户打卡信息
router.get('/', function (req, res, next) {
    conn.query(`insert into detail(temperature,health_status,apart_status,location)
    values(?,?,?,?) where id=?`, [req.query.temperature, req.query.health_status,
        req.query.apart_status, req.query.location, req.query.id], function (err, r) {
            if (err) throw err
            if (r.affectedRows > 0) {
                conn.query('select* from detail where id=?', req.query.id, function (err, ret) {
                    if (err) throw err
                    res.send(ret)
                })
            } else {
                res.send('添加打卡信息失败!')
            }
    })    
});
 
module.exports = router;
