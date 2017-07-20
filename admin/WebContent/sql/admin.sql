/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : admin

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-07-05 19:11:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_andorra
-- ----------------------------
DROP TABLE IF EXISTS `sys_andorra`;
CREATE TABLE `sys_andorra` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `type` char(2) DEFAULT NULL COMMENT '类型 ',
  `adurl` varchar(200) DEFAULT NULL COMMENT '图片地址',
  `publisher` varchar(50) DEFAULT NULL COMMENT '发布人',
  `addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `uptime` datetime DEFAULT NULL COMMENT '修改时间',
  `starttime` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `endtime` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `status` char(2) DEFAULT '0' COMMENT '状态  0为默认未启用，1为启用',
  `tourl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_andorra
-- ----------------------------
INSERT INTO `sys_andorra` VALUES ('11', 'test', '<p style=\"\">text<img src=\"http://10.10.28.214:10300/TP/ae5f19486f2f46e6ba93b0252bea802e.png\" title=\"llq.png\"/></p>', '0', '178b4c23860a4bd7bea6409e58038ed7.png', 'iuo', '2017-07-05 17:05:02', '2017-07-05 18:56:02', '2017-07-05', '2017-07-13', '0', '-ii');
INSERT INTO `sys_andorra` VALUES ('12', 'te', '<p><img src=\"/upload/43682f32dce94b6ea18dcba43e62b903.jpg\" title=\"c5d988e2b8ed99301d4da5793e682587.jpg\"/><img src=\"/upload/bb179e262cd7433291e92e530c6f7699.jpg\" title=\"手动é?手动é?阿斯蒂芬.jpg\"/></p>', '0', '12.jpg', 'f', '2017-07-05 19:05:47', '2017-07-05 19:06:47', '', '', '0', 'f');

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `PHONE` varchar(100) DEFAULT NULL,
  `SFID` varchar(100) DEFAULT NULL,
  `START_TIME` varchar(100) DEFAULT NULL,
  `END_TIME` varchar(100) DEFAULT NULL,
  `YEARS` int(10) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_gl_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('2ad0be435a98444ba3b90244cba1f630', '1', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('787973203e9141e686de08d0010d28be', '1', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'icon-desktop', '2');
INSERT INTO `sys_menu` VALUES ('2', '菜单权限', 'role.do', '1', '2', null, '2');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', null, '2');
INSERT INTO `sys_menu` VALUES ('8', '性能监控', 'druid/index.html', '9', '1', null, '2');
INSERT INTO `sys_menu` VALUES ('9', '系统工具', '#', '0', '3', 'icon-th', '2');
INSERT INTO `sys_menu` VALUES ('10', 'test', 'andorra/list.do', '1', '4', null, '2');
INSERT INTO `sys_menu` VALUES ('11', 'testp', 'pictures/list.do', '1', '5', null, '2');
INSERT INTO `sys_menu` VALUES ('12', '公司信息', '#', '0', '3', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '7974', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('2ad0be435a98444ba3b90244cba1f630', 'web', '7974', '1', '7974', '7974', '7974', '7974', '2ad0be435a98444ba3b90244cba1f630');
INSERT INTO `sys_role` VALUES ('787973203e9141e686de08d0010d28be', 'mvo', '7974', '1', '7974', '7974', '7974', '7974', '787973203e9141e686de08d0010d28be');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'dd94709528bb1c83d08f3088d4043f4742891f4f', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-07-05 19:04:50', '0:0:0:0:0:0:0:1', '0', '系统管理员', 'default', '123@123.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('3e73493326654d03a9f3b45f4a9f0820', 'mvo', 'bf16c10c2008cc711008f6f61ab26a692747db35', 'mvo', '', '787973203e9141e686de08d0010d28be', '2017-07-05 17:43:21', '10.10.28.214', '0', 'drfew', 'default', '22@ss.com', '2', '13665656512');
INSERT INTO `sys_user` VALUES ('cbb76b964807426bb9a920f85b5b8ed2', 'web', '5470c69755b7ee66b09d53ad4029218839567a5c', 'web', '', '2ad0be435a98444ba3b90244cba1f630', '2017-07-05 17:36:00', '10.10.28.214', '0', 'web账号', 'default', 'lll@ll.com', '1000', '13656562621');

-- ----------------------------
-- Table structure for sys_user_qx
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('2ad0be435a98444ba3b90244cba1f630', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('787973203e9141e686de08d0010d28be', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures` (
  `PICTURES_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(255) DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('6800af332d3542429c9f51e03927a628', '图片', 'b1ea45afff1745d59fbfd7219d4c6d71.jpeg', '20170705/b1ea45afff1745d59fbfd7219d4c6d71.jpeg', '2017-07-05 10:25:13', '1', '图片管理处上传');
INSERT INTO `tb_pictures` VALUES ('e7f8f67f54d6496b94c7936319bbbd3f', '图片', '378e6218c66149458906875024d1d123.jpg', '20170705/378e6218c66149458906875024d1d123.jpg', '2017-07-05 10:24:05', '1', '图片管理处上传');

DROP TABLE IF EXISTS `mor_monitor_result`;
CREATE TABLE `mor_monitor_result` (
`MOR_ID`  integer NOT NULL AUTO_INCREMENT COMMENT 'MOR_ID' ,
`CLASS_NAME`  varchar(100) NULL COMMENT '类名' ,
`JSON_STRING`  varchar(500) NULL  COMMENT 'Json字符串' ,
`CREATE_DATE`  datetime NULL  COMMENT '创建时间' ,
`CREATE_BY`  varchar(10) NULL COMMENT '创建人' ,
`UPDATE_DATE`  datetime NULL COMMENT '更新时间' ,
`UPDATE_BY`  varchar(10) NULL COMMENT '更新人' ,
`REMARK`  varchar(100) NULL COMMENT '描述' ,
`STS_CD`  varchar(2) NULL COMMENT '状态' ,
PRIMARY KEY (`MOR_ID`)
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8
;

