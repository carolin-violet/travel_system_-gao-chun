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

 Date: 30/05/2022 21:37:55
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
INSERT INTO `delicacy` VALUES ('1528260176480604161', '蟹黄包', '很好吃', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/752166c31d8e4dcd8134dfba8f043ecanrwmem.png', 3, 0, '2022-05-22 14:23:14', '2022-05-28 13:21:46');
INSERT INTO `delicacy` VALUES ('1529088864428240897', '米糕', '很好吃', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/07bae3b685c74967a020e9b76e615003[3275]【PFRD】世界が終わる日-64117602.png', 2, 0, '2022-05-24 21:16:09', '2022-05-29 20:45:00');

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
INSERT INTO `feedback` VALUES ('1528361382464978945', 'asdfd', '卧槽', 0, '2022-05-22 21:05:24', '2022-05-22 21:05:24');
INSERT INTO `feedback` VALUES ('1528617766280605698', 'sdgsdg', '卧槽', 0, '2022-05-23 14:04:10', '2022-05-23 14:04:10');
INSERT INTO `feedback` VALUES ('1531263487915925505', 'azsd', 'ghgfjhg', 0, '2022-05-30 21:17:20', '2022-05-30 21:17:20');

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
INSERT INTO `hotel` VALUES ('1530439994282373121', '狮王酒馆', '阿斯蒂芬', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/87fb9487a68b452caef32257376b98ac1.png', 3, 1, '2022-05-28 14:45:04', '2022-05-28 14:45:04');
INSERT INTO `hotel` VALUES ('1530789837718708225', '狮王旅馆', '奥里给', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/56c64435ee64405391d316b3f037eb69[3056]【COMITIA120】flap-62713348.png', 3, 0, '2022-05-29 13:55:13', '2022-05-29 20:37:06');

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
INSERT INTO `manager` VALUES ('1528213171205128194', 'admin2', '12345678910', '$2a$10$1U.9C0YPSBCaZFwVhiKV.eJiufB1pVbVbbPdG/GgJFk46enqdAXG2', 0, '2022-05-22 11:16:28', '2022-05-22 14:52:32');
INSERT INTO `manager` VALUES ('1528358307016765442', 'admin11', '12345678911', '$2a$10$1U.9C0YPSBCaZFwVhiKV.eJiufB1pVbVbbPdG/GgJFk46enqdAXG2', 0, '2022-05-22 20:53:11', '2022-05-25 18:04:32');
INSERT INTO `manager` VALUES ('1529403204062740482', '奥里给', '12345678912', '$2a$10$1U.9C0YPSBCaZFwVhiKV.eJiufB1pVbVbbPdG/GgJFk46enqdAXG2', 0, '2022-05-25 18:05:13', '2022-05-25 18:05:13');

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
INSERT INTO `notice` VALUES ('1528276227691917314', '公告AA', '今天下雨呀，注意安全', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f366bb8f50ed4b1e8f4e1fb1823dd4cc[6612]夏のお祭り-61749296.png', 0, '2022-05-22 15:27:01', '2022-05-29 20:55:56');

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
INSERT INTO `permission` VALUES (12, '1528213171205128194', 3);
INSERT INTO `permission` VALUES (13, '1528213171205128194', 7);
INSERT INTO `permission` VALUES (14, '1528358307016765442', 4);
INSERT INTO `permission` VALUES (15, '1528358307016765442', 6);
INSERT INTO `permission` VALUES (16, '1528358307016765442', 7);
INSERT INTO `permission` VALUES (17, '1529403204062740482', 8);

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
INSERT INTO `photos` VALUES ('1530438065770758146', '1528227447567302657', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/8a8ad5cc87a547ccb8dbda5f12e002901.png', 0, '2022-05-28 14:37:24', '2022-05-28 14:37:24');
INSERT INTO `photos` VALUES ('1530438077925851138', '1528227447567302657', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/f992971a691c47fda3cf375ea6d33ba62.png', 0, '2022-05-28 14:37:27', '2022-05-28 14:37:27');
INSERT INTO `photos` VALUES ('1530457310806159361', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/e7cf90fb2584482fb07b92cd7579bae61.png', 0, '2022-05-28 15:53:52', '2022-05-28 15:53:52');
INSERT INTO `photos` VALUES ('1530502751266574338', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/ff6a51d2163f450db03261de19e0e154课表.png', 1, '2022-05-28 18:54:26', '2022-05-28 18:54:26');
INSERT INTO `photos` VALUES ('1530558416789991426', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/89c488565ef94502aae86a8c42621403[2222]第二地区-59695820.png', 0, '2022-05-28 22:35:38', '2022-05-28 22:35:38');
INSERT INTO `photos` VALUES ('1530698086815404033', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/42c0d0e607204d45991b402987ae9140[2375]№白◆Tiger-64141182.png', 0, '2022-05-29 07:50:38', '2022-05-29 07:50:38');
INSERT INTO `photos` VALUES ('1530698086815404034', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/6d36b69cb40e45d6b14cf04db165014b[2300]青龍っ娘ちゃん-59227888.png', 0, '2022-05-29 07:50:38', '2022-05-29 07:50:38');
INSERT INTO `photos` VALUES ('1530698087255805954', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/2387c2264ba74412baecbc4dc460f6de[2378]黑翼-65215835.png', 0, '2022-05-29 07:50:38', '2022-05-29 07:50:38');
INSERT INTO `photos` VALUES ('1530698097846423554', '1528359301754765313', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/a959ad8955094202890b520a220ccc54[2639]春のささやき-62668066.png', 0, '2022-05-29 07:50:40', '2022-05-29 07:50:40');
INSERT INTO `photos` VALUES ('1530830429928656898', '1530789837718708225', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/3c693513c0454d5880c140ebb4e1982b[2242]猫-64711786.jpg', 0, '2022-05-29 16:36:31', '2022-05-29 16:36:31');
INSERT INTO `photos` VALUES ('1531263488104669185', '1531263487915925505', 'sdfsdg', 0, '2022-05-30 21:17:20', '2022-05-30 21:17:20');

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
INSERT INTO `role` VALUES (6, 'ROLE_ROUTE', '管理旅游路线');
INSERT INTO `role` VALUES (7, 'ROLE_NOTE', '管理游记信息');
INSERT INTO `role` VALUES (8, 'ROLE_FEEDBACK', '管理反馈信息');

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
INSERT INTO `route_detail` VALUES ('1528329486771171330', '1528314711727235073', '狮王旅馆', 1, '古老美丽', '11:59:57', '17:59:57', 0, '2022-05-22 18:58:39', '2022-05-26 19:31:41');
INSERT INTO `route_detail` VALUES ('1528329689679015937', '1528314711727235073', '游子山', 2, '4A景区qq', '08:59:57', '17:59:57', 0, '2022-05-22 18:59:28', '2022-05-22 19:01:57');
INSERT INTO `route_detail` VALUES ('1529788157329973250', '1528314711727235073', '狮王旅馆', 3, '挖坟公司返回干饭加个红客户尽快', '19:34:48', '21:34:49', 0, '2022-05-26 19:34:53', '2022-05-26 19:34:53');

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
INSERT INTO `scenic_spot` VALUES ('1528251322355183618', '游子山景区', '国家4A旅游景区', 'https://edu-19527.oss-cn-nanjing.aliyuncs.com/travel_GaoChun/48275b6cc0364a1e8ca68393bf2685f8[10328]陨石来临-60277048.jpg', 1, 0, '2022-05-22 13:48:03', '2022-05-29 20:41:56');

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
INSERT INTO `tourist` VALUES ('1531255715816026114', 'qaq', 'sds', '123456', 'dsfg', 0, '2022-05-30 20:46:27', '2022-05-30 20:46:27');

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
INSERT INTO `tourist_route` VALUES ('1528314711727235073', '快乐一日游', 'qaqqq按付款上来看估计没得看了附件NHK发的那个亨利墨菲过滤发惹麻烦跟进了恢复工具法国海军规划', '浮动后辜负了昆明九年好哥们，农民工和，吗李福根漫画，；‘的地方划分', 0, '2022-05-22 17:59:57', '2022-05-26 12:55:19');

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
INSERT INTO `travel_note` VALUES ('1528359301754765313', 'zj', '奥里给', 0, '2022-05-22 20:57:08', '2022-05-22 20:57:08');
INSERT INTO `travel_note` VALUES ('1528602195874832386', 'zj', '奥里给', 1, '2022-05-23 13:02:18', '2022-05-23 13:02:18');
INSERT INTO `travel_note` VALUES ('1528617602061021186', 'zj', '奥里给', 1, '2022-05-23 14:03:31', '2022-05-23 14:03:31');

SET FOREIGN_KEY_CHECKS = 1;
