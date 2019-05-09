/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : plants

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-03-08 13:21:09
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `fn_1_block`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_block`;
CREATE TABLE `fn_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '资料块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='资料块表';

-- ----------------------------
-- Records of fn_1_block
-- ----------------------------
INSERT INTO `fn_1_block` VALUES ('1', '首页文本公告', 'FineCMS公益版v5.0正式上线了，全新内容管理设计，灵活，高负载|#009688\nFineCMS公益版永久免费开源，不计较版权，开源QQ群：8615168|red');
INSERT INTO `fn_1_block` VALUES ('3', '友情链接', 'http://www.finecms.net|公益版论坛\n	http://www.dayrui.com|天睿程序设计');
INSERT INTO `fn_1_block` VALUES ('4', '图片上传', '{i-4}:');

-- ----------------------------
-- Table structure for `fn_1_category`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_category`;
CREATE TABLE `fn_1_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `tid` (`tid`),
  KEY `show` (`show`),
  KEY `dirname` (`dirname`),
  KEY `module` (`pid`,`displayorder`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='栏目表';

-- ----------------------------
-- Records of fn_1_category
-- ----------------------------
INSERT INTO `fn_1_category` VALUES ('1', '1', '0', 'news', '0', '植物', '', 'y', 'yejie', '', '0', '1', '0', '', '1', '', '', '{\"edit\":\"0\",\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"show_title\":\"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}\",\"list_title\":\"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\\u4e1a\\u754c\\u65b0\\u95fb\",\"list_description\":\"\\u4e1a\\u754c\\u65b0\\u95fb\\u63cf\\u8ff0\"},\"template\":{\"pagesize\":\"20\",\"show\":\"index.html\",\"category\":\"index.html\",\"list\":\"index.html\",\"search\":\"index.html\",\"page\":\"index.html\"},\"admin\":[],\"member\":[],\"html\":0,\"getchild\":0}', '0');

-- ----------------------------
-- Table structure for `fn_1_form`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form`;
CREATE TABLE `fn_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='表单模型表';

-- ----------------------------
-- Records of fn_1_form
-- ----------------------------
INSERT INTO `fn_1_form` VALUES ('1', '留言', 'liuyan', '{\"post\":\"1\",\"code\":\"1\",\"send\":\"\",\"template\":\"\",\"rt_url\":\"\"}');

-- ----------------------------
-- Table structure for `fn_1_form_liuyan`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form_liuyan`;
CREATE TABLE `fn_1_form_liuyan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  `author` varchar(100) DEFAULT NULL COMMENT '录入者账号',
  `inputip` varchar(30) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排序值',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `neirong` mediumtext,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `inputtime` (`inputtime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='留言表单表';

-- ----------------------------
-- Records of fn_1_form_liuyan
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_1_form_liuyan_data_0`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form_liuyan_data_0`;
CREATE TABLE `fn_1_form_liuyan_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表单附表';

-- ----------------------------
-- Records of fn_1_form_liuyan_data_0
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_1_index`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_index`;
CREATE TABLE `fn_1_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

-- ----------------------------
-- Records of fn_1_index
-- ----------------------------
INSERT INTO `fn_1_index` VALUES ('1', '1', 'news', '7', '9', '1491960567');
INSERT INTO `fn_1_index` VALUES ('2', '1', 'news', '7', '9', '1491960680');
INSERT INTO `fn_1_index` VALUES ('3', '1', 'news', '7', '9', '1491960733');
INSERT INTO `fn_1_index` VALUES ('4', '1', 'news', '7', '9', '1491960798');
INSERT INTO `fn_1_index` VALUES ('5', '1', 'news', '7', '9', '1491961512');
INSERT INTO `fn_1_index` VALUES ('6', '1', 'news', '7', '9', '1491961527');
INSERT INTO `fn_1_index` VALUES ('7', '1', 'news', '7', '9', '1491961540');
INSERT INTO `fn_1_index` VALUES ('8', '1', 'news', '7', '9', '1491961552');
INSERT INTO `fn_1_index` VALUES ('9', '1', 'news', '7', '9', '1491961566');
INSERT INTO `fn_1_index` VALUES ('10', '1', 'news', '7', '9', '1491961772');
INSERT INTO `fn_1_index` VALUES ('11', '1', 'news', '8', '9', '1491961788');
INSERT INTO `fn_1_index` VALUES ('12', '1', 'news', '8', '9', '1491961810');
INSERT INTO `fn_1_index` VALUES ('13', '1', 'news', '8', '9', '1491961819');
INSERT INTO `fn_1_index` VALUES ('14', '1', 'news', '8', '9', '1491961830');
INSERT INTO `fn_1_index` VALUES ('15', '1', 'news', '8', '9', '1491961842');
INSERT INTO `fn_1_index` VALUES ('16', '1', 'news', '8', '9', '1491961853');
INSERT INTO `fn_1_index` VALUES ('17', '1', 'news', '8', '9', '1491961865');
INSERT INTO `fn_1_index` VALUES ('18', '1', 'news', '8', '9', '1491961874');
INSERT INTO `fn_1_index` VALUES ('19', '1', 'news', '8', '9', '1491961886');
INSERT INTO `fn_1_index` VALUES ('20', '1', 'news', '8', '9', '1491961901');
INSERT INTO `fn_1_index` VALUES ('21', '1', 'news', '9', '9', '1491961919');
INSERT INTO `fn_1_index` VALUES ('22', '1', 'news', '9', '9', '1491961968');
INSERT INTO `fn_1_index` VALUES ('23', '1', 'news', '9', '9', '1491961979');
INSERT INTO `fn_1_index` VALUES ('24', '1', 'news', '9', '9', '1491961989');
INSERT INTO `fn_1_index` VALUES ('25', '1', 'news', '9', '9', '1491962001');
INSERT INTO `fn_1_index` VALUES ('26', '1', 'news', '9', '9', '1491962013');
INSERT INTO `fn_1_index` VALUES ('27', '1', 'news', '9', '9', '1491962025');
INSERT INTO `fn_1_index` VALUES ('28', '1', 'news', '9', '9', '1491962036');
INSERT INTO `fn_1_index` VALUES ('29', '1', 'news', '9', '9', '1491962048');
INSERT INTO `fn_1_index` VALUES ('30', '1', 'news', '9', '9', '1491962065');
INSERT INTO `fn_1_index` VALUES ('31', '1', 'news', '2', '9', '1491962157');
INSERT INTO `fn_1_index` VALUES ('32', '1', 'news', '2', '9', '1491962218');
INSERT INTO `fn_1_index` VALUES ('33', '1', 'news', '2', '9', '1491962231');
INSERT INTO `fn_1_index` VALUES ('34', '1', 'news', '2', '9', '1491962243');
INSERT INTO `fn_1_index` VALUES ('35', '1', 'news', '2', '9', '1491962255');
INSERT INTO `fn_1_index` VALUES ('36', '1', 'news', '2', '9', '1491962288');
INSERT INTO `fn_1_index` VALUES ('37', '1', 'news', '2', '9', '1491962297');
INSERT INTO `fn_1_index` VALUES ('38', '1', 'news', '2', '9', '1491962307');
INSERT INTO `fn_1_index` VALUES ('39', '1', 'news', '2', '9', '1491962318');
INSERT INTO `fn_1_index` VALUES ('40', '1', 'news', '2', '9', '1491962330');
INSERT INTO `fn_1_index` VALUES ('41', '1', 'news', '10', '9', '1491962345');
INSERT INTO `fn_1_index` VALUES ('42', '1', 'news', '10', '9', '1491962366');
INSERT INTO `fn_1_index` VALUES ('43', '1', 'news', '10', '9', '1491962376');
INSERT INTO `fn_1_index` VALUES ('44', '1', 'news', '10', '9', '1491962387');
INSERT INTO `fn_1_index` VALUES ('45', '1', 'news', '10', '9', '1491962400');
INSERT INTO `fn_1_index` VALUES ('46', '1', 'news', '10', '9', '1491962414');
INSERT INTO `fn_1_index` VALUES ('47', '1', 'news', '10', '9', '1491962433');
INSERT INTO `fn_1_index` VALUES ('48', '1', 'news', '10', '9', '1491962449');
INSERT INTO `fn_1_index` VALUES ('49', '1', 'news', '10', '9', '1491962464');
INSERT INTO `fn_1_index` VALUES ('50', '1', 'news', '10', '9', '1491962491');
INSERT INTO `fn_1_index` VALUES ('51', '1', 'news', '11', '9', '1491962512');
INSERT INTO `fn_1_index` VALUES ('52', '1', 'news', '11', '9', '1491962537');
INSERT INTO `fn_1_index` VALUES ('53', '1', 'news', '11', '9', '1491962548');
INSERT INTO `fn_1_index` VALUES ('54', '1', 'news', '11', '9', '1491962560');
INSERT INTO `fn_1_index` VALUES ('55', '1', 'news', '11', '9', '1491962573');
INSERT INTO `fn_1_index` VALUES ('56', '1', 'news', '11', '9', '1491962585');
INSERT INTO `fn_1_index` VALUES ('57', '1', 'news', '11', '9', '1491962601');
INSERT INTO `fn_1_index` VALUES ('58', '1', 'news', '11', '9', '1491962613');
INSERT INTO `fn_1_index` VALUES ('59', '1', 'news', '11', '9', '1491962627');
INSERT INTO `fn_1_index` VALUES ('60', '1', 'news', '11', '9', '1491962640');
INSERT INTO `fn_1_index` VALUES ('61', '1', 'news', '12', '9', '1491962660');
INSERT INTO `fn_1_index` VALUES ('62', '1', 'news', '12', '9', '1491962681');
INSERT INTO `fn_1_index` VALUES ('63', '1', 'news', '12', '9', '1491962694');
INSERT INTO `fn_1_index` VALUES ('64', '1', 'news', '12', '9', '1491962703');
INSERT INTO `fn_1_index` VALUES ('65', '1', 'news', '12', '9', '1491962715');
INSERT INTO `fn_1_index` VALUES ('66', '1', 'news', '12', '9', '1491962731');
INSERT INTO `fn_1_index` VALUES ('67', '1', 'news', '12', '9', '1491962742');
INSERT INTO `fn_1_index` VALUES ('68', '1', 'news', '12', '9', '1491962758');
INSERT INTO `fn_1_index` VALUES ('69', '1', 'news', '12', '9', '1491962768');
INSERT INTO `fn_1_index` VALUES ('70', '1', 'news', '12', '9', '1491962780');
INSERT INTO `fn_1_index` VALUES ('71', '1', 'news', '13', '9', '1491962798');
INSERT INTO `fn_1_index` VALUES ('72', '1', 'news', '13', '9', '1491962819');
INSERT INTO `fn_1_index` VALUES ('73', '1', 'news', '13', '9', '1491962830');
INSERT INTO `fn_1_index` VALUES ('74', '1', 'news', '13', '9', '1491962843');
INSERT INTO `fn_1_index` VALUES ('75', '1', 'news', '13', '9', '1491962852');
INSERT INTO `fn_1_index` VALUES ('76', '1', 'news', '13', '9', '1491962861');
INSERT INTO `fn_1_index` VALUES ('77', '1', 'news', '13', '9', '1491962871');
INSERT INTO `fn_1_index` VALUES ('78', '1', 'news', '13', '9', '1491962881');
INSERT INTO `fn_1_index` VALUES ('79', '1', 'news', '13', '9', '1491962890');
INSERT INTO `fn_1_index` VALUES ('80', '1', 'news', '13', '9', '1491962902');
INSERT INTO `fn_1_index` VALUES ('81', '1', 'news', '14', '9', '1491962962');
INSERT INTO `fn_1_index` VALUES ('82', '1', 'news', '14', '9', '1491962977');
INSERT INTO `fn_1_index` VALUES ('83', '1', 'news', '14', '9', '1491962988');
INSERT INTO `fn_1_index` VALUES ('84', '1', 'news', '14', '9', '1491962997');
INSERT INTO `fn_1_index` VALUES ('85', '1', 'news', '14', '9', '1491963009');
INSERT INTO `fn_1_index` VALUES ('86', '1', 'news', '14', '9', '1491963018');
INSERT INTO `fn_1_index` VALUES ('87', '1', 'news', '14', '9', '1491963028');
INSERT INTO `fn_1_index` VALUES ('88', '1', 'news', '14', '9', '1491963040');
INSERT INTO `fn_1_index` VALUES ('89', '1', 'news', '14', '9', '1491963052');
INSERT INTO `fn_1_index` VALUES ('90', '1', 'news', '14', '9', '1491963164');
INSERT INTO `fn_1_index` VALUES ('91', '1', 'news', '15', '9', '1491963194');
INSERT INTO `fn_1_index` VALUES ('92', '1', 'news', '15', '9', '1491963214');
INSERT INTO `fn_1_index` VALUES ('93', '1', 'news', '15', '9', '1491963225');
INSERT INTO `fn_1_index` VALUES ('94', '1', 'news', '15', '9', '1491963235');
INSERT INTO `fn_1_index` VALUES ('95', '1', 'news', '15', '9', '1491963245');
INSERT INTO `fn_1_index` VALUES ('96', '1', 'news', '15', '9', '1491963255');
INSERT INTO `fn_1_index` VALUES ('97', '1', 'news', '15', '9', '1491963269');
INSERT INTO `fn_1_index` VALUES ('98', '1', 'news', '15', '9', '1491963280');
INSERT INTO `fn_1_index` VALUES ('99', '1', 'news', '15', '9', '1491963293');
INSERT INTO `fn_1_index` VALUES ('100', '1', 'news', '15', '9', '1491963305');
INSERT INTO `fn_1_index` VALUES ('101', '1', 'news', '16', '9', '1491963316');
INSERT INTO `fn_1_index` VALUES ('102', '1', 'news', '16', '9', '1491963382');
INSERT INTO `fn_1_index` VALUES ('103', '1', 'news', '16', '9', '1491963396');
INSERT INTO `fn_1_index` VALUES ('104', '1', 'news', '16', '9', '1491963405');
INSERT INTO `fn_1_index` VALUES ('105', '1', 'news', '16', '9', '1491963414');
INSERT INTO `fn_1_index` VALUES ('106', '1', 'news', '16', '9', '1491963427');
INSERT INTO `fn_1_index` VALUES ('107', '1', 'news', '16', '9', '1491963440');
INSERT INTO `fn_1_index` VALUES ('108', '1', 'news', '16', '9', '1491963453');
INSERT INTO `fn_1_index` VALUES ('109', '1', 'news', '16', '9', '1491963567');
INSERT INTO `fn_1_index` VALUES ('110', '1', 'news', '16', '9', '1491963584');
INSERT INTO `fn_1_index` VALUES ('111', '1', 'news', '17', '9', '1491963594');
INSERT INTO `fn_1_index` VALUES ('112', '1', 'news', '17', '9', '1491963620');
INSERT INTO `fn_1_index` VALUES ('113', '1', 'news', '17', '9', '1491963630');
INSERT INTO `fn_1_index` VALUES ('114', '1', 'news', '17', '9', '1491963640');
INSERT INTO `fn_1_index` VALUES ('115', '1', 'news', '17', '9', '1491963649');
INSERT INTO `fn_1_index` VALUES ('116', '1', 'news', '17', '9', '1491963661');
INSERT INTO `fn_1_index` VALUES ('117', '1', 'news', '17', '9', '1491963671');
INSERT INTO `fn_1_index` VALUES ('118', '1', 'news', '17', '9', '1491963682');
INSERT INTO `fn_1_index` VALUES ('119', '1', 'news', '17', '9', '1491963692');
INSERT INTO `fn_1_index` VALUES ('120', '1', 'news', '17', '9', '1491963722');
INSERT INTO `fn_1_index` VALUES ('121', '1', 'news', '2', '9', '1491964073');
INSERT INTO `fn_1_index` VALUES ('122', '1', 'news', '2', '9', '1491964135');
INSERT INTO `fn_1_index` VALUES ('123', '1', 'news', '2', '9', '1491964148');
INSERT INTO `fn_1_index` VALUES ('124', '1', 'news', '2', '9', '1491964156');
INSERT INTO `fn_1_index` VALUES ('125', '1', 'news', '2', '9', '1491964165');
INSERT INTO `fn_1_index` VALUES ('126', '1', 'news', '2', '9', '1491964180');
INSERT INTO `fn_1_index` VALUES ('127', '1', 'news', '1', '9', '1502075282');
INSERT INTO `fn_1_index` VALUES ('128', '1', 'news', '1', '9', '1502076339');
INSERT INTO `fn_1_index` VALUES ('129', '1', 'news', '1', '9', '1502093483');
INSERT INTO `fn_1_index` VALUES ('130', '1', 'news', '1', '9', '1502093535');
INSERT INTO `fn_1_index` VALUES ('131', '1', 'news', '1', '9', '1502093570');
INSERT INTO `fn_1_index` VALUES ('132', '1', 'news', '1', '9', '1502093588');
INSERT INTO `fn_1_index` VALUES ('133', '1', 'news', '1', '9', '1502093607');
INSERT INTO `fn_1_index` VALUES ('134', '1', 'news', '1', '9', '1502093624');
INSERT INTO `fn_1_index` VALUES ('135', '1', 'news', '1', '9', '1502093643');
INSERT INTO `fn_1_index` VALUES ('136', '1', 'news', '1', '9', '1502093666');
INSERT INTO `fn_1_index` VALUES ('137', '1', 'news', '1', '9', '1502093688');
INSERT INTO `fn_1_index` VALUES ('138', '1', 'news', '1', '9', '1502298001');
INSERT INTO `fn_1_index` VALUES ('139', '1', 'news', '1', '9', '1502298119');
INSERT INTO `fn_1_index` VALUES ('140', '1', 'news', '1', '9', '1502298156');
INSERT INTO `fn_1_index` VALUES ('141', '1', 'news', '1', '9', '1502358144');
INSERT INTO `fn_1_index` VALUES ('142', '1', 'news', '1', '9', '1502358184');
INSERT INTO `fn_1_index` VALUES ('143', '1', 'news', '1', '9', '1502358219');
INSERT INTO `fn_1_index` VALUES ('144', '1', 'news', '1', '9', '1511144401');
INSERT INTO `fn_1_index` VALUES ('145', '1', 'news', '1', '9', '1511144534');
INSERT INTO `fn_1_index` VALUES ('146', '1', 'news', '1', '9', '1511144569');
INSERT INTO `fn_1_index` VALUES ('147', '1', 'news', '1', '9', '1511144603');
INSERT INTO `fn_1_index` VALUES ('148', '1', 'news', '1', '9', '1511144629');
INSERT INTO `fn_1_index` VALUES ('149', '1', 'news', '1', '9', '1511144654');
INSERT INTO `fn_1_index` VALUES ('150', '1', 'news', '1', '9', '1511144677');
INSERT INTO `fn_1_index` VALUES ('151', '1', 'news', '1', '9', '1511144703');
INSERT INTO `fn_1_index` VALUES ('152', '1', 'news', '1', '9', '1511144727');
INSERT INTO `fn_1_index` VALUES ('153', '1', 'news', '1', '9', '1511144753');
INSERT INTO `fn_1_index` VALUES ('154', '1', 'news', '1', '9', '1511144776');
INSERT INTO `fn_1_index` VALUES ('155', '1', 'news', '1', '9', '1511144801');
INSERT INTO `fn_1_index` VALUES ('156', '1', 'news', '1', '9', '1511144825');
INSERT INTO `fn_1_index` VALUES ('157', '1', 'news', '1', '9', '1511144853');
INSERT INTO `fn_1_index` VALUES ('158', '1', 'news', '1', '9', '1511144876');
INSERT INTO `fn_1_index` VALUES ('159', '1', 'news', '1', '9', '1511144900');
INSERT INTO `fn_1_index` VALUES ('160', '1', 'news', '1', '9', '1511145407');
INSERT INTO `fn_1_index` VALUES ('161', '1', 'news', '1', '9', '1511145425');
INSERT INTO `fn_1_index` VALUES ('162', '1', 'news', '1', '9', '1511145452');
INSERT INTO `fn_1_index` VALUES ('163', '1', 'news', '1', '9', '1511145476');
INSERT INTO `fn_1_index` VALUES ('164', '1', 'news', '1', '9', '1511145496');
INSERT INTO `fn_1_index` VALUES ('165', '1', 'news', '1', '9', '1537972146');
INSERT INTO `fn_1_index` VALUES ('166', '1', 'news', '1', '9', '1537972211');
INSERT INTO `fn_1_index` VALUES ('167', '1', 'news', '1', '9', '1537972255');
INSERT INTO `fn_1_index` VALUES ('168', '1', 'news', '1', '9', '1537972380');
INSERT INTO `fn_1_index` VALUES ('169', '1', 'news', '1', '9', '1537972446');
INSERT INTO `fn_1_index` VALUES ('170', '1', 'news', '1', '9', '1537972479');
INSERT INTO `fn_1_index` VALUES ('171', '1', 'news', '1', '9', '1537972501');
INSERT INTO `fn_1_index` VALUES ('172', '1', 'news', '1', '9', '1537972529');
INSERT INTO `fn_1_index` VALUES ('173', '1', 'news', '1', '9', '1537972565');
INSERT INTO `fn_1_index` VALUES ('174', '1', 'news', '1', '9', '1537972598');
INSERT INTO `fn_1_index` VALUES ('175', '1', 'news', '1', '9', '1537972624');
INSERT INTO `fn_1_index` VALUES ('176', '1', 'news', '1', '9', '1537972654');
INSERT INTO `fn_1_index` VALUES ('177', '1', 'news', '1', '9', '1537972681');
INSERT INTO `fn_1_index` VALUES ('178', '1', 'news', '1', '9', '1537972919');
INSERT INTO `fn_1_index` VALUES ('179', '1', 'news', '1', '9', '1537972953');
INSERT INTO `fn_1_index` VALUES ('180', '1', 'news', '1', '9', '1537972975');
INSERT INTO `fn_1_index` VALUES ('181', '1', 'news', '1', '9', '1537973033');
INSERT INTO `fn_1_index` VALUES ('182', '1', 'news', '1', '9', '1537973077');
INSERT INTO `fn_1_index` VALUES ('183', '1', 'news', '1', '9', '1537973108');
INSERT INTO `fn_1_index` VALUES ('184', '1', 'news', '1', '9', '1537973134');
INSERT INTO `fn_1_index` VALUES ('185', '1', 'news', '1', '9', '1537973221');
INSERT INTO `fn_1_index` VALUES ('186', '1', 'news', '1', '9', '1537973242');
INSERT INTO `fn_1_index` VALUES ('187', '1', 'news', '1', '9', '1537973266');
INSERT INTO `fn_1_index` VALUES ('188', '1', 'news', '1', '9', '1538010188');
INSERT INTO `fn_1_index` VALUES ('189', '1', 'news', '1', '9', '1538010247');
INSERT INTO `fn_1_index` VALUES ('190', '1', 'news', '1', '9', '1538010278');
INSERT INTO `fn_1_index` VALUES ('191', '1', 'news', '1', '9', '1538018883');
INSERT INTO `fn_1_index` VALUES ('192', '1', 'news', '1', '9', '1538018918');
INSERT INTO `fn_1_index` VALUES ('193', '1', 'news', '1', '9', '1538019129');
INSERT INTO `fn_1_index` VALUES ('194', '1', 'news', '1', '9', '1538019151');
INSERT INTO `fn_1_index` VALUES ('195', '1', 'news', '1', '9', '1538019165');
INSERT INTO `fn_1_index` VALUES ('196', '1', 'news', '1', '9', '1538019299');
INSERT INTO `fn_1_index` VALUES ('197', '1', 'news', '1', '9', '1538019521');
INSERT INTO `fn_1_index` VALUES ('198', '1', 'news', '1', '9', '1538019530');
INSERT INTO `fn_1_index` VALUES ('199', '1', 'news', '1', '9', '1538019603');
INSERT INTO `fn_1_index` VALUES ('200', '1', 'news', '1', '9', '1551697689');
INSERT INTO `fn_1_index` VALUES ('201', '1', 'news', '1', '9', '1552018470');

-- ----------------------------
-- Table structure for `fn_1_news`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_news`;
CREATE TABLE `fn_1_news` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `comments` int(11) NOT NULL,
  `favorites` int(11) NOT NULL,
  `shx` varchar(255) DEFAULT NULL,
  `sdlx` varchar(255) DEFAULT NULL,
  `wslxx` varchar(255) DEFAULT NULL,
  `gstxx` varchar(255) DEFAULT NULL,
  `jx` varchar(255) DEFAULT NULL,
  `qhlx` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`),
  KEY `status` (`status`),
  KEY `inputtime` (`inputtime`),
  KEY `updatetime` (`updatetime`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型主表';

-- ----------------------------
-- Records of fn_1_news
-- ----------------------------
INSERT INTO `fn_1_news` VALUES ('127', '1', '狐尾藻', '17', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=127', '0', '127.0.0.1', '1502075282', '1537951482', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('128', '1', '黄菖蒲', '2', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=128', '0', '127.0.0.1', '1502076339', '1537951473', '0', '0', '0', 'value3', 'value5', 'value23', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('129', '1', '黄花蔺', '3', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=129', '0', '127.0.0.1', '1502093483', '1537951614', '0', '0', '0', 'value3', 'value5', 'value23', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('130', '1', '梭鱼草', '4', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=130', '0', '127.0.0.1', '1502093535', '1537951577', '0', '0', '0', 'value3', 'value5', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('131', '1', '美人蕉', '5', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=131', '0', '127.0.0.1', '1502093570', '1537951506', '0', '0', '0', 'value3', 'value6', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('132', '1', '香蒲', '6', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=132', '0', '127.0.0.1', '1502093588', '1537951563', '0', '0', '0', 'value4', 'value5', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('133', '1', '雨久花', '7', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=133', '0', '127.0.0.1', '1502093607', '1537951546', '0', '0', '0', 'value4', 'value5', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('134', '1', '星光草', '8', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=134', '0', '127.0.0.1', '1502093624', '1537951533', '0', '0', '0', 'value4', 'value6', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('135', '1', '千屈菜', '14', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=135', '0', '127.0.0.1', '1502093643', '1537951605', '0', '0', '0', 'value3', 'value6', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('136', '1', '荷花', '15', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=136', '0', '127.0.0.1', '1502093666', '1537951590', '0', '0', '0', 'value4', 'value5', 'value22', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('137', '1', '菖蒲', '13', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=137', '0', '127.0.0.1', '1502093688', '1537951521', '0', '0', '0', 'value3', 'value6', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('138', '1', '芦苇', '16', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=138', '0', '219.137.185.117', '1502298001', '1537951492', '0', '0', '0', 'value3', 'value5', 'value26', 'value10', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('139', '1', '风车草', '18', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=139', '0', '219.137.185.117', '1502298119', '1537951461', '0', '0', '0', 'value3', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('140', '1', '水葱', '19', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=140', '0', '219.137.185.117', '1502298156', '1537951185', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('141', '1', '王莲', '20', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=141', '0', '219.137.186.63', '1502358144', '1537951199', '0', '0', '0', 'value4', 'value5', 'value25', 'value9', 'value12', 'value17');
INSERT INTO `fn_1_news` VALUES ('142', '1', '铜钱草', '21', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=142', '0', '219.137.186.63', '1502358184', '1537951446', '0', '0', '0', 'value3', 'value6', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('143', '1', '凤眼莲', '22', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=143', '0', '219.137.186.63', '1502358219', '1537951432', '0', '0', '0', 'value3', 'value5', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('144', '1', '荸荠', '23', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=144', '0', '219.137.187.187', '1511144401', '1537951423', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('145', '1', '慈姑', '24', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=145', '0', '219.137.187.187', '1511144534', '1537951396', '0', '0', '0', 'value4', 'value6', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('146', '1', '大薸', '25', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=146', '0', '219.137.187.187', '1511144569', '1537951386', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('147', '1', '灯芯草', '26', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=147', '0', '219.137.187.187', '1511144603', '1537951374', '0', '0', '0', 'value4', 'value6', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('148', '1', '黑藻', '27', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=148', '0', '219.137.187.187', '1511144629', '1537951359', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('149', '1', '红蓼', '28', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=149', '0', '219.137.187.187', '1511144654', '1537951346', '0', '0', '0', 'value4', 'value6', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('150', '1', '茭白', '29', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=150', '0', '219.137.187.187', '1511144677', '1538010853', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('151', '1', '金鱼藻', '30', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=151', '0', '219.137.187.187', '1511144703', '1537951315', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('152', '1', '菱', '31', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=152', '0', '219.137.187.187', '1511144727', '1538010820', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('153', '1', '马蹄莲', '32', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=153', '0', '219.137.187.187', '1511144753', '1537951284', '0', '0', '0', 'value3', 'value50', 'value25', 'value9', 'value12', 'value19');
INSERT INTO `fn_1_news` VALUES ('154', '1', '芡实', '33', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=154', '0', '219.137.187.187', '1511144776', '1537951267', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('155', '1', '石龙尾', '34', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=155', '0', '219.137.187.187', '1511144801', '1538010837', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('156', '1', '水蓼', '35', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=156', '0', '219.137.187.187', '1511144825', '1538010740', '0', '0', '0', 'value4', 'value5', 'value22', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('157', '1', '香根草', '36', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=157', '0', '219.137.187.187', '1511144853', '1537951162', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('158', '1', '薏米', '37', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=158', '0', '219.137.187.187', '1511144876', '1538010512', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('159', '1', '芋', '38', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=159', '0', '219.137.187.187', '1511144900', '1538010755', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('160', '1', '水仙', '81', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=160', '0', '219.137.187.187', '1511145407', '1538019957', '0', '0', '0', 'value4', 'value5', 'value23', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('161', '1', '水鳖', '40', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=161', '0', '219.137.187.187', '1511145425', '1537945259', '0', '0', '0', 'value3', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('162', '1', '龟背竹', '80', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=162', '0', '219.137.187.187', '1511145452', '1538019939', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('163', '1', '铜钱草', '41', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=163', '0', '219.137.187.187', '1511145476', '1538010723', '0', '0', '0', 'value4', 'value5', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('164', '1', '窄叶泽泻', '42', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=164', '0', '219.137.187.187', '1511145496', '1538010786', '0', '0', '0', 'value4', 'value5', 'value25', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('165', '1', '白兰', '43', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=165', '0', '223.73.115.167', '1537972146', '1537972146', '0', '0', '0', 'value1', 'value50', 'value25', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('166', '1', '翠芦莉', '44', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=166', '0', '223.73.115.167', '1537972211', '1537972211', '0', '0', '0', 'value3', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('167', '1', '鹅掌藤', '45', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=167', '0', '223.73.115.167', '1537972255', '1537972255', '0', '0', '0', 'value2', 'value50', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('168', '1', '凤凰木', '47', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=168', '0', '223.73.115.167', '1537972380', '1537972380', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('169', '1', '宫粉羊蹄甲', '48', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=169', '0', '223.73.115.167', '1537972446', '1538018836', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('170', '1', '福建茶', '49', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=170', '0', '223.73.115.167', '1537972479', '1537972479', '0', '0', '0', 'value2', 'value50', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('171', '1', '桂花', '50', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=171', '0', '223.73.115.167', '1537972501', '1537972501', '0', '0', '0', 'value2', 'value50', 'value23', 'value9', 'value12', 'value19');
INSERT INTO `fn_1_news` VALUES ('172', '1', '海南蒲桃', '51', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=172', '0', '223.73.115.167', '1537972529', '1537972529', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('173', '1', '红继木', '52', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=173', '0', '223.73.115.167', '1537972565', '1537972565', '0', '0', '0', 'value2', 'value50', 'value22', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('174', '1', '黄花风铃木', '53', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=174', '0', '223.73.115.167', '1537972598', '1537972598', '0', '0', '0', 'value1', 'value50', 'value23', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('175', '1', '灰莉', '54', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=175', '0', '223.73.115.167', '1537972624', '1537972624', '0', '0', '0', 'value2', 'value50', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('176', '1', '鸡蛋花', '55', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=176', '0', '223.73.115.167', '1537972654', '1538020177', '0', '0', '0', 'value1', 'value50', 'value25', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('177', '1', '蓝花楹', '56', '', '蓝花楹，拉丁学名：（Jacaranda mimosifolia D. Don）紫葳科落叶乔木，高达15米。原产南美洲巴西，中国近年来引种栽培供观赏。蓝花楹是观赏、观叶、观花树种，热带、暖亚热带地区广泛栽作行道树，木材黄白色至灰色，质软而轻，纹理通直，加工容易，可作家具用材。该种同时具有观赏与经济价值。', '0', '1', 'admin', '9', '/index.php?c=show&id=177', '0', '223.73.115.167', '1537972681', '1540395401', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('178', '1', '簕杜鹃', '57', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=178', '0', '223.73.115.167', '1537972919', '1537972919', '0', '0', '0', 'value2', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('179', '1', '龙船花', '58', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=179', '0', '223.73.115.167', '1537972953', '1537972953', '0', '0', '0', 'value2', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('180', '1', '蔓马樱丹', '59', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=180', '0', '223.73.115.167', '1537972975', '1537972975', '0', '0', '0', 'value2', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('181', '1', '芒果', '60', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=181', '0', '223.73.115.167', '1537973033', '1538018782', '0', '0', '0', 'value1', 'value50', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('182', '1', '木棉', '61', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=182', '0', '223.73.115.167', '1537973077', '1537973077', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('183', '1', '四季米仔兰', '62', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=183', '0', '223.73.115.167', '1537973108', '1537973108', '0', '0', '0', 'value2', 'value50', 'value23', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('184', '1', '橡胶榕', '63', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=184', '0', '223.73.115.167', '1537973134', '1537973134', '0', '0', '0', 'value1', 'value50', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('185', '1', '小叶榕', '64', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=185', '0', '223.73.115.167', '1537973221', '1537973221', '0', '0', '0', 'value1', 'value50', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('186', '1', '杨桃', '65', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=186', '0', '223.73.115.167', '1537973242', '1538018726', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('187', '1', '棕竹', '66', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=187', '0', '223.73.115.167', '1537973266', '1537973266', '0', '0', '0', 'value2', 'value50', 'value26', 'value10', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('188', '1', '红花羊蹄甲', '67', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=188', '0', '222.200.86.48', '1538010188', '1538019905', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('189', '1', '荷花玉兰', '68', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=189', '0', '222.200.86.48', '1538010247', '1538018804', '0', '0', '0', 'value1', 'value50', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('190', '1', '蒲桃', '69', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=190', '0', '222.200.86.48', '1538010278', '1538018770', '0', '0', '0', 'value1', 'value50', 'value25', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('191', '1', '黄槐', '70', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=191', '0', '211.66.88.148', '1538018883', '1538018883', '0', '0', '0', 'value1', 'value50', 'value23', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('192', '1', '火焰木', '71', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=192', '0', '211.66.88.148', '1538018918', '1538018918', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('193', '1', '串钱柳', '72', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=193', '0', '211.66.88.148', '1538019129', '1538019129', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('194', '1', '大叶紫薇', '79', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=194', '0', '211.66.88.148', '1538019151', '1538020186', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value13', 'value18');
INSERT INTO `fn_1_news` VALUES ('195', '1', '无忧树', '73', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=195', '0', '211.66.88.148', '1538019165', '1538019165', '0', '0', '0', 'value1', 'value50', 'value26', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('196', '1', '腊肠树', '76', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=196', '0', '211.66.88.148', '1538019299', '1538019824', '0', '0', '0', 'value1', 'value50', 'value23', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('197', '1', '红千层', '78', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=197', '0', '211.66.88.148', '1538019521', '1538019857', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('198', '1', '红花荷', '77', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=198', '0', '211.66.88.148', '1538019530', '1538019840', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('199', '1', '金合欢', '75', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=199', '0', '211.66.88.148', '1538019603', '1538019803', '0', '0', '0', 'value1', 'value50', 'value23', 'value9', 'value12', 'value18');
INSERT INTO `fn_1_news` VALUES ('201', '1', '测试植物', '82', '', '这是一个植物的介绍', '0', '1', 'admin', '9', '/index.php?c=show&id=201', '0', '222.201.225.10', '1552018470', '1552018745', '0', '0', '0', 'value1', 'value50', 'value22', 'value9', 'value12', 'value17');

-- ----------------------------
-- Table structure for `fn_1_news_data_0`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_news_data_0`;
CREATE TABLE `fn_1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `shenghuoxing` varchar(255) DEFAULT NULL,
  `shidileixing` varchar(255) DEFAULT NULL,
  `wslx` varchar(255) DEFAULT NULL,
  `gstx` varchar(255) DEFAULT NULL,
  `jixiang` varchar(255) DEFAULT NULL,
  `ssfw` varchar(255) DEFAULT NULL,
  `qihouleixing` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `uid` (`uid`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型附表';

-- ----------------------------
-- Records of fn_1_news_data_0
-- ----------------------------
INSERT INTO `fn_1_news_data_0` VALUES ('127', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('128', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('129', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('130', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('131', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('132', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('133', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('134', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('135', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('136', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('137', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('138', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('139', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('140', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('141', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('142', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('143', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('144', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('145', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('146', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('147', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('148', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('149', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('150', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('151', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('152', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('153', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('154', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('155', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('156', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('157', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('158', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('159', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('160', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('161', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('162', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('163', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('164', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('165', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('166', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('167', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('168', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('169', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('170', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('171', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('172', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('173', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('174', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('175', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('176', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('177', '1', '1', '<div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">蓝花楹，拉丁学名：（Jacaranda mimosifolia D. Don）紫葳科落叶乔木，高达15米。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">原产南美洲巴西，中国近年来引种栽培供观赏。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">蓝花楹是观赏、观叶、观花树种，热带、暖亚热带地区广泛栽作行道树，木材黄白色至灰色，质软而轻，纹理通直，加工容易，可作家具用材。该种同时具有观赏与经济价值。</div><p><br/></p>', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('178', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('179', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('180', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('181', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('182', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('183', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('184', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('185', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('186', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('187', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('188', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('189', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('190', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('191', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('192', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('193', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('194', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('195', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('196', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('197', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('198', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('199', '1', '1', '', null, null, null, null, null, null, null);
INSERT INTO `fn_1_news_data_0` VALUES ('201', '1', '1', '<p dir=\"ltr\">这是一个植物的介绍</p>', null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `fn_1_tag`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_tag`;
CREATE TABLE `fn_1_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '父级id',
  `name` varchar(200) NOT NULL COMMENT '关键词名称',
  `code` varchar(200) NOT NULL COMMENT '关键词代码（拼音）',
  `pcode` varchar(255) DEFAULT NULL,
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  `url` varchar(255) DEFAULT NULL COMMENT '关键词url',
  `childids` varchar(255) NOT NULL COMMENT '子类集合',
  `content` text NOT NULL COMMENT '关键词描述',
  `total` int(10) NOT NULL COMMENT '点击数量',
  `displayorder` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `letter` (`code`,`hits`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='关键词库表';

-- ----------------------------
-- Records of fn_1_tag
-- ----------------------------
INSERT INTO `fn_1_tag` VALUES ('1', '0', '标签测试', 'test', null, '18', '', '', '1', '0', '0');
INSERT INTO `fn_1_tag` VALUES ('2', '0', '中国', 'zhongguo', '', '0', '', '', '', '0', '0');

-- ----------------------------
-- Table structure for `fn_1_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin`;
CREATE TABLE `fn_1_weixin` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信属性参数表';

-- ----------------------------
-- Records of fn_1_weixin
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_1_weixin_follow`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_follow`;
CREATE TABLE `fn_1_weixin_follow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信粉丝同步表';

-- ----------------------------
-- Records of fn_1_weixin_follow
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_1_weixin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_menu`;
CREATE TABLE `fn_1_weixin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `displayorder` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of fn_1_weixin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_1_weixin_user`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_user`;
CREATE TABLE `fn_1_weixin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL COMMENT '会员id',
  `username` varchar(100) NOT NULL,
  `groupid` int(10) NOT NULL,
  `openid` varchar(50) NOT NULL COMMENT '唯一id',
  `nickname` text NOT NULL COMMENT '微信昵称',
  `sex` tinyint(1) unsigned DEFAULT NULL COMMENT '性别',
  `city` varchar(30) DEFAULT NULL COMMENT '城市',
  `country` varchar(30) DEFAULT NULL COMMENT '国家',
  `province` varchar(30) DEFAULT NULL COMMENT '省',
  `language` varchar(30) DEFAULT NULL COMMENT '语言',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `subscribe_time` int(10) unsigned NOT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `subscribe_time` (`subscribe_time`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信粉丝表';

-- ----------------------------
-- Records of fn_1_weixin_user
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_admin`
-- ----------------------------
DROP TABLE IF EXISTS `fn_admin`;
CREATE TABLE `fn_admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` text COMMENT '定制权限',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of fn_admin
-- ----------------------------
INSERT INTO `fn_admin` VALUES ('1', '网站创始人', '', 'blue');

-- ----------------------------
-- Table structure for `fn_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment`;
CREATE TABLE `fn_attachment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `author` (`author`),
  KEY `relatedtid` (`related`),
  KEY `fileext` (`fileext`),
  KEY `filemd5` (`filemd5`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of fn_attachment
-- ----------------------------
INSERT INTO `fn_attachment` VALUES ('1', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9');
INSERT INTO `fn_attachment` VALUES ('2', '1', 'admin', '1', '', '1', '0', '618240', 'jpg', '511873f8639cf1209fa0acc87c4faf2a');
INSERT INTO `fn_attachment` VALUES ('3', '1', 'admin', '1', '', '1', '0', '114883', 'jpg', 'bf314a4f15b1b97e03e4cc86bb478fd2');
INSERT INTO `fn_attachment` VALUES ('4', '1', 'admin', '1', '', '1', '0', '294154', 'jpg', '0beec4bdae96c072d939e73467c0037e');
INSERT INTO `fn_attachment` VALUES ('5', '1', 'admin', '1', '', '1', '0', '170271', 'jpg', 'beacb9da7cf1660561a745460b28f756');
INSERT INTO `fn_attachment` VALUES ('6', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445');
INSERT INTO `fn_attachment` VALUES ('7', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8');
INSERT INTO `fn_attachment` VALUES ('8', '1', 'admin', '1', '', '1', '0', '131666', 'jpg', 'fb721afdbea04392fa3188747bb06b21');
INSERT INTO `fn_attachment` VALUES ('9', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9');
INSERT INTO `fn_attachment` VALUES ('10', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8');
INSERT INTO `fn_attachment` VALUES ('11', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445');
INSERT INTO `fn_attachment` VALUES ('12', '1', 'admin', '1', '', '1', '0', '745964', 'jpg', 'b4be6888ffd5a425ff5f36bc11638c8f');
INSERT INTO `fn_attachment` VALUES ('13', '1', 'admin', '1', '', '1', '0', '745964', 'jpg', 'b4be6888ffd5a425ff5f36bc11638c8f');
INSERT INTO `fn_attachment` VALUES ('14', '1', 'admin', '1', '', '1', '0', '1165609', 'jpg', 'a4cf850f9193ed0dd9a89c75ea178345');
INSERT INTO `fn_attachment` VALUES ('15', '1', 'admin', '1', '', '1', '0', '165151', 'jpg', '4794e00367cadea095f4b1ff0d652ab1');
INSERT INTO `fn_attachment` VALUES ('16', '1', 'admin', '1', '', '1', '0', '790098', 'jpg', 'f9acdd9ed12e8aceda0392e26d2ca350');
INSERT INTO `fn_attachment` VALUES ('17', '1', 'admin', '1', '', '1', '0', '833495', 'jpg', 'e8c603579c48e1a2b09d76c3ac1b8396');
INSERT INTO `fn_attachment` VALUES ('18', '1', 'admin', '1', '', '1', '0', '2177618', 'jpg', '6e526d2ed1e01308df4858e0e372913a');
INSERT INTO `fn_attachment` VALUES ('19', '1', 'admin', '1', '', '1', '0', '966451', 'jpg', 'bd3f98ed41619c66cae3391cbdc53773');
INSERT INTO `fn_attachment` VALUES ('20', '1', 'admin', '1', '', '1', '0', '228782', 'jpg', 'ec116650681f4ce7dc63d68d3e45e3e0');
INSERT INTO `fn_attachment` VALUES ('21', '1', 'admin', '1', '', '1', '0', '279593', 'jpg', 'e7aacf4c51dc39aa14a2c207b6b1f1a6');
INSERT INTO `fn_attachment` VALUES ('22', '1', 'admin', '1', '', '1', '0', '291707', 'jpg', '284998c9131107b2bad824b95a9d3acc');
INSERT INTO `fn_attachment` VALUES ('23', '1', 'admin', '1', '', '1', '0', '520980', 'jpg', 'b852b78e14286d989e9f68aa15d3f254');
INSERT INTO `fn_attachment` VALUES ('24', '1', 'admin', '1', '', '1', '0', '41359', 'jpg', 'a4e3b873fc2854b124ee6e402bbcbff0');
INSERT INTO `fn_attachment` VALUES ('25', '1', 'admin', '1', '', '1', '0', '275886', 'jpg', '016e4f71fa59cad381c7410082b76c1d');
INSERT INTO `fn_attachment` VALUES ('26', '1', 'admin', '1', '', '1', '0', '325386', 'jpg', 'bd360506f953bff573c0db8ab5aab745');
INSERT INTO `fn_attachment` VALUES ('27', '1', 'admin', '1', '', '1', '0', '233185', 'jpg', 'e0bb2ca71e9c55303e62bf468ac74365');
INSERT INTO `fn_attachment` VALUES ('28', '1', 'admin', '1', '', '1', '0', '560916', 'jpg', 'b610153f80f1c20afb873b8042d0a62c');
INSERT INTO `fn_attachment` VALUES ('29', '1', 'admin', '1', '', '1', '0', '65884', 'jpg', '2ba2b1ce4ca21dfce367af9a40689545');
INSERT INTO `fn_attachment` VALUES ('30', '1', 'admin', '1', '', '1', '0', '943647', 'jpg', '5a6d9b34a86d37eac2916259e7001d31');
INSERT INTO `fn_attachment` VALUES ('31', '1', 'admin', '1', '', '1', '0', '212091', 'jpg', '0de80787368e737a08abd86e774d44ac');
INSERT INTO `fn_attachment` VALUES ('32', '1', 'admin', '1', '', '1', '0', '69888', 'jpg', 'e60fd94a7c811a644215f1f5be5a2413');
INSERT INTO `fn_attachment` VALUES ('33', '1', 'admin', '1', '', '1', '0', '297492', 'jpg', 'dc988d9aac24eada428cc1ab61141c0f');
INSERT INTO `fn_attachment` VALUES ('34', '1', 'admin', '1', '', '1', '0', '50821', 'jpg', '8079d6410821aab68e456fbf19a15748');
INSERT INTO `fn_attachment` VALUES ('35', '1', 'admin', '1', '', '1', '0', '300012', 'jpg', '78caf9668b995892c7159440979d2fe4');
INSERT INTO `fn_attachment` VALUES ('36', '1', 'admin', '1', '', '1', '0', '52541', 'jpg', 'c676f051fa0311c66795689ef4285efa');
INSERT INTO `fn_attachment` VALUES ('37', '1', 'admin', '1', '', '1', '0', '454205', 'jpg', '671d6568acad540c169c04cbf0298dd9');
INSERT INTO `fn_attachment` VALUES ('38', '1', 'admin', '1', '', '1', '0', '167895', 'jpg', 'f726d4583a41331823a511180c9bdc0d');
INSERT INTO `fn_attachment` VALUES ('39', '1', 'admin', '1', '', '1', '0', '106220', 'jpg', 'e72e078a30a0e015f8a5b6d9d7d666c9');
INSERT INTO `fn_attachment` VALUES ('40', '1', 'admin', '1', '', '1', '0', '163287', 'jpg', 'e7d6ec49b1c64f93c30f3cca68aadf06');
INSERT INTO `fn_attachment` VALUES ('41', '1', 'admin', '1', '', '1', '0', '140319', 'jpg', '029c0f9b0908ce59018f926d61d7d218');
INSERT INTO `fn_attachment` VALUES ('42', '1', 'admin', '1', '', '1', '0', '140380', 'jpg', '53564fff9aca155f59f8276d39b7688e');
INSERT INTO `fn_attachment` VALUES ('43', '1', 'admin', '1', '', '1', '0', '130171', 'jpg', '3201859ec613bae0467d5b326fb7bf0a');
INSERT INTO `fn_attachment` VALUES ('44', '1', 'admin', '1', '', '1', '0', '62536', 'jpg', '63f4c612e8a25bcfa5f0fa072e0bc429');
INSERT INTO `fn_attachment` VALUES ('45', '1', 'admin', '1', '', '1', '0', '51118', 'jpg', '9c85c8d627c0c43370d5aa95ef5b2ddb');
INSERT INTO `fn_attachment` VALUES ('46', '1', 'admin', '1', '', '1', '0', '107090', 'jpg', 'f7bd3152a851ba28bd3a26735a311d34');
INSERT INTO `fn_attachment` VALUES ('47', '1', 'admin', '1', '', '1', '0', '1003653', 'jpg', '8c489640c3ec93be94546915c38ddce1');
INSERT INTO `fn_attachment` VALUES ('48', '1', 'admin', '1', '', '1', '0', '141199', 'jpg', 'ec931ed7c6936fc7dfa506b332b97663');
INSERT INTO `fn_attachment` VALUES ('49', '1', 'admin', '1', '', '1', '0', '374088', 'jpg', 'e5c950cc2ef1a9519cad2616a953fc0e');
INSERT INTO `fn_attachment` VALUES ('50', '1', 'admin', '1', '', '1', '0', '468531', 'jpg', '7dd2e32a3357559d76f6f77eb08ad729');
INSERT INTO `fn_attachment` VALUES ('51', '1', 'admin', '1', '', '1', '0', '2292193', 'jpg', '1a71b455c5a85315de1d5deed17dd563');
INSERT INTO `fn_attachment` VALUES ('52', '1', 'admin', '1', '', '1', '0', '2002033', 'jpg', '58eb434fdfa9a45b530fa9eef02d7c60');
INSERT INTO `fn_attachment` VALUES ('53', '1', 'admin', '1', '', '1', '0', '362619', 'jpg', 'aaa33bf47c340ed9a980c68d29492c9a');
INSERT INTO `fn_attachment` VALUES ('54', '1', 'admin', '1', '', '1', '0', '93317', 'jpg', '7e1baa6d3cd16767d82b697b577f4008');
INSERT INTO `fn_attachment` VALUES ('55', '1', 'admin', '1', '', '1', '0', '40008', 'jpg', '448b619ae2ef981e1d41afd782046f8b');
INSERT INTO `fn_attachment` VALUES ('56', '1', 'admin', '1', '', '1', '0', '698255', 'jpg', '2dc755edc63686cf7978bdaa5ca56437');
INSERT INTO `fn_attachment` VALUES ('57', '1', 'admin', '1', '', '1', '0', '123126', 'jpg', 'e59e9bdeddf99977495d144570c3cec6');
INSERT INTO `fn_attachment` VALUES ('58', '1', 'admin', '1', '', '1', '0', '117033', 'jpg', 'c938cfdc6eaff488b63343342e415a80');
INSERT INTO `fn_attachment` VALUES ('59', '1', 'admin', '1', '', '1', '0', '215603', 'jpg', 'de3e8aba6248ba012e69d4ec7c7f2c1b');
INSERT INTO `fn_attachment` VALUES ('60', '1', 'admin', '1', '', '1', '0', '623340', 'jpg', 'a561697aec1082dfe2bd3750135b91a1');
INSERT INTO `fn_attachment` VALUES ('61', '1', 'admin', '1', '', '1', '0', '5551964', 'jpg', 'a58da992705cd9169ecccc88ab13688a');
INSERT INTO `fn_attachment` VALUES ('62', '1', 'admin', '1', '', '1', '0', '451738', 'jpg', '1a42b2f3d4a8d5f4174e87b38c2863f8');
INSERT INTO `fn_attachment` VALUES ('63', '1', 'admin', '1', '', '1', '0', '1095793', 'jpg', '404acfefcf969ff018750216016f4aa1');
INSERT INTO `fn_attachment` VALUES ('64', '1', 'admin', '1', '', '1', '0', '144077', 'jpg', '3b5d9be374e7c179e7100c5f7777d66b');
INSERT INTO `fn_attachment` VALUES ('65', '1', 'admin', '1', '', '1', '0', '215347', 'jpg', '34e9c0a7350f68415d91a8f344d3d696');
INSERT INTO `fn_attachment` VALUES ('66', '1', 'admin', '1', '', '1', '0', '3299000', 'jpg', 'ddc3e852091d758bc8137b71bf1a69ae');
INSERT INTO `fn_attachment` VALUES ('67', '1', 'admin', '1', '', '1', '0', '203459', 'jpg', '4c914a860f4468fe291bac5ce025b61e');
INSERT INTO `fn_attachment` VALUES ('68', '1', 'admin', '1', '', '1', '0', '246630', 'jpg', '0bac2f36189d07cff45a29a80b4a572b');
INSERT INTO `fn_attachment` VALUES ('69', '1', 'admin', '1', '', '1', '0', '68813', 'jpg', 'b724cf88ec754942186b109e6c3bb2b3');
INSERT INTO `fn_attachment` VALUES ('70', '1', 'admin', '1', '', '1', '0', '192993', 'jpg', 'c9705babeb13e791727da1f083bf3143');
INSERT INTO `fn_attachment` VALUES ('71', '1', 'admin', '1', '', '1', '0', '39434', 'jpg', 'e1765fe292df696802be48edffc55888');
INSERT INTO `fn_attachment` VALUES ('72', '1', 'admin', '1', '', '1', '0', '37274', 'jpg', '43a52ea4eaf9aa5a848cc71600fa6b5a');
INSERT INTO `fn_attachment` VALUES ('73', '1', 'admin', '1', '', '1', '0', '96256', 'jpg', '3fa31315394fe7a9d1f2c4816a303c6e');
INSERT INTO `fn_attachment` VALUES ('74', '1', 'admin', '1', '', '1', '0', '134728', 'jpg', '6a7e70c1f9b1415a5b8bda6a2bffc6f1');
INSERT INTO `fn_attachment` VALUES ('75', '1', 'admin', '1', '', '1', '0', '55951', 'jpg', '552b1cf3f56896a1430b114fe1e3ceb1');
INSERT INTO `fn_attachment` VALUES ('76', '1', 'admin', '1', '', '1', '0', '134728', 'jpg', '6a7e70c1f9b1415a5b8bda6a2bffc6f1');
INSERT INTO `fn_attachment` VALUES ('77', '1', 'admin', '1', '', '1', '0', '36311', 'jpg', 'e6add33f3c150d7683208821d08c6cff');
INSERT INTO `fn_attachment` VALUES ('78', '1', 'admin', '1', '', '1', '0', '86589', 'jpg', '311d6898da8e4df557dfa7d868211aaa');
INSERT INTO `fn_attachment` VALUES ('79', '1', 'admin', '1', '', '1', '0', '56791', 'jpg', 'c4d247952a29b25202a552e86fd2ac7a');
INSERT INTO `fn_attachment` VALUES ('80', '1', 'admin', '1', '', '1', '0', '94710', 'jpg', '43f4ce0d7cd5011d61a99179a25a444f');
INSERT INTO `fn_attachment` VALUES ('81', '1', 'admin', '1', '', '1', '0', '115620', 'jpg', 'b16354697cba91b152f1effee0391d91');
INSERT INTO `fn_attachment` VALUES ('82', '1', 'admin', '1', '', '1', '0', '23900', 'jpg', '3f1fc791b3856b861b109d60306ad359');

-- ----------------------------
-- Table structure for `fn_attachment_0`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_0`;
CREATE TABLE `fn_attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

-- ----------------------------
-- Records of fn_attachment_0
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_1`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_1`;
CREATE TABLE `fn_attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';

-- ----------------------------
-- Records of fn_attachment_1
-- ----------------------------
INSERT INTO `fn_attachment_1` VALUES ('1', '1', 'admin', '', '1', 'jpg', '138875', '201708/a4061921a4.jpg', '0', '', '1502076294');
INSERT INTO `fn_attachment_1` VALUES ('2', '1', 'admin', '', '2', 'jpg', '618240', '201708/b50a7dd636.jpg', '0', '', '1502076376');
INSERT INTO `fn_attachment_1` VALUES ('3', '1', 'admin', '', '3', 'jpg', '114883', '201708/dd1c800216.jpg', '0', '', '1502093524');
INSERT INTO `fn_attachment_1` VALUES ('4', '1', 'admin', '', '8', 'jpg', '294154', '201708/2060b8441d.jpg', '0', '', '1502093558');
INSERT INTO `fn_attachment_1` VALUES ('5', '1', 'admin', '', '4', 'jpg', '170271', '201708/6c022f3b3e.jpg', '0', '', '1502093580');
INSERT INTO `fn_attachment_1` VALUES ('6', '1', 'admin', '', '6', 'jpg', '137646', '201708/8c12027570.jpg', '0', '', '1502093603');
INSERT INTO `fn_attachment_1` VALUES ('7', '1', 'admin', '', '5', 'jpg', '1368105', '201708/36c896481d.jpg', '0', '', '1502093622');
INSERT INTO `fn_attachment_1` VALUES ('8', '1', 'admin', '', '7', 'jpg', '131666', '201708/ba4eb73bf4.jpg', '0', '', '1502093641');
INSERT INTO `fn_attachment_1` VALUES ('9', '1', 'admin', '', '1', 'jpg', '138875', '201708/5fa6872ac8.jpg', '0', '', '1502093665');
INSERT INTO `fn_attachment_1` VALUES ('10', '1', 'admin', '', '5', 'jpg', '1368105', '201708/79c128c47e.jpg', '0', '', '1502093687');
INSERT INTO `fn_attachment_1` VALUES ('11', '1', 'admin', '', '6', 'jpg', '137646', '201708/10ea3ca6b4.jpg', '0', '', '1502093701');
INSERT INTO `fn_attachment_1` VALUES ('12', '1', 'admin', '', '菖蒲', 'jpg', '745964', '201708/80272c6242.jpg', '0', '', '1502297482');
INSERT INTO `fn_attachment_1` VALUES ('13', '1', 'admin', '', '菖蒲', 'jpg', '745964', '201708/07154894ea.jpg', '0', '', '1502297517');
INSERT INTO `fn_attachment_1` VALUES ('14', '1', 'admin', '', '千屈菜', 'jpg', '1165609', '201708/dcdebfa93f.jpg', '0', '', '1502297713');
INSERT INTO `fn_attachment_1` VALUES ('15', '1', 'admin', '', '荷花', 'jpg', '165151', '201708/94aa5f6900.jpg', '0', '', '1502297800');
INSERT INTO `fn_attachment_1` VALUES ('16', '1', 'admin', '', '芦苇', 'jpg', '790098', '201708/9bdb52c34d.jpg', '0', '', '1502298018');
INSERT INTO `fn_attachment_1` VALUES ('17', '1', 'admin', '', '狐尾藻', 'jpg', '833495', '201708/fc85d5aaa3.jpg', '0', '', '1502298068');
INSERT INTO `fn_attachment_1` VALUES ('18', '1', 'admin', '', '风车草', 'jpg', '2177618', '201708/b2484d2d08.jpg', '0', '', '1502298131');
INSERT INTO `fn_attachment_1` VALUES ('19', '1', 'admin', '', '水葱', 'jpg', '966451', '201708/3c8ab20563.jpg', '0', '', '1502298169');
INSERT INTO `fn_attachment_1` VALUES ('20', '1', 'admin', '', '王莲', 'jpg', '228782', '201708/2463f89cd2.jpg', '0', '', '1502358156');
INSERT INTO `fn_attachment_1` VALUES ('21', '1', 'admin', '', '铜钱草', 'jpg', '279593', '201708/f4c5b53f76.jpg', '0', '', '1502358195');
INSERT INTO `fn_attachment_1` VALUES ('22', '1', 'admin', '', '水葫芦', 'jpg', '291707', '201708/9d3417ba49.jpg', '0', '', '1502358231');
INSERT INTO `fn_attachment_1` VALUES ('23', '1', 'admin', '', '荸荠', 'jpg', '520980', '201711/4dc0a4120e.jpg', '0', '', '1511144431');
INSERT INTO `fn_attachment_1` VALUES ('24', '1', 'admin', '', '慈姑', 'jpg', '41359', '201711/d7228d4be8.jpg', '0', '', '1511144542');
INSERT INTO `fn_attachment_1` VALUES ('25', '1', 'admin', '', '大薸', 'jpg', '275886', '201711/28f7ae924d.jpg', '0', '', '1511144579');
INSERT INTO `fn_attachment_1` VALUES ('26', '1', 'admin', '', '灯芯草', 'jpg', '325386', '201711/76184401ea.jpg', '0', '', '1511144610');
INSERT INTO `fn_attachment_1` VALUES ('27', '1', 'admin', '', '黑藻', 'jpg', '233185', '201711/97d5987527.jpg', '0', '', '1511144636');
INSERT INTO `fn_attachment_1` VALUES ('28', '1', 'admin', '', '红蓼', 'jpg', '560916', '201711/f5b029cae1.jpg', '0', '', '1511144661');
INSERT INTO `fn_attachment_1` VALUES ('29', '1', 'admin', '', '茭白', 'jpg', '65884', '201711/7c5823e839.jpg', '0', '', '1511144684');
INSERT INTO `fn_attachment_1` VALUES ('30', '1', 'admin', '', '金鱼藻', 'jpg', '943647', '201711/2df994a01b.jpg', '0', '', '1511144712');
INSERT INTO `fn_attachment_1` VALUES ('31', '1', 'admin', '', '菱', 'jpg', '212091', '201711/2d97c098f8.jpg', '0', '', '1511144733');
INSERT INTO `fn_attachment_1` VALUES ('32', '1', 'admin', '', '马蹄莲', 'jpg', '69888', '201711/fd1d75c524.jpg', '0', '', '1511144761');
INSERT INTO `fn_attachment_1` VALUES ('33', '1', 'admin', '', '芡实', 'jpg', '297492', '201711/7e4d57b53a.jpg', '0', '', '1511144782');
INSERT INTO `fn_attachment_1` VALUES ('34', '1', 'admin', '', '石龙尾', 'jpg', '50821', '201711/7534311413.jpg', '0', '', '1511144808');
INSERT INTO `fn_attachment_1` VALUES ('35', '1', 'admin', '', '水蓼', 'jpg', '300012', '201711/aae6fe5381.jpg', '0', '', '1511144834');
INSERT INTO `fn_attachment_1` VALUES ('36', '1', 'admin', '', '香根草', 'jpg', '52541', '201711/faf97ce2c8.jpg', '0', '', '1511144860');
INSERT INTO `fn_attachment_1` VALUES ('37', '1', 'admin', '', '薏米', 'jpg', '454205', '201711/31cb858359.jpg', '0', '', '1511144886');
INSERT INTO `fn_attachment_1` VALUES ('38', '1', 'admin', '', '芋', 'jpg', '167895', '201711/b49aefe53c.jpg', '0', '', '1511144907');
INSERT INTO `fn_attachment_1` VALUES ('39', '1', 'admin', '', '水仙', 'jpg', '106220', '201711/684c25121f.jpg', '0', '', '1511145417');
INSERT INTO `fn_attachment_1` VALUES ('40', '1', 'admin', '', '水鳖', 'jpg', '163287', '201711/afcc2547b3.jpg', '0', '', '1511145436');
INSERT INTO `fn_attachment_1` VALUES ('41', '1', 'admin', '', '铜钱草', 'jpg', '140319', '201711/07e44539c8.jpg', '0', '', '1511145495');
INSERT INTO `fn_attachment_1` VALUES ('42', '1', 'admin', '', '窄叶泽泻', 'jpg', '140380', '201711/f7fcb78c6a.jpg', '0', '', '1511145514');
INSERT INTO `fn_attachment_1` VALUES ('43', '1', 'admin', '', '白兰', 'jpg', '130171', '201809/527f7f6f2f.jpg', '0', '', '1537972191');
INSERT INTO `fn_attachment_1` VALUES ('44', '1', 'admin', '', '翠芦莉', 'jpg', '62536', '201809/55508081f7.jpg', '0', '', '1537972220');
INSERT INTO `fn_attachment_1` VALUES ('45', '1', 'admin', '', '鹅掌藤', 'jpg', '51118', '201809/97fa2e8635.jpg', '0', '', '1537972266');
INSERT INTO `fn_attachment_1` VALUES ('46', '1', 'admin', '', '二乔玉兰', 'jpg', '107090', '201809/aaf7394321.jpg', '0', '', '1537972320');
INSERT INTO `fn_attachment_1` VALUES ('47', '1', 'admin', '', '凤凰木', 'jpg', '1003653', '201809/b323614c0f.jpg', '0', '', '1537972431');
INSERT INTO `fn_attachment_1` VALUES ('48', '1', 'admin', '', '宫粉羊蹄甲', 'jpg', '141199', '201809/614bbc7e36.jpg', '0', '', '1537972458');
INSERT INTO `fn_attachment_1` VALUES ('49', '1', 'admin', '', '福建茶', 'jpg', '374088', '201809/41dfec534f.jpg', '0', '', '1537972488');
INSERT INTO `fn_attachment_1` VALUES ('50', '1', 'admin', '', '桂花', 'jpg', '468531', '201809/d8ca8be54b.jpg', '0', '', '1537972511');
INSERT INTO `fn_attachment_1` VALUES ('51', '1', 'admin', '', '海南蒲桃', 'jpg', '2292193', '201809/4a27930699.jpg', '0', '', '1537972541');
INSERT INTO `fn_attachment_1` VALUES ('52', '1', 'admin', '', '红继木', 'jpg', '2002033', '201809/ef7c1d7c99.jpg', '0', '', '1537972578');
INSERT INTO `fn_attachment_1` VALUES ('53', '1', 'admin', '', '黄花风铃木', 'jpg', '362619', '201809/366d273617.jpg', '0', '', '1537972607');
INSERT INTO `fn_attachment_1` VALUES ('54', '1', 'admin', '', '灰莉', 'jpg', '93317', '201809/fc1dfa2025.jpg', '0', '', '1537972632');
INSERT INTO `fn_attachment_1` VALUES ('55', '1', 'admin', '', '鸡蛋花', 'jpg', '40008', '201809/e5aaed8de6.jpg', '0', '', '1537972664');
INSERT INTO `fn_attachment_1` VALUES ('56', '1', 'admin', '', '蓝花楹', 'jpg', '698255', '201809/2a1d67a37d.jpg', '0', '', '1537972901');
INSERT INTO `fn_attachment_1` VALUES ('57', '1', 'admin', '', '勒杜鹃', 'jpg', '123126', '201809/265ff8c9b4.jpg', '0', '', '1537972929');
INSERT INTO `fn_attachment_1` VALUES ('58', '1', 'admin', '', '龙船花', 'jpg', '117033', '201809/d85be48326.jpg', '0', '', '1537972962');
INSERT INTO `fn_attachment_1` VALUES ('59', '1', 'admin', '', '蔓马缨丹', 'jpg', '215603', '201809/5d88b29ac1.jpg', '0', '', '1537973005');
INSERT INTO `fn_attachment_1` VALUES ('60', '1', 'admin', '', '芒果', 'jpg', '623340', '201809/6f7ed3028b.jpg', '0', '', '1537973064');
INSERT INTO `fn_attachment_1` VALUES ('61', '1', 'admin', '', '木棉', 'jpg', '5551964', '201809/12231837f6.jpg', '0', '', '1537973093');
INSERT INTO `fn_attachment_1` VALUES ('62', '1', 'admin', '', '四季米仔兰', 'jpg', '451738', '201809/97a002532c.jpg', '0', '', '1537973117');
INSERT INTO `fn_attachment_1` VALUES ('63', '1', 'admin', '', '橡胶榕', 'jpg', '1095793', '201809/71a9ce2f18.jpg', '0', '', '1537973207');
INSERT INTO `fn_attachment_1` VALUES ('64', '1', 'admin', '', '小叶榕', 'jpg', '144077', '201809/d6c228d1ff.jpg', '0', '', '1537973231');
INSERT INTO `fn_attachment_1` VALUES ('65', '1', 'admin', '', '杨桃', 'jpg', '215347', '201809/7e2461743f.jpg', '0', '', '1537973253');
INSERT INTO `fn_attachment_1` VALUES ('66', '1', 'admin', '', '棕竹', 'jpg', '3299000', '201809/7beae9bad9.jpg', '0', '', '1537973276');
INSERT INTO `fn_attachment_1` VALUES ('67', '1', 'admin', '', '2854437738824041070', 'jpg', '203459', '201809/57036d668d.jpg', '0', '', '1538010231');
INSERT INTO `fn_attachment_1` VALUES ('68', '1', 'admin', '', '22735524_22735524_1372511588528', 'jpg', '246630', '201809/16ba405ae0.jpg', '0', '', '1538010262');
INSERT INTO `fn_attachment_1` VALUES ('69', '1', 'admin', '', 'faf2b2119313b07e1fb0efd00bd7912396dd8cdd', 'jpg', '68813', '201809/bbdbf65c41.jpg', '0', '', '1538010296');
INSERT INTO `fn_attachment_1` VALUES ('70', '1', 'admin', '', '20140727232925_3wXsw', 'jpg', '192993', '201809/356644fc04.jpg', '0', '', '1538018901');
INSERT INTO `fn_attachment_1` VALUES ('71', '1', 'admin', '', '火焰木', 'jpg', '39434', '201809/59439ddd74.jpg', '0', '', '1538019121');
INSERT INTO `fn_attachment_1` VALUES ('72', '1', 'admin', '', '串钱柳', 'jpg', '37274', '201809/c25f669392.jpg', '0', '', '1538019140');
INSERT INTO `fn_attachment_1` VALUES ('73', '1', 'admin', '', '无忧树', 'jpg', '96256', '201809/67d8a85ed5.jpg', '0', '', '1538019281');
INSERT INTO `fn_attachment_1` VALUES ('74', '1', 'admin', '', '腊肠树', 'jpg', '134728', '201809/19cf5cde1d.jpg', '0', '', '1538019413');
INSERT INTO `fn_attachment_1` VALUES ('75', '1', 'admin', '', '金合欢', 'jpg', '55951', '201809/7f24fe15ab.jpg', '0', '', '1538019814');
INSERT INTO `fn_attachment_1` VALUES ('76', '1', 'admin', '', '腊肠树', 'jpg', '134728', '201809/1185e0e668.jpg', '0', '', '1538019833');
INSERT INTO `fn_attachment_1` VALUES ('77', '1', 'admin', '', '红花荷', 'jpg', '36311', '201809/a6baf5da0d.jpg', '0', '', '1538019849');
INSERT INTO `fn_attachment_1` VALUES ('78', '1', 'admin', '', '红千层', 'jpg', '86589', '201809/0c180b9599.jpg', '0', '', '1538019866');
INSERT INTO `fn_attachment_1` VALUES ('79', '1', 'admin', '', '大叶紫薇', 'jpg', '56791', '201809/e7d2b6e453.jpg', '0', '', '1538019883');
INSERT INTO `fn_attachment_1` VALUES ('80', '1', 'admin', '', 'guibeizhu', 'jpg', '94710', '201809/fbea188c0c.jpg', '0', '', '1538019947');
INSERT INTO `fn_attachment_1` VALUES ('81', '1', 'admin', '', 'shuixian', 'jpg', '115620', '201809/f7391d0176.jpg', '0', '', '1538019993');
INSERT INTO `fn_attachment_1` VALUES ('82', '1', 'admin', '', '微信图片_20190304173402', 'jpg', '23900', '201903/f08a402a7b.jpg', '0', '', '1552018760');

-- ----------------------------
-- Table structure for `fn_attachment_2`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_2`;
CREATE TABLE `fn_attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

-- ----------------------------
-- Records of fn_attachment_2
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_3`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_3`;
CREATE TABLE `fn_attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

-- ----------------------------
-- Records of fn_attachment_3
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_4`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_4`;
CREATE TABLE `fn_attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

-- ----------------------------
-- Records of fn_attachment_4
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_5`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_5`;
CREATE TABLE `fn_attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

-- ----------------------------
-- Records of fn_attachment_5
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_6`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_6`;
CREATE TABLE `fn_attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

-- ----------------------------
-- Records of fn_attachment_6
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_7`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_7`;
CREATE TABLE `fn_attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

-- ----------------------------
-- Records of fn_attachment_7
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_8`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_8`;
CREATE TABLE `fn_attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

-- ----------------------------
-- Records of fn_attachment_8
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_attachment_9`
-- ----------------------------
DROP TABLE IF EXISTS `fn_attachment_9`;
CREATE TABLE `fn_attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

-- ----------------------------
-- Records of fn_attachment_9
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_field`
-- ----------------------------
DROP TABLE IF EXISTS `fn_field`;
CREATE TABLE `fn_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `list` (`relatedid`,`disabled`,`issystem`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='字段表';

-- ----------------------------
-- Records of fn_field
-- ----------------------------
INSERT INTO `fn_field` VALUES ('8', '主题', 'title', 'Text', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', '1');
INSERT INTO `fn_field` VALUES ('9', '缩略图', 'thumb', 'File', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '10');
INSERT INTO `fn_field` VALUES ('10', '关键字', 'keywords', 'Text', '4', 'module', '1', '1', '1', '1', '1', '1', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0');
INSERT INTO `fn_field` VALUES ('11', '描述', 'description', 'Textarea', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":500,\"height\":60,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"filter\":\"dr_clearhtml\"}}', '11');
INSERT INTO `fn_field` VALUES ('12', '内容', 'content', 'Ueditor', '4', 'module', '1', '0', '1', '1', '0', '0', '{\"option\":{\"width\":\"90%\",\"height\":\"400\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '12');
INSERT INTO `fn_field` VALUES ('25', '内容', 'neirong', 'Ueditor', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"width\":\"100%\",\"height\":\"200\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '0');
INSERT INTO `fn_field` VALUES ('23', '主题', 'title', 'Text', '1', 'form-1', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1}}', '0');
INSERT INTO `fn_field` VALUES ('54', '季相', 'jx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u5e38\\u7eff|value12\\r\\n\\u843d\\u53f6|value13\\r\\n\\u534a\\u843d\\u53f6|value49\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('53', '观赏特性', 'gstxx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u89c2\\u82b1|value9\\r\\n\\u89c2\\u53f6|value10\\r\\n\\u89c2\\u679c|value11\\r\\n\\u89c2\\u5f62|value45\\r\\n\\u5176\\u4ed6|value46\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('56', '气候类型', 'qhlx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u70ed\\u5e26|value17\\r\\n\\u4e9a\\u70ed\\u5e26|value18\\r\\n\\u6e29\\u5e26|value19\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('50', '生活型', 'shx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u4e54\\u6728|value1\\r\\n\\u704c\\u6728|value2\\r\\n\\u85e4\\u672c|value41\\r\\n\\u5730\\u88ab\\u8349\\u672c|value3\\r\\n\\u6c34\\u751f\\u8349\\u672c|value42\\r\\n\\u8349\\u576a\\u8349\\u672c|value43\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('51', '生活环境', 'sdlx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u65f1\\u751f|value50\\r\\n\\u4e2d\\u751f|value44\\r\\n\\u6e7f\\u751f|value6\\r\\n\\u6c34\\u751f|value5\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');
INSERT INTO `fn_field` VALUES ('52', '花色', 'wslxx', 'Radio', '4', 'module', '1', '1', '0', '1', '0', '0', '{\"option\":{\"options\":\"\\u7ea2|value22\\r\\n\\u9ec4|value23\\r\\n\\u84dd|value24\\r\\n\\u7c89|value47\\r\\n\\u7d2b|value48\\r\\n\\u767d|value25\\r\\n\\u5176\\u4ed6|value26\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1');

-- ----------------------------
-- Table structure for `fn_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `fn_linkage`;
CREATE TABLE `fn_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `module` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='联动菜单表';

-- ----------------------------
-- Records of fn_linkage
-- ----------------------------
INSERT INTO `fn_linkage` VALUES ('1', '中国地区', '0', 'address');

-- ----------------------------
-- Table structure for `fn_linkage_data_1`
-- ----------------------------
DROP TABLE IF EXISTS `fn_linkage_data_1`;
CREATE TABLE `fn_linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cname` (`cname`),
  KEY `hidden` (`hidden`),
  KEY `list` (`site`,`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

-- ----------------------------
-- Records of fn_linkage_data_1
-- ----------------------------
INSERT INTO `fn_linkage_data_1` VALUES ('1', '1', '0', '0', '北京', 'beijing', '0', '0', '1', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('2', '1', '0', '0', '天津', 'tianjin', '0', '0', '2', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('3', '1', '0', '0', '上海', 'shanghai', '0', '0', '3', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('4', '1', '0', '0', '重庆', 'chongqing', '0', '0', '4', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('5', '1', '0', '0', '黑龙江', 'heilongjiang', '0', '0', '5', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('6', '1', '0', '0', '吉林', 'jilin', '0', '0', '6', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('7', '1', '0', '0', '辽宁', 'liaoning', '0', '0', '7', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('8', '1', '0', '0', '河北', 'hebei', '0', '0', '8', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('9', '1', '0', '0', '河南', 'henan', '0', '0', '9', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('10', '1', '0', '0', '山东', 'shandong', '0', '0', '10', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('11', '1', '0', '0', '江苏', 'jiangsu', '0', '0', '11', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('12', '1', '0', '0', '山西', 'shanxi', '0', '0', '12', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('13', '1', '0', '0', '陕西', 'shanxi1', '0', '0', '13', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('14', '1', '0', '0', '甘肃', 'gansu', '0', '0', '14', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('15', '1', '0', '0', '四川', 'sichuan', '0', '0', '15', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('16', '1', '0', '0', '青海', 'qinghai', '0', '0', '16', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('17', '1', '0', '0', '湖南', 'hunan', '0', '0', '17', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('18', '1', '0', '0', '湖北', 'hubei', '0', '0', '18', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('19', '1', '0', '0', '江西', 'jiangxi', '0', '0', '19', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('20', '1', '0', '0', '安徽', 'anhui', '0', '0', '20', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('21', '1', '0', '0', '浙江', 'zhejiang', '0', '0', '21', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('22', '1', '0', '0', '福建', 'fujian', '0', '0', '22', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('23', '1', '0', '0', '广东', 'guangdong', '0', '0', '23', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('24', '1', '0', '0', '广西', 'guangxi', '0', '0', '24', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('25', '1', '0', '0', '贵州', 'guizhou', '0', '0', '25', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('26', '1', '0', '0', '云南', 'yunnan', '0', '0', '26', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('27', '1', '0', '0', '海南', 'hainan', '0', '0', '27', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('28', '1', '0', '0', '内蒙古', 'neimenggu', '0', '0', '28', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('29', '1', '0', '0', '新疆', 'xinjiang', '0', '0', '29', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('30', '1', '0', '0', '宁夏', 'ningxia', '0', '0', '30', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('31', '1', '0', '0', '西藏', 'xicang', '0', '0', '31', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('32', '1', '0', '0', '香港', 'xianggang', '0', '0', '32', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('33', '1', '0', '0', '澳门', 'aomen', '0', '0', '33', '0');
INSERT INTO `fn_linkage_data_1` VALUES ('34', '1', '0', '0', '台湾', 'taiwan', '0', '0', '34', '0');

-- ----------------------------
-- Table structure for `fn_mail_smtp`
-- ----------------------------
DROP TABLE IF EXISTS `fn_mail_smtp`;
CREATE TABLE `fn_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表';

-- ----------------------------
-- Records of fn_mail_smtp
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_member`
-- ----------------------------
DROP TABLE IF EXISTS `fn_member`;
CREATE TABLE `fn_member` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `adminid` (`adminid`),
  KEY `phone` (`phone`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fn_member
-- ----------------------------
INSERT INTO `fn_member` VALUES ('1', '', 'admin', 'ac7cd59472be180b81c7551b92925f03', 'b3967a0e93', '1212', '12', '', '9999.00', '0.00', '0.00', '10000', '10000', '1', '3', '4', '0', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `fn_member_data`
-- ----------------------------
DROP TABLE IF EXISTS `fn_member_data`;
CREATE TABLE `fn_member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of fn_member_data
-- ----------------------------
INSERT INTO `fn_member_data` VALUES ('1', '1', '0');

-- ----------------------------
-- Table structure for `fn_member_oauth`
-- ----------------------------
DROP TABLE IF EXISTS `fn_member_oauth`;
CREATE TABLE `fn_member_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表';

-- ----------------------------
-- Records of fn_member_oauth
-- ----------------------------

-- ----------------------------
-- Table structure for `fn_module`
-- ----------------------------
DROP TABLE IF EXISTS `fn_module`;
CREATE TABLE `fn_module` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dirname` (`dirname`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='模块表';

-- ----------------------------
-- Records of fn_module
-- ----------------------------
INSERT INTO `fn_module` VALUES ('4', '{\"name\":\"\\u6587\\u7ae0\",\"urlrule\":\"4\",\"search_title\":\"[\\u7b2c{page}\\u9875{join}][{keyword}{join}][{param}{join}]{modulename}{join}{SITE_NAME}\",\"search_keywords\":\"\",\"search_description\":\"\",\"use\":1}', 'news', '0', '0', '0', '', '0', '0');

-- ----------------------------
-- Table structure for `fn_site`
-- ----------------------------
DROP TABLE IF EXISTS `fn_site`;
CREATE TABLE `fn_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

-- ----------------------------
-- Records of fn_site
-- ----------------------------
INSERT INTO `fn_site` VALUES ('1', 'FineCMS', '222.201.225.10', '{\"SITE_CLOSE\":\"0\",\"SITE_CLOSE_MSG\":\"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....\",\"SITE_NAME\":\"FineCMS\",\"SITE_TIME_FORMAT\":\"Y-m-d H:i\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_THEME\":\"default\",\"SITE_TEMPLATE\":\"default\",\"SITE_TIMEZONE\":\"8\",\"SITE_DOMAINS\":\"\",\"SITE_REWRITE\":\"0\",\"SITE_MOBILE_OPEN\":\"1\",\"SITE_MOBILE\":\"\",\"SITE_SEOJOIN\":\"_\",\"SITE_TITLE\":\"FineCMS\\u516c\\u76ca\\u8f6f\\u4ef6\",\"SITE_KEYWORDS\":\"\\u514d\\u8d39cms,\\u5f00\\u6e90cms\",\"SITE_DESCRIPTION\":\"\\u516c\\u76ca\\u8f6f\\u4ef6\\u4ea7\\u54c1\\u4ecb\\u7ecd\",\"SITE_IMAGE_RATIO\":\"1\",\"SITE_IMAGE_WATERMARK\":\"0\",\"SITE_IMAGE_VRTALIGN\":\"top\",\"SITE_IMAGE_HORALIGN\":\"left\",\"SITE_IMAGE_VRTOFFSET\":\"\",\"SITE_IMAGE_HOROFFSET\":\"\",\"SITE_IMAGE_TYPE\":\"0\",\"SITE_IMAGE_OVERLAY\":\"default.png\",\"SITE_IMAGE_OPACITY\":\"\",\"SITE_IMAGE_FONT\":\"default.ttf\",\"SITE_IMAGE_COLOR\":\"\",\"SITE_IMAGE_SIZE\":\"\",\"SITE_IMAGE_TEXT\":\"\",\"SITE_DOMAIN\":\"plants.gdngs.cn\",\"SITE_IMAGE_CONTENT\":0}');

-- ----------------------------
-- Table structure for `fn_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `fn_urlrule`;
CREATE TABLE `fn_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='URL规则表';

-- ----------------------------
-- Records of fn_urlrule
-- ----------------------------
INSERT INTO `fn_urlrule` VALUES ('1', '3', '栏目规则测试', '{\"share_list\":\"{dirname}-list.html\",\"share_list_page\":\"{dirname}-list-{page}.html\",\"share_show\":\"{dirname}-show-{id}.html\",\"share_show_page\":\"{dirname}-show-{id}-{page}.html\",\"share_search\":\"\",\"share_search_page\":\"\",\"tags\":\"\"}');
INSERT INTO `fn_urlrule` VALUES ('2', '4', '站点URL测试', '{\"share_list\":\"\",\"share_list_page\":\"\",\"share_show\":\"\",\"share_show_page\":\"\",\"share_search\":\"search.html\",\"share_search_page\":\"search\\/{param}.html\",\"tags\":\"tag\\/{tag}.html\"}');
