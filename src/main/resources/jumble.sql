/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : jumble

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-15 19:58:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zh` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `pwd` varchar(80) NOT NULL,
  `sex` int(4) NOT NULL,
  `email` varchar(60) NOT NULL,
  `ipone` varchar(11) NOT NULL,
  `adress` varchar(60) NOT NULL,
  `creat_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '12345@', '张三', '12345', '1', '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-10 19:19:44', '2018-04-14 15:48:24');
INSERT INTO `admin` VALUES ('2', '111111111111111', '张张', '1111', '1', '111111111', '1111111', '重庆', '2018-04-11 21:18:00', null);
INSERT INTO `admin` VALUES ('7', 'taotao@buxiw', '保险', '123456', '0', '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-14 15:56:12', null);
INSERT INTO `admin` VALUES ('6', '111111111111111', '张张', '1111', '1', '111111111', '1111111', '重庆', '2018-04-11 21:18:00', null);

-- ----------------------------
-- Table structure for `contribution`
-- ----------------------------
DROP TABLE IF EXISTS `contribution`;
CREATE TABLE `contribution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mid` bigint(20) NOT NULL COMMENT '捐钱的',
  `qid` bigint(20) NOT NULL COMMENT '求助信息表',
  `quid` bigint(20) NOT NULL COMMENT '求助者id',
  `money` int(10) NOT NULL COMMENT '钱',
  `creat_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contribution
-- ----------------------------
INSERT INTO `contribution` VALUES ('1', '1', '1', '1', '100', '2018-04-15 16:45:57');
INSERT INTO `contribution` VALUES ('2', '1', '1', '1', '100', '2018-04-15 19:36:37');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '义捐物品id',
  `name` varchar(100) NOT NULL,
  `pice` int(20) NOT NULL,
  `gurl` varchar(300) NOT NULL COMMENT '物品图片地址',
  `content` varchar(300) NOT NULL,
  `uid` bigint(20) NOT NULL COMMENT '会员id',
  `count` int(10) NOT NULL COMMENT '数量',
  `type` int(4) NOT NULL COMMENT '物品状态 0 以创建 1 未通过 2 已通过 3以卖出',
  `aid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `message` varchar(200) DEFAULT NULL COMMENT '理由',
  `creat_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('14', 'img\\goods\\1523633186842.gif', '111', '1523634818096.jpg;1523634818096.jpg', 'img\\goods\\1523633186842.gif', '1', '11', '3', null, '可以东西不错', '2018-04-13 23:45:25', '2018-04-15 14:11:56');
INSERT INTO `goods` VALUES ('15', '你妈逼', '222', '1523634818096.jpg;1523634818096.jpg', '你妈逼你妈逼你妈逼', '1', '2', '2', '1', '哈哈哈哈h', '2018-04-13 23:53:38', null);
INSERT INTO `goods` VALUES ('16', '好东西', '200', '1523792825084.jpg;1523792825088.jpg;', '恒大；安静看来大家来快点啦', '1', '2', '1', '1', '嗯不', '2018-04-15 19:47:05', null);
INSERT INTO `goods` VALUES ('17', '好东西1', '200', '1523793243624.jpg;1523793243629.jpg;1523793243636.jpg;', '号；拉啊啦啦；阿妈啦麻烦、啦', '1', '2', '0', null, null, '2018-04-15 19:54:03', null);

-- ----------------------------
-- Table structure for `money`
-- ----------------------------
DROP TABLE IF EXISTS `money`;
CREATE TABLE `money` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` int(10) NOT NULL COMMENT '义卖总资金',
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of money
-- ----------------------------
INSERT INTO `money` VALUES ('1', '10300', '2018-04-15 19:52:16');

