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

 Date: 08/24/2015 10:13:38 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
--  Records of `think_admin`
-- ----------------------------
BEGIN;
INSERT INTO `think_admin` VALUES ('1', '1', 'admin', '21232f297a57a5a743894a0e4a801fc3', '超级管理员', '1', '10', '2015-08-15 14:59:20', '2015-08-15 14:59:22', '超级管理员'), ('2', '2', 'test', 'e10adc3949ba59abbe56e057f20f883e', '123', '2', '0', '2015-08-20 11:26:11', '2015-08-20 11:26:11', '123');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='代理商表';

-- ----------------------------
--  Records of `think_agent`
-- ----------------------------
BEGIN;
INSERT INTO `think_agent` VALUES ('1', '1111', './Uploads/20150823/55d9c9b9095cf.jpg', '182012012012', '12395813', 'asdawews', '1', '11111', '2015-08-23 21:25:21', '2015-08-23 21:25:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代理申请表';

-- ----------------------------
--  Records of `think_agent_application`
-- ----------------------------
BEGIN;
INSERT INTO `think_agent_application` VALUES ('1', '3', '111', '111', '111', '111', '111', '1111', '11111', '1111', '省份', '地级市', '1', '0', '2015-08-23 23:01:10', '2015-08-23 23:01:10'), ('2', '3', '111', '1111', '111', '111', '1111', '111', '11', '111', '北京市', '北京市', '0', '0', '2015-08-23 23:05:55', '2015-08-23 23:05:55');
COMMIT;

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
INSERT INTO `think_agent_class` VALUES ('1', '一级代理', '100', '2015-08-23 21:24:37', '2015-08-23 21:24:37'), ('2', '二级代理', '200', '2015-08-23 21:24:49', '2015-08-23 21:24:49'), ('3', '三级代理', '300', '2015-08-23 21:24:55', '2015-08-23 21:24:55');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理组表';

-- ----------------------------
--  Records of `think_group`
-- ----------------------------
BEGIN;
INSERT INTO `think_group` VALUES ('1', '超级管理组', '超级管理组', '2015-08-15 15:01:06', '2015-08-15 15:01:08'), ('2', '测试组', '测试组', '2015-08-20 11:22:57', '2015-08-20 11:22:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='组权限关系对应表';

-- ----------------------------
--  Records of `think_group_node_map`
-- ----------------------------
BEGIN;
INSERT INTO `think_group_node_map` VALUES ('1', '1', '1', null), ('7', '1', '10', null), ('8', '1', '27', null), ('9', '1', '2', null), ('10', '2', '1', null);
COMMIT;

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
INSERT INTO `think_know` VALUES ('1', '1', '2014.10.28 5亿冠名豪夺中国电视广告史第一大单', './Uploads/20150818/55d29aa932fd3.jpg', '&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;5亿是个什么概念？&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;（用100元的人民币堆叠，5亿人民币的高度达到450米，可以与上海环球金融中心比肩。）&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; text-align: center; background: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://www.kansws.com.cn/Public/kindeditor/attached/image/20150527/20150527180645_79754.png&quot; alt=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;如果给你5亿，你是会购买&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;94554个&lt;/span&gt;Iphone6，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;8333个&lt;/span&gt;爱马仕手袋，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;2000件&lt;/span&gt;Vera Wang婚纱，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;685台&lt;/span&gt;特斯拉电动车，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;100套&lt;/span&gt;上海市中心公寓，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;15个&lt;/span&gt;赵薇购入的法国酒庄，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;2.5架&lt;/span&gt;成龙定制的巴西私人飞机还是天天拿着450米高的百元大钞摞高楼玩？&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;致力缔造&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;时尚&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;新菁英女性&lt;/span&gt;全新婚恋观的&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;，选择用5亿，做&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;这&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;件&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;事情！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; text-align: center; background: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://www.kansws.com.cn/Public/kindeditor/attached/image/20150527/20150527180707_46768.png&quot; alt=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;2014年10月17日，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;第二度重金冠名江苏卫视&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;《非诚勿扰》&lt;/span&gt;栏目！&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;5亿冠名费，创造中国电视广告投放新高！！！！&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;现如今大家只要说到《好声音》都会想起加多宝，看到《爸爸去哪儿》就会想起伊利……2015，民族品牌大手笔冠名的大旗将由&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;来接力，从今往后，大家只要谈起&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;《非诚勿扰》&lt;/span&gt;就会想起&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;。&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;5亿冠名，我们不是土豪，也不是在炫富！&lt;br/&gt;而是&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;誓要成为&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;民族品牌领军人物&lt;/span&gt;的决心！&lt;br/&gt;是&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;专注化妆品12年，潜心&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;研发美肤科技&lt;/span&gt;，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;释放时代女性菁英之美的国货力量！&lt;/span&gt;&lt;br/&gt;2015，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;将一如既往地投入更多资源和精力，进行产品科技研发，销售渠道扩展以及回馈消费者，引领“&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;中国制造&lt;/span&gt;”冲出国内市场，开拓全球疆土，建立真正属于中国人的美妆帝国。&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; text-align: center; background: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://www.kansws.com.cn/Public/kindeditor/attached/image/20150527/20150527180724_23914.png&quot; alt=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; text-align: center; background: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://www.kansws.com.cn/Public/kindeditor/attached/image/20150527/20150527180737_39025.png&quot; alt=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; text-align: center; background: rgb(255, 255, 255);&quot;&gt;&lt;img src=&quot;http://www.kansws.com.cn/Public/kindeditor/attached/image/20150527/20150527180750_46477.png&quot; alt=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;/&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;《非诚勿扰》打破了传统以男性为主导的婚恋市场，把选择的主动权交到女性手上。&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;韩束主张的都市&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;新菁英女性&lt;/span&gt;，就是要选择自己的人生，选择自己的爱情！&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;如此契合的品牌精髓是我们选择《非诚勿扰》并执着坚持的最大原因。因为我们相信，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;时尚新菁英女性&lt;/span&gt;的美，不仅来自吹弹可破的肌肤，玲珑有致的身材，更来自强大的内心，自由的精神，选择的勇气。&lt;/p&gt;&lt;p style=&quot;margin-top: 10px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-family: 黑体; color: rgb(22, 21, 21); line-height: 20px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;专注美丽12年，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;韩束&lt;/span&gt;致力打造国货领军品牌地位，与亿万&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;时尚&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;新菁英女性&lt;/span&gt;共同成长，&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; background: transparent;&quot;&gt;释放你的美！&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2015-08-18 10:39:56', '2015-08-23 21:40:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='知识分类表';

-- ----------------------------
--  Records of `think_know_class`
-- ----------------------------
BEGIN;
INSERT INTO `think_know_class` VALUES ('1', '素材包', './Uploads/20150823/55d9c396c5124.png', '2015-08-23 20:59:04', '2015-08-23 20:59:04'), ('2', '皮肤知识', './Uploads/20150823/55d9c3b3723d0.png', '2015-08-23 20:59:32', '2015-08-23 20:59:32'), ('3', '商品知识', './Uploads/20150823/55d9c3cc1c213.png', '2015-08-23 20:59:56', '2015-08-23 20:59:56'), ('4', '品牌知识', './Uploads/20150823/55d9c3e2e7287.png', '2015-08-23 21:00:19', '2015-08-23 21:00:19');
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
INSERT INTO `think_lesson` VALUES ('1', '化妆知识', '2015-08-20', '张三', '知识讲座', '&lt;p&gt;知识讲座知识讲座知识讲座知识讲座知识讲座&lt;/p&gt;', '1', '2015-08-17 09:50:05', '2015-08-23 22:41:07');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='节点表';

-- ----------------------------
--  Records of `think_node`
-- ----------------------------
BEGIN;
INSERT INTO `think_node` VALUES ('1', '0', '后台首页', 'Index/index', '1', '2015-08-15 15:37:06', '2015-08-15 15:37:07'), ('2', '0', '代理申请', 'AgentApplication/index', '1', '2015-08-15 15:37:44', '2015-08-15 15:37:46'), ('3', '0', '代理商信息', 'Agent/index', '1', '2015-08-15 15:38:25', '2015-08-15 15:38:26'), ('4', '0', '知识管理', 'Know/index', '1', '2015-08-15 15:38:47', '2015-08-15 15:38:48'), ('5', '0', '素材管理', 'Material/index', '1', '2015-08-15 15:39:17', '2015-08-15 15:39:18'), ('6', '0', '课程管理', 'Lesson/index', '1', '2015-08-15 15:39:35', '2015-08-15 15:39:37'), ('7', '0', '关键词管理', 'Keywords/index', '1', '2015-08-15 15:39:55', '2015-08-15 15:39:57'), ('8', '0', '自定义菜单', 'Menu/index', '1', '2015-08-15 15:41:16', '2015-08-15 15:41:18'), ('9', '0', '单页管理', 'Singlepage/index', '1', '2015-08-20 11:41:48', '2015-08-20 11:41:50'), ('10', '2', '代理类型管理', 'AgentClass/index', '1', '2015-08-15 15:43:11', '2015-08-15 15:43:12'), ('11', '4', '知识类型管理', 'KnowClass/index', '1', '2015-08-15 15:44:27', '2015-08-15 15:44:29'), ('12', '1', '代理审核', 'AgentApplication/check', '0', '2015-08-15 15:47:38', '2015-08-15 15:47:40'), ('13', '3', '新增代理商', 'Agent/add', '0', '2015-08-15 15:48:01', '2015-08-15 15:48:03'), ('14', '3', '编辑代理商', 'Agent/edit', '0', '2015-08-15 15:48:17', '2015-08-15 15:48:20'), ('15', '3', '删除代理商', 'Agent/del', '0', '2015-08-15 15:49:02', '2015-08-15 15:49:03'), ('16', '4', '新增知识', 'Know/add', '0', '2015-08-15 15:53:55', '2015-08-15 15:53:56'), ('17', '4', '编辑知识', 'Know/edit', '0', '2015-08-15 15:54:10', '2015-08-15 15:54:12'), ('18', '4', '删除知识', 'Know/del', '0', '2015-08-15 15:54:24', '2015-08-15 15:54:26'), ('19', '5', '新增素材', 'Material/add', '0', '2015-08-15 15:55:03', '2015-08-15 15:55:04'), ('20', '5', '编辑素材', 'Material/edit', '0', '2015-08-15 15:55:17', '2015-08-15 15:55:18'), ('21', '5', '删除素材', 'Material/del', '0', '2015-08-15 15:55:31', '2015-08-15 15:55:33'), ('22', '6', '新增课程', 'Lesson/add', '0', '2015-08-15 15:55:59', '2015-08-15 15:56:01'), ('23', '6', '编辑课程', 'Lesson/edit', '0', '2015-08-15 15:56:16', '2015-08-15 15:56:18'), ('24', '6', '删除课程', 'Lesson/del', '0', '2015-08-15 15:56:30', '2015-08-15 15:56:31'), ('25', '30', '基本设置', 'System/index', '1', '2015-08-19 11:41:39', '2015-08-19 11:41:41'), ('26', '30', '管理员', 'Admin/index', '1', '2015-08-15 16:16:42', '2015-08-15 16:16:43'), ('27', '2', '代理申请列表', 'AgentApplication/index', '1', '2015-08-15 16:33:32', '2015-08-15 16:33:34'), ('28', '4', '知识列表', 'Know/index', '1', '2015-08-15 16:33:57', '2015-08-15 16:33:58'), ('30', '0', '系统设置', 'System/index', '1', '2015-08-15 15:41:51', '2015-08-15 15:41:52'), ('31', '30', '管理组', 'Group/index', '1', '2015-08-15 16:16:55', '2015-08-15 16:16:56');
COMMIT;

-- ----------------------------
--  Table structure for `think_singlepage`
-- ----------------------------
DROP TABLE IF EXISTS `think_singlepage`;
CREATE TABLE `think_singlepage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '单页标题',
  `content` text NOT NULL COMMENT '单页内容',
  `ctime` datetime NOT NULL,
  `mtime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单页表';

-- ----------------------------
--  Records of `think_singlepage`
-- ----------------------------
BEGIN;
INSERT INTO `think_singlepage` VALUES ('1', '关于我们', '&lt;p class=&quot;p0&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-family: 黑体; line-height: 16px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;上海韩束化妆品有限公司，&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;2002&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;年创建于上海。在苏州、上海，分别拥有&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;20000&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;平米和&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;75000&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;平米的先进生产工厂，以及苏州黎姿、上海美研两家化妆品研究所，凭借其“&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;20&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;亿的年产能力和全球领先的研发技术”享誉业内。&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p0&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-family: 黑体; line-height: 16px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;&amp;nbsp; &amp;nbsp; 韩束奉行多元、乐观、创新、冒险的企业精神，是国内全渠道营销的佼佼者。目前，专营店网店&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;17000&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;家，屈臣氏和大润发等&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;KA&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;渠道网店&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;5500&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;家、电视购物渠道行业销售第一名、电子商务渠道国货第一名，同时成为屈臣氏、万宁、聚美优品、乐蜂网、麦考林等企业指定&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;ODM&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;供应商，旗下红&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;BB&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;、逆天白、巨补水系列产品更是红动中国，深入消费者心中。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;p0&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; outline: 0px; list-style: none; vertical-align: baseline; font-family: 黑体; line-height: 16px; white-space: normal; background: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;韩束——中国美妆行业领导者，&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;12&lt;/span&gt;&lt;span style=&quot;margin: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; list-style: none; vertical-align: baseline; font-weight: inherit; font-style: inherit; font-family: inherit; color: rgb(102, 102, 102); line-height: 2; background: transparent;&quot;&gt;年潜心专注，崇尚科技与时尚，整合全球行业资源，肩负民族品牌崛起之使命，致力于打造中国的世界级品牌。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '2015-08-20 12:06:05', '2015-08-23 21:06:37');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
