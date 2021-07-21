/*
 Navicat Premium Data Transfer

 Source Server         : VarerLeet
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : ssm-crud

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 22/07/2021 00:42:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES (101, '市场部');
INSERT INTO `tbl_dept` VALUES (102, '文娱部');
INSERT INTO `tbl_dept` VALUES (103, '销售部');

SET FOREIGN_KEY_CHECKS = 1;
