var express = require('express');
var router = express.Router();
const conn = require('../db');

// 修改密码和头像,并返回当前用户信息
router.get('/', function (req, res, next) {
    conn.query('update user set password=? and picture=? where id=?',
        [req.query.password, req.query.picture, req.query.id], function (err, r) {
            if (err) throw err
            if (r.affectedRows > 0) {
                conn.query('select* from user where id=?',
                    req.query.id, function (err, ret) {
                        if (err) throw err
                        res.send(ret)
                })
            } else {
                res.send('修改失败!')
            }
    })
});
 
module.exports = router;
