/*
Navicat MySQL Data Transfer

Source Server         : work
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : blog_db

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2021-03-03 00:31:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cms_article
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` char(32) NOT NULL COMMENT '主键',
  `category_id` char(32) DEFAULT NULL COMMENT '分类id',
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
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标识（0：已删除 1：正常）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '1', '通天塔', null, null, null, null, null, '0', '2020-08-16 18:34:23', '0', null, null, null, null, 'admin', '2020-08-16 18:34:15', null, null, '1');
INSERT INTO `cms_article` VALUES ('1afb7a9d12844483957c6d69fd2f5a74', null, '望见青空之丘', null, null, null, null, null, '0', '2020-07-06 00:11:10', '0', null, null, null, null, 'admin', '2020-07-05 18:23:01', 'admin', '2020-07-06 00:11:11', '0');
INSERT INTO `cms_article` VALUES ('35c5d79cc52648fcbb74cd0f9f0d0efb', null, '行星系', null, null, null, null, null, '0', '2020-07-05 22:58:17', '0', null, null, null, null, 'admin', '2020-07-05 18:33:42', 'admin', '2020-07-05 22:58:17', '0');
INSERT INTO `cms_article` VALUES ('393a8e455777446f8ba74ce37e744412', null, '用原生js处理长按触发功能。', null, null, null, null, null, '0', '2020-07-06 22:59:05', '0', null, null, null, null, 'admin', '2020-07-06 22:59:06', null, null, '1');
INSERT INTO `cms_article` VALUES ('3c0b9846bec4468495437a9c3e940251', null, '32323', null, null, null, null, null, '0', '2020-07-05 22:58:18', '0', null, null, null, null, 'admin', '2020-07-05 18:34:06', 'admin', '2020-07-05 22:58:19', '0');
INSERT INTO `cms_article` VALUES ('59fc277f11a44921975c1ee6c9a0ca99', null, '望见青空之丘', null, null, null, null, null, '0', '2020-07-05 22:58:20', '0', null, null, null, null, 'admin', '2020-07-05 18:23:50', 'admin', '2020-07-05 22:58:20', '0');
INSERT INTO `cms_article` VALUES ('6c53f2f537bb4d9391568289c9040c9d', null, '望见青空之丘', null, null, null, null, null, '0', '2020-07-05 22:58:21', '0', null, null, null, null, 'admin', '2020-07-05 18:23:51', 'admin', '2020-07-05 22:58:22', '0');
INSERT INTO `cms_article` VALUES ('7181e56e9b964917b1d201b3c9c92421', null, '啊哈哈哈哈啊', null, null, null, null, null, '0', '2020-07-06 22:59:19', '0', null, null, null, null, 'admin', '2020-07-05 18:31:40', 'admin', '2020-07-06 22:59:19', '0');
INSERT INTO `cms_article` VALUES ('82be6ee7c3cd44139fb3468ab6edec3b', null, 'MySQL对数据按照列分组并查出指定的条目数量，同时对每条数据排序。', null, null, null, null, null, '0', '2020-07-06 22:57:18', '0', null, null, null, null, 'admin', '2020-07-06 22:57:18', null, null, '1');
INSERT INTO `cms_article` VALUES ('8de402e6aa434925a037f980ba750213', null, '帝修堤修', null, null, null, null, null, '0', '2020-07-06 22:59:21', '0', null, null, null, null, 'admin', '2020-07-05 18:32:06', 'admin', '2020-07-06 22:59:21', '0');
INSERT INTO `cms_article` VALUES ('8e2cf300e3b14721aa11ec47dc1ce46c', null, '离间计', null, null, null, null, null, '0', '2020-07-05 22:57:28', '0', null, null, null, null, 'admin', '2020-07-05 18:27:39', 'admin', '2020-07-05 22:57:29', '0');
INSERT INTO `cms_article` VALUES ('a03e04455c2e4481a09403c0fb31cd96', null, '离间计', null, null, null, null, null, '0', '2020-07-05 22:58:23', '0', null, null, null, null, 'admin', '2020-07-05 18:26:37', 'admin', '2020-07-05 22:58:23', '0');
INSERT INTO `cms_article` VALUES ('a1bec1c6e4e445749c7262665e5409a7', null, '突然不行？', null, null, null, null, null, '0', '2020-07-05 22:57:30', '0', null, null, null, null, 'admin', '2020-07-05 18:32:42', 'admin', '2020-07-05 22:57:30', '0');
INSERT INTO `cms_article` VALUES ('b6aa010a677d495ca8f1c09fdd273205', null, '望见青空之丘', null, null, null, null, null, '0', '2020-07-05 22:57:35', '0', null, null, null, null, 'admin', '2020-07-05 18:22:55', 'admin', '2020-07-05 22:57:35', '0');
INSERT INTO `cms_article` VALUES ('c190a85d78b14171aaa25542f7265e1b', null, '离间计', null, null, null, null, null, '0', '2020-07-05 22:58:24', '0', null, null, null, null, 'admin', '2020-07-05 18:26:12', 'admin', '2020-07-05 22:58:24', '0');
INSERT INTO `cms_article` VALUES ('e407b317929c4f11be3ca0fe63209cad', null, '3333', null, null, null, null, null, '0', '2020-07-05 22:57:33', '0', null, null, null, null, 'admin', '2020-07-05 18:19:36', 'admin', '2020-07-05 22:57:34', '0');
INSERT INTO `cms_article` VALUES ('e6f3eed8c2024b00b14c85860392c50d', null, '离间计', null, null, null, null, null, '0', '2020-07-06 22:59:22', '0', null, null, null, null, 'admin', '2020-07-05 18:28:00', 'admin', '2020-07-06 22:59:22', '0');
INSERT INTO `cms_article` VALUES ('e996f498c0ca48acb7ccb103bbe64bff', null, '跨往星空之桥', null, null, null, null, null, '0', '2020-07-06 22:59:22', '0', null, null, null, null, 'admin', '2020-07-05 18:24:29', 'admin', '2020-07-06 22:59:23', '0');
INSERT INTO `cms_article` VALUES ('fbf6c96a2062466ea9a4fdee0f51edf0', null, '流行碎片', null, null, null, null, null, '0', '2020-07-06 22:59:23', '0', null, null, null, null, 'admin', '2020-07-05 18:34:59', 'admin', '2020-07-06 22:59:23', '0');

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
INSERT INTO `cms_article_data` VALUES ('07af152ab3af406f8d12e3e1cff47cb6', '<p>请输入...行星系</p>', 'e6f3eed8c2024b00b14c85860392c50d', null);
INSERT INTO `cms_article_data` VALUES ('0c980500465e45b3be49f298ae50ac6e', '<p>阿库娅2</p>', 'e996f498c0ca48acb7ccb103bbe64bff', null);
INSERT INTO `cms_article_data` VALUES ('108c54771e8b4d7fab00770ebca06332', '<p>请输入...谢谢谢谢</p>', '35c5d79cc52648fcbb74cd0f9f0d0efb', null);
INSERT INTO `cms_article_data` VALUES ('16c76fa6ff714b508225c4f977fe80b9', '<p>请输入...行星系</p>', '1', null);
INSERT INTO `cms_article_data` VALUES ('17aa496feaef4108b6861d829e1caae6', '<p>请输入.</p>', 'fbf6c96a2062466ea9a4fdee0f51edf0', null);
INSERT INTO `cms_article_data` VALUES ('21995d1fc0394be78652fd7c9bdd3590', '<p>阿库娅</p>', '1afb7a9d12844483957c6d69fd2f5a74', null);
INSERT INTO `cms_article_data` VALUES ('24aba1a5c7904934be5a26e01ff6585b', '<p>请输入...行星系</p>', 'c190a85d78b14171aaa25542f7265e1b', null);
INSERT INTO `cms_article_data` VALUES ('3bd1b76b99f94869bf73ded8c26b1c0e', '<p>阿库娅</p>', '6c53f2f537bb4d9391568289c9040c9d', null);
INSERT INTO `cms_article_data` VALUES ('44ab62530cee4b94bb78e99cccf4ab01', '<p>请输入...行星系</p>', 'a03e04455c2e4481a09403c0fb31cd96', null);
INSERT INTO `cms_article_data` VALUES ('45ecf23dcb8d4726a394c715b109ca89', '<p>阿库娅</p>', 'b6aa010a677d495ca8f1c09fdd273205', null);
INSERT INTO `cms_article_data` VALUES ('60a7a258c17444d18de0f947903ffbaa', '<p>请这里是因为当时需求原因所使用的长按触发功能</p><p>注意：这里的长按，不能再有滚动条的页面使用，因为修改的事件触发的原因，所以滚动条滚动的</p><p>首先是html代码，在需要触发事件的区域内绑定三个事件方法。(注意这个长按方法只有移动端能触发。)</p><pre><code>&lt;div v-if=\"total != 0\" class=\"project-details\" <br>    @touchstart.prevent=\"goTouchstart(item)\"<br>    @touchmove=\"goTouchmove(item)\" <br>    @touchend=\"goTouchend(item)\" &gt;<br>&lt;/div&gt;</code></pre><p>&nbsp; 然后是js代码，需要在data中先定义一个属性&nbsp;&nbsp;<br></p><pre><code>data() {<br>    return {<br>         timeOutEvent: \'\' //长按定时器<br>    }<br>}</code></pre><pre><code>/**<br>             * 触发长按的方法<br>             * 如果手在按钮上超过6毫秒<br>             */<br>            goTouchstart(){<br>                let that = this;<br>                clearTimeout(this.timeOutEvent);//清除定时器<br>                this.timeOutEvent = 0<br>                this.timeOutEvent = setTimeout(() =&gt;{<br>                    //执行长按要执行的内容，<br>                    that.handleHold()<br>                    that.timeOutEvent = 0;<br>                },600);//这里设置定时<br>            },<br>            //手释放，如果在500毫秒内就释放，则取消长按事件，此时可以执行onclick应该执行的事件<br>            goTouchend(item){<br>                clearTimeout(this.timeOutEvent);<br>                if(this.timeOutEvent){<br>                    //这里写要执行的内容（尤如onclick事件）<br>                    this.selectProject(item)<br>                }<br>            },<br>            //如果手指有移动，则取消所有事件，此时说明用户只是要移动而不是长按<br>            goTouchmove(item){<br>                clearTimeout(this.timeOutEvent);//清除定时器<br>                this.timeOutEvent = 0;<br>            },</code></pre><p>这边大体执行流程是， 当手指按到触发事件的组件上的时候，会清除定时器，重置定时器时间为0. 然后创建个定时器 0.6秒后执行你要执行的内容，执行完后将定时器时间为0.</p><p>如果手在0.5秒内松开，清除定时器，取消长按时间。再判断定时的器时间是否大于0，如果大于0.则执行普通的点击事件操作。</p><p>如果等于0则意味着已经触发了长按操作，就不执行普通点击操作。</p><p>如果手指有移动，则取消所有事件，并清除定时器。同时将定时器事件清0</p>', '393a8e455777446f8ba74ce37e744412', null);
INSERT INTO `cms_article_data` VALUES ('b2463bb056f840cf9d850510ee76de65', '<p>请输入...111</p>', '8de402e6aa434925a037f980ba750213', null);
INSERT INTO `cms_article_data` VALUES ('c4585174a26d40d68a6e39181f17e4f4', '<p>请输入...44444</p>', '3c0b9846bec4468495437a9c3e940251', null);
INSERT INTO `cms_article_data` VALUES ('c74f1dae916c4157986e4b4a990e1319', '<p>请输入...44444</p>', 'e407b317929c4f11be3ca0fe63209cad', null);
INSERT INTO `cms_article_data` VALUES ('d3b3b630987a49c4a722fc8226a623f7', '<p>请输入...可以</p>', 'a1bec1c6e4e445749c7262665e5409a7', null);
INSERT INTO `cms_article_data` VALUES ('e9baae62bfab4c7fb3a50000099c66f7', '<p>阿库娅</p>', '59fc277f11a44921975c1ee6c9a0ca99', null);
INSERT INTO `cms_article_data` VALUES ('eb3ff5383b9242db8e0217b052a8f7a3', '<p>我去拖沓一</p>', '7181e56e9b964917b1d201b3c9c92421', null);
INSERT INTO `cms_article_data` VALUES ('fca463bde12d4146bd9dca798292cdd1', '<p>在一次工作中需要用到查出每个群聊的最新20条数据。</p><p>下面直接进入正题</p><p>这段 sql 是通过给每组数据进行分组后给其添加了一列数据列。</p><p>参考了一篇别人的文章，原文是采用了 set 定义变量， 和case 因为set 所以会有个问题<span style=\"color: rgb(194, 79, 74);\">并行</span>的问题，所以这里采用了</p><p><span style=\"color: rgb(77, 128, 191);\">(SELECT @order_num&nbsp;:= \'\') F1, (SELECT @TAG := \'\') F1</span>&nbsp;来分别保存字段和序号 以及 IF&nbsp;显得更易懂。</p><p>t2是关联其他信息的表，这里可以不关联。 必须先按分组列排序，再按时间排序上面 sql 应该很容易看得懂，重要是思路。</p><p><br></p><pre><code>SELECT<br>&nbsp;&nbsp; &nbsp;t1.id,<br>&nbsp;&nbsp; &nbsp;t1.creator AS creator,<br>&nbsp;&nbsp; &nbsp;t1.correlation_id AS correlationId,<br>&nbsp;&nbsp; &nbsp;t1.correlation_type AS correlationType,<br>&nbsp;&nbsp; &nbsp;t2.real_name AS `realName`,<br>&nbsp;&nbsp; &nbsp;t1.body AS body,<br>&nbsp;&nbsp; &nbsp;t1.type,<br>&nbsp;&nbsp; &nbsp;t2.photo AS photo,<br>&nbsp;&nbsp; &nbsp;t1.create_time AS createTime<br>FROM<br>&nbsp;&nbsp; &nbsp;(<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.id<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SELECT<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.id,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.correlation_id,<br><br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;IF (<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;@TAG = t.correlation_id,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;@order_num := @order_num + 1,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;@order_num := 1<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;) rownum,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;@TAG := t.correlation_id<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;FROM<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t_chat_message t,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(SELECT @TAG := \'\') F1,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;(SELECT @order_num := 0) F2<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;WHERE<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.correlation_id IN (<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\'fe4c6420dacd4ca6999ed43d00fc18ea\',<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\'3d43a73e0fd244fda838790c1ddd876d\',<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\'dbfe6f12b9b14af9ae64e03514de6055\',<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;\'615296ff455f45edb24cb44366d8982c\'<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;)<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;ORDER BY<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.correlation_id,<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.create_time ASC<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;) t<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;WHERE<br>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;t.rownum &lt;= 20<br>&nbsp;&nbsp; &nbsp;) t<br>LEFT JOIN t_chat_message t1 ON t.id = t1.id<br>LEFT JOIN t_user_info t2 ON t1.creator = t2.login_name;</code></pre><p>上面 sql 应该很容易看得懂，重要是思路。</p>', '82be6ee7c3cd44139fb3468ab6edec3b', null);

-- ----------------------------
-- Table structure for cms_article_dict
-- ----------------------------
DROP TABLE IF EXISTS `cms_article_dict`;
CREATE TABLE `cms_article_dict` (
  `id` char(32) NOT NULL,
  `value` varchar(100) DEFAULT NULL COMMENT '数据值',
  `label` varchar(100) DEFAULT NULL COMMENT '标签名',
  `type` tinyint(1) DEFAULT NULL COMMENT '类型（1.用户自定义分类 2：用户自定义标签）',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `creator` char(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` char(32) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(1:正常 0:删除)',
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
  `id` char(32) NOT NULL COMMENT '主键',
  `parent_id` char(32) DEFAULT '0' COMMENT '上级id(''0''：最上级)',
  `name` varchar(100) DEFAULT NULL COMMENT '昵称',
  `description` varchar(255) DEFAULT NULL COMMENT '说明',
  `sort` int(11) DEFAULT NULL COMMENT '排序(权重)',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
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
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` char(32) NOT NULL,
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `body` varchar(255) DEFAULT NULL COMMENT '内容',
  `sort` int(10) DEFAULT NULL COMMENT '权重',
  `to_user` varchar(32) DEFAULT '*' COMMENT '默认 * 代表广播',
  `creator` char(32) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` char(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注消息',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(1:正常 0:删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm` (
  `id` char(32) NOT NULL COMMENT '主键',
  `val` varchar(50) DEFAULT NULL COMMENT '权限值，shiro的权限控制表达式',
  `parent_val` varchar(50) DEFAULT NULL COMMENT '父权限',
  `name` varchar(25) DEFAULT NULL COMMENT '权限名称',
  `type` int(3) DEFAULT NULL COMMENT '权限类型：1.菜单 2.按钮 3.接口 4.特殊',
  `leaf` char(1) DEFAULT NULL COMMENT '是否是叶子节点',
  `remarks` varchar(255) DEFAULT NULL COMMENT '说明',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0表示已删除， 1表示未删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `val` (`val`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO `sys_perm` VALUES ('1', '*', null, '所有权限', '0', '', '', null, '2019-04-20 19:59:50', null, null, '0');
INSERT INTO `sys_perm` VALUES ('2', 'a:auth', null, '登录模块', '3', '1', '', null, '2019-04-20 19:59:55', null, null, '0');
INSERT INTO `sys_perm` VALUES ('3', 'm:sys', null, '系统', '1', '0', '', null, '2019-04-20 15:54:44', null, null, '1');
INSERT INTO `sys_perm` VALUES ('4', 'm:sys:perm', 'm:sys', '权限管理', '1', '1', '', null, '2019-04-20 15:54:41', null, null, '1');
INSERT INTO `sys_perm` VALUES ('5', 'm:sys:role', 'm:sys', '角色管理', '1', '1', '', null, '2019-04-20 15:54:38', null, null, '1');
INSERT INTO `sys_perm` VALUES ('6', 'm:sys:user', 'm:sys', '用户管理', '1', '1', '', null, '2019-04-20 15:54:36', null, null, '1');
INSERT INTO `sys_perm` VALUES ('7', 'm:test:test', 'm:test', '测试菜单', '1', '1', null, null, '2019-04-20 21:08:42', null, null, '1');
INSERT INTO `sys_perm` VALUES ('8', 'm:test', null, '测试模块', '1', '0', null, null, '2019-04-20 21:08:46', null, null, '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(32) NOT NULL COMMENT '角色id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色昵称',
  `is_sys` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统数据(1:系统数据；0:正常数据)',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用（1:可用, 0:不可用）',
  `remarks` varchar(255) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_date` datetime DEFAULT NULL,
  `updater` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_date` datetime DEFAULT NULL,
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0:已删除；1:未删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '1', '具有本系统中最高权限', null, '2019-04-21 19:13:47', null, null, '1');
INSERT INTO `sys_role` VALUES ('1123848331933184001', '测试角色', '0', '1', null, null, '2019-06-03 20:50:40', null, null, '0');
INSERT INTO `sys_role` VALUES ('1123852439469654017', '详细信息', '0', '1', null, null, '2019-06-03 20:41:32', null, null, '0');
INSERT INTO `sys_role` VALUES ('1125418569650950145', '详细', '0', '1', '添加登陆模块权限', null, '2019-06-03 20:43:59', null, null, '0');
INSERT INTO `sys_role` VALUES ('1130111061799587841', '测试', '0', '1', '为什么会失效', null, '2019-06-03 20:43:55', null, null, '0');
INSERT INTO `sys_role` VALUES ('1130123814048124930', '测试权限', '0', '1', '马黑', null, '2019-06-03 20:34:45', null, null, '0');
INSERT INTO `sys_role` VALUES ('1132665874263392257', 'dasdas ', '0', '1', '掉您马黑', null, '2019-06-03 20:41:46', null, null, '0');
INSERT INTO `sys_role` VALUES ('1132667963609792513', '33', '0', '1', '99', null, '2019-06-03 20:33:01', null, null, '0');
INSERT INTO `sys_role` VALUES ('1132668137816014850', '3333', '0', '1', null, null, '2019-06-03 20:33:16', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135527912877088770', '1', '0', '1', null, null, '2019-06-03 20:47:00', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135527925015404545', '2', '0', '1', null, null, '2019-06-03 20:47:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528359440441346', '1', '0', '1', null, null, '2019-06-03 20:47:21', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528369498382338', '2', '0', '1', null, null, '2019-06-03 20:47:24', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135528383893233665', '3', '0', '1', null, null, '2019-06-03 20:47:26', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529158576988161', '1', '0', '1', null, null, '2019-06-03 20:50:36', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529167993200641', '2', '0', '1', null, null, '2019-06-03 20:50:34', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529177833037825', '3', '0', '1', null, null, '2019-06-03 20:50:30', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529308930203649', '1', '0', '1', null, null, '2019-06-03 20:51:12', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529319319494658', '2', '0', '1', null, null, '2019-06-03 20:52:39', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529332820959234', '3', '0', '1', null, null, '2019-06-03 20:52:37', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529344443375618', '4', '0', '1', null, null, '2019-06-03 20:52:35', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529743430737922', '1', '0', '1', null, null, '2019-06-03 20:53:28', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529752444297218', '2', '0', '1', null, null, '2019-06-03 20:53:13', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529763240435714', '3', '0', '1', null, null, '2019-06-03 20:53:07', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135529771981365249', '4', '0', '1', null, null, '2019-06-03 20:53:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530133186437122', '1', '0', '1', null, null, '2019-06-03 20:54:31', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530142753644545', '2', '0', '1', null, null, '2019-06-03 20:54:35', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530154292174850', '3', '0', '1', null, null, '2019-06-03 20:54:33', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530163582558209', '4', '0', '1', null, null, '2019-06-03 20:54:41', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530173153959937', '5', '0', '1', null, null, '2019-06-03 20:54:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530835472310273', '1', '0', '1', null, null, '2019-06-03 20:57:17', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530846067122178', '2', '0', '1', null, null, '2019-06-03 21:00:05', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530856129257473', '3', '0', '1', null, null, '2019-06-03 21:00:02', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530867424518146', '4', '0', '1', null, null, '2019-06-03 21:00:07', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135530878468120577', '5', '0', '1', null, null, '2019-06-03 21:00:09', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531718968893442', '1', '0', '1', null, null, '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531729442070530', '2', '0', '1', null, null, '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1135531738271080450', '3', '0', '1', null, null, '2019-06-03 21:00:43', null, null, '0');
INSERT INTO `sys_role` VALUES ('1152897047936131074', '二级管理员', '0', '1', null, null, '2019-07-21 19:04:10', null, null, '1');
INSERT INTO `sys_role` VALUES ('1152897161132007426', '三级管理员', '0', '1', null, null, '2019-07-21 19:04:38', null, null, '1');
INSERT INTO `sys_role` VALUES ('1152897230841339905', '雷老虎', '0', '1', '1', null, '2019-07-21 19:05:00', null, null, '0');
INSERT INTO `sys_role` VALUES ('2', '财务', '0', '1', '拥有财务相关权限', null, '2019-04-21 19:16:12', null, null, '1');
INSERT INTO `sys_role` VALUES ('3', '仓管', '0', '1', '拥有关于仓库相关权限', null, '2019-07-21 19:04:22', null, null, '1');

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm` (
  `role_id` char(32) NOT NULL COMMENT '用户id',
  `perm_id` char(32) NOT NULL COMMENT '权限id'
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
  `id` char(32) NOT NULL COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `gender` tinyint(1) DEFAULT NULL COMMENT '性别: 0为男性；1为女性',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(50) DEFAULT NULL COMMENT '手机',
  `user_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '登陆ip',
  `login_time` datetime DEFAULT NULL COMMENT '登陆时间',
  `status` tinyint(1) NOT NULL COMMENT '是否可登陆(1:表示可登陆,0表示不可登陆)',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `creator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除标记(0表示已删除，1表示未删除 )',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '肯德基', '1', 'admin', '123456', 'xxxxxxxx@xxx.com', '13xxxxxxxxxx', '0', null, '0.0.0.0', '2019-07-28 18:12:48', '1', '1', null, '2019-03-04 22:49:35', null, '2019-07-28 18:12:49', '1');
INSERT INTO `sys_user` VALUES ('10', null, null, 'ceshisss', 'ttt', null, null, '0', null, null, null, '1', null, null, '2019-04-10 22:18:14', null, '2019-04-10 22:18:14', '0');
INSERT INTO `sys_user` VALUES ('11', '22', '1', '测试', '22', null, null, '0', null, null, '2019-07-28 18:20:17', '1', null, null, '2019-04-10 22:59:47', null, '2019-07-28 18:14:23', '0');
INSERT INTO `sys_user` VALUES ('1155421191415627778', null, '1', '光剑', '1111', null, null, '0', null, null, null, '1', null, null, '2019-07-28 18:14:13', null, null, '1');
INSERT INTO `sys_user` VALUES ('1155421284277518338', '11', '1', '11', '11', null, null, '0', null, null, '2019-07-28 18:19:13', '1', null, null, '2019-07-28 18:14:36', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155421332994359297', '12', '1', '12', '12', null, null, '0', null, null, '2019-07-28 18:14:57', '1', null, null, '2019-07-28 18:14:47', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423092358086657', null, '1', 'lalal', '111', null, null, '0', null, null, '2019-07-28 18:21:49', '1', null, null, '2019-07-28 18:21:47', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423143608287233', '1', '1', '1', '1', null, null, '0', null, null, '2019-07-28 18:22:31', '1', null, null, '2019-07-28 18:21:59', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423161266307073', '2', '1', '2', '2', null, null, '0', null, null, '2019-07-28 18:22:25', '1', null, null, '2019-07-28 18:22:03', null, null, '0');
INSERT INTO `sys_user` VALUES ('1155423180757237761', '3', '1', '3', '3', null, null, '0', null, null, '2019-07-28 18:22:31', '1', null, null, '2019-07-28 18:22:08', null, null, '0');
INSERT INTO `sys_user` VALUES ('2', '测试', '2', 'test', '123456', 'test@xxx.com', '15xxxxxxxxxx', '0', null, null, '2019-07-28 18:20:50', '0', null, null, null, null, '2019-07-21 23:07:45', '0');
INSERT INTO `sys_user` VALUES ('3', '测试1', '1', 'test1', '123456', 'xxxxxx@qq.com', '135xxxxxxxx', '0', null, null, '2019-07-28 18:20:03', '1', null, null, '2019-03-23 15:09:14', null, '2019-07-21 23:20:45', '0');
INSERT INTO `sys_user` VALUES ('4', 'ttt', '1', 'test2', '123456', 'xxxxxx@qq.com', '135xxxxxx', '0', null, null, '2019-07-28 18:19:03', '1', null, null, '2019-03-23 15:11:37', null, '2019-03-23 15:11:37', '0');
INSERT INTO `sys_user` VALUES ('5', 'ttt', '1', 'test3', '123456', 'xxxxxx@qq.com', '135xxxxxx', '0', null, null, '2019-07-28 18:18:55', '1', null, null, '2019-03-23 15:16:22', null, '2019-03-23 15:16:22', '0');
INSERT INTO `sys_user` VALUES ('6', 'xx', '1', 'xxx', 'xx', 'xx', 'xx', '0', null, null, '2019-07-28 18:12:51', '1', null, null, '2019-03-23 15:20:38', null, '2019-03-23 15:20:38', '0');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` char(32) NOT NULL COMMENT '用户id',
  `role_id` char(32) NOT NULL COMMENT '角色id',
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
