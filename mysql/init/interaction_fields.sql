/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : interaction_fields

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 22/09/2021 21:07:01
*/

CREATE DATABASE  `interaction_fields` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use interaction_fields;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dict_attachment_status
-- ----------------------------
DROP TABLE IF EXISTS `dict_attachment_status`;
CREATE TABLE `dict_attachment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dict_attachment_status
-- ----------------------------
BEGIN;
INSERT INTO `dict_attachment_status` VALUES (1, '成功');
INSERT INTO `dict_attachment_status` VALUES (2, '错误');
INSERT INTO `dict_attachment_status` VALUES (3, '超出时间限制');
INSERT INTO `dict_attachment_status` VALUES (4, '超出内存限制');
COMMIT;

-- ----------------------------
-- Table structure for dict_attachment_type
-- ----------------------------
DROP TABLE IF EXISTS `dict_attachment_type`;
CREATE TABLE `dict_attachment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dict_attachment_type
-- ----------------------------
BEGIN;
INSERT INTO `dict_attachment_type` VALUES (1, 'language/Java');
INSERT INTO `dict_attachment_type` VALUES (2, 'language/CPP');
INSERT INTO `dict_attachment_type` VALUES (3, 'language/CLang');
INSERT INTO `dict_attachment_type` VALUES (4, 'language/JavaScript');
INSERT INTO `dict_attachment_type` VALUES (5, 'language/Python');
COMMIT;

-- ----------------------------
-- Table structure for dict_role
-- ----------------------------
DROP TABLE IF EXISTS `dict_role`;
CREATE TABLE `dict_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dict_role
-- ----------------------------
BEGIN;
INSERT INTO `dict_role` VALUES (1, 'ROLE_USER');
COMMIT;

-- ----------------------------
-- Table structure for tb_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tb_attachment`;
CREATE TABLE `tb_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meeting_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `binary` blob NOT NULL,
  `type_id` int NOT NULL,
  `result` blob,
  `status_id` int DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_attachment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_meeting
-- ----------------------------
DROP TABLE IF EXISTS `tb_meeting`;
CREATE TABLE `tb_meeting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_meeting
-- ----------------------------
BEGIN;
INSERT INTO `tb_meeting` VALUES (16, '45a02d2d-53cc-48d5-9137-d13bfb5f850d', 'a的会议', 'T3O7BP', '109fa65f-76cb-42a0-8da6-ca78ec81d5f9', '2021-08-31 21:35:58', NULL);
INSERT INTO `tb_meeting` VALUES (17, '7409d5ea-06f9-46e3-8fa0-ca57bfb01258', 'c的会议', 'VPMTCK', '104abcd1-33db-4910-82c9-30975e9162c4', '2021-09-08 18:11:44', NULL);
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_at` datetime NOT NULL,
  `sign_up_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` VALUES (1, '109fa65f-76cb-42a0-8da6-ca78ec81d5f9', 'a', '123123', '12124', '$2a$10$jk3z3//pET/4NNTFVcZX4uc0sbd6.mdSsUtzdecr3HuuTJe43U8fW', '2021-07-19 03:17:58', '2021-07-19 03:18:03');
INSERT INTO `tb_user` VALUES (2, '1045a9d1-33db-4910-82c9-30975e9162c4', 'b', NULL, NULL, '$2a$10$jk3z3//pET/4NNTFVcZX4uc0sbd6.mdSsUtzdecr3HuuTJe43U8fW', '2021-07-19 04:56:07', '2021-07-19 04:56:07');
INSERT INTO `tb_user` VALUES (3, '104abcd1-33db-4910-82c9-30975e9162c4', 'c', NULL, NULL, '$2a$10$jk3z3//pET/4NNTFVcZX4uc0sbd6.mdSsUtzdecr3HuuTJe43U8fW', '2021-07-19 04:56:07', '2021-07-19 04:56:07');
INSERT INTO `tb_user` VALUES (4, '101111d1-33db-4910-82c9-30975e9162c4', 'd', NULL, NULL, '$2a$10$jk3z3//pET/4NNTFVcZX4uc0sbd6.mdSsUtzdecr3HuuTJe43U8fW', '2021-07-19 04:56:07', '2021-07-19 04:56:07');
COMMIT;

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
BEGIN;
INSERT INTO `tb_user_role` VALUES (1, '109fa65f-76cb-42a0-8da6-ca78ec81d5f9', 1);
INSERT INTO `tb_user_role` VALUES (2, '1045a9d1-33db-4910-82c9-30975e9162c4', 1);
INSERT INTO `tb_user_role` VALUES (3, '104abcd1-33db-4910-82c9-30975e9162c4', 1);
INSERT INTO `tb_user_role` VALUES (4, '101111d1-33db-4910-82c9-30975e9162c4', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
