//加载Express模块
const express = require("express");
const bodyParser=require('body-parser')
//加载cors模块
const cors = require("cors");

//加载MySQL模式
const mysql = require("mysql");
const { throws } = require("assert");

//创建MySQL连接池
const pool = mysql.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    database: 'pos',
    connectionLimit: 15
});

//创建Express应用
const server = express();

//使用CROS模块

server.use(cors({
    origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));
//使用body-parser中间件
server.use(bodyParser.urlencoded({extended:false}))
//获取常用商品表
server.get('/offenGoods', (req, res) => {

    //获取数据表的全部记录
    let sql = 'SELECT goodsId,goodsname,price FROM POS_offenGoods';

    //通过MySQL连接池执行SQL语句
    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 1, results: results });
    });
});

//获取所有文章的接口

server.get('/type0Goods', (req, res) => {

    let sql = 'SELECT goodsId, goodsimg,goodsname,price  FROM POS_type0Goods';

    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 2, results: results });
    });
});
server.get('/type1Goods', (req, res) => {

    let sql = 'SELECT goodsId, goodsimg,goodsname,price  FROM POS_type1Goods';

    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 3, results: results });
    });
});
server.get('/type2Goods', (req, res) => {

    let sql = 'SELECT goodsId, goodsimg,goodsname,price  FROM POS_type2Goods';

    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 4, results: results });
    });
});
server.get('/type3Goods', (req, res) => {

    let sql = 'SELECT goodsId, goodsimg,goodsname,price  FROM POS_type3Goods';

    pool.query(sql, (err, results) => {
        if (err) throw err;
        res.send({ message: '查询成功', code: 5, results: results });
    });
});


//指定WEB服务器的监听端口
server.listen(3000, () => {
    console.log('服务器启动...');
});