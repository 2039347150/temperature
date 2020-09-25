/*
 Navicat Premium Data Transfer

 Source Server         : 连接MySQL
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : 127.0.0.1:3306
 Source Schema         : temperature

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 25/09/2020 09:05:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detail
-- ----------------------------
DROP TABLE IF EXISTS `detail`;
CREATE TABLE `detail`  (
  `temperature` int(11) NOT NULL COMMENT '体温',
  `health_status` enum('生病痊愈','生病中','正常') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '正常' COMMENT '身体状况',
  `apart_status` enum('治疗隔离','自我隔离','正常居家') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '正常居家' COMMENT '隔离状态',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '打卡地点',
  `id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  CONSTRAINT `id` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
