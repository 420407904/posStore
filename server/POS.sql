#设置客户端连接服务器端编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS POS;
#创建数据库，设置存储的编码
CREATE DATABASE POS CHARSET=UTF8;
#进入数据库
USE POS;
#订单表
CREATE TABLE POS_tableData( 
  tgoodsName  VARCHAR(10) ,
  tprice INT ,
  tcount SMALLINT DEFAULT 1
);
#插入数据
INSERT INTO POS_tableData VALUES('可口可乐',8,1);
INSERT INTO POS_tableData VALUES('香辣鸡腿堡',15,1);
INSERT INTO POS_tableData VALUES('爱心薯条',8,1);
INSERT INTO POS_tableData VALUES('甜筒',8,1);
#常用商品表
CREATE TABLE POS_offenGoods(
	ogoodsId SMALLINT PRIMARY KEY,
	ogoodsName VARCHAR(10),
	oprice SMALLINT
);
INSERT INTO POS_offenGoods VALUES(1,'香辣鸡腿堡',18);
INSERT INTO POS_offenGoods VALUES(2,'田园鸡腿堡',15);
INSERT INTO POS_offenGoods VALUES(3,'凤楼鸡堡',38);
INSERT INTO POS_offenGoods VALUES(4,'快乐全家桶',68);
INSERT INTO POS_offenGoods VALUES(5,'香辣鸡块',20);
INSERT INTO POS_offenGoods VALUES(6,'大块鸡米花',28);
INSERT INTO POS_offenGoods VALUES(7,'雪顶咖啡',18);
INSERT INTO POS_offenGoods VALUES(8,'可乐大杯',10);
#汉堡
CREATE TABLE POS_type0Goods(
	agoodsId SMALLINT PRIMARY KEY,
	agoodsImg VARCHAR(256),
	agoodsName VARCHAR(10),
	aprice SMALLINT
);
INSERT INTO POS_type0Goods VALUES(1,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','香辣鸡腿堡',18);
INSERT INTO POS_type0Goods VALUES(2,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','田园鸡腿堡',18);
INSERT INTO POS_type0Goods VALUES(3,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','凤楼鸡腿堡',18);
INSERT INTO POS_type0Goods VALUES(4,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','快乐全家桶',18);
INSERT INTO POS_type0Goods VALUES(5,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','香辣鸡块',18);
INSERT INTO POS_type0Goods VALUES(6,'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2809766829,3770707334&fm=26&gp=0.jpg','大块鸡米花',18);
