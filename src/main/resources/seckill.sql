CREATE TABLE `seckill_user`(
	`id` bigint(20) NOT NULL COMMENT '用户ID，手机号码',
	`nickname` varchar(255) NOT NULL COMMENT '昵称',
	`password` varchar(32) DEFAULT NULL COMMENT 'MD5(MD5(pass明文+固定salt)+salt)',
	`salt` varchar(10) DEFAULT NULL,
	`head` varchar(128) DEFAULT NULL COMMENT '头像，云存储的ID',
	`register_date` datetime DEFAULT NULL COMMENT '注册时间',
	`last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
	`login_count` int(11) DEFAULT '0' COMMENT '登录次数',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `goods` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
	`goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
	`goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
	`goods_img` varchar(64) DEFAULT NULL COMMENT '商品的图片',
	`goods_detail` longtext COMMENT '商品的详情介绍',
	`goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
	`goods_stock` int(11) DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
INSERT INTO `goods` VALUES(1,'iPhone X','Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机','/img/iphonex.png','Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机','8388.00','8888')
INSERT INTO `goods` VALUES(2,'MacBook Pro','Apple MacBook Pro 15.4英寸笔记本电脑 银色','/img/macbookpro.png','i7处理器，大容量固态硬盘，外设接口丰富，配备绚丽的retina显示屏，强大而专业！选购AppleCare Protection Plan，获得长达3年来自Apple的额外硬件服务选项。购买勾选：保障服务、原厂保3年。','13599.00','6666')

CREATE TABLE `seckill_goods` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀的商品',
	`goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
	`seckill_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价',
	`stock_count` int(11) DEFAULT NULL COMMENT '库存数量',
	`start_time` datetime DEFAULT NULL COMMENT '秒杀开始时间',
	`end_time` datetime DEFAULT NULL COMMENT '秒杀结束时间',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
INSERT INTO `seckill_goods` VALUES(1,1,0.01,4,'2017-11-05 15:18:00','2018-02-13 14:00:18'),(2,2,0.01,9,'2017-02-05 14:00:00','2018-02-13 14:00:18')

CREATE TABLE `order_info` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
	`goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
	`delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
	`goods_name` varchar(16) DEFAULT NULL COMMENT '冗余过来的商品名称',
	`goods_count` int(11) DEFAULT NULL COMMENT '商品数量',
	`goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
	`order_channel` tinyint(4) DEFAULT '0' COMMENT '1pc, 2android, 3ios',
	`status` tinyint(4) DEFAULT '0' COMMENT '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退款，5已完成',
	`crate_time` datetime DEFAULT NULL COMMENT '订单的创建时间',
	`pay_time` datetime DEFAULT NULL COMMENT '支付时间',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `seckill_order` (
	`id` bigint(20) NOT NULL AUTO_INCREMENT,
	`user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
	`goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
	`order_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- sql

/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.10-log : Database - seckill
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`seckill` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `seckill`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(64) DEFAULT NULL COMMENT '商品的图片',
  `goods_detail` longtext COMMENT '商品的详情介绍',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `goods` */

/*Table structure for table `seckill_goods` */

DROP TABLE IF EXISTS `seckill_goods`;

CREATE TABLE `seckill_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `seckill_price` decimal(10,2) DEFAULT NULL,
  `stock_count` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `seckill_goods` */

/*Table structure for table `seckill_order` */

DROP TABLE IF EXISTS `seckill_order`;

CREATE TABLE `seckill_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `seckill_order` */

/*Table structure for table `seckill_user` */

DROP TABLE IF EXISTS `seckill_user`;

CREATE TABLE `seckill_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID，手机号码',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `password` varchar(32) DEFAULT NULL COMMENT 'MD5(MD5(pass明文+固定salt)+salt)',
  `salt` varchar(10) DEFAULT NULL,
  `head` varchar(128) DEFAULT NULL COMMENT '头像，云存储的ID',
  `register_date` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `seckill_user` */

insert  into `seckill_user`(`id`,`nickname`,`password`,`salt`,`head`,`register_date`,`last_login_date`,`login_count`) values (13000000000,'user0','b7797cce01b4b131b433b6acf4add449','1a2b3c',NULL,'2019-12-29 22:39:03',NULL,1),(13000000001,'user1','b7797cce01b4b131b433b6acf4add449','1a2b3c',NULL,'2019-12-29 22:39:03',NULL,1),(13000000002,'user2','b7797cce01b4b131b433b6acf4add449','1a2b3c',NULL,'2019-12-29 22:39:03',NULL,1),(13000000003,'user3','b7797cce01b4b131b433b6acf4add449','1a2b3c',NULL,'2019-12-29 22:39:03',NULL,1),(13000000004,'user4','b7797cce01b4b131b433b6acf4add449','1a2b3c',NULL,'2019-12-29 22:39:03',NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
