/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : dl_review

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2013-05-22 22:16:34
*/

SET FOREIGN_KEY_CHECKS=0;
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
  PRIMARY KEY (`id`),
  KEY `FK1C63FD057E797E9B` (`deviceClassInfo_id`),
  CONSTRAINT `FK1C63FD057E797E9B` FOREIGN KEY (`deviceClassInfo_id`) REFERENCES `device_class_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checkpoint_info
-- ----------------------------
INSERT INTO `checkpoint_info` VALUES ('1', '2013-05-22 00:51:16', null, '1', '配变（架）与树木、竹子安全距离严重不足，危及安全', 'type1', '6');
INSERT INTO `checkpoint_info` VALUES ('2', '2013-05-22 00:49:35', null, '0', '10kV挂式（针式）绝缘子破裂，复合绝缘子表面裂纹。', 'type1', '2');
INSERT INTO `checkpoint_info` VALUES ('3', '2013-05-22 00:51:11', null, '1', '户外杆上电缆头与通信线相碰或安全距离不足，危及安全', 'type5', '6');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_class_info
-- ----------------------------
INSERT INTO `device_class_info` VALUES ('1', null, null, '变压器', null);
INSERT INTO `device_class_info` VALUES ('2', null, null, '瓷质绝缘件', null);
INSERT INTO `device_class_info` VALUES ('3', null, null, '刀闸\\跌落式开关', null);
INSERT INTO `device_class_info` VALUES ('4', null, null, '导线', null);
INSERT INTO `device_class_info` VALUES ('5', null, null, '电缆本体', null);
INSERT INTO `device_class_info` VALUES ('6', null, null, '电缆接头\r\n附件', null);
INSERT INTO `device_class_info` VALUES ('7', null, null, '电缆走廊', null);
INSERT INTO `device_class_info` VALUES ('8', null, null, '柱上开关（断路器、负荷开关）', null);
INSERT INTO `device_class_info` VALUES ('9', null, null, '防雷接地', null);
INSERT INTO `device_class_info` VALUES ('10', null, null, '杆塔、横\r\n担、拉线', null);
INSERT INTO `device_class_info` VALUES ('11', null, null, '金具', null);
INSERT INTO `device_class_info` VALUES ('12', null, null, '开关柜保护', null);
INSERT INTO `device_class_info` VALUES ('13', null, null, '开关柜（环网柜）', null);
INSERT INTO `device_class_info` VALUES ('14', null, null, '母线', null);
INSERT INTO `device_class_info` VALUES ('15', null, null, '小区电气', null);
INSERT INTO `device_class_info` VALUES ('16', null, null, '小区附属配置', null);
INSERT INTO `device_class_info` VALUES ('17', null, null, '小区土建', null);
INSERT INTO `device_class_info` VALUES ('18', null, null, '指示器显示器等', null);
INSERT INTO `device_class_info` VALUES ('19', null, null, '自动化', null);
INSERT INTO `device_class_info` VALUES ('20', null, null, '配网调度', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of func_info
-- ----------------------------
INSERT INTO `func_info` VALUES ('1', '2013-05-21 13:55:12', null, '1', '二维码维护', '/qrcode', null);
INSERT INTO `func_info` VALUES ('2', '2013-05-21 13:55:25', null, '1', '用户维护', '/user', null);
INSERT INTO `func_info` VALUES ('3', '2013-05-21 13:55:52', null, '1', '基站维护', '/station', null);
INSERT INTO `func_info` VALUES ('4', '2013-05-21 13:56:20', null, '1', '系统参数设置', '/setting', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrcode_info
-- ----------------------------
INSERT INTO `qrcode_info` VALUES ('2', '2013-05-21 18:26:59', null, '1ZVIDIAQRCODE测试', null, '062700fb723a26839f61220351d38be9.png');
INSERT INTO `qrcode_info` VALUES ('3', '2013-05-21 20:15:54', null, '1ZVIDIAQRCODE测试', null, '062700fb723a26839f61220351d38be9.png');
INSERT INTO `qrcode_info` VALUES ('4', '2013-05-21 20:16:12', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('5', '2013-05-21 20:17:03', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('6', '2013-05-21 20:18:02', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('7', '2013-05-21 20:18:23', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('8', '2013-05-21 20:19:09', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('9', '2013-05-21 20:19:09', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('10', '2013-05-21 20:19:09', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('11', '2013-05-21 20:19:09', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('12', '2013-05-21 20:19:09', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('13', '2013-05-21 20:19:09', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('14', '2013-05-21 20:19:16', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('15', '2013-05-21 20:19:16', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('16', '2013-05-21 20:19:17', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('17', '2013-05-21 20:19:17', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('18', '2013-05-21 20:19:17', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('19', '2013-05-21 20:19:17', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('20', '2013-05-21 20:20:44', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('21', '2013-05-21 20:20:44', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('22', '2013-05-21 20:20:44', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('23', '2013-05-21 20:20:44', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('24', '2013-05-21 20:20:44', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('25', '2013-05-21 20:20:44', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('26', '2013-05-21 20:21:25', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('27', '2013-05-21 20:21:25', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('28', '2013-05-21 20:21:25', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('29', '2013-05-21 20:21:25', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('30', '2013-05-21 20:21:25', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('31', '2013-05-21 20:21:25', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('32', '2013-05-21 20:21:39', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('33', '2013-05-21 20:21:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('34', '2013-05-21 20:21:39', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('35', '2013-05-21 20:21:40', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('36', '2013-05-21 20:21:40', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('37', '2013-05-21 20:21:40', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('38', '2013-05-21 20:21:53', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('39', '2013-05-21 20:21:53', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('40', '2013-05-21 20:21:53', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('41', '2013-05-21 20:21:53', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('42', '2013-05-21 20:21:53', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('43', '2013-05-21 20:21:53', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('44', '2013-05-21 20:22:52', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('45', '2013-05-21 20:22:52', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('46', '2013-05-21 20:22:52', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('47', '2013-05-21 20:22:52', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('48', '2013-05-21 20:22:52', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('49', '2013-05-21 20:22:52', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('50', '2013-05-21 20:23:17', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('51', '2013-05-21 20:23:17', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('52', '2013-05-21 20:23:17', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('53', '2013-05-21 20:23:17', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('54', '2013-05-21 20:23:17', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('55', '2013-05-21 20:23:17', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('56', '2013-05-21 20:23:22', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('57', '2013-05-21 20:23:26', null, '1ZVIDIAQRCODE测试111', null, 'd614c40fb7d90a08940939d4dd3429a7.png');
INSERT INTO `qrcode_info` VALUES ('59', '2013-05-21 20:34:18', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('60', '2013-05-21 20:34:24', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('61', '2013-05-21 20:34:27', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('62', '2013-05-21 20:37:30', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('63', '2013-05-21 20:37:30', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('64', '2013-05-21 20:37:30', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('65', '2013-05-21 20:37:30', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('66', '2013-05-21 20:37:30', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('67', '2013-05-21 20:37:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('68', '2013-05-21 20:38:01', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('69', '2013-05-21 20:38:39', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('70', '2013-05-21 20:38:49', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('71', '2013-05-21 20:38:58', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('72', '2013-05-21 20:39:06', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('73', '2013-05-21 20:39:06', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('74', '2013-05-21 20:39:06', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('75', '2013-05-21 20:39:06', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('76', '2013-05-21 20:39:06', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('77', '2013-05-22 02:57:35', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('78', '2013-05-22 02:57:38', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('79', '2013-05-22 02:57:38', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('80', '2013-05-22 02:57:38', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('81', '2013-05-22 02:57:38', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('82', '2013-05-22 02:57:38', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('83', '2013-05-22 02:57:38', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png');
INSERT INTO `qrcode_info` VALUES ('84', '2013-05-22 03:00:51', null, '2ZVIDIAQRCODE测试1112', null, 'de9be416d9ca6c007debfc170095eee6.png');
INSERT INTO `qrcode_info` VALUES ('85', '2013-05-22 03:00:51', null, '3ZVIDIAQRCODE测试11123', null, '4e8de451dd131ac877c9fa828feb16f1.png');
INSERT INTO `qrcode_info` VALUES ('86', '2013-05-22 03:00:51', null, '4ZVIDIAQRCODE测试111234', null, 'f1124f6d2d38ec6ff8504ca07ed9e49b.png');
INSERT INTO `qrcode_info` VALUES ('87', '2013-05-22 03:00:51', null, '5ZVIDIAQRCODE测试1112345', null, 'dc7fcc61abec9d352caf7229fe8e2a77.png');
INSERT INTO `qrcode_info` VALUES ('88', '2013-05-22 03:00:51', null, '6ZVIDIAQRCODE测试11123455', null, '17a221611b832b8373f8fbfa06de84cb.png');
INSERT INTO `qrcode_info` VALUES ('89', '2013-05-22 03:00:51', null, '7ZVIDIAQRCODE测试1112111', null, '22bced6eb2376ae134833d2f547e9e6c.png');
INSERT INTO `qrcode_info` VALUES ('90', '2013-05-22 03:00:51', null, '8ZVIDIAQRCODE配电设备1', null, 'e61b4f81701a684fb363d2240a3b0042.png');

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
  PRIMARY KEY (`id`),
  KEY `FK5109FD35F3D3DDFB` (`stationInfo_id`),
  KEY `FK5109FD35DBE2F74` (`userInfo_id`),
  CONSTRAINT `FK5109FD35DBE2F74` FOREIGN KEY (`userInfo_id`) REFERENCES `user_info` (`id`),
  CONSTRAINT `FK5109FD35F3D3DDFB` FOREIGN KEY (`stationInfo_id`) REFERENCES `station_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_info
