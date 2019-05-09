/*
 Navicat MySQL Data Transfer

 Source Server         : 120.76.200.232
 Source Server Version : 50717
 Source Host           : 120.76.200.232
 Source Database       : hnplants

 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 05/09/2019 23:52:18 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `fn_1_block`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_block`;
CREATE TABLE `fn_1_block` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '资料块名称',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资料块表';

-- ----------------------------
--  Records of `fn_1_block`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_block` VALUES ('1', '首页文本公告', 'FineCMS公益版v5.0正式上线了，全新内容管理设计，灵活，高负载|#009688\nFineCMS公益版永久免费开源，不计较版权，开源QQ群：8615168|red'), ('3', '友情链接', 'http://www.finecms.net|公益版论坛\n	http://www.dayrui.com|天睿程序设计'), ('4', '图片上传', '{i-4}:');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_category`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `tid` (`tid`) USING BTREE,
  KEY `show` (`show`) USING BTREE,
  KEY `dirname` (`dirname`) USING BTREE,
  KEY `module` (`pid`,`displayorder`,`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='栏目表';

-- ----------------------------
--  Records of `fn_1_category`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_category` VALUES ('1', '1', '0', 'news', '0', '植物', '', 'y', 'yejie', '', '0', '1', '0', '', '1', '', '', '{\"edit\":\"0\",\"linkurl\":\"\",\"urlrule\":\"0\",\"seo\":{\"show_title\":\"[\\u7b2c{page}\\u9875{join}]{title}{join}{catname}{join}{SITE_NAME}\",\"list_title\":\"[\\u7b2c{page}\\u9875{join}]{name}{join}{SITE_NAME}\",\"list_keywords\":\"\\u4e1a\\u754c\\u65b0\\u95fb\",\"list_description\":\"\\u4e1a\\u754c\\u65b0\\u95fb\\u63cf\\u8ff0\"},\"template\":{\"pagesize\":\"20\",\"show\":\"index.html\",\"category\":\"index.html\",\"list\":\"index.html\",\"search\":\"index.html\",\"page\":\"index.html\"},\"admin\":[],\"member\":[],\"html\":0,\"getchild\":0}', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_form`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form`;
CREATE TABLE `fn_1_form` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `table` (`table`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='表单模型表';

-- ----------------------------
--  Records of `fn_1_form`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_form` VALUES ('1', '留言', 'liuyan', '{\"post\":\"1\",\"code\":\"1\",\"send\":\"\",\"template\":\"\",\"rt_url\":\"\"}');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_form_liuyan`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `inputtime` (`inputtime`) USING BTREE,
  KEY `displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='留言表单表';

-- ----------------------------
--  Table structure for `fn_1_form_liuyan_data_0`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_form_liuyan_data_0`;
CREATE TABLE `fn_1_form_liuyan_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT '0' COMMENT '录入者uid',
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='留言表单附表';

-- ----------------------------
--  Table structure for `fn_1_index`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_index`;
CREATE TABLE `fn_1_index` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `catid` (`catid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `inputtime` (`inputtime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容索引表';

-- ----------------------------
--  Records of `fn_1_index`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_index` VALUES ('1', '1', 'news', '7', '9', '1491960567'), ('2', '1', 'news', '7', '9', '1491960680'), ('3', '1', 'news', '7', '9', '1491960733'), ('4', '1', 'news', '7', '9', '1491960798'), ('5', '1', 'news', '7', '9', '1491961512'), ('6', '1', 'news', '7', '9', '1491961527'), ('7', '1', 'news', '7', '9', '1491961540'), ('8', '1', 'news', '7', '9', '1491961552'), ('9', '1', 'news', '7', '9', '1491961566'), ('10', '1', 'news', '7', '9', '1491961772'), ('11', '1', 'news', '8', '9', '1491961788'), ('12', '1', 'news', '8', '9', '1491961810'), ('13', '1', 'news', '8', '9', '1491961819'), ('14', '1', 'news', '8', '9', '1491961830'), ('15', '1', 'news', '8', '9', '1491961842'), ('16', '1', 'news', '8', '9', '1491961853'), ('17', '1', 'news', '8', '9', '1491961865'), ('18', '1', 'news', '8', '9', '1491961874'), ('19', '1', 'news', '8', '9', '1491961886'), ('20', '1', 'news', '8', '9', '1491961901'), ('21', '1', 'news', '9', '9', '1491961919'), ('22', '1', 'news', '9', '9', '1491961968'), ('23', '1', 'news', '9', '9', '1491961979'), ('24', '1', 'news', '9', '9', '1491961989'), ('25', '1', 'news', '9', '9', '1491962001'), ('26', '1', 'news', '9', '9', '1491962013'), ('27', '1', 'news', '9', '9', '1491962025'), ('28', '1', 'news', '9', '9', '1491962036'), ('29', '1', 'news', '9', '9', '1491962048'), ('30', '1', 'news', '9', '9', '1491962065'), ('31', '1', 'news', '2', '9', '1491962157'), ('32', '1', 'news', '2', '9', '1491962218'), ('33', '1', 'news', '2', '9', '1491962231'), ('34', '1', 'news', '2', '9', '1491962243'), ('35', '1', 'news', '2', '9', '1491962255'), ('36', '1', 'news', '2', '9', '1491962288'), ('37', '1', 'news', '2', '9', '1491962297'), ('38', '1', 'news', '2', '9', '1491962307'), ('39', '1', 'news', '2', '9', '1491962318'), ('40', '1', 'news', '2', '9', '1491962330'), ('41', '1', 'news', '10', '9', '1491962345'), ('42', '1', 'news', '10', '9', '1491962366'), ('43', '1', 'news', '10', '9', '1491962376'), ('44', '1', 'news', '10', '9', '1491962387'), ('45', '1', 'news', '10', '9', '1491962400'), ('46', '1', 'news', '10', '9', '1491962414'), ('47', '1', 'news', '10', '9', '1491962433'), ('48', '1', 'news', '10', '9', '1491962449'), ('49', '1', 'news', '10', '9', '1491962464'), ('50', '1', 'news', '10', '9', '1491962491'), ('51', '1', 'news', '11', '9', '1491962512'), ('52', '1', 'news', '11', '9', '1491962537'), ('53', '1', 'news', '11', '9', '1491962548'), ('54', '1', 'news', '11', '9', '1491962560'), ('55', '1', 'news', '11', '9', '1491962573'), ('56', '1', 'news', '11', '9', '1491962585'), ('57', '1', 'news', '11', '9', '1491962601'), ('58', '1', 'news', '11', '9', '1491962613'), ('59', '1', 'news', '11', '9', '1491962627'), ('60', '1', 'news', '11', '9', '1491962640'), ('61', '1', 'news', '12', '9', '1491962660'), ('62', '1', 'news', '12', '9', '1491962681'), ('63', '1', 'news', '12', '9', '1491962694'), ('64', '1', 'news', '12', '9', '1491962703'), ('65', '1', 'news', '12', '9', '1491962715'), ('66', '1', 'news', '12', '9', '1491962731'), ('67', '1', 'news', '12', '9', '1491962742'), ('68', '1', 'news', '12', '9', '1491962758'), ('69', '1', 'news', '12', '9', '1491962768'), ('70', '1', 'news', '12', '9', '1491962780'), ('71', '1', 'news', '13', '9', '1491962798'), ('72', '1', 'news', '13', '9', '1491962819'), ('73', '1', 'news', '13', '9', '1491962830'), ('74', '1', 'news', '13', '9', '1491962843'), ('75', '1', 'news', '13', '9', '1491962852'), ('76', '1', 'news', '13', '9', '1491962861'), ('77', '1', 'news', '13', '9', '1491962871'), ('78', '1', 'news', '13', '9', '1491962881'), ('79', '1', 'news', '13', '9', '1491962890'), ('80', '1', 'news', '13', '9', '1491962902'), ('81', '1', 'news', '14', '9', '1491962962'), ('82', '1', 'news', '14', '9', '1491962977'), ('83', '1', 'news', '14', '9', '1491962988'), ('84', '1', 'news', '14', '9', '1491962997'), ('85', '1', 'news', '14', '9', '1491963009'), ('86', '1', 'news', '14', '9', '1491963018'), ('87', '1', 'news', '14', '9', '1491963028'), ('88', '1', 'news', '14', '9', '1491963040'), ('89', '1', 'news', '14', '9', '1491963052'), ('90', '1', 'news', '14', '9', '1491963164'), ('91', '1', 'news', '15', '9', '1491963194'), ('92', '1', 'news', '15', '9', '1491963214'), ('93', '1', 'news', '15', '9', '1491963225'), ('94', '1', 'news', '15', '9', '1491963235'), ('95', '1', 'news', '15', '9', '1491963245'), ('96', '1', 'news', '15', '9', '1491963255'), ('97', '1', 'news', '15', '9', '1491963269'), ('98', '1', 'news', '15', '9', '1491963280'), ('99', '1', 'news', '15', '9', '1491963293'), ('100', '1', 'news', '15', '9', '1491963305'), ('101', '1', 'news', '16', '9', '1491963316'), ('102', '1', 'news', '16', '9', '1491963382'), ('103', '1', 'news', '16', '9', '1491963396'), ('104', '1', 'news', '16', '9', '1491963405'), ('105', '1', 'news', '16', '9', '1491963414'), ('106', '1', 'news', '16', '9', '1491963427'), ('107', '1', 'news', '16', '9', '1491963440'), ('108', '1', 'news', '16', '9', '1491963453'), ('109', '1', 'news', '16', '9', '1491963567'), ('110', '1', 'news', '16', '9', '1491963584'), ('111', '1', 'news', '17', '9', '1491963594'), ('112', '1', 'news', '17', '9', '1491963620'), ('113', '1', 'news', '17', '9', '1491963630'), ('114', '1', 'news', '17', '9', '1491963640'), ('115', '1', 'news', '17', '9', '1491963649'), ('116', '1', 'news', '17', '9', '1491963661'), ('117', '1', 'news', '17', '9', '1491963671'), ('118', '1', 'news', '17', '9', '1491963682'), ('119', '1', 'news', '17', '9', '1491963692'), ('120', '1', 'news', '17', '9', '1491963722'), ('121', '1', 'news', '2', '9', '1491964073'), ('122', '1', 'news', '2', '9', '1491964135'), ('123', '1', 'news', '2', '9', '1491964148'), ('124', '1', 'news', '2', '9', '1491964156'), ('125', '1', 'news', '2', '9', '1491964165'), ('126', '1', 'news', '2', '9', '1491964180'), ('127', '1', 'news', '1', '9', '1502075282'), ('128', '1', 'news', '1', '9', '1502076339'), ('129', '1', 'news', '1', '9', '1502093483'), ('130', '1', 'news', '1', '9', '1502093535'), ('131', '1', 'news', '1', '9', '1502093570'), ('132', '1', 'news', '1', '9', '1502093588'), ('133', '1', 'news', '1', '9', '1502093607'), ('134', '1', 'news', '1', '9', '1502093624'), ('135', '1', 'news', '1', '9', '1502093643'), ('136', '1', 'news', '1', '9', '1502093666'), ('137', '1', 'news', '1', '9', '1502093688'), ('138', '1', 'news', '1', '9', '1502298001'), ('139', '1', 'news', '1', '9', '1502298119'), ('140', '1', 'news', '1', '9', '1502298156'), ('141', '1', 'news', '1', '9', '1502358144'), ('142', '1', 'news', '1', '9', '1502358184'), ('143', '1', 'news', '1', '9', '1502358219'), ('144', '1', 'news', '1', '9', '1511144401'), ('145', '1', 'news', '1', '9', '1511144534'), ('146', '1', 'news', '1', '9', '1511144569'), ('147', '1', 'news', '1', '9', '1511144603'), ('148', '1', 'news', '1', '9', '1511144629'), ('149', '1', 'news', '1', '9', '1511144654'), ('150', '1', 'news', '1', '9', '1511144677'), ('151', '1', 'news', '1', '9', '1511144703'), ('152', '1', 'news', '1', '9', '1511144727'), ('153', '1', 'news', '1', '9', '1511144753'), ('154', '1', 'news', '1', '9', '1511144776'), ('155', '1', 'news', '1', '9', '1511144801'), ('156', '1', 'news', '1', '9', '1511144825'), ('157', '1', 'news', '1', '9', '1511144853'), ('158', '1', 'news', '1', '9', '1511144876'), ('159', '1', 'news', '1', '9', '1511144900'), ('160', '1', 'news', '1', '9', '1511145407'), ('161', '1', 'news', '1', '9', '1511145425'), ('162', '1', 'news', '1', '9', '1511145452'), ('163', '1', 'news', '1', '9', '1511145476'), ('164', '1', 'news', '1', '9', '1511145496'), ('165', '1', 'news', '1', '9', '1537972146'), ('166', '1', 'news', '1', '9', '1537972211'), ('167', '1', 'news', '1', '9', '1537972255'), ('168', '1', 'news', '1', '9', '1537972380'), ('169', '1', 'news', '1', '9', '1537972446'), ('170', '1', 'news', '1', '9', '1537972479'), ('171', '1', 'news', '1', '9', '1537972501'), ('172', '1', 'news', '1', '9', '1537972529'), ('173', '1', 'news', '1', '9', '1537972565'), ('174', '1', 'news', '1', '9', '1537972598'), ('175', '1', 'news', '1', '9', '1537972624'), ('176', '1', 'news', '1', '9', '1537972654'), ('177', '1', 'news', '1', '9', '1537972681'), ('178', '1', 'news', '1', '9', '1537972919'), ('179', '1', 'news', '1', '9', '1537972953'), ('180', '1', 'news', '1', '9', '1537972975'), ('181', '1', 'news', '1', '9', '1537973033'), ('182', '1', 'news', '1', '9', '1537973077'), ('183', '1', 'news', '1', '9', '1537973108'), ('184', '1', 'news', '1', '9', '1537973134'), ('185', '1', 'news', '1', '9', '1537973221'), ('186', '1', 'news', '1', '9', '1537973242'), ('187', '1', 'news', '1', '9', '1537973266'), ('188', '1', 'news', '1', '9', '1538010188'), ('189', '1', 'news', '1', '9', '1538010247'), ('190', '1', 'news', '1', '9', '1538010278'), ('191', '1', 'news', '1', '9', '1538018883'), ('192', '1', 'news', '1', '9', '1538018918'), ('193', '1', 'news', '1', '9', '1538019129'), ('194', '1', 'news', '1', '9', '1538019151'), ('195', '1', 'news', '1', '9', '1538019165'), ('196', '1', 'news', '1', '9', '1538019299'), ('197', '1', 'news', '1', '9', '1538019521'), ('198', '1', 'news', '1', '9', '1538019530'), ('199', '1', 'news', '1', '9', '1538019603'), ('200', '1', 'news', '1', '9', '1551697689'), ('201', '1', 'news', '1', '9', '1552018470'), ('202', '1', 'news', '1', '9', '1555234598');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_news`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_news`;
CREATE TABLE `fn_1_news` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text,
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
  `shhj` varchar(255) DEFAULT NULL,
  `shx` varchar(255) DEFAULT NULL,
  `hs` varchar(255) DEFAULT NULL,
  `gstx` varchar(255) DEFAULT NULL,
  `jixiang` varchar(255) DEFAULT NULL,
  `qhlx` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `catid` (`catid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `inputtime` (`inputtime`) USING BTREE,
  KEY `updatetime` (`updatetime`) USING BTREE,
  KEY `displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模型主表';

-- ----------------------------
--  Records of `fn_1_news`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_news` VALUES ('127', '1', '狐尾藻', '17', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=127', '0', '127.0.0.1', '1502075282', '1537951482', '0', '0', '0', null, null, null, null, null, null), ('128', '1', '黄菖蒲', '2', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=128', '0', '127.0.0.1', '1502076339', '1537951473', '0', '0', '0', null, null, null, null, null, null), ('129', '1', '黄花蔺', '3', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=129', '0', '127.0.0.1', '1502093483', '1537951614', '0', '0', '0', null, null, null, null, null, null), ('130', '1', '梭鱼草', '4', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=130', '0', '127.0.0.1', '1502093535', '1537951577', '0', '0', '0', null, null, null, null, null, null), ('131', '1', '美人蕉', '5', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=131', '0', '127.0.0.1', '1502093570', '1537951506', '0', '0', '0', null, null, null, null, null, null), ('132', '1', '香蒲', '6', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=132', '0', '127.0.0.1', '1502093588', '1537951563', '0', '0', '0', null, null, null, null, null, null), ('133', '1', '雨久花', '7', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=133', '0', '127.0.0.1', '1502093607', '1537951546', '0', '0', '0', null, null, null, null, null, null), ('134', '1', '星光草', '8', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=134', '0', '127.0.0.1', '1502093624', '1537951533', '0', '0', '0', null, null, null, null, null, null), ('135', '1', '千屈菜', '14', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=135', '0', '127.0.0.1', '1502093643', '1537951605', '0', '0', '0', null, null, null, null, null, null), ('136', '1', '荷花', '15', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=136', '0', '127.0.0.1', '1502093666', '1537951590', '0', '0', '0', null, null, null, null, null, null), ('137', '1', '菖蒲', '13', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=137', '0', '127.0.0.1', '1502093688', '1537951521', '0', '0', '0', null, null, null, null, null, null), ('138', '1', '芦苇', '16', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=138', '0', '219.137.185.117', '1502298001', '1537951492', '0', '0', '0', null, null, null, null, null, null), ('139', '1', '风车草', '18', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=139', '0', '219.137.185.117', '1502298119', '1537951461', '0', '0', '0', null, null, null, null, null, null), ('140', '1', '水葱', '19', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=140', '0', '219.137.185.117', '1502298156', '1537951185', '0', '0', '0', null, null, null, null, null, null), ('141', '1', '王莲', '20', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=141', '0', '219.137.186.63', '1502358144', '1537951199', '0', '0', '0', null, null, null, null, null, null), ('142', '1', '铜钱草', '21', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=142', '0', '219.137.186.63', '1502358184', '1537951446', '0', '0', '0', null, null, null, null, null, null), ('143', '1', '凤眼莲', '22', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=143', '0', '219.137.186.63', '1502358219', '1537951432', '0', '0', '0', null, null, null, null, null, null), ('144', '1', '荸荠', '23', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=144', '0', '219.137.187.187', '1511144401', '1537951423', '0', '0', '0', null, null, null, null, null, null), ('145', '1', '慈姑', '24', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=145', '0', '219.137.187.187', '1511144534', '1537951396', '0', '0', '0', null, null, null, null, null, null), ('146', '1', '大薸', '25', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=146', '0', '219.137.187.187', '1511144569', '1537951386', '0', '0', '0', null, null, null, null, null, null), ('147', '1', '灯芯草', '26', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=147', '0', '219.137.187.187', '1511144603', '1537951374', '0', '0', '0', null, null, null, null, null, null), ('148', '1', '黑藻', '27', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=148', '0', '219.137.187.187', '1511144629', '1537951359', '0', '0', '0', null, null, null, null, null, null), ('149', '1', '红蓼', '28', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=149', '0', '219.137.187.187', '1511144654', '1537951346', '0', '0', '0', null, null, null, null, null, null), ('150', '1', '茭白', '29', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=150', '0', '219.137.187.187', '1511144677', '1538010853', '0', '0', '0', null, null, null, null, null, null), ('151', '1', '金鱼藻', '30', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=151', '0', '219.137.187.187', '1511144703', '1537951315', '0', '0', '0', null, null, null, null, null, null), ('152', '1', '菱', '31', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=152', '0', '219.137.187.187', '1511144727', '1538010820', '0', '0', '0', null, null, null, null, null, null), ('153', '1', '马蹄莲', '32', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=153', '0', '219.137.187.187', '1511144753', '1537951284', '0', '0', '0', null, null, null, null, null, null), ('154', '1', '芡实', '33', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=154', '0', '219.137.187.187', '1511144776', '1537951267', '0', '0', '0', null, null, null, null, null, null), ('155', '1', '石龙尾', '34', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=155', '0', '219.137.187.187', '1511144801', '1538010837', '0', '0', '0', null, null, null, null, null, null), ('156', '1', '水蓼', '35', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=156', '0', '219.137.187.187', '1511144825', '1538010740', '0', '0', '0', null, null, null, null, null, null), ('157', '1', '香根草', '36', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=157', '0', '219.137.187.187', '1511144853', '1537951162', '0', '0', '0', null, null, null, null, null, null), ('158', '1', '薏米', '37', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=158', '0', '219.137.187.187', '1511144876', '1538010512', '0', '0', '0', null, null, null, null, null, null), ('159', '1', '芋', '38', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=159', '0', '219.137.187.187', '1511144900', '1538010755', '0', '0', '0', null, null, null, null, null, null), ('160', '1', '水仙', '81', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=160', '0', '219.137.187.187', '1511145407', '1538019957', '0', '0', '0', null, null, null, null, null, null), ('161', '1', '水鳖', '40', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=161', '0', '219.137.187.187', '1511145425', '1537945259', '0', '0', '0', null, null, null, null, null, null), ('162', '1', '龟背竹', '80', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=162', '0', '219.137.187.187', '1511145452', '1538019939', '0', '0', '0', null, null, null, null, null, null), ('163', '1', '铜钱草', '41', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=163', '0', '219.137.187.187', '1511145476', '1538010723', '0', '0', '0', null, null, null, null, null, null), ('164', '1', '窄叶泽泻', '42', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=164', '0', '219.137.187.187', '1511145496', '1538010786', '0', '0', '0', null, null, null, null, null, null), ('165', '1', '白兰', '43', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=165', '0', '223.73.115.167', '1537972146', '1537972146', '0', '0', '0', null, null, null, null, null, null), ('166', '1', '翠芦莉', '44', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=166', '0', '223.73.115.167', '1537972211', '1537972211', '0', '0', '0', null, null, null, null, null, null), ('167', '1', '鹅掌藤', '45', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=167', '0', '223.73.115.167', '1537972255', '1537972255', '0', '0', '0', null, null, null, null, null, null), ('168', '1', '凤凰木', '47', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=168', '0', '223.73.115.167', '1537972380', '1537972380', '0', '0', '0', null, null, null, null, null, null), ('169', '1', '宫粉羊蹄甲', '48', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=169', '0', '223.73.115.167', '1537972446', '1538018836', '0', '0', '0', null, null, null, null, null, null), ('170', '1', '福建茶', '49', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=170', '0', '223.73.115.167', '1537972479', '1537972479', '0', '0', '0', null, null, null, null, null, null), ('171', '1', '桂花', '50', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=171', '0', '223.73.115.167', '1537972501', '1537972501', '0', '0', '0', null, null, null, null, null, null), ('172', '1', '海南蒲桃', '51', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=172', '0', '223.73.115.167', '1537972529', '1537972529', '0', '0', '0', null, null, null, null, null, null), ('173', '1', '红继木', '52', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=173', '0', '223.73.115.167', '1537972565', '1537972565', '0', '0', '0', null, null, null, null, null, null), ('174', '1', '黄花风铃木', '53', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=174', '0', '223.73.115.167', '1537972598', '1537972598', '0', '0', '0', null, null, null, null, null, null), ('175', '1', '灰莉', '54', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=175', '0', '223.73.115.167', '1537972624', '1537972624', '0', '0', '0', null, null, null, null, null, null), ('176', '1', '鸡蛋花', '55', '', '', '5', '1', 'admin', '9', '/index.php?c=show&id=176', '0', '223.73.115.167', '1537972654', '1538020177', '0', '0', '0', null, null, null, null, null, null), ('177', '1', '蓝花楹', '56', '', '蓝花楹，拉丁学名：（Jacaranda mimosifolia D. Don）紫葳科落叶乔木，高达15米。原产南美洲巴西，中国近年来引种栽培供观赏。蓝花楹是观赏、观叶、观花树种，热带、暖亚热带地区广泛栽作行道树，木材黄白色至灰色，质软而轻，纹理通直，加工容易，可作家具用材。该种同时具有观赏与经济价值。', '6', '1', 'admin', '9', '/index.php?c=show&id=177', '0', '223.73.115.167', '1537972681', '1557338560', '0', '0', '0', '[\"value50\",\"value6\"]', '[\"value2\"]', '[\"value24\"]', '[\"value10\"]', '[\"value13\",\"value49\"]', '[\"value18\"]'), ('178', '1', '簕杜鹃', '57', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=178', '0', '223.73.115.167', '1537972919', '1537972919', '0', '0', '0', null, null, null, null, null, null), ('179', '1', '龙船花', '58', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=179', '0', '223.73.115.167', '1537972953', '1537972953', '0', '0', '0', null, null, null, null, null, null), ('180', '1', '蔓马樱丹', '59', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=180', '0', '223.73.115.167', '1537972975', '1537972975', '0', '0', '0', null, null, null, null, null, null), ('181', '1', '芒果', '60', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=181', '0', '223.73.115.167', '1537973033', '1538018782', '0', '0', '0', null, null, null, null, null, null), ('182', '1', '木棉', '61', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=182', '0', '223.73.115.167', '1537973077', '1537973077', '0', '0', '0', null, null, null, null, null, null), ('183', '1', '四季米仔兰', '62', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=183', '0', '223.73.115.167', '1537973108', '1537973108', '0', '0', '0', null, null, null, null, null, null), ('184', '1', '橡胶榕', '63', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=184', '0', '223.73.115.167', '1537973134', '1537973134', '0', '0', '0', null, null, null, null, null, null), ('185', '1', '小叶榕', '64', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=185', '0', '223.73.115.167', '1537973221', '1537973221', '0', '0', '0', null, null, null, null, null, null), ('186', '1', '杨桃', '65', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=186', '0', '223.73.115.167', '1537973242', '1538018726', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('187', '1', '棕竹', '66', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=187', '0', '223.73.115.167', '1537973266', '1537973266', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('188', '1', '红花羊蹄甲', '67', '', '', '3', '1', 'admin', '9', '/index.php?c=show&id=188', '0', '222.200.86.48', '1538010188', '1538019905', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('189', '1', '荷花玉兰', '68', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=189', '0', '222.200.86.48', '1538010247', '1538018804', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('190', '1', '蒲桃', '69', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=190', '0', '222.200.86.48', '1538010278', '1538018770', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('191', '1', '黄槐', '70', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=191', '0', '211.66.88.148', '1538018883', '1538018883', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('192', '1', '火焰木', '71', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=192', '0', '211.66.88.148', '1538018918', '1538018918', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('193', '1', '串钱柳', '72', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=193', '0', '211.66.88.148', '1538019129', '1538019129', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('194', '1', '大叶紫薇', '79', '', '', '68', '1', 'admin', '9', '/index.php?c=show&id=194', '0', '211.66.88.148', '1538019151', '1538020186', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('195', '1', '无忧树', '73', '', '', '3', '1', 'admin', '9', '/index.php?c=show&id=195', '0', '211.66.88.148', '1538019165', '1538019165', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('196', '1', '腊肠树', '76', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=196', '0', '211.66.88.148', '1538019299', '1538019824', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('197', '1', '红千层', '78', '', '', '3', '1', 'admin', '9', '/index.php?c=show&id=197', '0', '211.66.88.148', '1538019521', '1538019857', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('198', '1', '红花荷', '77', '', '', '0', '1', 'admin', '9', '/index.php?c=show&id=198', '0', '211.66.88.148', '1538019530', '1538019840', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('199', '1', '金合欢', '75', '', '', '1', '1', 'admin', '9', '/index.php?c=show&id=199', '0', '211.66.88.148', '1538019603', '1538019803', '0', '0', '0', null, '[\"value1\"]', null, null, null, null), ('202', '1', '杧果 Mangifera indica L.', '84', '', '形态特征：常绿大乔木，高10-20米；树皮灰褐色，小枝褐色，无毛。叶薄革质，常集生枝顶，叶形和大小变化较大，通常为长圆形或长圆状披针形，先端渐尖、长渐尖或急尖，基部楔形或近圆形。圆锥花序长20-35厘米，多花密...', '25', '1', 'admin', '9', '/index.php?c=show&id=202', '0', '172.18.206.205', '1555234598', '1557338546', '0', '0', '0', '[\"value50\"]', '[\"value1\"]', '[\"value23\",\"value24\"]', '[\"value10\"]', '[\"value12\",\"value13\"]', '[\"value17\",\"value18\"]');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_news_data_0`
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
  `money` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `catid` (`catid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模型附表';

-- ----------------------------
--  Records of `fn_1_news_data_0`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_news_data_0` VALUES ('127', '1', '1', '', null, null, null, null, null, null, null, null), ('128', '1', '1', '', null, null, null, null, null, null, null, null), ('129', '1', '1', '', null, null, null, null, null, null, null, null), ('130', '1', '1', '', null, null, null, null, null, null, null, null), ('131', '1', '1', '', null, null, null, null, null, null, null, null), ('132', '1', '1', '', null, null, null, null, null, null, null, null), ('133', '1', '1', '', null, null, null, null, null, null, null, null), ('134', '1', '1', '', null, null, null, null, null, null, null, null), ('135', '1', '1', '', null, null, null, null, null, null, null, null), ('136', '1', '1', '', null, null, null, null, null, null, null, null), ('137', '1', '1', '', null, null, null, null, null, null, null, null), ('138', '1', '1', '', null, null, null, null, null, null, null, null), ('139', '1', '1', '', null, null, null, null, null, null, null, null), ('140', '1', '1', '', null, null, null, null, null, null, null, null), ('141', '1', '1', '', null, null, null, null, null, null, null, null), ('142', '1', '1', '', null, null, null, null, null, null, null, null), ('143', '1', '1', '', null, null, null, null, null, null, null, null), ('144', '1', '1', '', null, null, null, null, null, null, null, null), ('145', '1', '1', '', null, null, null, null, null, null, null, null), ('146', '1', '1', '', null, null, null, null, null, null, null, null), ('147', '1', '1', '', null, null, null, null, null, null, null, null), ('148', '1', '1', '', null, null, null, null, null, null, null, null), ('149', '1', '1', '', null, null, null, null, null, null, null, null), ('150', '1', '1', '', null, null, null, null, null, null, null, null), ('151', '1', '1', '', null, null, null, null, null, null, null, null), ('152', '1', '1', '', null, null, null, null, null, null, null, null), ('153', '1', '1', '', null, null, null, null, null, null, null, null), ('154', '1', '1', '', null, null, null, null, null, null, null, null), ('155', '1', '1', '', null, null, null, null, null, null, null, null), ('156', '1', '1', '', null, null, null, null, null, null, null, null), ('157', '1', '1', '', null, null, null, null, null, null, null, null), ('158', '1', '1', '', null, null, null, null, null, null, null, null), ('159', '1', '1', '', null, null, null, null, null, null, null, null), ('160', '1', '1', '', null, null, null, null, null, null, null, null), ('161', '1', '1', '', null, null, null, null, null, null, null, null), ('162', '1', '1', '', null, null, null, null, null, null, null, null), ('163', '1', '1', '', null, null, null, null, null, null, null, null), ('164', '1', '1', '', null, null, null, null, null, null, null, null), ('165', '1', '1', '', null, null, null, null, null, null, null, null), ('166', '1', '1', '', null, null, null, null, null, null, null, null), ('167', '1', '1', '', null, null, null, null, null, null, null, null), ('168', '1', '1', '', null, null, null, null, null, null, null, null), ('169', '1', '1', '', null, null, null, null, null, null, null, null), ('170', '1', '1', '', null, null, null, null, null, null, null, null), ('171', '1', '1', '', null, null, null, null, null, null, null, null), ('172', '1', '1', '', null, null, null, null, null, null, null, null), ('173', '1', '1', '', null, null, null, null, null, null, null, null), ('174', '1', '1', '', null, null, null, null, null, null, null, null), ('175', '1', '1', '', null, null, null, null, null, null, null, null), ('176', '1', '1', '', null, null, null, null, null, null, null, null), ('177', '1', '1', '<div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">蓝花楹，拉丁学名：（Jacaranda mimosifolia D. Don）紫葳科落叶乔木，高达15米。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">原产南美洲巴西，中国近年来引种栽培供观赏。</div><div class=\"para\" label-module=\"para\" style=\"word-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 28px; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">蓝花楹是观赏、观叶、观花树种，热带、暖亚热带地区广泛栽作行道树，木材黄白色至灰色，质软而轻，纹理通直，加工容易，可作家具用材。该种同时具有观赏与经济价值。</div><p><img id=\"dbfaf0a1f4e9938566487087a02f10fe_img_83\" src=\"/uploadfile/ueditor/image/20190410/1554825817705069.jpg\" title=\"1554825817705069.jpg\" alt=\"316971.jpg\" width=\"913\" height=\"658\" style=\"width: 913px; height: 658px;\"/></p>', null, null, null, null, null, null, null, ''), ('178', '1', '1', '', null, null, null, null, null, null, null, null), ('179', '1', '1', '', null, null, null, null, null, null, null, null), ('180', '1', '1', '', null, null, null, null, null, null, null, null), ('181', '1', '1', '', null, null, null, null, null, null, null, null), ('182', '1', '1', '', null, null, null, null, null, null, null, null), ('183', '1', '1', '', null, null, null, null, null, null, null, null), ('184', '1', '1', '', null, null, null, null, null, null, null, null), ('185', '1', '1', '', null, null, null, null, null, null, null, null), ('186', '1', '1', '', null, null, null, null, null, null, null, null), ('187', '1', '1', '', null, null, null, null, null, null, null, null), ('188', '1', '1', '', null, null, null, null, null, null, null, null), ('189', '1', '1', '', null, null, null, null, null, null, null, null), ('190', '1', '1', '', null, null, null, null, null, null, null, null), ('191', '1', '1', '', null, null, null, null, null, null, null, null), ('192', '1', '1', '', null, null, null, null, null, null, null, null), ('193', '1', '1', '', null, null, null, null, null, null, null, null), ('194', '1', '1', '', null, null, null, null, null, null, null, null), ('195', '1', '1', '', null, null, null, null, null, null, null, null), ('196', '1', '1', '', null, null, null, null, null, null, null, null), ('197', '1', '1', '', null, null, null, null, null, null, null, null), ('198', '1', '1', '', null, null, null, null, null, null, null, null), ('199', '1', '1', '', null, null, null, null, null, null, null, null), ('202', '1', '1', '<p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-size: 18px;\"></span></strong></span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">生活型：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"color: red;\">乔木</span> 灌木&nbsp; 藤本 地被草本 水生草本&nbsp; 草坪草本 </span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">生活环境：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: 宋体;\">旱生 </span><span style=\"font-family: 宋体; color: red;\">中生</span><span style=\"font-family: 宋体;\"> 湿生 水生</span></span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">观赏特性：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: 宋体;\">观花 </span><span style=\"font-family: 宋体; color: red;\">观叶</span> <span style=\"font-family: 宋体; color: red;\">观果</span> <span style=\"font-family: 宋体; color: red;\">观形</span><span style=\"font-family: 宋体;\"> 其他</span></span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">花色</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: 宋体;\">红 </span><span style=\"font-family: 宋体; color: red;\">黄</span><span style=\"font-family: 宋体;\"> 蓝 粉 紫 白 其他</span></span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">季相：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: 宋体; color: red;\">常绿</span><span style=\"font-family: 宋体;\"> 落叶 半落叶</span></span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">气候类型：</span></strong></span><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><span style=\"font-family: 宋体; color: red;\">热带</span><span style=\"font-family: 宋体;\"> 亚热带 温带 </span></span></p><p><br/></p><p style=\"text-align: left;\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-size: 18px;\">形态特</span></strong><strong><span style=\"font-size: 18px;\">征：</span></strong></span><br/></p><p style=\"text-indent: 32px;background: white\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">常绿大乔木，高10-20米；树皮灰褐色，小枝褐色，无毛。叶薄革质，常集生枝顶，叶形和大小变化较大，通常为长圆形或长圆状披针形，先端渐尖、长渐尖或急尖，基部楔形或近圆形。圆锥花序长20-35厘米，多花密集，被灰黄色微柔毛，分枝开展，花小，杂性，黄色或淡黄色。核果大，肾形（栽培品种其形状和大小变化极大），压扁，成熟时黄色，中果皮肉质，肥厚，鲜黄色，味甜，果核坚硬。</span></p><p style=\"text-indent: 32px;background: white\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p style=\"background: white\"><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">生长习性：</span></strong></span></p><p style=\"text-indent: 32px\"><span style=\"background: white; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">芒果性喜温暖，不耐寒霜。温度最适生长温度为25-30℃，低于20℃生长缓慢，低于10℃叶片、花序会停止生长，近成熟的果实会受寒害。为喜光果树，充足的光照可促进花芽分化、开花坐果和提高果实品质，改善外观。芒果对土壤要求不苛，在海拔600米以下的地区均可栽培芒果。但以土层深厚，地下水位低于3米以下，排水良好，微酸性的壤土或沙壤土为好。</span></p><p style=\"text-indent: 32px\"><span style=\"background: white; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><strong><span style=\"font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 18px;\">园林价值：</span></strong></span></p><p style=\"text-indent:32px\"><span style=\"background: white; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">芒果树冠球形，常绿乔木，郁闭度大，树干挺拔、树形端正、形态优雅、分枝点较高、冠幅较大、枝叶繁茂、蔽荫度好。为热带良好的庭园和行道树种。</span></p><p style=\"text-indent:32px\"><span style=\"background: white; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p style=\"text-align: center;\"><img id=\"dbfaf0a1f4e9938566487087a02f10fe_img_85\" src=\"/uploadfile/ueditor/image/20190414/1555236392790894.jpg\" style=\"width: 1015px; height: 573px; float: left;\" title=\"1555236392790894.jpg\" width=\"1015\" height=\"573\"/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\"><br/></p><p style=\"text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"text-align: left;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p style=\"text-align: left;\"><img id=\"dbfaf0a1f4e9938566487087a02f10fe_img_86\" src=\"/uploadfile/ueditor/image/20190414/1555236392256381.jpg\" title=\"1555236392256381.jpg\" width=\"1014\" height=\"570\" style=\"width: 1014px; height: 570px; float: left;\"/></p><p><br/></p>', null, null, null, null, null, null, null, '芒果树冠球形，常绿乔木，郁闭度大，树干挺拔、树形端正、形态优雅、分枝点较高、冠幅较大、枝叶繁茂、蔽荫度好。为热带良好的庭园和行道树种。');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_tag`
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `letter` (`code`,`hits`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='关键词库表';

-- ----------------------------
--  Records of `fn_1_tag`
-- ----------------------------
BEGIN;
INSERT INTO `fn_1_tag` VALUES ('1', '0', '标签测试', 'test', null, '18', '', '', '1', '0', '0'), ('2', '0', '中国', 'zhongguo', '', '0', '', '', '', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_1_weixin`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin`;
CREATE TABLE `fn_1_weixin` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信属性参数表';

-- ----------------------------
--  Table structure for `fn_1_weixin_follow`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_follow`;
CREATE TABLE `fn_1_weixin_follow` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `uid` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信粉丝同步表';

-- ----------------------------
--  Table structure for `fn_1_weixin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `fn_1_weixin_menu`;
CREATE TABLE `fn_1_weixin_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `value` text NOT NULL,
  `displayorder` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信菜单表';

-- ----------------------------
--  Table structure for `fn_1_weixin_user`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='微信粉丝表';

-- ----------------------------
--  Table structure for `fn_admin`
-- ----------------------------
DROP TABLE IF EXISTS `fn_admin`;
CREATE TABLE `fn_admin` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` text COMMENT '定制权限',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
--  Records of `fn_admin`
-- ----------------------------
BEGIN;
INSERT INTO `fn_admin` VALUES ('1', '网站创始人', '', 'blue');
COMMIT;

-- ----------------------------
--  Table structure for `fn_attachment`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `author` (`author`) USING BTREE,
  KEY `relatedtid` (`related`) USING BTREE,
  KEY `fileext` (`fileext`) USING BTREE,
  KEY `filemd5` (`filemd5`) USING BTREE,
  KEY `siteid` (`siteid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
--  Records of `fn_attachment`
-- ----------------------------
BEGIN;
INSERT INTO `fn_attachment` VALUES ('1', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9'), ('2', '1', 'admin', '1', '', '1', '0', '618240', 'jpg', '511873f8639cf1209fa0acc87c4faf2a'), ('3', '1', 'admin', '1', '', '1', '0', '114883', 'jpg', 'bf314a4f15b1b97e03e4cc86bb478fd2'), ('4', '1', 'admin', '1', '', '1', '0', '294154', 'jpg', '0beec4bdae96c072d939e73467c0037e'), ('5', '1', 'admin', '1', '', '1', '0', '170271', 'jpg', 'beacb9da7cf1660561a745460b28f756'), ('6', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445'), ('7', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8'), ('8', '1', 'admin', '1', '', '1', '0', '131666', 'jpg', 'fb721afdbea04392fa3188747bb06b21'), ('9', '1', 'admin', '1', '', '1', '0', '138875', 'jpg', '2f0b9e7386a6a677f1f4b71211527ce9'), ('10', '1', 'admin', '1', '', '1', '0', '1368105', 'jpg', '4a50808bf38781498c86b21376ff1ed8'), ('11', '1', 'admin', '1', '', '1', '0', '137646', 'jpg', '57c604405bee23ba05466cbb6cac7445'), ('12', '1', 'admin', '1', '', '1', '0', '745964', 'jpg', 'b4be6888ffd5a425ff5f36bc11638c8f'), ('13', '1', 'admin', '1', '', '1', '0', '745964', 'jpg', 'b4be6888ffd5a425ff5f36bc11638c8f'), ('14', '1', 'admin', '1', '', '1', '0', '1165609', 'jpg', 'a4cf850f9193ed0dd9a89c75ea178345'), ('15', '1', 'admin', '1', '', '1', '0', '165151', 'jpg', '4794e00367cadea095f4b1ff0d652ab1'), ('16', '1', 'admin', '1', '', '1', '0', '790098', 'jpg', 'f9acdd9ed12e8aceda0392e26d2ca350'), ('17', '1', 'admin', '1', '', '1', '0', '833495', 'jpg', 'e8c603579c48e1a2b09d76c3ac1b8396'), ('18', '1', 'admin', '1', '', '1', '0', '2177618', 'jpg', '6e526d2ed1e01308df4858e0e372913a'), ('19', '1', 'admin', '1', '', '1', '0', '966451', 'jpg', 'bd3f98ed41619c66cae3391cbdc53773'), ('20', '1', 'admin', '1', '', '1', '0', '228782', 'jpg', 'ec116650681f4ce7dc63d68d3e45e3e0'), ('21', '1', 'admin', '1', '', '1', '0', '279593', 'jpg', 'e7aacf4c51dc39aa14a2c207b6b1f1a6'), ('22', '1', 'admin', '1', '', '1', '0', '291707', 'jpg', '284998c9131107b2bad824b95a9d3acc'), ('23', '1', 'admin', '1', '', '1', '0', '520980', 'jpg', 'b852b78e14286d989e9f68aa15d3f254'), ('24', '1', 'admin', '1', '', '1', '0', '41359', 'jpg', 'a4e3b873fc2854b124ee6e402bbcbff0'), ('25', '1', 'admin', '1', '', '1', '0', '275886', 'jpg', '016e4f71fa59cad381c7410082b76c1d'), ('26', '1', 'admin', '1', '', '1', '0', '325386', 'jpg', 'bd360506f953bff573c0db8ab5aab745'), ('27', '1', 'admin', '1', '', '1', '0', '233185', 'jpg', 'e0bb2ca71e9c55303e62bf468ac74365'), ('28', '1', 'admin', '1', '', '1', '0', '560916', 'jpg', 'b610153f80f1c20afb873b8042d0a62c'), ('29', '1', 'admin', '1', '', '1', '0', '65884', 'jpg', '2ba2b1ce4ca21dfce367af9a40689545'), ('30', '1', 'admin', '1', '', '1', '0', '943647', 'jpg', '5a6d9b34a86d37eac2916259e7001d31'), ('31', '1', 'admin', '1', '', '1', '0', '212091', 'jpg', '0de80787368e737a08abd86e774d44ac'), ('32', '1', 'admin', '1', '', '1', '0', '69888', 'jpg', 'e60fd94a7c811a644215f1f5be5a2413'), ('33', '1', 'admin', '1', '', '1', '0', '297492', 'jpg', 'dc988d9aac24eada428cc1ab61141c0f'), ('34', '1', 'admin', '1', '', '1', '0', '50821', 'jpg', '8079d6410821aab68e456fbf19a15748'), ('35', '1', 'admin', '1', '', '1', '0', '300012', 'jpg', '78caf9668b995892c7159440979d2fe4'), ('36', '1', 'admin', '1', '', '1', '0', '52541', 'jpg', 'c676f051fa0311c66795689ef4285efa'), ('37', '1', 'admin', '1', '', '1', '0', '454205', 'jpg', '671d6568acad540c169c04cbf0298dd9'), ('38', '1', 'admin', '1', '', '1', '0', '167895', 'jpg', 'f726d4583a41331823a511180c9bdc0d'), ('39', '1', 'admin', '1', '', '1', '0', '106220', 'jpg', 'e72e078a30a0e015f8a5b6d9d7d666c9'), ('40', '1', 'admin', '1', '', '1', '0', '163287', 'jpg', 'e7d6ec49b1c64f93c30f3cca68aadf06'), ('41', '1', 'admin', '1', '', '1', '0', '140319', 'jpg', '029c0f9b0908ce59018f926d61d7d218'), ('42', '1', 'admin', '1', '', '1', '0', '140380', 'jpg', '53564fff9aca155f59f8276d39b7688e'), ('43', '1', 'admin', '1', '', '1', '0', '130171', 'jpg', '3201859ec613bae0467d5b326fb7bf0a'), ('44', '1', 'admin', '1', '', '1', '0', '62536', 'jpg', '63f4c612e8a25bcfa5f0fa072e0bc429'), ('45', '1', 'admin', '1', '', '1', '0', '51118', 'jpg', '9c85c8d627c0c43370d5aa95ef5b2ddb'), ('46', '1', 'admin', '1', '', '1', '0', '107090', 'jpg', 'f7bd3152a851ba28bd3a26735a311d34'), ('47', '1', 'admin', '1', '', '1', '0', '1003653', 'jpg', '8c489640c3ec93be94546915c38ddce1'), ('48', '1', 'admin', '1', '', '1', '0', '141199', 'jpg', 'ec931ed7c6936fc7dfa506b332b97663'), ('49', '1', 'admin', '1', '', '1', '0', '374088', 'jpg', 'e5c950cc2ef1a9519cad2616a953fc0e'), ('50', '1', 'admin', '1', '', '1', '0', '468531', 'jpg', '7dd2e32a3357559d76f6f77eb08ad729'), ('51', '1', 'admin', '1', '', '1', '0', '2292193', 'jpg', '1a71b455c5a85315de1d5deed17dd563'), ('52', '1', 'admin', '1', '', '1', '0', '2002033', 'jpg', '58eb434fdfa9a45b530fa9eef02d7c60'), ('53', '1', 'admin', '1', '', '1', '0', '362619', 'jpg', 'aaa33bf47c340ed9a980c68d29492c9a'), ('54', '1', 'admin', '1', '', '1', '0', '93317', 'jpg', '7e1baa6d3cd16767d82b697b577f4008'), ('55', '1', 'admin', '1', '', '1', '0', '40008', 'jpg', '448b619ae2ef981e1d41afd782046f8b'), ('56', '1', 'admin', '1', '', '1', '0', '698255', 'jpg', '2dc755edc63686cf7978bdaa5ca56437'), ('57', '1', 'admin', '1', '', '1', '0', '123126', 'jpg', 'e59e9bdeddf99977495d144570c3cec6'), ('58', '1', 'admin', '1', '', '1', '0', '117033', 'jpg', 'c938cfdc6eaff488b63343342e415a80'), ('59', '1', 'admin', '1', '', '1', '0', '215603', 'jpg', 'de3e8aba6248ba012e69d4ec7c7f2c1b'), ('60', '1', 'admin', '1', '', '1', '0', '623340', 'jpg', 'a561697aec1082dfe2bd3750135b91a1'), ('61', '1', 'admin', '1', '', '1', '0', '5551964', 'jpg', 'a58da992705cd9169ecccc88ab13688a'), ('62', '1', 'admin', '1', '', '1', '0', '451738', 'jpg', '1a42b2f3d4a8d5f4174e87b38c2863f8'), ('63', '1', 'admin', '1', '', '1', '0', '1095793', 'jpg', '404acfefcf969ff018750216016f4aa1'), ('64', '1', 'admin', '1', '', '1', '0', '144077', 'jpg', '3b5d9be374e7c179e7100c5f7777d66b'), ('65', '1', 'admin', '1', '', '1', '0', '215347', 'jpg', '34e9c0a7350f68415d91a8f344d3d696'), ('66', '1', 'admin', '1', '', '1', '0', '3299000', 'jpg', 'ddc3e852091d758bc8137b71bf1a69ae'), ('67', '1', 'admin', '1', '', '1', '0', '203459', 'jpg', '4c914a860f4468fe291bac5ce025b61e'), ('68', '1', 'admin', '1', '', '1', '0', '246630', 'jpg', '0bac2f36189d07cff45a29a80b4a572b'), ('69', '1', 'admin', '1', '', '1', '0', '68813', 'jpg', 'b724cf88ec754942186b109e6c3bb2b3'), ('70', '1', 'admin', '1', '', '1', '0', '192993', 'jpg', 'c9705babeb13e791727da1f083bf3143'), ('71', '1', 'admin', '1', '', '1', '0', '39434', 'jpg', 'e1765fe292df696802be48edffc55888'), ('72', '1', 'admin', '1', '', '1', '0', '37274', 'jpg', '43a52ea4eaf9aa5a848cc71600fa6b5a'), ('73', '1', 'admin', '1', '', '1', '0', '96256', 'jpg', '3fa31315394fe7a9d1f2c4816a303c6e'), ('74', '1', 'admin', '1', '', '1', '0', '134728', 'jpg', '6a7e70c1f9b1415a5b8bda6a2bffc6f1'), ('75', '1', 'admin', '1', '', '1', '0', '55951', 'jpg', '552b1cf3f56896a1430b114fe1e3ceb1'), ('76', '1', 'admin', '1', '', '1', '0', '134728', 'jpg', '6a7e70c1f9b1415a5b8bda6a2bffc6f1'), ('77', '1', 'admin', '1', '', '1', '0', '36311', 'jpg', 'e6add33f3c150d7683208821d08c6cff'), ('78', '1', 'admin', '1', '', '1', '0', '86589', 'jpg', '311d6898da8e4df557dfa7d868211aaa'), ('79', '1', 'admin', '1', '', '1', '0', '56791', 'jpg', 'c4d247952a29b25202a552e86fd2ac7a'), ('80', '1', 'admin', '1', '', '1', '0', '94710', 'jpg', '43f4ce0d7cd5011d61a99179a25a444f'), ('81', '1', 'admin', '1', '', '1', '0', '115620', 'jpg', 'b16354697cba91b152f1effee0391d91'), ('82', '1', 'admin', '1', '', '1', '0', '23900', 'jpg', '3f1fc791b3856b861b109d60306ad359'), ('83', '1', 'admin', '1', '', '1', '0', '156808', 'jpg', 'c8ceabb662bf5f5caeb59ad2466bd4be'), ('84', '1', 'admin', '1', '', '1', '0', '270561', 'jpg', '8f912c7f57cfc1d4de487eca20be17f4'), ('85', '1', 'admin', '1', '', '1', '0', '48851', 'jpg', 'da5090b94f8387f38807f5ed9024c2b3'), ('86', '1', 'admin', '1', '', '1', '0', '112659', 'jpg', 'f29c1872c0314fca311cb58062bfcf91');
COMMIT;

-- ----------------------------
--  Table structure for `fn_attachment_0`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表0';

-- ----------------------------
--  Table structure for `fn_attachment_1`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表1';

-- ----------------------------
--  Records of `fn_attachment_1`
-- ----------------------------
BEGIN;
INSERT INTO `fn_attachment_1` VALUES ('1', '1', 'admin', '', '1', 'jpg', '138875', '201708/a4061921a4.jpg', '0', '', '1502076294'), ('2', '1', 'admin', '', '2', 'jpg', '618240', '201708/b50a7dd636.jpg', '0', '', '1502076376'), ('3', '1', 'admin', '', '3', 'jpg', '114883', '201708/dd1c800216.jpg', '0', '', '1502093524'), ('4', '1', 'admin', '', '8', 'jpg', '294154', '201708/2060b8441d.jpg', '0', '', '1502093558'), ('5', '1', 'admin', '', '4', 'jpg', '170271', '201708/6c022f3b3e.jpg', '0', '', '1502093580'), ('6', '1', 'admin', '', '6', 'jpg', '137646', '201708/8c12027570.jpg', '0', '', '1502093603'), ('7', '1', 'admin', '', '5', 'jpg', '1368105', '201708/36c896481d.jpg', '0', '', '1502093622'), ('8', '1', 'admin', '', '7', 'jpg', '131666', '201708/ba4eb73bf4.jpg', '0', '', '1502093641'), ('9', '1', 'admin', '', '1', 'jpg', '138875', '201708/5fa6872ac8.jpg', '0', '', '1502093665'), ('10', '1', 'admin', '', '5', 'jpg', '1368105', '201708/79c128c47e.jpg', '0', '', '1502093687'), ('11', '1', 'admin', '', '6', 'jpg', '137646', '201708/10ea3ca6b4.jpg', '0', '', '1502093701'), ('12', '1', 'admin', '', '菖蒲', 'jpg', '745964', '201708/80272c6242.jpg', '0', '', '1502297482'), ('13', '1', 'admin', '', '菖蒲', 'jpg', '745964', '201708/07154894ea.jpg', '0', '', '1502297517'), ('14', '1', 'admin', '', '千屈菜', 'jpg', '1165609', '201708/dcdebfa93f.jpg', '0', '', '1502297713'), ('15', '1', 'admin', '', '荷花', 'jpg', '165151', '201708/94aa5f6900.jpg', '0', '', '1502297800'), ('16', '1', 'admin', '', '芦苇', 'jpg', '790098', '201708/9bdb52c34d.jpg', '0', '', '1502298018'), ('17', '1', 'admin', '', '狐尾藻', 'jpg', '833495', '201708/fc85d5aaa3.jpg', '0', '', '1502298068'), ('18', '1', 'admin', '', '风车草', 'jpg', '2177618', '201708/b2484d2d08.jpg', '0', '', '1502298131'), ('19', '1', 'admin', '', '水葱', 'jpg', '966451', '201708/3c8ab20563.jpg', '0', '', '1502298169'), ('20', '1', 'admin', '', '王莲', 'jpg', '228782', '201708/2463f89cd2.jpg', '0', '', '1502358156'), ('21', '1', 'admin', '', '铜钱草', 'jpg', '279593', '201708/f4c5b53f76.jpg', '0', '', '1502358195'), ('22', '1', 'admin', '', '水葫芦', 'jpg', '291707', '201708/9d3417ba49.jpg', '0', '', '1502358231'), ('23', '1', 'admin', '', '荸荠', 'jpg', '520980', '201711/4dc0a4120e.jpg', '0', '', '1511144431'), ('24', '1', 'admin', '', '慈姑', 'jpg', '41359', '201711/d7228d4be8.jpg', '0', '', '1511144542'), ('25', '1', 'admin', '', '大薸', 'jpg', '275886', '201711/28f7ae924d.jpg', '0', '', '1511144579'), ('26', '1', 'admin', '', '灯芯草', 'jpg', '325386', '201711/76184401ea.jpg', '0', '', '1511144610'), ('27', '1', 'admin', '', '黑藻', 'jpg', '233185', '201711/97d5987527.jpg', '0', '', '1511144636'), ('28', '1', 'admin', '', '红蓼', 'jpg', '560916', '201711/f5b029cae1.jpg', '0', '', '1511144661'), ('29', '1', 'admin', '', '茭白', 'jpg', '65884', '201711/7c5823e839.jpg', '0', '', '1511144684'), ('30', '1', 'admin', '', '金鱼藻', 'jpg', '943647', '201711/2df994a01b.jpg', '0', '', '1511144712'), ('31', '1', 'admin', '', '菱', 'jpg', '212091', '201711/2d97c098f8.jpg', '0', '', '1511144733'), ('32', '1', 'admin', '', '马蹄莲', 'jpg', '69888', '201711/fd1d75c524.jpg', '0', '', '1511144761'), ('33', '1', 'admin', '', '芡实', 'jpg', '297492', '201711/7e4d57b53a.jpg', '0', '', '1511144782'), ('34', '1', 'admin', '', '石龙尾', 'jpg', '50821', '201711/7534311413.jpg', '0', '', '1511144808'), ('35', '1', 'admin', '', '水蓼', 'jpg', '300012', '201711/aae6fe5381.jpg', '0', '', '1511144834'), ('36', '1', 'admin', '', '香根草', 'jpg', '52541', '201711/faf97ce2c8.jpg', '0', '', '1511144860'), ('37', '1', 'admin', '', '薏米', 'jpg', '454205', '201711/31cb858359.jpg', '0', '', '1511144886'), ('38', '1', 'admin', '', '芋', 'jpg', '167895', '201711/b49aefe53c.jpg', '0', '', '1511144907'), ('39', '1', 'admin', '', '水仙', 'jpg', '106220', '201711/684c25121f.jpg', '0', '', '1511145417'), ('40', '1', 'admin', '', '水鳖', 'jpg', '163287', '201711/afcc2547b3.jpg', '0', '', '1511145436'), ('41', '1', 'admin', '', '铜钱草', 'jpg', '140319', '201711/07e44539c8.jpg', '0', '', '1511145495'), ('42', '1', 'admin', '', '窄叶泽泻', 'jpg', '140380', '201711/f7fcb78c6a.jpg', '0', '', '1511145514'), ('43', '1', 'admin', '', '白兰', 'jpg', '130171', '201809/527f7f6f2f.jpg', '0', '', '1537972191'), ('44', '1', 'admin', '', '翠芦莉', 'jpg', '62536', '201809/55508081f7.jpg', '0', '', '1537972220'), ('45', '1', 'admin', '', '鹅掌藤', 'jpg', '51118', '201809/97fa2e8635.jpg', '0', '', '1537972266'), ('46', '1', 'admin', '', '二乔玉兰', 'jpg', '107090', '201809/aaf7394321.jpg', '0', '', '1537972320'), ('47', '1', 'admin', '', '凤凰木', 'jpg', '1003653', '201809/b323614c0f.jpg', '0', '', '1537972431'), ('48', '1', 'admin', '', '宫粉羊蹄甲', 'jpg', '141199', '201809/614bbc7e36.jpg', '0', '', '1537972458'), ('49', '1', 'admin', '', '福建茶', 'jpg', '374088', '201809/41dfec534f.jpg', '0', '', '1537972488'), ('50', '1', 'admin', '', '桂花', 'jpg', '468531', '201809/d8ca8be54b.jpg', '0', '', '1537972511'), ('51', '1', 'admin', '', '海南蒲桃', 'jpg', '2292193', '201809/4a27930699.jpg', '0', '', '1537972541'), ('52', '1', 'admin', '', '红继木', 'jpg', '2002033', '201809/ef7c1d7c99.jpg', '0', '', '1537972578'), ('53', '1', 'admin', '', '黄花风铃木', 'jpg', '362619', '201809/366d273617.jpg', '0', '', '1537972607'), ('54', '1', 'admin', '', '灰莉', 'jpg', '93317', '201809/fc1dfa2025.jpg', '0', '', '1537972632'), ('55', '1', 'admin', '', '鸡蛋花', 'jpg', '40008', '201809/e5aaed8de6.jpg', '0', '', '1537972664'), ('56', '1', 'admin', '', '蓝花楹', 'jpg', '698255', '201809/2a1d67a37d.jpg', '0', '', '1537972901'), ('57', '1', 'admin', '', '勒杜鹃', 'jpg', '123126', '201809/265ff8c9b4.jpg', '0', '', '1537972929'), ('58', '1', 'admin', '', '龙船花', 'jpg', '117033', '201809/d85be48326.jpg', '0', '', '1537972962'), ('59', '1', 'admin', '', '蔓马缨丹', 'jpg', '215603', '201809/5d88b29ac1.jpg', '0', '', '1537973005'), ('60', '1', 'admin', '', '芒果', 'jpg', '623340', '201809/6f7ed3028b.jpg', '0', '', '1537973064'), ('61', '1', 'admin', '', '木棉', 'jpg', '5551964', '201809/12231837f6.jpg', '0', '', '1537973093'), ('62', '1', 'admin', '', '四季米仔兰', 'jpg', '451738', '201809/97a002532c.jpg', '0', '', '1537973117'), ('63', '1', 'admin', '', '橡胶榕', 'jpg', '1095793', '201809/71a9ce2f18.jpg', '0', '', '1537973207'), ('64', '1', 'admin', '', '小叶榕', 'jpg', '144077', '201809/d6c228d1ff.jpg', '0', '', '1537973231'), ('65', '1', 'admin', '', '杨桃', 'jpg', '215347', '201809/7e2461743f.jpg', '0', '', '1537973253'), ('66', '1', 'admin', '', '棕竹', 'jpg', '3299000', '201809/7beae9bad9.jpg', '0', '', '1537973276'), ('67', '1', 'admin', '', '2854437738824041070', 'jpg', '203459', '201809/57036d668d.jpg', '0', '', '1538010231'), ('68', '1', 'admin', '', '22735524_22735524_1372511588528', 'jpg', '246630', '201809/16ba405ae0.jpg', '0', '', '1538010262'), ('69', '1', 'admin', '', 'faf2b2119313b07e1fb0efd00bd7912396dd8cdd', 'jpg', '68813', '201809/bbdbf65c41.jpg', '0', '', '1538010296'), ('70', '1', 'admin', '', '20140727232925_3wXsw', 'jpg', '192993', '201809/356644fc04.jpg', '0', '', '1538018901'), ('71', '1', 'admin', '', '火焰木', 'jpg', '39434', '201809/59439ddd74.jpg', '0', '', '1538019121'), ('72', '1', 'admin', '', '串钱柳', 'jpg', '37274', '201809/c25f669392.jpg', '0', '', '1538019140'), ('73', '1', 'admin', '', '无忧树', 'jpg', '96256', '201809/67d8a85ed5.jpg', '0', '', '1538019281'), ('74', '1', 'admin', '', '腊肠树', 'jpg', '134728', '201809/19cf5cde1d.jpg', '0', '', '1538019413'), ('75', '1', 'admin', '', '金合欢', 'jpg', '55951', '201809/7f24fe15ab.jpg', '0', '', '1538019814'), ('76', '1', 'admin', '', '腊肠树', 'jpg', '134728', '201809/1185e0e668.jpg', '0', '', '1538019833'), ('77', '1', 'admin', '', '红花荷', 'jpg', '36311', '201809/a6baf5da0d.jpg', '0', '', '1538019849'), ('78', '1', 'admin', '', '红千层', 'jpg', '86589', '201809/0c180b9599.jpg', '0', '', '1538019866'), ('79', '1', 'admin', '', '大叶紫薇', 'jpg', '56791', '201809/e7d2b6e453.jpg', '0', '', '1538019883'), ('80', '1', 'admin', '', 'guibeizhu', 'jpg', '94710', '201809/fbea188c0c.jpg', '0', '', '1538019947'), ('81', '1', 'admin', '', 'shuixian', 'jpg', '115620', '201809/f7391d0176.jpg', '0', '', '1538019993'), ('82', '1', 'admin', '', '微信图片_20190304173402', 'jpg', '23900', '201903/f08a402a7b.jpg', '0', '', '1552018760'), ('83', '1', 'admin', '', '316971', 'jpg', '156808', 'ueditor/image/20190410/1554825817705069.jpg', '0', '', '1554825816'), ('84', '1', 'admin', '', '3', 'jpg', '270561', '201904/b374f9055e.jpg', '0', '', '1555234854'), ('85', '1', 'admin', '', '1', 'jpg', '48851', 'ueditor/image/20190414/1555236392790894.jpg', '0', '', '1555236392'), ('86', '1', 'admin', '', '2', 'jpg', '112659', 'ueditor/image/20190414/1555236392256381.jpg', '0', '', '1555236392');
COMMIT;

-- ----------------------------
--  Table structure for `fn_attachment_2`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表2';

-- ----------------------------
--  Table structure for `fn_attachment_3`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表3';

-- ----------------------------
--  Table structure for `fn_attachment_4`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表4';

-- ----------------------------
--  Table structure for `fn_attachment_5`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表5';

-- ----------------------------
--  Table structure for `fn_attachment_6`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表6';

-- ----------------------------
--  Table structure for `fn_attachment_7`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表7';

-- ----------------------------
--  Table structure for `fn_attachment_8`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表8';

-- ----------------------------
--  Table structure for `fn_attachment_9`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表9';

-- ----------------------------
--  Table structure for `fn_field`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `list` (`relatedid`,`disabled`,`issystem`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字段表';

-- ----------------------------
--  Records of `fn_field`
-- ----------------------------
BEGIN;
INSERT INTO `fn_field` VALUES ('8', '主题', 'title', 'Text', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1,\"formattr\":\"onblur=\\\"check_title();get_keywords(\'keywords\');\\\"\"}}', '1'), ('9', '缩略图', 'thumb', 'File', '4', 'module', '1', '1', '1', '1', '1', '0', '{\"option\":{\"ext\":\"jpg,gif,png\",\"size\":10,\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"}}', '10'), ('10', '关键字', 'keywords', 'Text', '4', 'module', '1', '1', '1', '1', '1', '1', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"formattr\":\" data-role=\\\"tagsinput\\\"\"}}', '0'), ('11', '形态特征', 'description', 'Textarea', '4', 'module', '1', '1', '1', '1', '0', '0', '{\"option\":{\"width\":\"500\",\"is_mb_auto\":\"0\",\"height\":\"60\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"dr_clearhtml\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '11'), ('12', '生长习性', 'content', 'Ueditor', '4', 'module', '1', '0', '1', '1', '0', '0', '{\"option\":{\"width\":\"90%\",\"height\":\"400\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '12'), ('25', '内容', 'neirong', 'Ueditor', '1', 'form-1', '1', '1', '0', '1', '0', '0', '{\"option\":{\"width\":\"100%\",\"height\":\"200\",\"autofloat\":\"0\",\"autoheight\":\"0\",\"autodown\":\"0\",\"page\":\"0\",\"mode\":\"1\",\"tool\":\"\'bold\', \'italic\', \'underline\'\",\"mode2\":\"1\",\"tool2\":\"\'bold\', \'italic\', \'underline\'\",\"mode3\":\"1\",\"tool3\":\"\'bold\', \'italic\', \'underline\'\",\"value\":\"\"},\"validate\":{\"required\":\"1\",\"pattern\":\"\",\"errortips\":\"\",\"xss\":\"1\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '0'), ('23', '主题', 'title', 'Text', '1', 'form-1', '1', '1', '1', '1', '1', '0', '{\"option\":{\"width\":400,\"fieldtype\":\"VARCHAR\",\"fieldlength\":\"255\"},\"validate\":{\"xss\":1,\"required\":1}}', '0'), ('68', '季相', 'jixiang', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u5e38\\u7eff|value12\\n\\u843d\\u53f6|value13\\n\\u534a\\u843d\\u53f6|value49\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('67', '观赏特性', 'gstx', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u89c2\\u82b1|value9\\n\\u89c2\\u53f6|value10\\n\\u89c2\\u679c|value11\\n\\u89c2\\u5f62|value45\\n\\u5176\\u4ed6|value46\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('69', '气候类型', 'qhlx', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u70ed\\u5e26|value17\\n\\u4e9a\\u70ed\\u5e26|value18\\n\\u6e29\\u5e26|value19\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('65', '生活型', 'shx', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u4e54\\u6728|value1\\n\\u704c\\u6728|value2\\n\\u85e4\\u672c|value41\\n\\u5730\\u88ab\\u8349\\u672c|value3\\n\\u6c34\\u751f\\u8349\\u672c|value42\\n\\u8349\\u576a\\u8349\\u672c|value43\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('64', '生活环境', 'shhj', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u65f1\\u751f|value50\\n\\u4e2d\\u751f|value44\\n\\u6e7f\\u751f|value6\\n\\u6c34\\u751f|value5\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('66', '花色', 'hs', 'Checkbox', '4', 'module', '1', '1', '0', '0', '0', '0', '{\"option\":{\"options\":\"\\u7ea2|value22\\n\\u9ec4|value23\\n\\u84dd|value24\\n\\u7c89|value47\\n\\u7d2b|value48\\n\\u767d|value25\\n\\u5176\\u4ed6|value26\",\"value\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '1'), ('63', '园林价值', 'money', 'Text', '4', 'module', '1', '0', '0', '0', '0', '0', '{\"option\":{\"width\":\"200\",\"is_mb_auto\":\"0\",\"value\":\"\",\"fieldtype\":\"\",\"fieldlength\":\"\"},\"validate\":{\"required\":\"0\",\"pattern\":\"\",\"errortips\":\"\",\"check\":\"\",\"filter\":\"\",\"tips\":\"\",\"formattr\":\"\"},\"is_right\":\"0\"}', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_linkage`
-- ----------------------------
DROP TABLE IF EXISTS `fn_linkage`;
CREATE TABLE `fn_linkage` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `code` (`code`) USING BTREE,
  KEY `module` (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='联动菜单表';

-- ----------------------------
--  Records of `fn_linkage`
-- ----------------------------
BEGIN;
INSERT INTO `fn_linkage` VALUES ('1', '中国地区', '0', 'address');
COMMIT;

-- ----------------------------
--  Table structure for `fn_linkage_data_1`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cname` (`cname`) USING BTREE,
  KEY `hidden` (`hidden`) USING BTREE,
  KEY `list` (`site`,`displayorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='联动菜单数据表';

-- ----------------------------
--  Records of `fn_linkage_data_1`
-- ----------------------------
BEGIN;
INSERT INTO `fn_linkage_data_1` VALUES ('1', '1', '0', '0', '北京', 'beijing', '0', '0', '1', '0'), ('2', '1', '0', '0', '天津', 'tianjin', '0', '0', '2', '0'), ('3', '1', '0', '0', '上海', 'shanghai', '0', '0', '3', '0'), ('4', '1', '0', '0', '重庆', 'chongqing', '0', '0', '4', '0'), ('5', '1', '0', '0', '黑龙江', 'heilongjiang', '0', '0', '5', '0'), ('6', '1', '0', '0', '吉林', 'jilin', '0', '0', '6', '0'), ('7', '1', '0', '0', '辽宁', 'liaoning', '0', '0', '7', '0'), ('8', '1', '0', '0', '河北', 'hebei', '0', '0', '8', '0'), ('9', '1', '0', '0', '河南', 'henan', '0', '0', '9', '0'), ('10', '1', '0', '0', '山东', 'shandong', '0', '0', '10', '0'), ('11', '1', '0', '0', '江苏', 'jiangsu', '0', '0', '11', '0'), ('12', '1', '0', '0', '山西', 'shanxi', '0', '0', '12', '0'), ('13', '1', '0', '0', '陕西', 'shanxi1', '0', '0', '13', '0'), ('14', '1', '0', '0', '甘肃', 'gansu', '0', '0', '14', '0'), ('15', '1', '0', '0', '四川', 'sichuan', '0', '0', '15', '0'), ('16', '1', '0', '0', '青海', 'qinghai', '0', '0', '16', '0'), ('17', '1', '0', '0', '湖南', 'hunan', '0', '0', '17', '0'), ('18', '1', '0', '0', '湖北', 'hubei', '0', '0', '18', '0'), ('19', '1', '0', '0', '江西', 'jiangxi', '0', '0', '19', '0'), ('20', '1', '0', '0', '安徽', 'anhui', '0', '0', '20', '0'), ('21', '1', '0', '0', '浙江', 'zhejiang', '0', '0', '21', '0'), ('22', '1', '0', '0', '福建', 'fujian', '0', '0', '22', '0'), ('23', '1', '0', '0', '广东', 'guangdong', '0', '0', '23', '0'), ('24', '1', '0', '0', '广西', 'guangxi', '0', '0', '24', '0'), ('25', '1', '0', '0', '贵州', 'guizhou', '0', '0', '25', '0'), ('26', '1', '0', '0', '云南', 'yunnan', '0', '0', '26', '0'), ('27', '1', '0', '0', '海南', 'hainan', '0', '0', '27', '0'), ('28', '1', '0', '0', '内蒙古', 'neimenggu', '0', '0', '28', '0'), ('29', '1', '0', '0', '新疆', 'xinjiang', '0', '0', '29', '0'), ('30', '1', '0', '0', '宁夏', 'ningxia', '0', '0', '30', '0'), ('31', '1', '0', '0', '西藏', 'xicang', '0', '0', '31', '0'), ('32', '1', '0', '0', '香港', 'xianggang', '0', '0', '32', '0'), ('33', '1', '0', '0', '澳门', 'aomen', '0', '0', '33', '0'), ('34', '1', '0', '0', '台湾', 'taiwan', '0', '0', '34', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_mail_smtp`
-- ----------------------------
DROP TABLE IF EXISTS `fn_mail_smtp`;
CREATE TABLE `fn_mail_smtp` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='邮件账户表';

-- ----------------------------
--  Table structure for `fn_member`
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
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `adminid` (`adminid`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
--  Records of `fn_member`
-- ----------------------------
BEGIN;
INSERT INTO `fn_member` VALUES ('1', '', 'admin', 'ac7cd59472be180b81c7551b92925f03', 'b3967a0e93', '1212', '12', '', '9999.00', '0.00', '0.00', '10000', '10000', '1', '3', '4', '0', '', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_member_data`
-- ----------------------------
DROP TABLE IF EXISTS `fn_member_data`;
CREATE TABLE `fn_member_data` (
  `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='会员表';

-- ----------------------------
--  Records of `fn_member_data`
-- ----------------------------
BEGIN;
INSERT INTO `fn_member_data` VALUES ('1', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_member_oauth`
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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员OAuth2授权表';

-- ----------------------------
--  Table structure for `fn_module`
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dirname` (`dirname`) USING BTREE,
  KEY `displayorder` (`displayorder`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块表';

-- ----------------------------
--  Records of `fn_module`
-- ----------------------------
BEGIN;
INSERT INTO `fn_module` VALUES ('4', '{\"name\":\"\\u6587\\u7ae0\",\"urlrule\":\"4\",\"search_title\":\"[\\u7b2c{page}\\u9875{join}][{keyword}{join}][{param}{join}]{modulename}{join}{SITE_NAME}\",\"search_keywords\":\"\",\"search_description\":\"\",\"use\":1}', 'news', '0', '0', '0', '', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `fn_site`
-- ----------------------------
DROP TABLE IF EXISTS `fn_site`;
CREATE TABLE `fn_site` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='站点表';

-- ----------------------------
--  Records of `fn_site`
-- ----------------------------
BEGIN;
INSERT INTO `fn_site` VALUES ('1', '植物网', 'hnplants.com', '{\"SITE_CLOSE\":\"0\",\"SITE_CLOSE_MSG\":\"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....\",\"SITE_NAME\":\"\\u690d\\u7269\\u7f51\",\"SITE_TIME_FORMAT\":\"Y-m-d H:i\",\"SITE_LANGUAGE\":\"zh-cn\",\"SITE_THEME\":\"default\",\"SITE_TEMPLATE\":\"default\",\"SITE_TIMEZONE\":\"8\",\"SITE_DOMAINS\":\"\",\"SITE_REWRITE\":\"0\",\"SITE_MOBILE_OPEN\":\"1\",\"SITE_MOBILE\":\"\",\"SITE_SEOJOIN\":\"_\",\"SITE_TITLE\":\"FineCMS\\u516c\\u76ca\\u8f6f\\u4ef6\",\"SITE_KEYWORDS\":\"\\u514d\\u8d39cms,\\u5f00\\u6e90cms\",\"SITE_DESCRIPTION\":\"\\u516c\\u76ca\\u8f6f\\u4ef6\\u4ea7\\u54c1\\u4ecb\\u7ecd\",\"SITE_IMAGE_RATIO\":\"1\",\"SITE_IMAGE_WATERMARK\":\"0\",\"SITE_IMAGE_VRTALIGN\":\"top\",\"SITE_IMAGE_HORALIGN\":\"left\",\"SITE_IMAGE_VRTOFFSET\":\"\",\"SITE_IMAGE_HOROFFSET\":\"\",\"SITE_IMAGE_TYPE\":\"0\",\"SITE_IMAGE_OVERLAY\":\"default.png\",\"SITE_IMAGE_OPACITY\":\"\",\"SITE_IMAGE_FONT\":\"default.ttf\",\"SITE_IMAGE_COLOR\":\"\",\"SITE_IMAGE_SIZE\":\"\",\"SITE_IMAGE_TEXT\":\"\",\"SITE_DOMAIN\":\"hnplants.com\",\"SITE_IMAGE_CONTENT\":0}');
COMMIT;

-- ----------------------------
--  Table structure for `fn_urlrule`
-- ----------------------------
DROP TABLE IF EXISTS `fn_urlrule`;
CREATE TABLE `fn_urlrule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='URL规则表';

-- ----------------------------
--  Records of `fn_urlrule`
-- ----------------------------
BEGIN;
INSERT INTO `fn_urlrule` VALUES ('1', '3', '栏目规则测试', '{\"share_list\":\"{dirname}-list.html\",\"share_list_page\":\"{dirname}-list-{page}.html\",\"share_show\":\"{dirname}-show-{id}.html\",\"share_show_page\":\"{dirname}-show-{id}-{page}.html\",\"share_search\":\"\",\"share_search_page\":\"\",\"tags\":\"\"}'), ('2', '4', '站点URL测试', '{\"share_list\":\"\",\"share_list_page\":\"\",\"share_show\":\"\",\"share_show_page\":\"\",\"share_search\":\"search.html\",\"share_search_page\":\"search\\/{param}.html\",\"tags\":\"tag\\/{tag}.html\"}');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
