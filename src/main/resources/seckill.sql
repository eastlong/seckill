/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.10-log : Database - miaosha
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`miaosha` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `miaosha`;

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_title` varchar(255) DEFAULT NULL,
  `goods_img` varchar(255) DEFAULT NULL,
  `goods_detail` longtext,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `goods_stock` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_title`,`goods_img`,`goods_detail`,`goods_price`,`goods_stock`) values (1,'iPhoneX','Apple iPhone X (A1865) 64GB 银色 移动联通电信4G手机','https://img10.360buyimg.com/n1/s450x450_jfs/t7297/154/3413903491/65679/45ae4902/59e42830N9da56c41.jpg','超视网膜显示屏，两款大作一起登场。 它们经过精心定制，是 iPhone 色彩精准度最高的 OLED 显示屏，支持 HDR 显示，并能呈现真实深邃的黑色。其中，iPhone XS Max 更拥有 iPhone 迄今最大的显示屏','8765.00',10000),(2,'Mate 20','华为 HUAWEI Mate 20 Pro (UD)屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB亮黑色全网通双4G手机','https://img14.360buyimg.com/n0/jfs/t25288/359/1939640863/406912/ff77e158/5bbf17f0N428d505a.jpg','屏内指纹版麒麟980芯片全面屏超大广角徕卡三摄8GB+128GB亮黑色全网通双4G手机','5999.00',8000);

/*Table structure for table `miaosha_goods` */

DROP TABLE IF EXISTS `miaosha_goods`;

CREATE TABLE `miaosha_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `miaosha_price` decimal(10,2) DEFAULT NULL,
  `stock_count` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `miaosha_goods` */

insert  into `miaosha_goods`(`id`,`goods_id`,`miaosha_price`,`stock_count`,`start_date`,`end_date`) values (1,1,'0.01',52,'2019-01-23 11:54:41','2019-03-07 11:54:45'),(2,2,'0.03',263,'2019-03-05 10:43:53','2019-03-08 10:44:02');

/*Table structure for table `miaosha_order` */

DROP TABLE IF EXISTS `miaosha_order`;

CREATE TABLE `miaosha_order` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `miaosha_order` */

insert  into `miaosha_order`(`id`,`user_id`,`goods_id`,`order_id`) values (00000000000000000007,18912341234,2,6),(00000000000000000006,18912341234,2,5),(00000000000000000008,1,1,7);

/*Table structure for table `miaosha_user` */

DROP TABLE IF EXISTS `miaosha_user`;

CREATE TABLE `miaosha_user` (
  `id` bigint(20) unsigned zerofill NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `head` varchar(255) DEFAULT NULL,
  `register_date` datetime DEFAULT NULL,
  `last_login_date` datetime DEFAULT NULL,
  `login_count` int(11) unsigned zerofill NOT NULL DEFAULT '00000000000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `miaosha_user` */

insert  into `miaosha_user`(`id`,`nickname`,`password`,`salt`,`head`,`register_date`,`last_login_date`,`login_count`) values (00000000018912341234,'18912341234','b7797cce01b4b131b433b6acf4add449','1a2b3c4d',NULL,NULL,NULL,00000000000);

/*Table structure for table `order_info` */

DROP TABLE IF EXISTS `order_info`;

CREATE TABLE `order_info` (
  `id` bigint(20) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `delivery_addr_id` bigint(20) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_count` int(255) DEFAULT NULL,
  `goods_price` decimal(10,2) DEFAULT NULL,
  `order_channel` tinyint(255) DEFAULT NULL,
  `status` tinyint(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `order_info` */

insert  into `order_info`(`id`,`user_id`,`goods_id`,`delivery_addr_id`,`goods_name`,`goods_count`,`goods_price`,`order_channel`,`status`,`create_date`,`pay_date`) values (00000000000000000002,18912341234,1,NULL,'iPhoneX',1,'0.01',1,0,'2019-03-05 08:28:50',NULL),(00000000000000000003,18912341234,1,NULL,'iPhoneX',1,'0.01',1,0,'2019-03-05 08:33:52',NULL),(00000000000000000004,18912341234,2,NULL,'Mate 20',1,'0.03',1,0,'2019-03-06 02:46:05',NULL),(00000000000000000005,18912341234,2,NULL,'Mate 20',1,'0.03',1,0,'2019-03-06 03:05:13',NULL),(00000000000000000006,18912341234,2,NULL,'Mate 20',1,'0.03',1,0,'2019-03-06 09:09:38',NULL),(00000000000000000007,13000000000,1,NULL,'iPhoneX',NULL,NULL,1,0,'2020-03-16 23:12:49',NULL);

/*Table structure for table `seckill_goods` */

DROP TABLE IF EXISTS `seckill_goods`;

CREATE TABLE `seckill_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) DEFAULT NULL,
  `miaosha_price` decimal(10,2) DEFAULT NULL,
  `stock_count` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `seckill_goods` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`avatar`,`create_time`,`email`,`last_login_time`,`last_update_time`,`password`,`phone_number`,`status`) values (1,'18912341234',NULL,NULL,NULL,NULL,NULL,'b7797cce01b4b131b433b6acf4add449',NULL,0),(2,'13000000000',NULL,NULL,NULL,NULL,NULL,'2e65029dcb7a861b3f7d1098da6004be',NULL,1);

/*Table structure for table `user_test` */

DROP TABLE IF EXISTS `user_test`;

CREATE TABLE `user_test` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `user_test` */

insert  into `user_test`(`id`,`name`) values (1001,'hadoop'),(1002,'spark'),(1003,'flink');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