-- ----------------------------
INSERT INTO `review_info` VALUES ('1', '2013-05-22 01:56:06', null, null, '2', '1', '1', 'test');
INSERT INTO `review_info` VALUES ('7', '2013-05-22 02:06:08', null, null, '2', '1', '1', 'test');
INSERT INTO `review_info` VALUES ('8', '2013-05-22 02:07:19', null, null, '3', '1', '1', 'test');
INSERT INTO `review_info` VALUES ('9', '2013-05-22 02:08:20', null, null, '3', '1', '1', 'test');
INSERT INTO `review_info` VALUES ('10', '2013-05-22 02:08:51', null, null, '3', '1', '0', 'test');

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
  PRIMARY KEY (`id`),
  KEY `FK3D803A33BC3BCF19` (`checkpointInfo_id`),
  CONSTRAINT `FK3D803A33BC3BCF19` FOREIGN KEY (`checkpointInfo_id`) REFERENCES `checkpoint_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_item_info
-- ----------------------------
INSERT INTO `review_item_info` VALUES ('1', '2013-05-22 02:06:08', null, null, 'normal', '1', '1');
INSERT INTO `review_item_info` VALUES ('2', '2013-05-22 02:07:19', null, null, 'normal', '1', '1');
INSERT INTO `review_item_info` VALUES ('3', '2013-05-22 02:08:20', null, null, 'normal', '1', '1');
INSERT INTO `review_item_info` VALUES ('4', '2013-05-22 02:08:20', null, null, 'normal', '2', '0');
INSERT INTO `review_item_info` VALUES ('5', '2013-05-22 02:08:51', null, null, 'normal', '2', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_info
-- ----------------------------
INSERT INTO `role_info` VALUES ('1', '2013-05-21 13:56:35', null, 'ROOT', '超级管理员');
INSERT INTO `role_info` VALUES ('2', '2013-05-21 13:56:43', null, 'ADMIN', '管理员');
INSERT INTO `role_info` VALUES ('3', '2013-05-21 13:57:00', null, 'STAFF', '巡检员');

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
  PRIMARY KEY (`id`),
  KEY `FKF794BCD9DCE184D9` (`qrCodeInfo_id`),
  CONSTRAINT `FKF794BCD9DCE184D9` FOREIGN KEY (`qrCodeInfo_id`) REFERENCES `qrcode_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of station_info
