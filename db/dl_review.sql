/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : dl_review

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2013-06-06 12:03:35
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `application_info`
-- ----------------------------
DROP TABLE IF EXISTS `application_info`;
CREATE TABLE `application_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `appAuthor` varchar(255) DEFAULT NULL,
  `appDesc` varchar(255) DEFAULT NULL,
  `appLicenceKey` varchar(255) DEFAULT NULL,
  `appLicensedTo` varchar(255) DEFAULT NULL,
  `appTitle` varchar(255) DEFAULT NULL,
  `appVersion` varchar(255) DEFAULT NULL,
  `appWebsite` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application_info
-- ----------------------------
INSERT INTO `application_info` VALUES ('1', null, null, null, null, null, null, null, null, '电力设备巡视系统', '1.0.1', null);

-- ----------------------------
-- Table structure for `checkpoint_info`
-- ----------------------------
DROP TABLE IF EXISTS `checkpoint_info`;
CREATE TABLE `checkpoint_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `alarm` tinyint(1) NOT NULL,
  `defectDetail` varchar(255) DEFAULT NULL,
  `defectType` varchar(255) DEFAULT NULL,
  `deviceClassInfo_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1C63FD057E797E9B` (`deviceClassInfo_id`),
  CONSTRAINT `FK1C63FD057E797E9B` FOREIGN KEY (`deviceClassInfo_id`) REFERENCES `device_class_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkpoint_info
-- ----------------------------
INSERT INTO `checkpoint_info` VALUES ('1', '2013-05-22 00:51:16', null, '1', '配变（架）与树木、竹子安全距离严重不足，危及安全', 'type1', '6', null, null);
INSERT INTO `checkpoint_info` VALUES ('2', '2013-05-22 00:49:35', null, '0', '10kV挂式（针式）绝缘子破裂，复合绝缘子表面裂纹。', 'type1', '2', null, null);
INSERT INTO `checkpoint_info` VALUES ('3', '2013-05-22 00:51:11', null, '1', '户外杆上电缆头与通信线相碰或安全距离不足，危及安全', 'type5', '6', null, null);

-- ----------------------------
-- Table structure for `device_class_info`
-- ----------------------------
DROP TABLE IF EXISTS `device_class_info`;
CREATE TABLE `device_class_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_class_info
-- ----------------------------
INSERT INTO `device_class_info` VALUES ('1', null, null, '变压器', null, null, null);
INSERT INTO `device_class_info` VALUES ('2', null, null, '瓷质绝缘件', null, null, null);
INSERT INTO `device_class_info` VALUES ('3', null, null, '刀闸\\跌落式开关', null, null, null);
INSERT INTO `device_class_info` VALUES ('4', null, null, '导线', null, null, null);
INSERT INTO `device_class_info` VALUES ('5', null, null, '电缆本体', null, null, null);
INSERT INTO `device_class_info` VALUES ('6', null, null, '电缆接头\r\n附件', null, null, null);
INSERT INTO `device_class_info` VALUES ('7', null, null, '电缆走廊', null, null, null);
INSERT INTO `device_class_info` VALUES ('8', null, null, '柱上开关（断路器、负荷开关）', null, null, null);
INSERT INTO `device_class_info` VALUES ('9', null, null, '防雷接地', null, null, null);
INSERT INTO `device_class_info` VALUES ('10', null, null, '杆塔、横\r\n担、拉线', null, null, null);
INSERT INTO `device_class_info` VALUES ('11', null, null, '金具', null, null, null);
INSERT INTO `device_class_info` VALUES ('12', null, null, '开关柜保护', null, null, null);
INSERT INTO `device_class_info` VALUES ('13', null, null, '开关柜（环网柜）', null, null, null);
INSERT INTO `device_class_info` VALUES ('14', null, null, '母线', null, null, null);
INSERT INTO `device_class_info` VALUES ('15', null, null, '小区电气', null, null, null);
INSERT INTO `device_class_info` VALUES ('16', null, null, '小区附属配置', null, null, null);
INSERT INTO `device_class_info` VALUES ('17', null, null, '小区土建', null, null, null);
INSERT INTO `device_class_info` VALUES ('18', null, null, '指示器显示器等', null, null, null);
INSERT INTO `device_class_info` VALUES ('19', null, null, '自动化', null, null, null);
INSERT INTO `device_class_info` VALUES ('20', null, null, '配网调度', null, null, null);

