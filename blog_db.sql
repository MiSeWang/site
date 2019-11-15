/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2019-11-15 00:47:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `category_id` varchar(32) DEFAULT NULL COMMENT '分类id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重',
  `weight_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '权重期限',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位置',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` longtext COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标识（0：已删除 1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '1', '通天塔', null, null, null, null, null, '0', '2019-08-04 15:32:15', '0', null, null, null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for cms_article_data
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_data`;
CREATE TABLE `cms_article_data` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `content` longtext COMMENT '内容',
  `article_id` varchar(32) DEFAULT NULL COMMENT '文章信息id',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article_data
-- ----------------------------

-- ----------------------------
-- Table structure for cms_article_dict
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_dict`;
CREATE TABLE `cms_article_dict` (
  `id` varchar(32) NOT NULL,
  `value` varchar(100) DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) DEFAULT NULL COMMENT '类型（1.用户自定义分类 2：用户自定义标签）',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` int(1) NOT NULL DEFAULT '1' COMMENT '删除标记(1:正常 0:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章字典';

-- ----------------------------
-- Records of cms_article_dict
-- ----------------------------
INSERT INTO `cms_article_dict` VALUES ('1', null, '测试分类1', '1', '用户自定义分类', null, null, '2019-08-18 21:18:05', null, null, null, '1');

-- ----------------------------
-- Table structure for cms_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '上级id',
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` varchar(11) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0:已删除 1:正常)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', null, 'A类', 'xxx', null, null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for cms_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_comment`;
CREATE TABLE `cms_comment` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `audit_user_id` varchar(64) NOT NULL,
  `audit_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `cms_guestbook`;
CREATE TABLE `cms_guestbook` (
  `id` int(11) NOT NULL,
  `type` char(1) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `workunit` varchar(100) DEFAULT NULL,
  `Ip` varchar(100) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `re_user_id` varchar(64) NOT NULL,
  `re_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `re_content` varchar(100) NOT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link
-- ----------------------------
DROP TABLE IF EXISTS `cms_link`;
CREATE TABLE `cms_link` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `color` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `weight_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` varchar(64) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `update_by` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(255) NOT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_link
-- ----------------------------

