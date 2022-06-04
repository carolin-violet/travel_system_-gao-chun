/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 31/05/2022 11:30:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论序号',
  `mark_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆、景点、美食等id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '评论时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1531477209812910081', '1531474342561529857', '1531476971047960577', 'wafda', 1, '2022-05-31 11:26:35', '2022-05-31 11:26:35');

-- ----------------------------
-- Table structure for delicacy
-- ----------------------------
DROP TABLE IF EXISTS `delicacy`;
CREATE TABLE `delicacy`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食描述',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '美食图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delicacy
-- ----------------------------
INSERT INTO `delicacy` VALUES ('1531476136838643714', '蟹黄包', '肥美', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/0e4ef6ca463b4d2289a04181626c274ddog.jpg', 5, 0, '2022-05-31 11:22:19', '2022-05-31 11:22:19');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反馈内容',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆介绍',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '旅馆图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级(用户主网站展示)',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1531474342561529857', '狮王旅馆', '美丽幽静', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/d81dd6ca379d46579eebdfd9def6cdf29866091_carolin-zhou_1641393112.png', 3, 0, '2022-05-31 11:15:11', '2022-05-31 11:19:17');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员手机号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除(1为删除，0为没删除)',
  `create_time` datetime(0) NOT NULL COMMENT '记录添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '记录修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('0', 'admin', '17075256495', '$2a$10$1U.9C0YPSBCaZFwVhiKV.eJiufB1pVbVbbPdG/GgJFk46enqdAXG2', 0, '2022-05-24 09:07:27', '2022-05-24 09:07:32');
INSERT INTO `manager` VALUES ('1531473122052620289', '王东', '12345678910', '$2a$10$Qml2UWOcgs.6Vm002CK/CumZH3BakApOHs0Eu0g9/jBB1zzX2aMr6', 0, '2022-05-31 11:10:20', '2022-05-31 11:10:20');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告描述',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告图片',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1531476213003010050', '端午活动', '2131', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8de4ec61f68d4de892a58c1fb4f261479866091_carolin-zhou_1641393112.png', 0, '2022-05-31 11:22:37', '2022-05-31 11:22:37');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '0', 1);
INSERT INTO `permission` VALUES (4, '0', 2);
INSERT INTO `permission` VALUES (5, '0', 3);
INSERT INTO `permission` VALUES (6, '0', 4);
INSERT INTO `permission` VALUES (7, '0', 5);
INSERT INTO `permission` VALUES (8, '0', 6);
INSERT INTO `permission` VALUES (9, '0', 7);
INSERT INTO `permission` VALUES (10, '0', 8);
INSERT INTO `permission` VALUES (18, '0', 9);
INSERT INTO `permission` VALUES (19, '0', 10);
INSERT INTO `permission` VALUES (20, '1531473122052620289', 2);
INSERT INTO `permission` VALUES (21, '1531473122052620289', 7);
INSERT INTO `permission` VALUES (22, '1531473122052620289', 9);

-- ----------------------------
-- Table structure for photos
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片id',
  `mark_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片所属类型id，比如(旅馆、景点、美食、游记等等)',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片链接',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of photos
-- ----------------------------
INSERT INTO `photos` VALUES ('1531475962884079618', '1531475910983761922', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/1897065a4c6a48d09d04badfc07eafe3a879f14bbfaf4691bf7dff8e71a87bc3.png', 0, '2022-05-31 11:21:38', '2022-05-31 11:21:38');
INSERT INTO `photos` VALUES ('1531477480962080770', '1531477480962080769', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/9f07ed92e09943119abaaf71d2102a911b87e2c5880511ebb6edd017c2d2eca2.png', 1, '2022-05-31 11:27:40', '2022-05-31 11:27:40');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_desc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ROLE_MANAGER', '超级管理员管理普通管理员');
INSERT INTO `role` VALUES (2, 'ROLE_HOTEL', '管理旅馆信息');
INSERT INTO `role` VALUES (3, 'ROLE_SCENIC', '管理景点信息');
INSERT INTO `role` VALUES (4, 'ROLE_DELICACY', '管理美食信息');
INSERT INTO `role` VALUES (5, 'ROLE_NOTICE', '管理公告信息');
INSERT INTO `role` VALUES (6, 'ROLE_ROUTE', '管理旅游路线信息');
INSERT INTO `role` VALUES (7, 'ROLE_NOTE', '管理游记信息');
INSERT INTO `role` VALUES (8, 'ROLE_FEEDBACK', '管理反馈信息');
INSERT INTO `role` VALUES (9, 'ROLE_TOURIST', '管理游客信息');
INSERT INTO `role` VALUES (10, 'ROLE_COMMENT', '管理评论信息');

-- ----------------------------
-- Table structure for route_detail
-- ----------------------------
DROP TABLE IF EXISTS `route_detail`;
CREATE TABLE `route_detail`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点id',
  `route_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `site` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `sort` tinyint(0) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点活动详情描述',
  `start_time` time(0) NOT NULL COMMENT '站点活动开始时间',
  `end_time` time(0) NOT NULL COMMENT '站点活动结束时间',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route_detail
-- ----------------------------

-- ----------------------------
-- Table structure for scenic_spot
-- ----------------------------
DROP TABLE IF EXISTS `scenic_spot`;
CREATE TABLE `scenic_spot`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点介绍',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '景点图片',
  `popular` tinyint(0) NOT NULL COMMENT '展示优先级',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic_spot
-- ----------------------------
INSERT INTO `scenic_spot` VALUES ('1531475910983761922', '游子山', '曲径通幽处', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/b06fadbc957d4a7d8587920a9cc017279866091_carolin-zhou_1634606834.png', 4, 0, '2022-05-31 11:21:25', '2022-05-31 11:21:25');

-- ----------------------------
-- Table structure for tourist
-- ----------------------------
DROP TABLE IF EXISTS `tourist`;
CREATE TABLE `tourist`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickName` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_deleted` tinyint(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `modify_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tourist
-- ----------------------------
INSERT INTO `tourist` VALUES ('1531476971047960577', 'qaq', '1111111111', '123456', 'dsfg', 1, '2022-05-31 11:25:38', '2022-05-31 11:25:38');

-- ----------------------------
-- Table structure for tourist_route
-- ----------------------------
DROP TABLE IF EXISTS `tourist_route`;
CREATE TABLE `tourist_route`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路id',
  `title` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '线路描述',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐原因',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tourist_route
-- ----------------------------

-- ----------------------------
-- Table structure for travel_note
-- ----------------------------
DROP TABLE IF EXISTS `travel_note`;
CREATE TABLE `travel_note`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游记id',
  `tourist_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游客id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '游记内容',
  `is_deleted` tinyint(0) NOT NULL COMMENT '逻辑删除',
  `create_time` datetime(0) NOT NULL COMMENT '添加时间',
  `modify_time` datetime(0) NOT NULL COMMENT '修改时间\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of travel_note
-- ----------------------------
INSERT INTO `travel_note` VALUES ('1531477480962080769', '1531476971047960577', 'ghgfjhg', 1, '2022-05-31 11:27:40', '2022-05-31 11:27:40');

SET FOREIGN_KEY_CHECKS = 1;