-- ----------------------------
INSERT INTO `station_info` VALUES ('2', '2013-05-21 20:18:48', null, '那儿。。。', null, null, '测试1112', '', '84');
INSERT INTO `station_info` VALUES ('3', '2013-05-21 20:18:51', null, '那儿。。。', null, null, '测试11123', '', '85');
INSERT INTO `station_info` VALUES ('4', '2013-05-21 20:18:54', null, '那儿。。。', null, null, '测试111234', '', '86');
INSERT INTO `station_info` VALUES ('5', '2013-05-21 20:18:57', null, '那儿。。。', null, null, '测试1112345', '', '87');
INSERT INTO `station_info` VALUES ('6', '2013-05-21 20:19:00', null, '那儿。。。', null, null, '测试11123455', '', '88');
INSERT INTO `station_info` VALUES ('7', '2013-05-22 01:36:46', null, '那儿。。。', null, null, '测试1112111', '', '89');
INSERT INTO `station_info` VALUES ('8', '2013-05-22 03:00:33', null, 'XX路213号', null, null, '配电设备1', '', '90');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '2013-05-22 01:45:48', null, '0', '0', '0', null, '0', 'e10adc3949ba59abbe56e057f20f883e', 'root', null, '王五');
INSERT INTO `user_info` VALUES ('2', '2013-05-22 01:23:20', null, '0', '0', '0', null, '0', 'e10adc3949ba59abbe56e057f20f883e', 'admin', null, '李四');
INSERT INTO `user_info` VALUES ('3', '2013-05-22 01:23:26', null, '0', '0', '0', null, '0', 'e10adc3949ba59abbe56e057f20f883e', 'staff', null, '张三');
INSERT INTO `user_info` VALUES ('13', '2013-05-22 01:50:12', null, '0', '0', '0', null, '0', 'e10adc3949ba59abbe56e057f20f883e', 'root11', null, '王五');

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
INSERT INTO `user_info_role_info` VALUES ('1', '1');
INSERT INTO `user_info_role_info` VALUES ('13', '1');