-- ----------------------------
-- Table structure for cms_link2
-- ----------------------------
DROP TABLE IF EXISTS `cms_link2`;
CREATE TABLE `cms_link2` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `copyright` longtext NOT NULL,
  `custom_index_view` varchar(255) NOT NULL,
  `create_by` varchar(64) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_by` varchar(64) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(255) NOT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_link2
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` varchar(100) DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) DEFAULT NULL COMMENT '标签名',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` int(1) NOT NULL DEFAULT '1' COMMENT '删除标记(1:正常 0:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL,
  `enname` varchar(255) NOT NULL,
  `create_by` varchar(64) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `remote_addr` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `request_uri` varchar(255) NOT NULL,
  `method` varchar(5) NOT NULL,
  `params` longtext NOT NULL,
  `exception` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `val` varchar(50) NOT NULL COMMENT '权限值，shiro的权限控制表达式',
  `parent_val` varchar(50) DEFAULT NULL COMMENT '父权限',
  `name` varchar(25) NOT NULL COMMENT '权限名称',
  `type` int(3) DEFAULT NULL COMMENT '权限类型：1.菜单 2.按钮 3.接口 4.特殊',
  `leaf` char(1) DEFAULT NULL COMMENT '是否是叶子节点',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '说明',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0表示已删除， 1表示未删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `val` (`val`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO `sys_perm` VALUES ('1', '*', null, '所有权限', '0', '', '2019-04-20 19:59:50', null, '', '0');
INSERT INTO `sys_perm` VALUES ('2', 'a:auth', null, '登录模块', '3', '1', '2019-04-20 19:59:55', null, '', '0');
INSERT INTO `sys_perm` VALUES ('3', 'm:sys', null, '系统', '1', '0', '2019-04-20 15:54:44', null, '', '1');
INSERT INTO `sys_perm` VALUES ('4', 'm:sys:perm', 'm:sys', '权限管理', '1', '1', '2019-04-20 15:54:41', null, '', '1');
INSERT INTO `sys_perm` VALUES ('5', 'm:sys:role', 'm:sys', '角色管理', '1', '1', '2019-04-20 15:54:38', null, '', '1');
INSERT INTO `sys_perm` VALUES ('6', 'm:sys:user', 'm:sys', '用户管理', '1', '1', '2019-04-20 15:54:36', null, '', '1');
INSERT INTO `sys_perm` VALUES ('7', 'm:test:test', 'm:test', '测试菜单', '1', '1', '2019-04-20 21:08:42', null, null, '1');
INSERT INTO `sys_perm` VALUES ('8', 'm:test', null, '测试模块', '1', '0', '2019-04-20 21:08:46', null, null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '角色id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色昵称',
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统数据(1:系统数据；0:正常数据)',
  `useable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用（1:可用, 0:不可用）',
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0:已删除；1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '1', '2019-04-21 19:13:47', null, '具有本系统中最高权限', '1');
INSERT INTO `sys_role` VALUES ('1123848331933184001', '测试角色', '0', '1', '2019-06-03 20:50:40', null, null, '0');
INSERT INTO `sys_role` VALUES ('1123852439469654017', '详细信息', '0', '1', '2019-06-03 20:41:32', null, null, '0');
INSERT INTO `sys_role` VALUES ('1125418569650950145', '详细', '0', '1', '2019-06-03 20:43:59', null, '添加登陆模块权限', '0');
INSERT INTO `sys_role` VALUES ('1130111061799587841', '测试', '0', '1', '2019-06-03 20:43:55', null, '为什么会失效', '0');
INSERT INTO `sys_role` VALUES ('1130123814048124930', '测试权限', '0', '1', '2019-06-03 20:34:45', null, '马黑', '0');
INSERT INTO `sys_role` VALUES ('1132665874263392257', 'dasdas ', '0', '1', '2019-06-03 20:41:46', null, '掉您马黑', '0');
INSERT INTO `sys_role` VALUES ('1132667963609792513', '33', '0', '1', '2019-06-03 20:33:01', null, '99', '0');
INSERT INTO `sys_role` VALUES ('1132668137816014850', '3333', '0', '1', '2019-06-03 20:33:16', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135527912877088770', '1', '0', '1', '2019-06-03 20:47:00', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135527925015404545', '2', '0', '1', '2019-06-03 20:47:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528359440441346', '1', '0', '1', '2019-06-03 20:47:21', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528369498382338', '2', '0', '1', '2019-06-03 20:47:24', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528383893233665', '3', '0', '1', '2019-06-03 20:47:26', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529158576988161', '1', '0', '1', '2019-06-03 20:50:36', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529167993200641', '2', '0', '1', '2019-06-03 20:50:34', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529177833037825', '3', '0', '1', '2019-06-03 20:50:30', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529308930203649', '1', '0', '1', '2019-06-03 20:51:12', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529319319494658', '2', '0', '1', '2019-06-03 20:52:39', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529332820959234', '3', '0', '1', '2019-06-03 20:52:37', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529344443375618', '4', '0', '1', '2019-06-03 20:52:35', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529743430737922', '1', '0', '1', '2019-06-03 20:53:28', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529752444297218', '2', '0', '1', '2019-06-03 20:53:13', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529763240435714', '3', '0', '1', '2019-06-03 20:53:07', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529771981365249', '4', '0', '1', '2019-06-03 20:53:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530133186437122', '1', '0', '1', '2019-06-03 20:54:31', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530142753644545', '2', '0', '1', '2019-06-03 20:54:35', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530154292174850', '3', '0', '1', '2019-06-03 20:54:33', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530163582558209', '4', '0', '1', '2019-06-03 20:54:41', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530173153959937', '5', '0', '1', '2019-06-03 20:54:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530835472310273', '1', '0', '1', '2019-06-03 20:57:17', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530846067122178', '2', '0', '1', '2019-06-03 21:00:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530856129257473', '3', '0', '1', '2019-06-03 21:00:02', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530867424518146', '4', '0', '1', '2019-06-03 21:00:07', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530878468120577', '5', '0', '1', '2019-06-03 21:00:09', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531718968893442', '1', '0', '1', '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531729442070530', '2', '0', '1', '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531738271080450', '3', '0', '1', '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1152897047936131074', '二级管理员', '0', '1', '2019-07-21 19:04:10', null, null, '1');
INSERT INTO `sys_role` VALUES ('1152897161132007426', '三级管理员', '0', '1', '2019-07-21 19:04:38', null, null, '1');
INSERT INTO `sys_role` VALUES ('1152897230841339905', '雷老虎', '0', '1', '2019-07-21 19:05:00', null, '1', '0');
INSERT INTO `sys_role` VALUES ('2', '财务', '0', '1', '2019-04-21 19:16:12', null, '拥有财务相关权限', '1');
INSERT INTO `sys_role` VALUES ('3', '仓管', '0', '1', '2019-07-21 19:04:22', null, '拥有关于仓库相关权限', '1');

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `role_id` varchar(32) NOT NULL COMMENT '用户id',
  `perm_id` varchar(32) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`role_id`,`perm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO `sys_role_perm` VALUES ('1', '1');
INSERT INTO `sys_role_perm` VALUES ('1123848331933184001', '2');
INSERT INTO `sys_role_perm` VALUES ('1123848331933184001', '7');
INSERT INTO `sys_role_perm` VALUES ('1123848331933184001', '8');
INSERT INTO `sys_role_perm` VALUES ('1123852439469654017', '7');
INSERT INTO `sys_role_perm` VALUES ('1123852439469654017', '8');
INSERT INTO `sys_role_perm` VALUES ('1125418569650950145', '2');
INSERT INTO `sys_role_perm` VALUES ('1125418569650950145', '7');
INSERT INTO `sys_role_perm` VALUES ('1125418569650950145', '8');
INSERT INTO `sys_role_perm` VALUES ('1130111061799587841', '2');
INSERT INTO `sys_role_perm` VALUES ('1130111061799587841', '7');
INSERT INTO `sys_role_perm` VALUES ('1130111061799587841', '8');
INSERT INTO `sys_role_perm` VALUES ('1130123814048124930', '2');
INSERT INTO `sys_role_perm` VALUES ('1130123814048124930', '4');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '2');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '3');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '4');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '5');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '6');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '7');
INSERT INTO `sys_role_perm` VALUES ('1132665874263392257', '8');
INSERT INTO `sys_role_perm` VALUES ('1152897047936131074', '2');
INSERT INTO `sys_role_perm` VALUES ('1152897047936131074', '3');
INSERT INTO `sys_role_perm` VALUES ('1152897047936131074', '4');
INSERT INTO `sys_role_perm` VALUES ('1152897047936131074', '5');
INSERT INTO `sys_role_perm` VALUES ('1152897047936131074', '6');
INSERT INTO `sys_role_perm` VALUES ('1152897161132007426', '2');
INSERT INTO `sys_role_perm` VALUES ('1152897161132007426', '3');
INSERT INTO `sys_role_perm` VALUES ('1152897161132007426', '4');
INSERT INTO `sys_role_perm` VALUES ('1152897161132007426', '5');
INSERT INTO `sys_role_perm` VALUES ('1152897161132007426', '6');
INSERT INTO `sys_role_perm` VALUES ('1152897230841339905', '3');
INSERT INTO `sys_role_perm` VALUES ('1152897230841339905', '4');
INSERT INTO `sys_role_perm` VALUES ('1152897230841339905', '5');
INSERT INTO `sys_role_perm` VALUES ('1152897230841339905', '6');
INSERT INTO `sys_role_perm` VALUES ('3', '2');
INSERT INTO `sys_role_perm` VALUES ('3', '3');
INSERT INTO `sys_role_perm` VALUES ('3', '4');
INSERT INTO `sys_role_perm` VALUES ('3', '5');
INSERT INTO `sys_role_perm` VALUES ('3', '6');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别: 0为男性；1为女性',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `avatar` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '登陆ip',
  `login_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `login_flag` tinyint(1) NOT NULL COMMENT '是否可登陆(1:表示可登陆,0表示不可登陆)',
  `create_date` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_date` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0表示已删除，1表示未删除 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '肯德基', '1', 'admin', '123456', 'xxxxxxxx@xxx.com', '13xxxxxxxxxx', '0', null, '0.0.0.0', '2019-07-28 18:12:48', '1', '2019-03-04 22:49:35', '2019-07-28 18:12:49', '1', '1');
INSERT INTO `sys_user` VALUES ('10', null, null, 'ceshisss', 'ttt', null, null, '0', null, null, null, '1', '2019-04-10 22:18:14', '2019-04-10 22:18:14', null, '0');
INSERT INTO `sys_user` VALUES ('11', '22', '1', '测试', '22', null, null, '0', null, null, '2019-07-28 18:20:17', '1', '2019-04-10 22:59:47', '2019-07-28 18:14:23', null, '0');
INSERT INTO `sys_user` VALUES ('1155421191415627778', null, '1', '光剑', '1111', null, null, '0', null, null, null, '1', '2019-07-28 18:14:13', null, null, '1');
INSERT INTO `sys_user` VALUES ('1155421284277518338', '11', '1', '11', '11', null, null, '0', null, null, '2019-07-28 18:19:13', '1', '2019-07-28 18:14:36', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155421332994359297', '12', '1', '12', '12', null, null, '0', null, null, '2019-07-28 18:14:57', '1', '2019-07-28 18:14:47', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423092358086657', null, '1', 'lalal', '111', null, null, '0', null, null, '2019-07-28 18:21:49', '1', '2019-07-28 18:21:47', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423143608287233', '1', '1', '1', '1', null, null, '0', null, null, '2019-07-28 18:22:31', '1', '2019-07-28 18:21:59', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423161266307073', '2', '1', '2', '2', null, null, '0', null, null, '2019-07-28 18:22:25', '1', '2019-07-28 18:22:03', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423180757237761', '3', '1', '3', '3', null, null, '0', null, null, '2019-07-28 18:22:31', '1', '2019-07-28 18:22:08', null, null, '0');
INSERT INTO `sys_user` VALUES ('2', '测试', '2', 'test', '123456', 'test@xxx.com', '15xxxxxxxxxx', '0', null, null, '2019-07-28 18:20:50', '0', null, '2019-07-21 23:07:45', null, '0');
INSERT INTO `sys_user` VALUES ('3', '测试1', '1', 'test1', '123456', 'xxxxxx@qq.com', '135xxxxxxxx', '0', null, null, '2019-07-28 18:20:03', '1', '2019-03-23 15:09:14', '2019-07-21 23:20:45', null, '0');
INSERT INTO `sys_user` VALUES ('4', 'ttt', '1', 'test2', '123456', 'xxxxxx@qq.com', '135xxxxxx', '0', null, null, '2019-07-28 18:19:03', '1', '2019-03-23 15:11:37', '2019-03-23 15:11:37', null, '0');
INSERT INTO `sys_user` VALUES ('5', 'ttt', '1', 'test3', '123456', 'xxxxxx@qq.com', '135xxxxxx', '0', null, null, '2019-07-28 18:18:55', '1', '2019-03-23 15:16:22', '2019-03-23 15:16:22', null, '0');
INSERT INTO `sys_user` VALUES ('6', 'xx', '1', 'xxx', 'xx', 'xx', 'xx', '0', null, null, '2019-07-28 18:12:51', '1', '2019-03-23 15:20:38', '2019-03-23 15:20:38', null, '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('11', '1152897047936131074');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('1155421191415627778', '1152897047936131074');
INSERT INTO `sys_user_role` VALUES ('1155421191415627778', '3');
INSERT INTO `sys_user_role` VALUES ('1155421284277518338', '1152897047936131074');
INSERT INTO `sys_user_role` VALUES ('1155421284277518338', '1152897161132007426');
INSERT INTO `sys_user_role` VALUES ('1155421332994359297', '1152897047936131074');
INSERT INTO `sys_user_role` VALUES ('1155421332994359297', '3');
INSERT INTO `sys_user_role` VALUES ('1155423092358086657', '1');
INSERT INTO `sys_user_role` VALUES ('1155423092358086657', '1152897047936131074');
INSERT INTO `sys_user_role` VALUES ('1155423092358086657', '1152897161132007426');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('2', '3');
INSERT INTO `sys_user_role` VALUES ('3', '1152897161132007426');
INSERT INTO `sys_user_role` VALUES ('3', '3');
