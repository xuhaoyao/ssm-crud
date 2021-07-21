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

 Date: 22/07/2021 00:42:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `d_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `fk_emp_dept`(`d_id`) USING BTREE,
  CONSTRAINT `tbl_emp_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1081 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES (1001, 'e11', NULL, NULL, NULL);
INSERT INTO `tbl_emp` VALUES (1002, 'e12', NULL, NULL, NULL);
INSERT INTO `tbl_emp` VALUES (1004, 'e14', NULL, NULL, NULL);
INSERT INTO `tbl_emp` VALUES (1034, 'edd1sd4', '男', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1039, 'edd1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1040, 'edd1sd4', '男', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1041, 'edsd13', '男', '23s2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1042, 'e1dsds4', '男', '23dd2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1043, 'ess1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1044, 'ess1sd4', '女', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1045, 'edd1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1046, 'edd1sd4', '男', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1047, 'edsd13', '男', '23s2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1048, 'e1dsds4', '男', '23dd2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1049, 'ess1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1050, 'ess1sd4', '女', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1051, 'edd1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1052, 'edd1sd4', '男', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1053, 'edsd13', '男', '23s2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1054, 'e1dsds4', '男', '23dd2@sds.com', 102);
INSERT INTO `tbl_emp` VALUES (1055, 'ess1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1056, 'ess1sd4', '女', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1057, 'edd1sd3', '女', '23s2@sds.com', 101);
INSERT INTO `tbl_emp` VALUES (1058, 'edd1sd4', '男', '23dd2@sds.com', 103);
INSERT INTO `tbl_emp` VALUES (1059, 'xhy', '男', '623834276@qq.com', 102);
INSERT INTO `tbl_emp` VALUES (1060, 'VarerLeet', '女', 'sddsd@qq.com', 102);
INSERT INTO `tbl_emp` VALUES (1061, '222', '男', '3232@123.com', 101);
INSERT INTO `tbl_emp` VALUES (1062, '', '男', '', 101);
INSERT INTO `tbl_emp` VALUES (1063, 'VarerLeet2', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1064, 'VarerLeet2', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1065, 'xhy222', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1066, 'xhy2222', '男', '3232@123.com', 102);
INSERT INTO `tbl_emp` VALUES (1067, 'xhy22232', '男', '623834276@qq.com', 103);
INSERT INTO `tbl_emp` VALUES (1068, 'xhy222', '男', '3232@123.com', 102);
INSERT INTO `tbl_emp` VALUES (1069, 'VarerLeet', '女', '3232@123.com', 102);
INSERT INTO `tbl_emp` VALUES (1070, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1071, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1072, 'xhydsdaf', '男', '3232@123.com', 102);
INSERT INTO `tbl_emp` VALUES (1073, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1074, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1075, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1076, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1077, 'VarerLeet', '女', '623834276@qq.com', 102);
INSERT INTO `tbl_emp` VALUES (1078, 'VarerLeet', '男', '623834276@qq.com', 101);
INSERT INTO `tbl_emp` VALUES (1079, 'VarerLeet6', '男', '623834276@qq.com', 102);
INSERT INTO `tbl_emp` VALUES (1080, 'VarerL33eet', '女', '666666666666@qq.com', 101);

SET FOREIGN_KEY_CHECKS = 1;