-- ----------------------------
-- Table structure for `order_user`
-- ----------------------------
DROP TABLE IF EXISTS `order_user`;
CREATE TABLE `order_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gid` bigint(20) NOT NULL COMMENT '物品id',
  `pice` int(10) NOT NULL,
  `sid` bigint(20) NOT NULL COMMENT '卖家id',
  `bid` bigint(20) NOT NULL COMMENT '买家id',
  `adress` varchar(100) NOT NULL COMMENT '收获地址',
  `ipone` varchar(11) DEFAULT NULL COMMENT '买家电话',
  `creat_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_user
-- ----------------------------
INSERT INTO `order_user` VALUES ('1', '14', '111', '1', '1', '重庆市沙坪坝还和路1号', '12345678', '2018-04-15 14:11:56');

-- ----------------------------
-- Table structure for `qzmessage`
-- ----------------------------
DROP TABLE IF EXISTS `qzmessage`;
CREATE TABLE `qzmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL COMMENT '会员id',
  `code` varchar(100) NOT NULL COMMENT '身份证',
  `picurl` varchar(100) NOT NULL,
  `contet` varchar(300) NOT NULL,
  `qpice` int(10) NOT NULL COMMENT '求助金额',
  `type` int(4) NOT NULL COMMENT '求助信息状态 0 以创建 1 以通过打款 2 不通过   ',
  `aid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `message` varchar(200) DEFAULT NULL,
  `creat_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qzmessage
-- ----------------------------
INSERT INTO `qzmessage` VALUES ('1', '1', '87321987383', '1523680916694.jpg;', '呃呃呃呃呃呃呃呃呃呃', '2000', '1', '1', '你太丑陋', '2018-04-14 12:41:56', '2018-04-15 18:10:31');
INSERT INTO `qzmessage` VALUES ('2', '1', '2099781493819839', '1523789585714.jpg;1523789585727.jpg;1523789585729.jpg;1523789585732.jpg;', '太饿了，', '100', '1', '1', '我也饿', '2018-04-15 18:53:05', '2018-04-15 18:53:38');
INSERT INTO `qzmessage` VALUES ('3', '1', '243233354342', '1523790268450.jpg;1523790268454.jpg;1523790268458.jpg;1523790268466.jpg;', '好饿啊', '100', '1', '1', '阿凡达', '2018-04-15 19:04:28', '2018-04-15 19:30:14');
INSERT INTO `qzmessage` VALUES ('4', '1', '212223212121', '1523792742750.jpg;1523792742756.jpg;1523792742761.jpg;', '哈哈哈哈', '122', '1', '1', '嗯', '2018-04-15 19:45:42', '2018-04-15 19:46:06');
INSERT INTO `qzmessage` VALUES ('5', '1', '8391029982112', '1523792881107.jpg;1523792881110.jpg;', '对对对', '44', '1', '1', '呃呃', '2018-04-15 19:48:01', '2018-04-15 19:48:17');
INSERT INTO `qzmessage` VALUES ('6', '1', '1321312313', '1523793122701.jpg;1523793122706.jpg;', '对对对', '33', '1', '1', '哈哈', '2018-04-15 19:52:02', '2018-04-15 19:52:16');

-- ----------------------------
-- Table structure for `rechange`
-- ----------------------------
DROP TABLE IF EXISTS `rechange`;
CREATE TABLE `rechange` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL COMMENT '会员id',
  `type` varchar(100) NOT NULL COMMENT '充值类型',
  `creat_time` datetime NOT NULL,
  `money` int(20) NOT NULL COMMENT '单次充值多少',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rechange
-- ----------------------------
INSERT INTO `rechange` VALUES ('1', '1', '支付宝', '2018-04-14 20:40:07', '100');
INSERT INTO `rechange` VALUES ('2', '1', '网银', '2018-04-15 12:11:09', '1000');
INSERT INTO `rechange` VALUES ('8', '1', '购买物品', '2018-04-15 14:11:56', '-111');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zh` varchar(60) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `meny` int(20) DEFAULT NULL,
  `pwd` varchar(80) NOT NULL,
  `sex` int(4) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `ipone` varchar(11) DEFAULT NULL,
  `creat_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345678', '小虎', '955', '123456', '0', '123456@qq.com', '18883156885', '2018-04-12 22:54:49', '2018-04-15 19:52:16');
INSERT INTO `user` VALUES ('2', '12345678', '哈哈', '0', '123456', '0', '123456@qq.com', '18883156885', '2018-04-12 22:57:20', null);
