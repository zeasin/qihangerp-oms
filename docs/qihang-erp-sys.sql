/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : qihang-erp

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 13/06/2024 10:42:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_shop_platform
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_platform`;
CREATE TABLE `s_shop_platform`  (
  `id` int(0) NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台名',
  `app_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appSecret',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `server_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '服务url',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '回调url',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电商平台配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_shop_platform
-- ----------------------------
INSERT INTO `s_shop_platform` VALUES (1, '1688', '', '', '1688开放平台', 'http://api.1688.com', 'http://qihangerp.cn', NULL, '2024-06-04 11:10:58');
INSERT INTO `s_shop_platform` VALUES (2, '视频号', ' ', ' ', NULL, 'https://api.weixin.qq.com/', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (3, '京东POP', '', '', NULL, NULL, 'http://qihangerp.cn', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (4, '淘宝天猫', '', '', '淘宝开放平台', 'http://gw.api.taobao.com/router/rest', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (5, '拼多多', '', '', '拼多多开放平台', 'https://gw-api.pinduoduo.com/api/router', 'http://qihangerp.cn', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (6, '抖店', '', '', NULL, 'https://openapi-fxg.jinritemai.com', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (7, '小红书', '', '', NULL, 'https://ark.xiaohongshu.com/ark/open_api/v3/common_controller', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (8, '快手', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (99, 'ERP系统', '', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-08-07 19:31:38', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '启航技术', 0, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:28:55');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '研发部', 1, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:31:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 11:36:40');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 14:50:27');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 16:02:13');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 09:24:16');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-09 15:59:59');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', 'Unable to connect to Redis', '2024-05-11 09:15:16');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-11 09:15:43');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-11 15:35:31');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:14:47');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:22:50');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-15 11:23:07');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-25 09:34:34');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-25 11:09:17');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 09:01:31');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 10:20:40');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 17:24:44');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 18:18:18');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-28 19:47:40');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-29 08:47:41');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-05-30 14:39:39');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2024-05-30 14:39:39');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-30 14:39:45');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-30 15:50:24');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 11:09:07');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 19:28:45');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-31 20:14:36');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:18:26');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:20:46');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-06-01 18:23:11');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-03 16:18:56');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 10:20:02');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 11:10:27');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 11:58:01');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-04 13:53:33');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 11:15:43');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 13:33:03');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 16:29:17');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 17:55:49');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2024-06-11 18:39:37');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2024-06-11 18:39:37');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 18:39:49');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-11 20:17:42');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 10:02:45');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 11:33:33');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 11:50:17');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 13:35:39');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-12 14:36:04');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-13 09:31:56');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-06-13 10:37:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `system_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '系统id（oms用在oms系统）',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2086 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统设置', 'oms', 0, 99, '/system', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '商品管理', '', 0, 9, '/goods', '', '', 1, 0, 'M', '0', '0', '', 'theme', 'admin', '2023-12-29 13:29:44', '', '', '');
INSERT INTO `sys_menu` VALUES (4, '采购管理', NULL, 0, 1, 'purchase', '', '', 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-24 17:06:13', '至简官网地址');
INSERT INTO `sys_menu` VALUES (5, '订单管理', 'oms', 0, 2, '/sale', '', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-29 16:53:03', 'admin', '2024-06-03 16:20:20', '');
INSERT INTO `sys_menu` VALUES (6, '发货管理', 'oms', 0, 3, '/ship', '', '', 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-01-01 14:08:04', 'admin', '2024-01-03 14:07:29', '');
INSERT INTO `sys_menu` VALUES (7, '售后管理', 'oms', 0, 4, '/saleafter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2024-01-03 14:23:55', 'admin', '2024-01-12 19:47:33', '');
INSERT INTO `sys_menu` VALUES (8, '店铺管理', 'oms', 0, 7, '/shop', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2024-04-12 16:46:19', 'admin', '2024-04-24 11:17:09', '');
INSERT INTO `sys_menu` VALUES (9, '库存管理', '', 0, 5, 'wms', '', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-31 12:14:33', 'admin', '2024-04-23 15:43:32', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 'oms', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', '', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-27 15:00:27', '', '', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', '', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-27 15:00:27', '', '', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', '', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', '', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-12 16:44:52', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', '', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', '', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-27 15:00:27', '', '', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', NULL, 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-27 15:00:27', '', '', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', NULL, 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-27 15:00:27', '', '', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', NULL, 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', NULL, 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', NULL, 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', NULL, 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', NULL, 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', NULL, 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', NULL, 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', NULL, 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', NULL, 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', NULL, 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', NULL, 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', NULL, 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', NULL, 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', NULL, 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', NULL, 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', NULL, 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', NULL, 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', NULL, 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', NULL, 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', NULL, 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', NULL, 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', NULL, 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', NULL, 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', NULL, 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', NULL, 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', NULL, 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', NULL, 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', NULL, 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', NULL, 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', NULL, 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', NULL, 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', NULL, 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', NULL, 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', NULL, 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', NULL, 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', NULL, 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', NULL, 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (2001, '面单打印', 'oms', 6, 0, 'ewaybill_print', 'shipping/ewaybillPrint/index', NULL, 1, 0, 'C', '0', '0', '', 'form', '', NULL, 'admin', '2024-06-03 16:21:13', '');
INSERT INTO `sys_menu` VALUES (2005, '供应商管理', NULL, 4, 9, 'supplier/list', 'scm/supplier/index', '', 1, 0, 'C', '0', '0', 'scm:supplier', 'qq', 'admin', '2023-12-29 09:14:02', 'admin', '2023-12-29 09:17:27.514466', '');
INSERT INTO `sys_menu` VALUES (2007, '商品管理', NULL, 2, 1, 'goods_list', 'goods/index', '', 1, 0, 'C', '0', '0', 'goods:list', 'theme', 'admin', '2023-12-29 13:31:01', 'admin', '2023-12-29 15:02:40.869685', '');
INSERT INTO `sys_menu` VALUES (2008, '商品分类', NULL, 2, 88, 'goods_category', 'goods/category/index', '', 1, 0, 'C', '0', '0', 'goods:category', 'tree-table', 'admin', '2023-12-29 13:32:41', 'admin', '2023-12-29 15:02:22.220534', '');
INSERT INTO `sys_menu` VALUES (2009, '品牌管理', NULL, 2, 99, 'goods/brand', 'goods/brand/index', '', 1, 0, 'C', '0', '1', 'goods:brand', 'clipboard', 'admin', '2023-12-29 13:34:49', 'admin', '2024-04-14 18:51:23', '');
INSERT INTO `sys_menu` VALUES (2010, '采购单管理', NULL, 4, 1, 'order', 'scm/purchase/order', '', 1, 0, 'C', '0', '0', 'scm:purchase:order', 'button', 'admin', '2023-12-29 16:35:55', 'admin', '2024-04-24 17:06:32', '');
INSERT INTO `sys_menu` VALUES (2012, '采购物流管理', NULL, 4, 2, 'ship', 'scm/purchase/ship', '', 1, 0, 'C', '0', '0', 'scm:purchase:ship', 'component', 'admin', '2023-12-29 16:45:42', 'admin', '2024-04-24 17:10:48', '');
INSERT INTO `sys_menu` VALUES (2015, '店铺管理', 'oms', 8, 10, 'shop_list', 'shop/shop_index', '', 1, 0, 'C', '0', '0', 'shop:list', 'example', 'admin', '2023-12-29 16:54:02', 'admin', '2024-04-25 11:15:07', '');
INSERT INTO `sys_menu` VALUES (2017, '店铺数据统计', 'oms', 5, 8, 'data', 'shop/data', '', 1, 0, 'C', '0', '1', 'shop:data', 'chart', 'admin', '2023-12-29 17:04:08', 'admin', '2023-12-31 19:04:58.785609', '');
INSERT INTO `sys_menu` VALUES (2019, '采购账单管理1', NULL, 4, 2, 'purchase', 'scm/purchase/cost', '', 1, 0, 'C', '0', '1', '', 'money', 'admin', '2023-12-29 17:09:32', 'admin', '2024-04-24 17:05:06', '');
INSERT INTO `sys_menu` VALUES (2021, '创建采购单', NULL, 4, 0, 'order/create', 'scm/purchase/order/create', '', 1, 0, 'C', '1', '0', '', 'edit', 'admin', '2023-12-29 21:23:45', 'admin', '2024-04-24 17:11:38', '');
INSERT INTO `sys_menu` VALUES (2025, '采购单详情', NULL, 4, 1, 'order/detail', 'scm/purchase/order/detail', '', 1, 0, 'C', '1', '0', '', 'button', 'admin', '2023-12-30 17:08:01', 'admin', '2024-04-24 17:15:00', '');
INSERT INTO `sys_menu` VALUES (2027, '入库管理', NULL, 9, 0, 'stock_in_entry/list', 'wms/stockInEntry', '', 1, 0, 'C', '0', '0', 'wms:stock_in_entry:list', 'stockin', 'admin', '2023-12-31 12:27:37', 'admin', '2024-01-14 15:12:48', '');
INSERT INTO `sys_menu` VALUES (2028, '生成采购入库单', NULL, 4, 3, 'ship/create_stock_in_entry', 'scm/purchase/ship/create_stock_in_entry', '', 1, 0, 'C', '1', '0', '', 'button', 'admin', '2023-12-31 12:31:32', 'admin', '2024-04-24 17:12:38', '');
INSERT INTO `sys_menu` VALUES (2029, '店铺售后管理', 'oms', 7, 2, 'shop_refund', 'shop/refund/index', '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-12-31 17:29:03', 'admin', '2024-05-04 18:57:32', '');
INSERT INTO `sys_menu` VALUES (2030, '手动创建订单', 'oms', 5, 1, 'order/create', 'sale/order/create', '', 1, 0, 'C', '1', '0', '', 'documentation', 'admin', '2023-12-31 20:01:22', 'admin', '2024-03-24 19:32:32', '');
INSERT INTO `sys_menu` VALUES (2032, '订单拉取日志', 'oms', 5, 3, 'order/pull_log', 'shop/order_pull_log', '', 1, 0, 'C', '0', '1', '', 'upload', 'admin', '2023-12-31 20:04:12', 'admin', '2024-05-04 18:56:46', '');
INSERT INTO `sys_menu` VALUES (2033, '订单处理', 'oms', 5, 1, 'order_list', 'sale/order/index', '', 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-12-31 20:05:05', 'admin', '2024-06-03 16:21:56', '');
INSERT INTO `sys_menu` VALUES (2036, '店铺订单管理', 'oms', 5, 2, 'shop_order', 'shop/order_index', '', 1, 0, 'C', '0', '0', '', 'excel', 'admin', '2024-01-01 14:14:42', 'admin', '2024-05-04 18:55:37', '');
INSERT INTO `sys_menu` VALUES (2046, '出库管理', NULL, 9, 5, 'stockOut', 'wms/stockOutEntry', NULL, 1, 0, 'C', '0', '0', '', 'link', 'admin', '2024-01-03 11:00:53', 'admin', '2024-01-12 15:52:19', '');
INSERT INTO `sys_menu` VALUES (2047, '库存查询', NULL, 9, 6, 'goodsInventory', 'goods/goodsInventory', NULL, 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2024-01-03 11:01:14', 'admin', '2024-01-09 17:55:33', '');
INSERT INTO `sys_menu` VALUES (2048, '库存盘点', NULL, 9, 9, 'pan', NULL, NULL, 1, 0, 'C', '0', '1', '', 'bug', 'admin', '2024-01-03 11:01:43', 'admin', '2024-01-09 19:57:08', '');
INSERT INTO `sys_menu` VALUES (2049, '打包发货', 'oms', 6, 3, 'ship_order', 'shipping/shipOrder/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-01-03 14:09:18', 'admin', '2024-05-02 10:47:38', '');
INSERT INTO `sys_menu` VALUES (2051, '物流跟踪', 'oms', 6, 4, 'ship_logistics', 'shipping/shipOrder/logistics', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2024-01-03 14:13:12', 'admin', '2024-05-02 10:50:34', '');
INSERT INTO `sys_menu` VALUES (2052, '物流公司管理', 'oms', 6, 9, 'logistics_company', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2024-01-03 14:14:09', 'admin', '2024-04-24 13:53:14', '');
INSERT INTO `sys_menu` VALUES (2054, '售后处理', 'oms', 7, 1, 'refund_list', 'sale/refund', NULL, 1, 0, 'C', '0', '0', '', 'size', 'admin', '2024-01-03 14:24:36', 'admin', '2024-05-05 20:14:23', '');
INSERT INTO `sys_menu` VALUES (2059, '备货清单', 'oms', 6, 1, 'stocking', 'shipping/stocking', '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-01-09 11:51:52', 'admin', '2024-05-01 21:34:33', '');
INSERT INTO `sys_menu` VALUES (2060, '拣货出库', '', 6, 2, 'stockout', 'shipping/stockOut', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-01-09 13:39:00', 'admin', '2024-04-26 13:51:21', '');
INSERT INTO `sys_menu` VALUES (2061, '库位管理', NULL, 9, 99, 'stock_location', 'wms/location', NULL, 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-01-09 13:54:30', 'admin', '2024-01-09 14:50:33', '');
INSERT INTO `sys_menu` VALUES (2063, '发货费用', '', 6, 5, 'ship_fee', 'shipping/shipFee', NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2024-01-12 18:35:31', 'admin', '2024-05-02 10:50:58', '');
INSERT INTO `sys_menu` VALUES (2066, '添加商品', NULL, 2, 2, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'component', 'admin', '2024-01-14 19:42:11', 'admin', '2024-04-14 18:50:36', '');
INSERT INTO `sys_menu` VALUES (2067, '商品SKU管理', '', 2, 3, 'spec_list', 'goods/spec', NULL, 1, 0, 'C', '0', '0', '', 'theme', 'admin', '2024-01-16 14:17:39', 'admin', '2024-04-14 18:51:13', '');
INSERT INTO `sys_menu` VALUES (2079, '电商平台设置', 'oms', 1, 0, 'platform', 'shop/platform', NULL, 1, 0, 'C', '0', '0', '', 'date-range', 'admin', '2024-04-12 16:58:07', 'admin', '2024-06-04 10:20:36', '');
INSERT INTO `sys_menu` VALUES (2080, '售后处理查询', 'oms', 7, 3, 'result_list', 'afterSale/index', NULL, 1, 0, 'C', '0', '0', '', 'time', 'admin', '2024-04-15 14:23:40', 'admin', '2024-05-05 20:27:37', '');
INSERT INTO `sys_menu` VALUES (2084, '店铺商品管理', 'oms', 8, 1, 'goods_list', 'shop/goods/', NULL, 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2024-04-15 14:52:16', 'admin', '2024-04-15 14:52:27', '');
INSERT INTO `sys_menu` VALUES (2085, '采购账单管理', NULL, 4, 4, 'bill', 'scm/purchase/bill', NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2024-04-24 17:03:07', 'admin', '2024-05-02 10:59:08', '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int(0) DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 452 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (415, '店铺订单', 5, 'cn.qihangerp.api.controller.ErpOrderController.export()', 'POST', 1, 'admin', NULL, '/api/order/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-08 14:50:58', 2385);
INSERT INTO `sys_oper_log` VALUES (416, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"createBy\":\"admin\",\"discountAmount\":0,\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, 'Cannot invoke \"java.lang.Double.doubleValue()\" because the return value of \"cn.qihangerp.domain.ErpOrder.getGoodsAmount()\" is null', '2024-05-09 09:25:50', 46);
INSERT INTO `sys_oper_log` VALUES (417, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"createBy\":\"admin\",\"discountAmount\":0,\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, 'Cannot invoke \"java.lang.Double.doubleValue()\" because the return value of \"cn.qihangerp.domain.ErpOrder.getGoodsAmount()\" is null', '2024-05-09 09:34:10', 451017);
INSERT INTO `sys_oper_log` VALUES (418, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":null,\"city\":\"深圳市\",\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"A451220036332\",\"params\":{},\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"shopId\":1,\"town\":\"福田区\"}', '{\"msg\":\"请填写商品价格！\",\"code\":1503}', 0, NULL, '2024-05-09 09:34:40', 38);
INSERT INTO `sys_oper_log` VALUES (419, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:35:41\",\"discountAmount\":0,\"goodsAmount\":21.0,\"itemList\":[{\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"isGift\":0,\"itemAmount\":21.0,\"quantity\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ship_status\' doesn\'t have a default value\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve cn.qihangerp.api.mapper.ErpOrderMapper.insertErpOrder-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order          ( order_num,             shop_type,             shop_id,                                                    refund_status,             order_status,             goods_amount,             discount_amount,             postage,             amount,             receiver_name,             receiver_phone,             address,                          province,             city,             town,                                                                                                                                  create_time,             create_by )           values ( ?,             ?,             ?,                                                    ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,                                                                                                                                  ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'ship_status\' doesn\'t have a default value\n; Field \'ship_status\' doesn\'t have a default value', '2024-05-09 09:35:49', 39515);
INSERT INTO `sys_oper_log` VALUES (420, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:37:14\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":43,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:37:15.161\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788382692918120449\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":43,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\n; Column \'shop_id\' cannot be null', '2024-05-09 09:37:21', 21750);
INSERT INTO `sys_oper_log` VALUES (421, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"福田路1903实际广场A栋89层8903房\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:41:47\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":44,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:41:47.788\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788383836272807937\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":44,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A451220036332\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382222220\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"福田区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'shop_id\' cannot be null\n; Column \'shop_id\' cannot be null', '2024-05-09 09:41:47', 102728);
INSERT INTO `sys_oper_log` VALUES (422, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":null,\"city\":\"深圳市\",\"goodsAmount\":null,\"itemList\":[{\"goodsImg\":\"\",\"goodsNum\":\"\",\"goodsPrice\":null,\"goodsSpec\":\"\",\"goodsTitle\":\"\",\"itemAmount\":null,\"remark\":\"\",\"specNum\":\"\"}],\"orderNum\":\"AD580023566000\",\"params\":{},\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"shopId\":1,\"town\":\"南山区\"}', '{\"msg\":\"请填写商品价格！\",\"code\":1503}', 0, NULL, '2024-05-09 09:43:00', 34);
INSERT INTO `sys_oper_log` VALUES (423, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:43:18\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":45,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:43:18.06\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788384214921965569\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":45,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'ship_status\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'ship_status\' cannot be null\n; Column \'ship_status\' cannot be null', '2024-05-09 09:43:18', 9190);
INSERT INTO `sys_oper_log` VALUES (424, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:44:15\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":46,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:44:16.002\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1788384457944158210\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":46,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'order_num\' cannot be null\r\n### The error may exist in file [D:\\dev\\projects\\qihang.ecom.erp\\api\\target\\classes\\mapper\\api\\ErpOrderMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into erp_sale_order_item(shop_id,order_id,supplier_id,ship_type,ship_status,order_num,order_item_num, goods_id, spec_id, goods_title, goods_img, goods_num, goods_spec, spec_num, goods_price, item_amount, quantity, remark, is_gift, refund_count, order_status,refund_status, create_time, create_by, update_time, update_by) values                  ( ?,?,?,?,?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'order_num\' cannot be null\n; Column \'order_num\' cannot be null', '2024-05-09 09:44:16', 4471);
INSERT INTO `sys_oper_log` VALUES (425, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"实际广场23309\",\"amount\":21.0,\"city\":\"深圳市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:47:54\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":47,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 09:47:54.252\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509448\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":47,\"orderItemNum\":\"AD580023566000\",\"orderNum\":\"AD580023566000\",\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"AD580023566000\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"广东省\",\"receiverName\":\"启航\",\"receiverPhone\":\"1382023320\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"南山区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 09:47:54', 4051);
INSERT INTO `sys_oper_log` VALUES (426, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"阿迪达斯打发打发\",\"amount\":21.0,\"city\":\"市辖区\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:04:50\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":48,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:04:50.233\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509449\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":48,\"orderItemNum\":\"A135822662000012\",\"orderNum\":\"A135822662000012\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\"}],\"orderNum\":\"A135822662000012\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"上海市\",\"receiverName\":\"启航\",\"receiverPhone\":\"136982222\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"黄浦区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:04:50', 178217);
INSERT INTO `sys_oper_log` VALUES (427, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"aaddfd\",\"amount\":21.0,\"city\":\"大同市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:12:21\",\"discountAmount\":0,\"goodsAmount\":21.0,\"id\":50,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:12:21.375\",\"goodsId\":439,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"goodsNum\":\"HNP182\",\"goodsPrice\":21.0,\"goodsSpec\":\"浅蓝色 2XL \",\"goodsTitle\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"id\":\"1785584827112509451\",\"isGift\":0,\"itemAmount\":21.0,\"orderId\":50,\"orderItemNum\":\"SF137003620200\",\"orderNum\":\"SF137003620200\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":439,\"specNum\":\"HNP1825005\",\"supplierId\":26}],\"orderNum\":\"SF137003620200\",\"orderStatus\":1,\"params\":{},\"postage\":0,\"province\":\"山西省\",\"receiverName\":\"A\",\"receiverPhone\":\"136000000\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"平城区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:12:21', 34870);
INSERT INTO `sys_oper_log` VALUES (428, '店铺订单', 1, 'cn.qihangerp.api.controller.ErpOrderController.add()', 'POST', 1, 'admin', NULL, '/api/order', '127.0.0.1', '内网IP', '{\"address\":\"AAAA\",\"amount\":66.0,\"city\":\"邯郸市\",\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:19:28\",\"discountAmount\":0,\"goodsAmount\":66.0,\"id\":51,\"itemList\":[{\"createBy\":\"admin\",\"createTime\":\"2024-05-09 10:19:28.933\",\"goodsId\":1228,\"goodsImg\":\"https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg\",\"goodsNum\":\"GZYYZ7277\",\"goodsPrice\":54.0,\"goodsSpec\":\"咖啡色 均码 \",\"goodsTitle\":\"GZYYZ7277复古显瘦灯芯绒a字半身裙\",\"id\":\"1785584827112509452\",\"isGift\":0,\"itemAmount\":54.0,\"orderId\":51,\"orderItemNum\":\"A13885020023320\",\"orderNum\":\"A13885020023320\",\"orderStatus\":1,\"quantity\":1,\"refundCount\":0,\"refundStatus\":1,\"remark\":\"\",\"shipStatus\":0,\"shopId\":1,\"specId\":1228,\"specNum\":\"GZYYZ72773100\",\"supplierId\":32}],\"orderNum\":\"A13885020023320\",\"orderStatus\":1,\"orderTime\":\"2024-05-09 10:19:20\",\"params\":{},\"postage\":0,\"province\":\"河北省\",\"receiverName\":\"Q\",\"receiverPhone\":\"13582202330\",\"refundStatus\":1,\"shipStatus\":0,\"shopId\":1,\"shopType\":99,\"town\":\"复兴区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 10:19:29', 22863);
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-12-29 16:53:03\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"销售管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"sale\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-11 09:16:33', 26);
INSERT INTO `sys_oper_log` VALUES (430, '采购订单', 1, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.add()', 'POST', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"contactId\":33,\"createBy\":\"admin\",\"goodsList\":[{\"amount\":210,\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"colorValue\":\"浅蓝色\",\"goodsId\":29,\"id\":439,\"name\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"number\":\"HNP182\",\"purPrice\":21,\"qty\":10,\"sizeValue\":\"2XL\",\"specNum\":\"HNP1825005\",\"styleValue\":\"\"}],\"orderAmount\":210,\"orderDate\":\"2024-05-25 00:00:00\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:06', 58);
INSERT INTO `sys_oper_log` VALUES (431, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"id\":469,\"optionType\":\"audit\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:16', 15);
INSERT INTO `sys_oper_log` VALUES (432, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"confirmUser\":\"q\",\"id\":469,\"optionType\":\"confirm\",\"totalAmount\":210,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:21', 31);
INSERT INTO `sys_oper_log` VALUES (433, '采购订单', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderController.edit()', 'PUT', 1, 'admin', NULL, '/purchase/purchaseOrder', '127.0.0.1', '内网IP', '{\"auditUser\":\"q\",\"confirmUser\":\"q\",\"id\":469,\"optionType\":\"SupplierShip\",\"shipCompany\":\"菜鸟速递\",\"shipCost\":0,\"shipNo\":\"qdd\",\"supplierDeliveryTime\":\"2024-05-25 00:00:00\",\"totalAmount\":210,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:36', 43);
INSERT INTO `sys_oper_log` VALUES (434, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.confirmReceipt()', 'PUT', 1, 'admin', NULL, '/purchase/PurchaseOrderShip', '127.0.0.1', '内网IP', '{\"backCount\":0,\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:35:36\",\"freight\":0,\"id\":469,\"orderDate\":\"2024-05-25\",\"orderGoodsUnit\":1,\"orderNo\":\"PUR20240525093505\",\"orderSpecUnit\":1,\"orderSpecUnitTotal\":10,\"params\":{},\"receiptTime\":\"2024-05-25 00:00:00\",\"remark\":\"2\",\"shipCompany\":\"菜鸟速递\",\"shipNo\":\"qdd\",\"shipTime\":\"2024-05-25\",\"status\":0,\"stockInCount\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:53', 14);
INSERT INTO `sys_oper_log` VALUES (435, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.createStockInEntry()', 'POST', 1, 'admin', NULL, '/purchase/PurchaseOrderShip/createStockInEntry', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:35:06\",\"goodsList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg\",\"colorValue\":\"浅蓝色\",\"goodsId\":29,\"goodsName\":\"HNP182弹力紧身贴标牛仔短裤女ins\",\"goodsNum\":\"HNP182\",\"id\":1965,\"inQty\":10,\"orderId\":469,\"params\":{},\"quantity\":10,\"remark\":\"\",\"sizeValue\":\"2XL\",\"specId\":439,\"specNum\":\"HNP1825005\",\"styleValue\":\"\"}],\"id\":469,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 09:35:53\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:35:56', 44);
INSERT INTO `sys_oper_log` VALUES (436, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.confirmReceipt()', 'PUT', 1, 'admin', NULL, '/purchase/PurchaseOrderShip', '127.0.0.1', '内网IP', '{\"backCount\":0,\"createBy\":\"admin\",\"createTime\":\"2024-04-24 16:22:40\",\"freight\":12,\"id\":468,\"orderDate\":\"2024-04-24\",\"orderGoodsUnit\":1,\"orderNo\":\"PUR20240424162152\",\"orderSpecUnit\":1,\"orderSpecUnitTotal\":10,\"params\":{},\"receiptTime\":\"2024-05-25 00:00:00\",\"remark\":\"11111\",\"shipCompany\":\"菜鸟速递\",\"shipNo\":\"SF232323\",\"shipTime\":\"2024-04-24\",\"status\":0,\"stockInCount\":0,\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:36:46', 10);
INSERT INTO `sys_oper_log` VALUES (437, '采购订单物流', 2, 'cn.qihangerp.api.controller.ScmPurchaseOrderShipController.createStockInEntry()', 'POST', 1, 'admin', NULL, '/purchase/PurchaseOrderShip/createStockInEntry', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-04-24 16:21:52\",\"goodsList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1964,\"inQty\":10,\"orderId\":468,\"params\":{},\"quantity\":10,\"remark\":\"\",\"sizeValue\":\"2XL\",\"specId\":1327,\"specNum\":\"JKL31120705\",\"styleValue\":\"\"}],\"id\":468,\"params\":{},\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 09:36:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 09:40:03', 30);
INSERT INTO `sys_oper_log` VALUES (438, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":0,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"11\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-25 10:21:12', 27645);
INSERT INTO `sys_oper_log` VALUES (439, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:20:56\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:22:35', 68);
INSERT INTO `sys_oper_log` VALUES (440, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:26:14', 104435);
INSERT INTO `sys_oper_log` VALUES (441, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:29:16', 69563);
INSERT INTO `sys_oper_log` VALUES (442, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":1794181606552338400,\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:33:47', 58368);
INSERT INTO `sys_oper_log` VALUES (443, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:22:35\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":\"1794181606552338400\",\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":2,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:35:52', 61);
INSERT INTO `sys_oper_log` VALUES (444, '入库单', 2, 'cn.qihangerp.api.controller.WmsStockInEntryController.stockIn()', 'POST', 1, 'admin', NULL, '/wms/WmsStockInEntry/stockIn', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"id\":\"1794181606514589698\",\"sourceGoodsUnit\":1,\"sourceId\":468,\"sourceNo\":\"PUR20240424162152\",\"sourceSpecUnit\":1,\"sourceSpecUnitTotal\":10,\"sourceType\":1,\"status\":1,\"stockInNum\":\"20240525094003\",\"stockInOperator\":\"admin\",\"stockInOperatorId\":1,\"stockInTime\":\"2024-05-25 10:19:41\",\"updateBy\":\"admin\",\"updateTime\":\"2024-05-25 10:35:52\",\"wmsStockInEntryItemList\":[{\"colorImage\":\"https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg\",\"colorValue\":\"烟灰色\",\"createBy\":\"admin\",\"createTime\":\"2024-05-25 09:40:04\",\"entryId\":\"1794181606514589698\",\"goodsId\":68,\"goodsName\":\"JKL3112松紧腰束脚哈伦裤\",\"goodsNum\":\"JKL3112\",\"id\":\"1794181606552338433\",\"inQuantity\":0,\"locationId\":20,\"locationNum\":\"A01-1-16\",\"originalQuantity\":10,\"quantity\":1,\"remark\":\"\",\"sizeValue\":\"2XL\",\"sourceId\":468,\"sourceItemId\":1964,\"sourceType\":1,\"specId\":1327,\"specNum\":\"JKL31120705\",\"status\":0,\"styleValue\":\"\"}]}', '{\"msg\":\"入库成功\",\"code\":200}', 0, NULL, '2024-05-25 10:36:15', 34);
INSERT INTO `sys_oper_log` VALUES (445, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-12-29 16:53:03\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":5,\"menuName\":\"订单管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/sale\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:20:20', 43);
INSERT INTO `sys_oper_log` VALUES (446, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shipping/ewaybillPrint/index\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"面单打印\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":6,\"path\":\"ewaybill_print\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:21:14', 10);
INSERT INTO `sys_oper_log` VALUES (447, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"sale/order/index\",\"createTime\":\"2023-12-31 20:05:05\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"订单处理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":5,\"path\":\"order_list\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-03 16:21:56', 10);
INSERT INTO `sys_oper_log` VALUES (448, '菜单管理', 2, 'cn.qihangerp.api.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"shop/platform\",\"createTime\":\"2024-04-12 16:58:07\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2079,\"menuName\":\"电商平台设置\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1,\"path\":\"platform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 10:20:36', 28);
INSERT INTO `sys_oper_log` VALUES (449, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"company\":\"华衣云商\",\"createTime\":\"2024-06-04 11:20:13\",\"ename\":\"kuaishou\",\"id\":8,\"isDelete\":0,\"name\":\"梦小妮牛仔裤-快手\",\"nickName\":\"快手小店\",\"orderNum\":0,\"platform\":8,\"remark\":\"1\",\"sellerShopId\":12,\"updateTime\":\"2024-06-04 12:07:55.484\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:07:55', 211);
INSERT INTO `sys_oper_log` VALUES (450, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessToken\":\"81_YbU9QodS3Li-hdOwls3ytkVGG2f0OpSOLzSzgiEV66YVWMKU6xkzFJAOGlqOQYSEJcldFTQDW0R4JdOSt2-34obCuCsiddbpswOmlIrvFNhy5iPp3SaKpBbWfXASUYjAFAOQU\",\"appKey\":\"wx720ff3dc8618810700\",\"appSercet\":\"b2fd7647ebcd88860de8087eb3ac425400\",\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:19:54\",\"ename\":\"wei\",\"id\":2,\"isDelete\":0,\"name\":\"视频号店铺-测试\",\"nickName\":\"视频号-梦小妮\",\"orderNum\":0,\"platform\":2,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-04 12:32:52.048\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:32:52', 114);
INSERT INTO `sys_oper_log` VALUES (451, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessToken\":\"81_YbU9QodS3Li-hdOwls3ytkVGG2f0OpSOLzSzgiEV66YVWMKU6xkzFJAOGlqOQYSEJcldFTQDW0R4JdOSt2-34obCuCsiddbpswOmlIrvFNhy5iPp3SaKpBbWfXASUYjAFAOQU\",\"appKey\":\"wx720ff3dc86188107\",\"appSercet\":\"b2fd7647ebcd88860de8087eb3ac4254\",\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:19:54\",\"ename\":\"wei\",\"id\":2,\"isDelete\":0,\"name\":\"视频号店铺-测试\",\"nickName\":\"视频号-梦小妮\",\"orderNum\":0,\"platform\":2,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-04 12:32:59.81\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 12:32:59', 9);
INSERT INTO `sys_oper_log` VALUES (452, '店铺', 2, 'cn.qihangerp.api.controller.ShopController.edit()', 'PUT', 1, 'admin', NULL, '/shop/shop', '127.0.0.1', '内网IP', '{\"accessExpiresIn\":0,\"accessToken\":\"86f2571c06714f0eaf02ce3924e0698b064f03c0\",\"accessTokenBegin\":0,\"company\":\"煜梦服饰\",\"createTime\":\"2024-06-04 11:20:04\",\"ename\":\"pdd\",\"id\":5,\"isDelete\":0,\"name\":\"梦小妮-拼多多\",\"nickName\":\"拼多多-梦小妮\",\"orderNum\":0,\"platform\":5,\"refreshTokenTimeout\":0,\"remark\":\"\",\"sellerShopId\":100061591,\"updateTime\":\"2024-06-11 13:37:51.285\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-11 13:37:51', 81);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件名',
  `original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'URL地址',
  `object_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '对象名',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '桶名',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-15 10:29:55', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_task
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task`  (
  `id` int(0) NOT NULL,
  `task_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cron` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES (1, '更新淘宝订单', '-', NULL, '定时更新淘宝订单', '2024-03-07 09:52:40');
INSERT INTO `sys_task` VALUES (2, '更新京东订单', '-', NULL, '定时更新京东订单', '2024-03-07 09:23:36');

-- ----------------------------
-- Table structure for sys_task_logs
-- ----------------------------
DROP TABLE IF EXISTS `sys_task_logs`;
CREATE TABLE `sys_task_logs`  (
  `id` bigint(0) NOT NULL COMMENT '主键ID',
  `task_id` int(0) DEFAULT NULL COMMENT '任务ID',
  `result` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结果',
  `start_time` datetime(0) DEFAULT NULL COMMENT '开始运行时间',
  `end_time` datetime(0) DEFAULT NULL COMMENT '结束时间',
  `status` int(0) DEFAULT NULL COMMENT '状态1运行中，2已结束',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '启航', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-13 10:37:46', 'admin', '2023-08-07 19:31:37', '', '2024-06-13 10:37:45', '管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'qihang', 'qihang', '00', 'qihang@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-08-07 19:31:37', 'admin', '2023-08-07 19:31:37', 'admin', '2024-01-05 18:29:55', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'admin11', 'aa', '00', '', '', '1', '', '$2a$10$VD49q2rn1ATpQDZJJrmJjuG52b4EkOTTZ0MPbRRmcqEYLmB5mAMsG', '0', '2', '', NULL, 'admin', '2024-04-24 11:06:27', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