-- ----------------------------
-- Table structure for `func_info`
-- ----------------------------
DROP TABLE IF EXISTS `func_info`;
CREATE TABLE `func_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `funcIndex` int(11) DEFAULT NULL,
  `funcName` varchar(255) DEFAULT NULL,
  `funcUrl` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of func_info
-- ----------------------------
INSERT INTO `func_info` VALUES ('1', '2013-05-21 13:55:12', null, '1', '二维码维护', '/qrcode', null, null, null, null);
INSERT INTO `func_info` VALUES ('2', '2013-05-21 13:55:25', null, '1', '用户维护', '/user', null, null, null, null);
INSERT INTO `func_info` VALUES ('3', '2013-05-21 13:55:52', null, '1', '基站维护', '/station', null, null, null, null);
INSERT INTO `func_info` VALUES ('4', '2013-05-21 13:56:20', null, '1', '系统参数设置', '/setting', null, null, null, null);

-- ----------------------------
-- Table structure for `qrcode_info`
-- ----------------------------
DROP TABLE IF EXISTS `qrcode_info`;
CREATE TABLE `qrcode_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `qrcode` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrcode_info
-- ----------------------------
INSERT INTO `qrcode_info` VALUES ('2', '2013-05-21 18:26:59', null, '1ZVIDIAQRCODE测试', null, '062700fb723a26839f61220351d38be9.png', null, null);
INSERT INTO `qrcode_info` VALUES ('3', '2013-05-21 20:15:54', null, '1ZVIDIAQRCODE测试', null, '062700fb723a26839f61220351d38be9.png', null, null);
INSERT INTO `qrcode_info` VALUES ('4', '2013-05-21 20:16:12', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('5', '2013-05-21 20:17:03', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('6', '2013-05-21 20:18:02', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('7', '2013-05-21 20:18:23', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('8', '2013-05-21 20:19:09', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('9', '2013-05-21 20:19:09', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('10', '2013-05-21 20:19:09', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('11', '2013-05-21 20:19:09', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('12', '2013-05-21 20:19:09', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('13', '2013-05-21 20:19:09', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('14', '2013-05-21 20:19:16', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('15', '2013-05-21 20:19:16', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('16', '2013-05-21 20:19:17', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('17', '2013-05-21 20:19:17', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('18', '2013-05-21 20:19:17', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('19', '2013-05-21 20:19:17', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('20', '2013-05-21 20:20:44', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('21', '2013-05-21 20:20:44', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('22', '2013-05-21 20:20:44', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('23', '2013-05-21 20:20:44', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('24', '2013-05-21 20:20:44', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('25', '2013-05-21 20:20:44', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('26', '2013-05-21 20:21:25', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('27', '2013-05-21 20:21:25', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('28', '2013-05-21 20:21:25', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('29', '2013-05-21 20:21:25', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('30', '2013-05-21 20:21:25', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('31', '2013-05-21 20:21:25', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('32', '2013-05-21 20:21:39', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('33', '2013-05-21 20:21:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('34', '2013-05-21 20:21:39', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('35', '2013-05-21 20:21:40', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('36', '2013-05-21 20:21:40', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('37', '2013-05-21 20:21:40', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('38', '2013-05-21 20:21:53', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('39', '2013-05-21 20:21:53', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('40', '2013-05-21 20:21:53', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('41', '2013-05-21 20:21:53', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('42', '2013-05-21 20:21:53', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('43', '2013-05-21 20:21:53', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('44', '2013-05-21 20:22:52', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('45', '2013-05-21 20:22:52', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('46', '2013-05-21 20:22:52', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('47', '2013-05-21 20:22:52', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('48', '2013-05-21 20:22:52', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('49', '2013-05-21 20:22:52', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('50', '2013-05-21 20:23:17', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('51', '2013-05-21 20:23:17', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('52', '2013-05-21 20:23:17', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('53', '2013-05-21 20:23:17', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('54', '2013-05-21 20:23:17', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('55', '2013-05-21 20:23:17', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('56', '2013-05-21 20:23:22', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('57', '2013-05-21 20:23:26', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png', null, null);
INSERT INTO `qrcode_info` VALUES ('59', '2013-05-21 20:34:18', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('60', '2013-05-21 20:34:24', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('61', '2013-05-21 20:34:27', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('62', '2013-05-21 20:37:30', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('63', '2013-05-21 20:37:30', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('64', '2013-05-21 20:37:30', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('65', '2013-05-21 20:37:30', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('66', '2013-05-21 20:37:30', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('67', '2013-05-21 20:37:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('68', '2013-05-21 20:38:01', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('69', '2013-05-21 20:38:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('70', '2013-05-21 20:38:49', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('71', '2013-05-21 20:38:58', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('72', '2013-05-21 20:39:06', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('73', '2013-05-21 20:39:06', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('74', '2013-05-21 20:39:06', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('75', '2013-05-21 20:39:06', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('76', '2013-05-21 20:39:06', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('77', '2013-05-22 02:57:35', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('78', '2013-05-22 02:57:38', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('79', '2013-05-22 02:57:38', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('80', '2013-05-22 02:57:38', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('81', '2013-05-22 02:57:38', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('82', '2013-05-22 02:57:38', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('83', '2013-05-22 02:57:38', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png', null, null);
INSERT INTO `qrcode_info` VALUES ('84', '2013-05-22 03:00:51', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('85', '2013-05-22 03:00:51', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('86', '2013-05-22 03:00:51', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('87', '2013-05-22 03:00:51', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('88', '2013-05-22 03:00:51', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('89', '2013-05-22 03:00:51', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png', null, null);
INSERT INTO `qrcode_info` VALUES ('90', '2013-05-22 03:00:51', null, '8ZVIDIAQRCODE配电设备1', null, 'e61b4f81701a684fb363d2240a3b0042.png', null, null);
INSERT INTO `qrcode_info` VALUES ('91', '2013-05-22 22:36:07', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('92', '2013-05-22 22:36:07', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('93', '2013-05-22 22:36:08', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('94', '2013-05-22 22:36:08', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('95', '2013-05-22 22:36:08', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('96', '2013-05-22 22:36:08', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png', null, null);
INSERT INTO `qrcode_info` VALUES ('97', '2013-05-22 22:36:08', null, '8ZVIDIAQRCODE配电设备1', null, 'e61b4f81701a684fb363d2240a3b0042.png', null, null);
INSERT INTO `qrcode_info` VALUES ('98', '2013-05-22 22:41:10', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('99', '2013-05-22 22:41:10', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png', null, null);
INSERT INTO `qrcode_info` VALUES ('100', '2013-05-22 22:41:10', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png', null, null);
INSERT INTO `qrcode_info` VALUES ('101', '2013-05-22 22:41:10', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png', null, null);
INSERT INTO `qrcode_info` VALUES ('102', '2013-05-22 22:41:10', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png', null, null);
INSERT INTO `qrcode_info` VALUES ('103', '2013-05-22 22:41:10', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png', null, null);
INSERT INTO `qrcode_info` VALUES ('104', '2013-05-22 22:41:10', null, '8ZVIDIAQRCODE配电设备1', null, 'e61b4f81701a684fb363d2240a3b0042.png', null, null);
INSERT INTO `qrcode_info` VALUES ('105', '2013-05-22 23:18:42', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);
INSERT INTO `qrcode_info` VALUES ('106', '2013-05-22 23:18:47', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png', null, null);

-- ----------------------------
-- Table structure for `review_info`
-- ----------------------------
DROP TABLE IF EXISTS `review_info`;
CREATE TABLE `review_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `reviewTime` datetime DEFAULT NULL,
  `stationInfo_id` bigint(20) DEFAULT NULL,
  `userInfo_id` bigint(20) DEFAULT NULL,
  `alarm` tinyint(1) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `readable` tinyint(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` double NOT NULL,
  `locType` int(11) NOT NULL,
  `longitude` double NOT NULL,
  `radius` float NOT NULL,
  `handleResult` varchar(255) DEFAULT NULL,
  `handleTime` datetime DEFAULT NULL,
  `handleUser` varchar(255) DEFAULT NULL,
  `handled` tinyint(1) NOT NULL,
  `handleUserInfo_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5109FD35F3D3DDFB` (`stationInfo_id`),
  KEY `FK5109FD35DBE2F74` (`userInfo_id`),
  KEY `FK5109FD35CA4CD84C` (`handleUserInfo_id`),
  CONSTRAINT `FK5109FD35CA4CD84C` FOREIGN KEY (`handleUserInfo_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK5109FD35DBE2F74` FOREIGN KEY (`userInfo_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK5109FD35F3D3DDFB` FOREIGN KEY (`stationInfo_id`) REFERENCES `station_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_info
-- ----------------------------
INSERT INTO `review_info` VALUES ('1', '2013-05-22 01:56:06', null, '2013-05-22 02:07:19', '2', '1', '1', 'test', '0', null, '0', '0', '0', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('7', '2013-05-22 02:06:08', null, '2013-05-22 02:07:19', '2', '1', '1', 'test', '0', null, '0', '0', '0', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('8', '2013-05-22 02:07:19', null, '2013-05-22 02:07:19', '3', '1', '1', 'test', '0', null, '0', '0', '0', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('9', '2013-05-22 02:08:20', null, '2013-05-22 02:07:19', '3', '1', '1', 'test', '0', null, '0', '0', '0', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('10', '2013-05-22 02:08:51', null, '2013-05-22 02:07:19', '3', '1', '0', 'test', '0', null, '0', '0', '0', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('14', '2013-06-03 14:13:58', null, '1980-01-06 16:25:11', '2', '13', '0', null, '0', '?????????????226-230?1', '24.481521', '161', '118.142095', '59.25', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('15', '2013-06-03 14:21:15', null, '1980-01-06 16:32:26', '2', '13', '0', null, '0', '?????????????226-230?1', '24.481521', '161', '118.142095', '59.25', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('16', '2013-06-03 14:24:44', null, '1980-01-06 16:35:27', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('17', '2013-06-03 14:25:20', null, '1980-01-06 16:36:32', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('18', '2013-06-03 14:25:00', null, '1980-01-06 16:35:27', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('19', '2013-06-03 14:25:00', null, '1980-01-06 16:35:53', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('20', '2013-06-03 14:25:20', null, '1980-01-06 16:35:27', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('21', '2013-06-03 14:25:20', null, '1980-01-06 16:35:53', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('22', '2013-06-03 14:26:03', null, '1980-01-06 16:37:15', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('23', '2013-06-03 14:28:37', null, '1980-01-06 16:39:25', '2', '13', '0', null, '0', '', '5e-324', '167', '5e-324', '0', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('24', '2013-06-03 14:30:57', null, '2013-06-03 14:31:12', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('25', '2013-06-03 14:30:18', null, '2013-06-03 14:30:19', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('26', '2013-06-03 14:30:29', null, '2013-06-03 14:30:19', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('27', '2013-06-03 14:33:04', null, '2013-06-03 14:33:20', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('28', '2013-06-03 14:33:03', null, '2013-06-03 14:32:57', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('29', '2013-06-03 14:33:03', null, '2013-06-03 14:33:06', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('30', '2013-06-03 14:33:48', null, '2013-06-03 14:34:04', '2', '13', '0', null, '0', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('31', '2013-06-03 14:36:14', null, '2013-06-03 14:36:30', '2', '13', '0', null, '0', '福建省厦门市思明区莲花南路41-1号', '24.486042', '161', '118.130791', '1115', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('32', '2013-06-03 14:37:57', null, '2013-06-03 14:38:12', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('33', '2013-06-03 14:37:56', null, '2013-06-03 14:36:30', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('34', '2013-06-03 14:44:06', null, '2013-06-03 14:44:21', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('35', '2013-06-03 14:43:43', null, '2013-06-03 14:43:46', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('36', '2013-06-03 14:43:50', null, '2013-06-03 14:43:46', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('37', '2013-06-03 14:44:05', null, '2013-06-03 14:43:46', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('38', '2013-06-03 14:45:54', null, '2013-06-03 14:45:49', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('39', '2013-06-03 14:45:54', null, '2013-06-03 14:45:58', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('40', '2013-06-03 14:47:37', null, '2013-06-03 14:47:51', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('41', '2013-06-03 14:46:17', null, '2013-06-03 14:45:58', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('42', '2013-06-03 14:46:17', null, '2013-06-03 14:46:10', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('43', '2013-06-03 14:46:48', null, '2013-06-03 14:46:10', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('44', '2013-06-03 14:46:58', null, '2013-06-03 14:45:49', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('45', '2013-06-03 14:46:59', null, '2013-06-03 14:45:58', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('46', '2013-06-03 14:46:59', null, '2013-06-03 14:46:10', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('47', '2013-06-03 14:50:03', null, '2013-06-03 14:50:18', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('48', '2013-06-03 14:50:11', null, '2013-06-03 14:50:18', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('49', '2013-06-03 14:50:22', null, '2013-06-03 14:50:18', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('50', '2013-06-03 14:53:52', null, '2013-06-03 14:53:10', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('58', '2013-06-03 15:10:27', null, '2013-06-03 15:08:08', '2', '13', '0', null, '0', '福建省厦门市思明区莲前西路226-230之9', '24.481269', '161', '118.142369', '62', null, null, null, '0', null, null, null);
INSERT INTO `review_info` VALUES ('59', '2013-06-03 15:15:06', null, '2013-06-03 15:11:59', '2', '13', '1', null, '1', '福建省厦门市思明区莲前西路264号', '24.48196', '161', '118.143429', '1777', '', '2013-06-03 23:25:44', null, '1', '1', null, null);
INSERT INTO `review_info` VALUES ('60', '2013-06-03 15:17:11', null, '2013-06-03 15:17:00', '2', '13', '1', null, '1', '福建省厦门市思明区莲花南路41-1号', '24.486042', '161', '118.130791', '1115', '', '2013-06-03 23:31:20', null, '1', '1', null, null);
INSERT INTO `review_info` VALUES ('61', '2013-06-03 15:20:49', null, '2013-06-03 15:20:56', '2', '13', '1', null, '1', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', '123123', '2013-06-03 23:37:43', 'root', '1', '1', null, null);
INSERT INTO `review_info` VALUES ('62', '2013-06-03 15:23:33', null, '2013-06-03 15:23:50', '2', '13', '0', null, '1', '福建省厦门市思明区东浦路49号', '24.48002', '161', '118.136869', '1761', '', '2013-06-03 23:23:28', null, '1', '1', null, null);
INSERT INTO `review_info` VALUES ('63', '2013-06-03 15:27:44', null, '2013-06-03 15:28:01', '2', '13', '0', null, '1', '福建省厦门市思明区莲前西路264号', '24.48196', '161', '118.143429', '1777', '', '2013-06-03 22:17:58', null, '1', '1', null, null);
INSERT INTO `review_info` VALUES ('64', '2013-06-03 15:28:25', null, '2013-06-03 15:28:42', '2', '13', '1', null, '1', '福建省厦门市思明区莲前西路264号', '24.48196', '161', '118.143429', '1777', 'test11111aaaa', '2013-06-06 00:11:55', 'root', '1', '1', null, null);

-- ----------------------------
-- Table structure for `review_info_review_item_info`
-- ----------------------------
DROP TABLE IF EXISTS `review_info_review_item_info`;
CREATE TABLE `review_info_review_item_info` (
  `review_info_id` bigint(20) NOT NULL,
  `reviewItemInfos_id` bigint(20) NOT NULL,
  KEY `FKCD4D0FFDF729B458` (`reviewItemInfos_id`),
  KEY `FKCD4D0FFD5319450A` (`review_info_id`),
  CONSTRAINT `FKCD4D0FFD5319450A` FOREIGN KEY (`review_info_id`) REFERENCES `review_info` (`id`),
  CONSTRAINT `FKCD4D0FFDF729B458` FOREIGN KEY (`reviewItemInfos_id`) REFERENCES `review_item_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_info_review_item_info
-- ----------------------------
INSERT INTO `review_info_review_item_info` VALUES ('7', '1');
INSERT INTO `review_info_review_item_info` VALUES ('8', '2');
INSERT INTO `review_info_review_item_info` VALUES ('9', '3');
INSERT INTO `review_info_review_item_info` VALUES ('9', '4');
INSERT INTO `review_info_review_item_info` VALUES ('10', '5');
INSERT INTO `review_info_review_item_info` VALUES ('14', '9');
INSERT INTO `review_info_review_item_info` VALUES ('14', '10');
INSERT INTO `review_info_review_item_info` VALUES ('14', '11');
INSERT INTO `review_info_review_item_info` VALUES ('15', '21');
INSERT INTO `review_info_review_item_info` VALUES ('15', '22');
INSERT INTO `review_info_review_item_info` VALUES ('15', '23');
INSERT INTO `review_info_review_item_info` VALUES ('16', '24');
INSERT INTO `review_info_review_item_info` VALUES ('16', '25');
INSERT INTO `review_info_review_item_info` VALUES ('16', '26');
INSERT INTO `review_info_review_item_info` VALUES ('18', '30');
INSERT INTO `review_info_review_item_info` VALUES ('18', '31');
INSERT INTO `review_info_review_item_info` VALUES ('18', '32');
INSERT INTO `review_info_review_item_info` VALUES ('19', '33');
INSERT INTO `review_info_review_item_info` VALUES ('19', '34');
INSERT INTO `review_info_review_item_info` VALUES ('19', '35');
INSERT INTO `review_info_review_item_info` VALUES ('20', '39');
INSERT INTO `review_info_review_item_info` VALUES ('20', '40');
INSERT INTO `review_info_review_item_info` VALUES ('20', '41');
INSERT INTO `review_info_review_item_info` VALUES ('21', '42');
INSERT INTO `review_info_review_item_info` VALUES ('21', '43');
INSERT INTO `review_info_review_item_info` VALUES ('21', '44');
INSERT INTO `review_info_review_item_info` VALUES ('17', '48');
INSERT INTO `review_info_review_item_info` VALUES ('17', '49');
INSERT INTO `review_info_review_item_info` VALUES ('17', '50');
INSERT INTO `review_info_review_item_info` VALUES ('22', '51');
INSERT INTO `review_info_review_item_info` VALUES ('22', '52');
INSERT INTO `review_info_review_item_info` VALUES ('22', '53');
INSERT INTO `review_info_review_item_info` VALUES ('23', '57');
INSERT INTO `review_info_review_item_info` VALUES ('23', '58');
INSERT INTO `review_info_review_item_info` VALUES ('23', '59');
INSERT INTO `review_info_review_item_info` VALUES ('25', '63');
INSERT INTO `review_info_review_item_info` VALUES ('25', '64');
INSERT INTO `review_info_review_item_info` VALUES ('25', '65');
INSERT INTO `review_info_review_item_info` VALUES ('26', '69');
INSERT INTO `review_info_review_item_info` VALUES ('26', '70');
INSERT INTO `review_info_review_item_info` VALUES ('26', '71');
INSERT INTO `review_info_review_item_info` VALUES ('24', '81');
INSERT INTO `review_info_review_item_info` VALUES ('24', '82');
INSERT INTO `review_info_review_item_info` VALUES ('24', '83');
INSERT INTO `review_info_review_item_info` VALUES ('28', '87');
INSERT INTO `review_info_review_item_info` VALUES ('28', '88');
INSERT INTO `review_info_review_item_info` VALUES ('28', '89');
INSERT INTO `review_info_review_item_info` VALUES ('29', '90');
INSERT INTO `review_info_review_item_info` VALUES ('29', '91');
INSERT INTO `review_info_review_item_info` VALUES ('29', '92');
INSERT INTO `review_info_review_item_info` VALUES ('27', '93');
INSERT INTO `review_info_review_item_info` VALUES ('27', '94');
INSERT INTO `review_info_review_item_info` VALUES ('27', '95');
INSERT INTO `review_info_review_item_info` VALUES ('30', '96');
INSERT INTO `review_info_review_item_info` VALUES ('30', '97');
INSERT INTO `review_info_review_item_info` VALUES ('30', '98');
INSERT INTO `review_info_review_item_info` VALUES ('31', '99');
INSERT INTO `review_info_review_item_info` VALUES ('31', '100');
INSERT INTO `review_info_review_item_info` VALUES ('31', '101');
INSERT INTO `review_info_review_item_info` VALUES ('33', '114');
INSERT INTO `review_info_review_item_info` VALUES ('33', '115');
INSERT INTO `review_info_review_item_info` VALUES ('33', '116');
INSERT INTO `review_info_review_item_info` VALUES ('32', '123');
INSERT INTO `review_info_review_item_info` VALUES ('32', '124');
INSERT INTO `review_info_review_item_info` VALUES ('32', '125');
INSERT INTO `review_info_review_item_info` VALUES ('35', '129');
INSERT INTO `review_info_review_item_info` VALUES ('35', '130');
INSERT INTO `review_info_review_item_info` VALUES ('35', '131');
INSERT INTO `review_info_review_item_info` VALUES ('36', '135');
INSERT INTO `review_info_review_item_info` VALUES ('36', '136');
INSERT INTO `review_info_review_item_info` VALUES ('36', '137');
INSERT INTO `review_info_review_item_info` VALUES ('37', '144');
INSERT INTO `review_info_review_item_info` VALUES ('37', '145');
INSERT INTO `review_info_review_item_info` VALUES ('37', '146');
INSERT INTO `review_info_review_item_info` VALUES ('34', '153');
INSERT INTO `review_info_review_item_info` VALUES ('34', '154');
INSERT INTO `review_info_review_item_info` VALUES ('34', '155');
INSERT INTO `review_info_review_item_info` VALUES ('38', '156');
INSERT INTO `review_info_review_item_info` VALUES ('38', '157');
INSERT INTO `review_info_review_item_info` VALUES ('38', '158');
INSERT INTO `review_info_review_item_info` VALUES ('39', '159');
INSERT INTO `review_info_review_item_info` VALUES ('39', '160');
INSERT INTO `review_info_review_item_info` VALUES ('39', '161');
INSERT INTO `review_info_review_item_info` VALUES ('41', '165');
INSERT INTO `review_info_review_item_info` VALUES ('41', '166');
INSERT INTO `review_info_review_item_info` VALUES ('41', '167');
INSERT INTO `review_info_review_item_info` VALUES ('42', '168');
INSERT INTO `review_info_review_item_info` VALUES ('42', '169');
INSERT INTO `review_info_review_item_info` VALUES ('42', '170');
INSERT INTO `review_info_review_item_info` VALUES ('43', '174');
INSERT INTO `review_info_review_item_info` VALUES ('43', '175');
INSERT INTO `review_info_review_item_info` VALUES ('43', '176');
INSERT INTO `review_info_review_item_info` VALUES ('44', '183');
INSERT INTO `review_info_review_item_info` VALUES ('44', '184');
INSERT INTO `review_info_review_item_info` VALUES ('44', '185');
INSERT INTO `review_info_review_item_info` VALUES ('45', '186');
INSERT INTO `review_info_review_item_info` VALUES ('45', '187');
INSERT INTO `review_info_review_item_info` VALUES ('45', '188');
INSERT INTO `review_info_review_item_info` VALUES ('46', '189');
INSERT INTO `review_info_review_item_info` VALUES ('46', '190');
INSERT INTO `review_info_review_item_info` VALUES ('46', '191');
INSERT INTO `review_info_review_item_info` VALUES ('40', '204');
INSERT INTO `review_info_review_item_info` VALUES ('40', '205');
INSERT INTO `review_info_review_item_info` VALUES ('40', '206');
INSERT INTO `review_info_review_item_info` VALUES ('47', '207');
INSERT INTO `review_info_review_item_info` VALUES ('47', '208');
INSERT INTO `review_info_review_item_info` VALUES ('47', '209');
INSERT INTO `review_info_review_item_info` VALUES ('48', '210');
INSERT INTO `review_info_review_item_info` VALUES ('48', '211');
INSERT INTO `review_info_review_item_info` VALUES ('48', '212');
INSERT INTO `review_info_review_item_info` VALUES ('49', '213');
INSERT INTO `review_info_review_item_info` VALUES ('49', '214');
INSERT INTO `review_info_review_item_info` VALUES ('49', '215');
INSERT INTO `review_info_review_item_info` VALUES ('50', '228');
INSERT INTO `review_info_review_item_info` VALUES ('50', '229');
INSERT INTO `review_info_review_item_info` VALUES ('50', '230');
INSERT INTO `review_info_review_item_info` VALUES ('58', '240');
INSERT INTO `review_info_review_item_info` VALUES ('58', '241');
INSERT INTO `review_info_review_item_info` VALUES ('58', '242');
INSERT INTO `review_info_review_item_info` VALUES ('59', '255');
INSERT INTO `review_info_review_item_info` VALUES ('59', '256');
INSERT INTO `review_info_review_item_info` VALUES ('59', '257');
INSERT INTO `review_info_review_item_info` VALUES ('60', '261');
INSERT INTO `review_info_review_item_info` VALUES ('60', '262');
INSERT INTO `review_info_review_item_info` VALUES ('60', '263');
INSERT INTO `review_info_review_item_info` VALUES ('61', '267');
INSERT INTO `review_info_review_item_info` VALUES ('61', '268');
INSERT INTO `review_info_review_item_info` VALUES ('61', '269');
INSERT INTO `review_info_review_item_info` VALUES ('62', '276');
INSERT INTO `review_info_review_item_info` VALUES ('62', '277');
INSERT INTO `review_info_review_item_info` VALUES ('62', '278');
INSERT INTO `review_info_review_item_info` VALUES ('63', '279');
INSERT INTO `review_info_review_item_info` VALUES ('63', '280');
INSERT INTO `review_info_review_item_info` VALUES ('63', '281');
INSERT INTO `review_info_review_item_info` VALUES ('64', '282');
INSERT INTO `review_info_review_item_info` VALUES ('64', '283');
INSERT INTO `review_info_review_item_info` VALUES ('64', '284');

-- ----------------------------
-- Table structure for `review_item_info`
-- ----------------------------
DROP TABLE IF EXISTS `review_item_info`;
CREATE TABLE `review_item_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `checkpointInfo_id` bigint(20) DEFAULT NULL,
  `alarm` tinyint(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D803A33BC3BCF19` (`checkpointInfo_id`),
  CONSTRAINT `FK3D803A33BC3BCF19` FOREIGN KEY (`checkpointInfo_id`) REFERENCES `checkpoint_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_item_info
-- ----------------------------
INSERT INTO `review_item_info` VALUES ('1', '2013-05-22 02:06:08', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('2', '2013-05-22 02:07:19', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('3', '2013-05-22 02:08:20', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('4', '2013-05-22 02:08:20', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('5', '2013-05-22 02:08:51', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('6', '2013-06-03 14:12:59', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('7', '2013-06-03 14:12:59', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('8', '2013-06-03 14:12:59', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('9', '2013-06-03 14:13:58', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('10', '2013-06-03 14:13:58', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('11', '2013-06-03 14:13:58', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('12', '2013-06-03 14:18:58', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('13', '2013-06-03 14:18:58', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('14', '2013-06-03 14:18:58', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('15', '2013-06-03 14:20:47', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('16', '2013-06-03 14:20:47', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('17', '2013-06-03 14:20:47', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('18', '2013-06-03 14:21:14', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('19', '2013-06-03 14:21:14', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('20', '2013-06-03 14:21:14', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('21', '2013-06-03 14:21:15', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('22', '2013-06-03 14:21:15', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('23', '2013-06-03 14:21:15', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('24', '2013-06-03 14:24:44', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('25', '2013-06-03 14:24:44', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('26', '2013-06-03 14:24:44', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('27', '2013-06-03 14:24:46', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('28', '2013-06-03 14:24:46', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('29', '2013-06-03 14:24:46', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('30', '2013-06-03 14:25:00', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('31', '2013-06-03 14:25:00', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('32', '2013-06-03 14:25:00', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('33', '2013-06-03 14:25:00', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('34', '2013-06-03 14:25:00', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('35', '2013-06-03 14:25:00', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('36', '2013-06-03 14:25:01', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('37', '2013-06-03 14:25:01', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('38', '2013-06-03 14:25:01', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('39', '2013-06-03 14:25:20', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('40', '2013-06-03 14:25:20', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('41', '2013-06-03 14:25:20', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('42', '2013-06-03 14:25:20', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('43', '2013-06-03 14:25:20', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('44', '2013-06-03 14:25:20', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('45', '2013-06-03 14:25:20', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('46', '2013-06-03 14:25:20', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('47', '2013-06-03 14:25:20', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('48', '2013-06-03 14:25:20', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('49', '2013-06-03 14:25:20', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('50', '2013-06-03 14:25:20', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('51', '2013-06-03 14:26:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('52', '2013-06-03 14:26:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('53', '2013-06-03 14:26:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('54', '2013-06-03 14:27:53', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('55', '2013-06-03 14:27:53', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('56', '2013-06-03 14:27:53', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('57', '2013-06-03 14:28:37', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('58', '2013-06-03 14:28:37', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('59', '2013-06-03 14:28:37', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('60', '2013-06-03 14:30:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('61', '2013-06-03 14:30:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('62', '2013-06-03 14:30:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('63', '2013-06-03 14:30:18', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('64', '2013-06-03 14:30:18', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('65', '2013-06-03 14:30:18', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('66', '2013-06-03 14:30:18', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('67', '2013-06-03 14:30:18', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('68', '2013-06-03 14:30:18', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('69', '2013-06-03 14:30:29', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('70', '2013-06-03 14:30:29', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('71', '2013-06-03 14:30:29', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('72', '2013-06-03 14:30:29', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('73', '2013-06-03 14:30:29', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('74', '2013-06-03 14:30:29', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('75', '2013-06-03 14:30:29', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('76', '2013-06-03 14:30:29', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('77', '2013-06-03 14:30:29', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('78', '2013-06-03 14:30:57', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('79', '2013-06-03 14:30:57', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('80', '2013-06-03 14:30:57', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('81', '2013-06-03 14:30:57', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('82', '2013-06-03 14:30:57', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('83', '2013-06-03 14:30:57', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('84', '2013-06-03 14:32:50', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('85', '2013-06-03 14:32:50', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('86', '2013-06-03 14:32:50', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('87', '2013-06-03 14:33:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('88', '2013-06-03 14:33:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('89', '2013-06-03 14:33:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('90', '2013-06-03 14:33:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('91', '2013-06-03 14:33:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('92', '2013-06-03 14:33:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('93', '2013-06-03 14:33:04', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('94', '2013-06-03 14:33:04', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('95', '2013-06-03 14:33:04', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('96', '2013-06-03 14:33:48', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('97', '2013-06-03 14:33:48', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('98', '2013-06-03 14:33:48', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('99', '2013-06-03 14:36:14', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('100', '2013-06-03 14:36:14', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('101', '2013-06-03 14:36:14', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('102', '2013-06-03 14:36:21', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('103', '2013-06-03 14:36:21', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('104', '2013-06-03 14:36:21', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('105', '2013-06-03 14:37:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('106', '2013-06-03 14:37:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('107', '2013-06-03 14:37:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('108', '2013-06-03 14:37:47', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('109', '2013-06-03 14:37:47', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('110', '2013-06-03 14:37:47', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('111', '2013-06-03 14:37:47', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('112', '2013-06-03 14:37:47', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('113', '2013-06-03 14:37:47', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('114', '2013-06-03 14:37:56', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('115', '2013-06-03 14:37:56', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('116', '2013-06-03 14:37:56', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('117', '2013-06-03 14:37:57', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('118', '2013-06-03 14:37:57', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('119', '2013-06-03 14:37:57', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('120', '2013-06-03 14:37:57', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('121', '2013-06-03 14:37:57', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('122', '2013-06-03 14:37:57', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('123', '2013-06-03 14:37:57', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('124', '2013-06-03 14:37:57', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('125', '2013-06-03 14:37:57', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('126', '2013-06-03 14:43:30', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('127', '2013-06-03 14:43:30', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('128', '2013-06-03 14:43:30', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('129', '2013-06-03 14:43:43', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('130', '2013-06-03 14:43:43', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('131', '2013-06-03 14:43:43', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('132', '2013-06-03 14:43:43', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('133', '2013-06-03 14:43:43', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('134', '2013-06-03 14:43:43', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('135', '2013-06-03 14:43:50', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('136', '2013-06-03 14:43:50', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('137', '2013-06-03 14:43:50', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('138', '2013-06-03 14:43:51', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('139', '2013-06-03 14:43:51', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('140', '2013-06-03 14:43:51', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('141', '2013-06-03 14:43:51', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('142', '2013-06-03 14:43:51', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('143', '2013-06-03 14:43:51', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('144', '2013-06-03 14:44:05', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('145', '2013-06-03 14:44:05', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('146', '2013-06-03 14:44:05', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('147', '2013-06-03 14:44:06', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('148', '2013-06-03 14:44:06', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('149', '2013-06-03 14:44:06', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('150', '2013-06-03 14:44:06', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('151', '2013-06-03 14:44:06', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('152', '2013-06-03 14:44:06', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('153', '2013-06-03 14:44:06', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('154', '2013-06-03 14:44:06', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('155', '2013-06-03 14:44:06', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('156', '2013-06-03 14:45:54', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('157', '2013-06-03 14:45:54', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('158', '2013-06-03 14:45:54', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('159', '2013-06-03 14:45:54', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('160', '2013-06-03 14:45:54', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('161', '2013-06-03 14:45:54', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('162', '2013-06-03 14:45:54', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('163', '2013-06-03 14:45:54', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('164', '2013-06-03 14:45:54', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('165', '2013-06-03 14:46:17', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('166', '2013-06-03 14:46:17', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('167', '2013-06-03 14:46:17', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('168', '2013-06-03 14:46:17', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('169', '2013-06-03 14:46:17', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('170', '2013-06-03 14:46:17', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('171', '2013-06-03 14:46:18', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('172', '2013-06-03 14:46:18', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('173', '2013-06-03 14:46:18', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('174', '2013-06-03 14:46:48', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('175', '2013-06-03 14:46:48', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('176', '2013-06-03 14:46:48', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('177', '2013-06-03 14:46:48', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('178', '2013-06-03 14:46:48', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('179', '2013-06-03 14:46:48', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('180', '2013-06-03 14:46:49', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('181', '2013-06-03 14:46:49', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('182', '2013-06-03 14:46:49', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('183', '2013-06-03 14:46:58', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('184', '2013-06-03 14:46:58', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('185', '2013-06-03 14:46:58', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('186', '2013-06-03 14:46:59', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('187', '2013-06-03 14:46:59', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('188', '2013-06-03 14:46:59', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('189', '2013-06-03 14:46:59', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('190', '2013-06-03 14:46:59', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('191', '2013-06-03 14:46:59', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('192', '2013-06-03 14:46:59', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('193', '2013-06-03 14:46:59', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('194', '2013-06-03 14:46:59', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('195', '2013-06-03 14:47:00', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('196', '2013-06-03 14:47:00', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('197', '2013-06-03 14:47:00', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('198', '2013-06-03 14:47:00', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('199', '2013-06-03 14:47:00', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('200', '2013-06-03 14:47:00', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('201', '2013-06-03 14:47:37', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('202', '2013-06-03 14:47:37', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('203', '2013-06-03 14:47:37', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('204', '2013-06-03 14:47:37', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('205', '2013-06-03 14:47:37', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('206', '2013-06-03 14:47:37', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('207', '2013-06-03 14:50:03', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('208', '2013-06-03 14:50:03', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('209', '2013-06-03 14:50:03', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('210', '2013-06-03 14:50:11', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('211', '2013-06-03 14:50:11', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('212', '2013-06-03 14:50:11', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('213', '2013-06-03 14:50:22', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('214', '2013-06-03 14:50:22', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('215', '2013-06-03 14:50:22', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('216', '2013-06-03 14:53:00', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('217', '2013-06-03 14:53:00', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('218', '2013-06-03 14:53:00', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('219', '2013-06-03 14:53:08', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('220', '2013-06-03 14:53:08', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('221', '2013-06-03 14:53:08', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('222', '2013-06-03 14:53:19', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('223', '2013-06-03 14:53:19', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('224', '2013-06-03 14:53:19', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('225', '2013-06-03 14:53:36', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('226', '2013-06-03 14:53:36', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('227', '2013-06-03 14:53:36', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('228', '2013-06-03 14:53:52', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('229', '2013-06-03 14:53:52', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('230', '2013-06-03 14:53:52', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('231', '2013-06-03 15:07:52', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('232', '2013-06-03 15:07:52', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('233', '2013-06-03 15:07:52', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('234', '2013-06-03 15:08:04', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('235', '2013-06-03 15:08:04', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('236', '2013-06-03 15:08:04', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('237', '2013-06-03 15:08:53', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('238', '2013-06-03 15:08:53', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('239', '2013-06-03 15:08:53', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('240', '2013-06-03 15:10:27', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('241', '2013-06-03 15:10:27', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('242', '2013-06-03 15:10:27', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('243', '2013-06-03 15:11:42', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('244', '2013-06-03 15:11:42', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('245', '2013-06-03 15:11:42', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('246', '2013-06-03 15:12:22', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('247', '2013-06-03 15:12:22', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('248', '2013-06-03 15:12:22', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('249', '2013-06-03 15:12:39', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('250', '2013-06-03 15:12:39', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('251', '2013-06-03 15:12:39', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('252', '2013-06-03 15:13:35', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('253', '2013-06-03 15:13:35', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('254', '2013-06-03 15:13:35', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('255', '2013-06-03 15:15:06', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('256', '2013-06-03 15:15:06', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('257', '2013-06-03 15:15:06', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('258', '2013-06-03 15:16:58', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('259', '2013-06-03 15:16:58', null, null, 'abnormal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('260', '2013-06-03 15:16:58', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('261', '2013-06-03 15:17:11', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('262', '2013-06-03 15:17:11', null, null, 'abnormal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('263', '2013-06-03 15:17:11', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('264', '2013-06-03 15:20:39', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('265', '2013-06-03 15:20:39', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('266', '2013-06-03 15:20:39', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('267', '2013-06-03 15:20:49', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('268', '2013-06-03 15:20:49', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('269', '2013-06-03 15:20:49', null, null, 'abnormal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('270', '2013-06-03 15:23:06', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('271', '2013-06-03 15:23:06', null, null, 'abnormal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('272', '2013-06-03 15:23:06', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('273', '2013-06-03 15:23:19', null, null, 'normal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('274', '2013-06-03 15:23:19', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('275', '2013-06-03 15:23:19', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('276', '2013-06-03 15:23:33', null, null, 'abnormal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('277', '2013-06-03 15:23:33', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('278', '2013-06-03 15:23:33', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('279', '2013-06-03 15:27:44', null, null, 'abnormal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('280', '2013-06-03 15:27:44', null, null, 'normal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('281', '2013-06-03 15:27:44', null, null, 'normal', '3', '1', null, null);
INSERT INTO `review_item_info` VALUES ('282', '2013-06-03 15:28:25', null, null, 'abnormal', '2', '0', null, null);
INSERT INTO `review_item_info` VALUES ('283', '2013-06-03 15:28:25', null, null, 'abnormal', '1', '1', null, null);
INSERT INTO `review_item_info` VALUES ('284', '2013-06-03 15:28:25', null, null, 'abnormal', '3', '1', null, null);

-- ----------------------------
-- Table structure for `role_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info`;
CREATE TABLE `role_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `authority` varchar(255) NOT NULL,
  `roleDesc` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '2013-05-21 13:56:35', null, 'ROLE_ROOT', '超级管理员', null, null);
INSERT INTO `role_info` VALUES ('2', '2013-05-21 13:56:43', null, 'ROLE_ADMIN', '管理员', null, null);
INSERT INTO `role_info` VALUES ('3', '2013-05-21 13:57:00', null, 'ROLE_STAFF', '巡检员', null, null);

-- ----------------------------
-- Table structure for `role_info_func_info`
-- ----------------------------
DROP TABLE IF EXISTS `role_info_func_info`;
CREATE TABLE `role_info_func_info` (
  `role_info_id` bigint(20) NOT NULL,
  `funcs_id` bigint(20) NOT NULL,
  KEY `FK8DB125E17460250B` (`funcs_id`),
  KEY `FK8DB125E199C37E01` (`role_info_id`),
  CONSTRAINT `FK8DB125E17460250B` FOREIGN KEY (`funcs_id`) REFERENCES `func_info` (`id`),
  CONSTRAINT `FK8DB125E199C37E01` FOREIGN KEY (`role_info_id`) REFERENCES `role_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info_func_info
-- ----------------------------

-- ----------------------------
-- Table structure for `station_info`
-- ----------------------------
DROP TABLE IF EXISTS `station_info`;
CREATE TABLE `station_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `qrCodeInfo_id` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF794BCD9DCE184D9` (`qrCodeInfo_id`),
  CONSTRAINT `FKF794BCD9DCE184D9` FOREIGN KEY (`qrCodeInfo_id`) REFERENCES `qrcode_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_info
-- ----------------------------
INSERT INTO `station_info` VALUES ('2', '2013-05-22 22:43:28', null, '那儿。。。', null, null, '测试1112', '', '106', null, null);
INSERT INTO `station_info` VALUES ('3', '2013-06-06 00:12:48', 'root', '那儿。。。', null, null, '测试11123', '', null, '2013-06-06 00:12:48', null);
INSERT INTO `station_info` VALUES ('4', '2013-05-22 22:43:17', null, '那儿。。。', null, null, '测试111234', '', null, null, null);
INSERT INTO `station_info` VALUES ('5', '2013-05-22 22:37:36', null, '那儿。。。', null, null, '测试1112345', '', '101', null, null);
INSERT INTO `station_info` VALUES ('6', '2013-05-22 22:40:37', null, '那儿。。。', null, null, '测试11123455', '', '102', null, null);
INSERT INTO `station_info` VALUES ('7', '2013-05-22 22:41:01', null, '那儿。。。', null, null, '测试1112111', '', '103', null, null);
INSERT INTO `station_info` VALUES ('8', '2013-05-22 22:40:58', null, 'XX路213号', null, null, '配电设备1', '', '104', null, null);
INSERT INTO `station_info` VALUES ('9', '2013-06-06 00:13:29', 'root', '那儿。。。1', null, null, '测试1112311231', '', null, '2013-06-06 00:13:29', null);

-- ----------------------------
-- Table structure for `system_setting_info`
-- ----------------------------
DROP TABLE IF EXISTS `system_setting_info`;
CREATE TABLE `system_setting_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `cdkey` varchar(255) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `maxCheckPoint` int(11) NOT NULL,
  `maxStation` int(11) NOT NULL,
  `maxUser` int(11) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_setting_info
-- ----------------------------

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `updated` datetime DEFAULT NULL,
  `updater` varchar(255) DEFAULT NULL,
  `accountNonExpired` tinyint(1) NOT NULL,
  `accountNonLocked` tinyint(1) NOT NULL,
  `credentialsNonExpired` tinyint(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `nickName` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `creator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '2013-06-03 20:38:37', null, '1', '1', '1', null, '1', 'e10adc3949ba59abbe56e057f20f883e', 'root', 'XX电力公司', '王五', null, null);
INSERT INTO `user_info` VALUES ('2', '2013-05-22 01:23:20', null, '1', '1', '1', null, '1', 'e10adc3949ba59abbe56e057f20f883e', 'admin', null, '李四', null, null);
INSERT INTO `user_info` VALUES ('3', '2013-05-22 01:23:26', null, '1', '1', '1', null, '1', 'e10adc3949ba59abbe56e057f20f883e', 'staff', null, '张三', null, null);
INSERT INTO `user_info` VALUES ('13', '2013-05-22 01:50:12', null, '1', '1', '1', null, '1', 'e10adc3949ba59abbe56e057f20f883e', '18859202910', null, '王五', null, null);

-- ----------------------------
-- Table structure for `user_info_role_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info_role_info`;
CREATE TABLE `user_info_role_info` (
  `user_info_id` bigint(20) NOT NULL,
  `authorities_id` bigint(20) NOT NULL,
  KEY `FK6646677ADE430577` (`authorities_id`),
  KEY `FK6646677ADDE47D2B` (`user_info_id`),
  CONSTRAINT `FK6646677ADDE47D2B` FOREIGN KEY (`user_info_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK6646677ADE430577` FOREIGN KEY (`authorities_id`) REFERENCES `role_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info_role_info
-- ----------------------------
INSERT INTO `user_info_role_info` VALUES ('13', '1');
INSERT INTO `user_info_role_info` VALUES ('1', '1');
