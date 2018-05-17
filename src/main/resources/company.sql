/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : company

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-05-17 22:24:11
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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '12345@', '张三', '12345', '1', '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-10 19:19:44', '2018-04-22 12:54:05');
INSERT INTO `admin` VALUES ('8', '2131231321', '小猫', '123456', '0', '1111@qq.com', '16666666', '重庆', '2018-04-15 20:34:20', '2018-05-01 12:45:13');
INSERT INTO `admin` VALUES ('7', 'taotao@buxiw', '保险', '123456', '0', '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-14 15:56:12', '2018-05-02 12:45:18');
INSERT INTO `admin` VALUES ('9', 'taotao11', 'ccdd', '12345', '0', '18883156885m@sina.cn', '18883156885', '重庆', '2018-04-15 20:39:27', '2018-05-01 12:45:31');

-- ----------------------------
-- Table structure for `history`
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL COMMENT '用户id',
  `title` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL COMMENT '地点',
  `reason` varchar(500) NOT NULL,
  `begin_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------

-- ----------------------------
-- Table structure for `levea`
-- ----------------------------
DROP TABLE IF EXISTS `levea`;
CREATE TABLE `levea` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `length` int(10) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `type` int(10) NOT NULL COMMENT '请假类型 0 已创建 1 以通过 2不通过',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of levea
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `reason` varchar(500) NOT NULL,
  `creat_time` date NOT NULL,
  `aid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('3', '关于景点介绍', '关于景点介绍关于景点介绍关于景点介绍关于景点介绍关于景点介绍关于景点介绍', '2018-05-09', '0');
INSERT INTO `notice` VALUES ('4', '关于乱删帖子的功夫', '关于乱删帖子的功夫关于乱删帖子的功夫关于乱删帖子的功夫关于乱删帖子的功夫', '2018-05-11', '0');
INSERT INTO `notice` VALUES ('2', '关于会员发帖烦烦烦', '                    关于会员发帖关于会员发帖关于会员发帖关于会员发帖关于会员发帖\r\n                  ', '2018-05-09', '0');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `aid` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `kpi` int(10) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of record
-- ----------------------------

-- ----------------------------
-- Table structure for `submit`
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `money` int(10) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `uplod_time` datetime DEFAULT NULL,
  `type` int(10) NOT NULL COMMENT '报销类型 0 以创建 1 同意报销 2 不同意报销',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of submit
-- ----------------------------

-- ----------------------------
-- Table structure for `suggest`
-- ----------------------------
DROP TABLE IF EXISTS `suggest`;
CREATE TABLE `suggest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `title` varchar(300) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `stuats` int(10) NOT NULL COMMENT '状态 0 以创建 1 回复',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of suggest
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zh` varchar(60) NOT NULL,
  `name` varchar(60) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '签名',
  `pwd` varchar(80) NOT NULL,
  `sex` int(4) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `ipone` varchar(11) DEFAULT NULL,
  `creat_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `kpi` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '12345678', '吓唬', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '123456', '0', '1234567@qq.com', '18883156885', '2018-04-12 22:54:49', '2018-05-04 23:28:00', null, '0');
INSERT INTO `user` VALUES ('2', '12345678', '哈哈', null, '1234567', '0', '123456@qq.com', '18883156885', '2018-04-12 22:57:20', null, null, '0');
INSERT INTO `user` VALUES ('6', '12345', '哈哈', null, '123456', '1', '12345@qq.com', '18883156885', '2018-05-06 16:21:51', null, null, '0');
INSERT INTO `user` VALUES ('7', '123456789', '搜索', null, '12345678', '1', '12345678@qq.com', '18883156885', '2018-05-06 17:16:05', null, null, '0');
INSERT INTO `user` VALUES ('5', 'tttt', '小混混', null, '123456', '1', '123456@qq.com', '18883166885', '2018-05-04 23:11:32', null, null, '0');
INSERT INTO `user` VALUES ('8', 'zxcv12', 'hh', null, '123456', '1', '123456@qq.com', '18883156886', '2018-05-06 21:30:08', null, null, '0');
INSERT INTO `user` VALUES ('9', 'tiantao11', 'fuck', null, '1234567', '0', '12344567@qq.com', '15696985992', '2018-05-13 19:19:28', null, null, '0');

-- ----------------------------
-- Table structure for `work`
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `content` varchar(300) NOT NULL,
  `aid` bigint(20) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `stuats` int(10) NOT NULL COMMENT '0 以创建 1 回复',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of work
-- ----------------------------
