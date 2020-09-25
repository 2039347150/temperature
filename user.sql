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

 Date: 25/09/2020 09:05:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `sex` enum('女','男') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `age` int(11) NOT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像路径',
  `checked_time` datetime(0) NULL DEFAULT NULL COMMENT '打卡时间',
  `checked_days` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '打卡天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20172207 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('吕全品', '123', 20170000, '男', 20, '/images/lqp.jpg', '2020-09-20 20:47:30', '0,1');
INSERT INTO `user` VALUES ('黄菊', '123', 20172088, '女', 21, '/images/hj.jpg', '2020-09-20 20:46:08', '0,1');
INSERT INTO `user` VALUES ('张灵灵', '123', 20172090, '女', 22, '/images/zll.jpg', '2020-09-24 00:00:00', '0,1');
INSERT INTO `user` VALUES ('游良军', '123', 20172134, '男', 22, '/images/ylj.jpg', '2020-09-24 00:00:00', '0,1');
INSERT INTO `user` VALUES ('彭俊', '123', 20172145, '男', 18, '/images/pj.jpg', '2020-09-25 00:00:00', '0,1,24,25');
INSERT INTO `user` VALUES ('王钰', '123', 20172156, '女', 22, '/images/wy.jpg', '2020-09-20 20:48:55', '0,1');
INSERT INTO `user` VALUES ('温子晗', '123', 20172161, '男', 22, '/images/wzh.jpg', '2020-09-25 00:00:00', '0,1,2,3,24,25');
INSERT INTO `user` VALUES ('陈静', '123', 20172168, '女', 22, '/images/cj.jpg', '2020-09-20 20:46:50', '0,1');
INSERT INTO `user` VALUES ('彭清仪', '123', 20172206, '女', 20, '/images/pqy.jpg', '2020-09-24 00:00:00', '0,1');

SET FOREIGN_KEY_CHECKS = 1;
