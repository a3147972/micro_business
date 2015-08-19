/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : micro

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 08/19/2015 15:08:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `think_admin`
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '性别 1-男 2-女 3-保密',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  `nickname` varchar(64) DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
--  Records of `think_admin`
-- ----------------------------
BEGIN;
INSERT INTO `think_admin` VALUES ('1', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员', '1', '10', '2015-08-15 14:59:20', '2015-08-15 14:59:22', '超级管理员');
COMMIT;

-- ----------------------------
--  Table structure for `think_agent`
-- ----------------------------
DROP TABLE IF EXISTS `think_agent`;
CREATE TABLE `think_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `mobile` varchar(13) NOT NULL COMMENT '手机号',
  `id_card` varchar(20) NOT NULL COMMENT '身份证',
  `wechat_number` varchar(255) NOT NULL COMMENT '微信号',
  `class_id` int(11) NOT NULL COMMENT '代理等级',
  `authorize_code` varchar(128) NOT NULL COMMENT '授权编码',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='代理商表';

-- ----------------------------
--  Records of `think_agent`
-- ----------------------------
BEGIN;
INSERT INTO `think_agent` VALUES ('2', '111', '111', '111', '111', '11', '2', '111', '2015-08-16 23:34:57', '2015-08-16 23:34:57'), ('3', '11', '111', '111', '11', '11', '3', '111111', '2015-08-17 09:00:01', '2015-08-17 09:00:01'), ('4', '张三', './Uploads/20150817/55d18f9b3b98b.jpg', '18210606014', '123123', '1231231', '3', '123123123', '2015-08-17 15:39:13', '2015-08-17 15:39:13');
COMMIT;

-- ----------------------------
--  Table structure for `think_agent_application`
-- ----------------------------
DROP TABLE IF EXISTS `think_agent_application`;
CREATE TABLE `think_agent_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '姓名',
  `mobile` varchar(15) NOT NULL COMMENT '手机号',
  `wechat_number` varchar(64) NOT NULL COMMENT '微信号',
  `recommend` varchar(64) DEFAULT NULL COMMENT '推荐人',
  `work_date` int(11) NOT NULL COMMENT '从事微商时间',
  `month_sale` int(11) NOT NULL COMMENT '月销售额',
  `brand` varchar(64) NOT NULL COMMENT '品牌',
  `reason` text NOT NULL COMMENT '申请理由',
  `province` varchar(32) NOT NULL COMMENT '省份',
  `city` varchar(32) NOT NULL COMMENT '市区',
  `source` int(11) NOT NULL COMMENT '推荐来源 1-朋友 2-报纸 3-电视 4-互联网 5-其他',
  `is_approve` int(11) NOT NULL DEFAULT '0' COMMENT '是否通过审核 1-通过 0-待审核 -1 - 不通过',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代理申请表';

-- ----------------------------
--  Table structure for `think_agent_class`
-- ----------------------------
DROP TABLE IF EXISTS `think_agent_class`;
CREATE TABLE `think_agent_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT '代理等级名称',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '起点金额',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='代理等级表';

-- ----------------------------
--  Records of `think_agent_class`
-- ----------------------------
BEGIN;
INSERT INTO `think_agent_class` VALUES ('2', '天使代理', '100', '2015-08-16 11:44:28', '2015-08-16 11:54:06'), ('3', '普通代理', '50', '2015-08-16 12:12:14', '2015-08-16 12:12:14');
COMMIT;

-- ----------------------------
--  Table structure for `think_group`
-- ----------------------------
DROP TABLE IF EXISTS `think_group`;
CREATE TABLE `think_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `remark` text,
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理组表';

-- ----------------------------
--  Records of `think_group`
-- ----------------------------
BEGIN;
INSERT INTO `think_group` VALUES ('1', '超级管理组', '超级管理组', '2015-08-15 15:01:06', '2015-08-15 15:01:08');
COMMIT;

-- ----------------------------
--  Table structure for `think_group_node_map`
-- ----------------------------
DROP TABLE IF EXISTS `think_group_node_map`;
CREATE TABLE `think_group_node_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组权限关系对应表';

-- ----------------------------
--  Table structure for `think_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `think_keywords`;
CREATE TABLE `think_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL COMMENT 'key名称',
  `type` int(11) NOT NULL COMMENT '回复类型 1-文本消息 2-图文消息',
  `content` text COMMENT '文本消息内容',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `think_keywords`
-- ----------------------------
BEGIN;
INSERT INTO `think_keywords` VALUES ('1', '知识', '1', '知识', '2015-08-18 13:57:00', '2015-08-18 13:59:00'), ('3', 'home', '2', '', '2015-08-18 13:59:09', '2015-08-18 13:59:09');
COMMIT;

-- ----------------------------
--  Table structure for `think_know`
-- ----------------------------
DROP TABLE IF EXISTS `think_know`;
CREATE TABLE `think_know` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `title` varchar(256) NOT NULL COMMENT '标题',
  `thumb` varchar(256) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='知识文章';

-- ----------------------------
--  Records of `think_know`
-- ----------------------------
BEGIN;
INSERT INTO `think_know` VALUES ('1', '1', '1111', './Uploads/20150818/55d29aa932fd3.jpg', '&lt;p&gt;222&lt;/p&gt;', '2015-08-18 10:39:56', '2015-08-18 10:55:36');
COMMIT;

-- ----------------------------
--  Table structure for `think_know_class`
-- ----------------------------
DROP TABLE IF EXISTS `think_know_class`;
CREATE TABLE `think_know_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '知识分类名称',
  `thumb` varchar(256) NOT NULL COMMENT '分类缩略图',
  `ctime` datetime DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='知识分类表';

-- ----------------------------
--  Records of `think_know_class`
-- ----------------------------
BEGIN;
INSERT INTO `think_know_class` VALUES ('1', '护肤知识', '111', '2015-08-17 09:07:01', '2015-08-17 09:07:01'), ('2', '化妆品知识', '222', '2015-08-17 09:07:43', '2015-08-17 09:07:43');
COMMIT;

-- ----------------------------
--  Table structure for `think_lesson`
-- ----------------------------
DROP TABLE IF EXISTS `think_lesson`;
CREATE TABLE `think_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT '培训标题',
  `start_time` varchar(256) NOT NULL COMMENT '演讲开始时间',
  `speaker` varchar(64) NOT NULL COMMENT '演讲人',
  `type` varchar(64) NOT NULL COMMENT '演讲类型',
  `desc` text NOT NULL COMMENT '课程描述',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 1-正在进行 0-未开始 -1 - 已结束',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- ----------------------------
--  Records of `think_lesson`
-- ----------------------------
BEGIN;
INSERT INTO `think_lesson` VALUES ('1', '111', '11', '111', '111', '111', '0', '2015-08-17 09:50:05', '2015-08-17 09:50:05');
COMMIT;

-- ----------------------------
--  Table structure for `think_material`
-- ----------------------------
DROP TABLE IF EXISTS `think_material`;
CREATE TABLE `think_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL COMMENT '素材标题',
  `text` text NOT NULL COMMENT '文字内容',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='素材表';

-- ----------------------------
--  Records of `think_material`
-- ----------------------------
BEGIN;
INSERT INTO `think_material` VALUES ('1', '111', '11', '2015-08-17 09:38:43', '2015-08-17 09:38:43'), ('2', '1111', '&lt;p&gt;1111&lt;/p&gt;', '2015-08-18 13:44:57', '2015-08-18 13:44:57');
COMMIT;

-- ----------------------------
--  Table structure for `think_menu`
-- ----------------------------
DROP TABLE IF EXISTS `think_menu`;
CREATE TABLE `think_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(14) NOT NULL COMMENT '菜单名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1-click 2-view 菜单类型',
  `url` varchar(500) DEFAULT NULL COMMENT '跳转类型指定的url',
  `key` varchar(64) DEFAULT NULL COMMENT '点击类型菜单key',
  `ctime` datetime DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '层级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
--  Records of `think_menu`
-- ----------------------------
BEGIN;
INSERT INTO `think_menu` VALUES ('1', '0', '菜单1', '2', '222', 'aaaa', '2015-08-18 14:46:54', '2015-08-19 11:25:50', '1'), ('2', '0', '菜单2', '1', '菜单2', '菜单2', '2015-08-18 14:47:29', '2015-08-18 14:47:29', '1'), ('3', '2', '菜单3', '1', '菜单3', '菜单3', '2015-08-18 14:57:52', '2015-08-18 14:57:52', '2'), ('5', '0', '111', '1', '111', '111', '2015-08-18 15:22:14', '2015-08-18 15:22:14', '1'), ('6', '2', '222', '1', '22', '222', '2015-08-18 15:22:24', '2015-08-18 15:22:24', '2'), ('7', '2', '2', '1', '2', '2', '2015-08-18 15:22:28', '2015-08-18 15:22:28', '2'), ('8', '2', '2', '1', '2', '2', '2015-08-18 15:22:31', '2015-08-18 15:22:31', '2'), ('9', '2', '2', '1', '2', '2', '2015-08-18 15:22:34', '2015-08-18 15:22:34', '2');
COMMIT;

-- ----------------------------
--  Table structure for `think_news`
-- ----------------------------
DROP TABLE IF EXISTS `think_news`;
CREATE TABLE `think_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_id` int(11) NOT NULL COMMENT '关键词id',
  `title` varchar(255) NOT NULL COMMENT '图文标题',
  `desc` text NOT NULL COMMENT '图文描述',
  `pic` varchar(500) NOT NULL COMMENT '图文消息缩略图',
  `url` varchar(500) NOT NULL COMMENT '图文跳转url',
  `ctime` datetime DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `think_news`
-- ----------------------------
BEGIN;
INSERT INTO `think_news` VALUES ('1', '3', '1111', '1111', './Uploads/20150818/55d2d07f51697.jpg', '111', '2015-08-18 14:28:18', '2015-08-18 14:28:18');
COMMIT;

-- ----------------------------
--  Table structure for `think_node`
-- ----------------------------
DROP TABLE IF EXISTS `think_node`;
CREATE TABLE `think_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(64) NOT NULL COMMENT '节点名称',
  `node` varchar(64) NOT NULL COMMENT '节点',
  `is_show` int(11) DEFAULT NULL COMMENT '是否在菜单显示',
  `ctime` datetime DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
--  Records of `think_node`
-- ----------------------------
BEGIN;
INSERT INTO `think_node` VALUES ('1', '0', '后台首页', 'Index/index', '1', '2015-08-15 15:37:06', '2015-08-15 15:37:07'), ('2', '0', '代理申请', 'AgentApplication/index', '1', '2015-08-15 15:37:44', '2015-08-15 15:37:46'), ('3', '0', '代理商信息', 'Agent/index', '1', '2015-08-15 15:38:25', '2015-08-15 15:38:26'), ('4', '0', '知识管理', 'Know/index', '1', '2015-08-15 15:38:47', '2015-08-15 15:38:48'), ('5', '0', '素材管理', 'Material/index', '1', '2015-08-15 15:39:17', '2015-08-15 15:39:18'), ('6', '0', '课程管理', 'Lesson/index', '1', '2015-08-15 15:39:35', '2015-08-15 15:39:37'), ('7', '0', '关键词管理', 'Keywords/index', '1', '2015-08-15 15:39:55', '2015-08-15 15:39:57'), ('8', '0', '自定义菜单', 'Menu/index', '1', '2015-08-15 15:41:16', '2015-08-15 15:41:18'), ('9', '0', '系统设置', 'System/index', '1', '2015-08-15 15:41:51', '2015-08-15 15:41:52'), ('10', '2', '代理类型管理', 'AgentClass/index', '1', '2015-08-15 15:43:11', '2015-08-15 15:43:12'), ('11', '4', '知识类型管理', 'KnowClass/index', '1', '2015-08-15 15:44:27', '2015-08-15 15:44:29'), ('12', '1', '代理审核', 'AgentApplication/check', '0', '2015-08-15 15:47:38', '2015-08-15 15:47:40'), ('13', '3', '新增代理商', 'Agent/add', '0', '2015-08-15 15:48:01', '2015-08-15 15:48:03'), ('14', '3', '编辑代理商', 'Agent/edit', '0', '2015-08-15 15:48:17', '2015-08-15 15:48:20'), ('15', '3', '删除代理商', 'Agent/del', '0', '2015-08-15 15:49:02', '2015-08-15 15:49:03'), ('16', '4', '新增知识', 'Know/add', '0', '2015-08-15 15:53:55', '2015-08-15 15:53:56'), ('17', '4', '编辑知识', 'Know/edit', '0', '2015-08-15 15:54:10', '2015-08-15 15:54:12'), ('18', '4', '删除知识', 'Know/del', '0', '2015-08-15 15:54:24', '2015-08-15 15:54:26'), ('19', '5', '新增素材', 'Material/add', '0', '2015-08-15 15:55:03', '2015-08-15 15:55:04'), ('20', '5', '编辑素材', 'Material/edit', '0', '2015-08-15 15:55:17', '2015-08-15 15:55:18'), ('21', '5', '删除素材', 'Material/del', '0', '2015-08-15 15:55:31', '2015-08-15 15:55:33'), ('22', '6', '新增课程', 'Lesson/add', '0', '2015-08-15 15:55:59', '2015-08-15 15:56:01'), ('23', '6', '编辑课程', 'Lesson/edit', '0', '2015-08-15 15:56:16', '2015-08-15 15:56:18'), ('24', '6', '删除课程', 'Lesson/del', '0', '2015-08-15 15:56:30', '2015-08-15 15:56:31'), ('25', '9', '管理员', 'Admin/index', '1', '2015-08-15 16:16:42', '2015-08-15 16:16:43'), ('26', '9', '管理组', 'Group/index', '1', '2015-08-15 16:16:55', '2015-08-15 16:16:56'), ('27', '2', '代理申请列表', 'AgentApplication/index', '1', '2015-08-15 16:33:32', '2015-08-15 16:33:34'), ('28', '4', '知识列表', 'Know/index', '1', '2015-08-15 16:33:57', '2015-08-15 16:33:58'), ('29', '9', '基本设置', 'System/index', '1', '2015-08-19 11:41:39', '2015-08-19 11:41:41');
COMMIT;

-- ----------------------------
--  Table structure for `tihnk_singlepage`
-- ----------------------------
DROP TABLE IF EXISTS `tihnk_singlepage`;
CREATE TABLE `tihnk_singlepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '单页标题',
  `content` text NOT NULL COMMENT '单页内容',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页表';

SET FOREIGN_KEY_CHECKS = 1;
