/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : qihang-oms

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 28/02/2024 20:24:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '淘宝平台', 0, 99, '/tao', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '京东平台', 0, 1, '/jd', 'Layout', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-01-06 23:55:21', '至简官网地址');
INSERT INTO `sys_menu` VALUES (3, '抖店平台', 0, 9, '/dou', 'Layout', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-29 13:29:44', '', '', '');
INSERT INTO `sys_menu` VALUES (4, '拼多多平台', 0, 2, '/pdd', 'Layout', '', 1, 0, 'M', '0', '0', '', 'peoples', 'admin', '2023-12-29 16:53:03', 'admin', '2024-01-03 14:06:38', '');
INSERT INTO `sys_menu` VALUES (5, '系统设置', 0, 99, '/system', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '订单管理', 1, 1, 'order_list', 'tao/order/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '商品管理', 1, 2, 'tao/goods/list', 'system/role/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-27 15:00:27', '', '', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '售后管理', 1, 3, 'tao/refund/list', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', '', '', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '店铺管理', 1, 4, 'tao/shop', 'system/dept/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '订单管理', 2, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '商品管理', 2, 6, 'jd/goods/list', 'system/dict/index', '', 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '售后设置', 2, 7, 'jd/refund/list', 'system/config/index', '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2023-12-27 15:00:27', '', '', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '店铺管理', 2, 8, 'jd/shop', 'system/notice/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', '', '', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '订单管理', 3, 9, 'dou/order/list', 'scm/supplier/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 09:14:02', 'admin', '2023-12-29 09:17:27.514466', '');
INSERT INTO `sys_menu` VALUES (109, '商品管理', 3, 10, 'dou/goods/list', 'goods/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 13:31:01', 'admin', '2023-12-29 15:02:40.869685', '');
INSERT INTO `sys_menu` VALUES (110, '售后管理', 3, 88, 'dou/refund/list', 'goods/category/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 13:32:41', 'admin', '2023-12-29 15:02:22.220534', '');
INSERT INTO `sys_menu` VALUES (111, '店铺管理', 3, 99, 'dou/shop', 'goods/brand/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-29 13:34:49', 'admin', '2023-12-29 13:58:43.724029', '');
INSERT INTO `sys_menu` VALUES (112, '订单管理', 4, 1, 'dou/order/list', 'scm/purchase/order', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2023-12-29 16:36:57.653118', '');
INSERT INTO `sys_menu` VALUES (113, '商品管理', 4, 2, 'pdd/goods/list', 'scm/purchase/contract', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 16:39:43', 'admin', '2023-12-30 18:07:58.363465', '');
INSERT INTO `sys_menu` VALUES (114, '售后管理', 4, 3, 'pdd/refund/list', 'scm/purchase/ship', '', 1, 0, 'C', '0', '0', '', 'system', 'admin', '2023-12-29 16:45:42', 'admin', '2023-12-30 20:48:47.282509', '');
INSERT INTO `sys_menu` VALUES (115, '店铺管理', 4, 4, 'pdd/shop', 'scm/purchase/cost', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-29 16:47:07', 'admin', '2024-01-13 18:32:21', '');
INSERT INTO `sys_menu` VALUES (116, '用户管理', 5, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (117, '菜单管理', 5, 1, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');

-- ----------------------------
-- Table structure for sys_platform
-- ----------------------------
DROP TABLE IF EXISTS `sys_platform`;
CREATE TABLE `sys_platform`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_platform
-- ----------------------------
INSERT INTO `sys_platform` VALUES (1, '天猫', 'TMALL', NULL, NULL);
INSERT INTO `sys_platform` VALUES (2, '京东', 'JD', NULL, NULL);
INSERT INTO `sys_platform` VALUES (3, '抖店', 'DOUDIAN', NULL, NULL);
INSERT INTO `sys_platform` VALUES (4, '拼多多', 'PDD', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '启航oms', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-27 09:30:34', 'admin', '2023-08-07 19:31:37', '', '2024-02-27 09:30:34', '管理员');

-- ----------------------------
-- Table structure for tao_goods
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods`;
CREATE TABLE `tao_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `iid` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '商品数字id',
  `title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `nick` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品类型(fixed:一口价;auction:拍卖)注：取消团购',
  `cid` bigint NULL DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `seller_cids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品所属的店铺内卖家自定义类目列表',
  `pic_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主图',
  `num` int NULL DEFAULT NULL COMMENT '商品数量',
  `props` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品属性 格式：pid:vid;pid:vid',
  `valid_thru` int NULL DEFAULT NULL COMMENT '有效期,7或者14（默认是7天）',
  `has_discount` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支持会员打折,true/false',
  `has_invoice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否有发票,true/false',
  `has_warranty` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否有保修,true/false',
  `has_showcase` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '橱窗推荐,true/false',
  `modified` datetime NULL DEFAULT NULL COMMENT '商品修改时间（格式：yyyy-MM-dd HH:mm:ss）',
  `delist_time` datetime NULL DEFAULT NULL COMMENT '下架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `postage_id` int NULL DEFAULT NULL COMMENT '宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。需要授权才能获取。',
  `list_time` datetime NULL DEFAULT NULL COMMENT '上架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品价格，格式：5.00；单位：元；精确到：分',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_ex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否在外部网店显示',
  `is_virtual` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '虚拟商品的状态字段',
  `is_taobao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否在淘宝显示',
  `sold_quantity` int NULL DEFAULT 0 COMMENT '商品销量',
  `is_cspu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为达尔文挂接成功了的商品',
  `first_starts_time` datetime NULL DEFAULT NULL COMMENT '商品首次上架时间',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `erp_goods_id` int NULL DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_goods
-- ----------------------------
INSERT INTO `tao_goods` VALUES (1, '392657083276', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/ed63f69d82e863972d1633cad97352a2.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2720218026', '2022-07-21 16:44:00', NULL, NULL, '1', NULL, NULL, 1024, NULL, NULL, 5, 9, '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (2, '393216514010', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/cafc8ca9dbc964862ee35c4429383f74.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2720220608', '2022-07-22 22:18:00', NULL, NULL, '1', NULL, NULL, 56, NULL, NULL, 5, 11, '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (3, '393654097571', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-07-23/58da809ecc22d16d8dc360d31e4cd064.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN270', '2022-07-23 22:34:00', NULL, NULL, '1', NULL, NULL, 30, NULL, NULL, 5, 0, '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (4, '393659007414', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-24/1c30e57d86fc72f3e5ba10ec860b24d2.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2720220858', '2022-07-23 22:50:00', NULL, NULL, '1', NULL, NULL, 486, NULL, NULL, 5, 10, '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (5, '394814708558', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/f671e813ff967e02f4421229be8f1c4a.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL8990', '2022-07-26 21:48:00', NULL, NULL, '1', NULL, NULL, 45, NULL, NULL, 5, 61, '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (6, '395429166799', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/b1405a6b88893d52fd4197dcb652e7fa.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9950', '2022-07-28 14:49:00', NULL, NULL, '1', NULL, NULL, 141, NULL, NULL, 5, 60, '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (7, '395930868595', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-24/424f2fe63587326c7c75973c42572176.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0708', '2022-07-29 20:01:00', NULL, NULL, '1', NULL, NULL, 69, NULL, NULL, 5, 0, '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (8, '398085327353', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-04/c18d2469f3eb07968f4dd36ab4a00486.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (9, '398667645632', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/e4021e68d40d8919bb319b7fe89f1b31.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-08-06 11:07:00', NULL, NULL, '1', NULL, NULL, 41, NULL, NULL, 5, 0, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (10, '401654801488', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-22/b99ead8c07a6743735e7e586bdb3eca4.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0025', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (11, '401781697078', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/ecef07b65c530ba38561516ecb5c343b.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2820210678', '2022-08-13 20:59:00', NULL, NULL, '1', NULL, NULL, 23, NULL, NULL, 5, 16, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (12, '401781826934', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/a98e7a25ec6651fcdadfacd09872b47b.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0014', '2022-08-13 21:00:00', NULL, NULL, '1', NULL, NULL, 68, NULL, NULL, 5, 18, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (13, '401993680807', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-14/edfc54f4eebf2392c7d6675a21a5a7c7.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (14, '403434723538', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/daee228c044d11aef6a59ba707284da8.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN20220012', '2022-08-18 00:11:00', NULL, NULL, '1', NULL, NULL, 42, NULL, NULL, 5, 24, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (15, '403438406420', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-18/3f2fbb00a6cd6ba918ab7fcb923fc24c.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0010', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (16, '403654853255', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/0317d2b3193307c71ffa05fd80fb6860.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN015', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (17, '403877249755', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/714ddb39d6867687ed2a3f9be6789889.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yfz-tb-670085078625', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (18, '403877355587', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/597fa2707d56eb0c91e3c94f88acdb0b.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yfz-tb-638661096456', NULL, NULL, NULL, '1', NULL, NULL, 1, NULL, NULL, 5, 0, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (19, '403877444479', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-14/c0889b9ba1dc4d1884b8cdfae91889a9.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yfz-tb-639346263403', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (20, '403877488703', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-24/9f69abd98877eb721a475af487bae74e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN023', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 27, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (21, '403877607629', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/c21e2ae2c578ce11e9abc6dece6d6c0e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN20220024', '2022-08-19 15:49:00', NULL, NULL, '1', NULL, NULL, 10, NULL, NULL, 5, 23, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (22, '403877716388', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/c1405585b4a6135a5b54dfb93c14893f.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0029', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (23, '404300819650', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-20/f90369c63c3cca6aa012e71fbeeb0d8d.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (24, '408225561862', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/109763d466358b6845392d07323ae03c.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T610041890003', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (25, '409855932902', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-15/d2f7884f4ea03f5580843171d190c407.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN180', '2022-09-03 20:27:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (26, '409864423309', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/3a3aa28f0de00054d4ebb3bec4190432.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN106', '2022-09-03 20:38:00', NULL, NULL, '1', NULL, NULL, 12, NULL, NULL, 5, 37, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (27, '409866847439', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/316f35a521c20cc7aa5f3e5d6f48936a.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN222', '2022-09-03 20:45:00', NULL, NULL, '1', NULL, NULL, 3, NULL, NULL, 5, 42, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (28, '409879757750', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/a9cfcd02574bc7babd42d1ac9c32bc7d.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN620', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (29, '409883128005', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/03500eb346573bc8804e5a8f053b52ed.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN621', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 34, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (30, '409885859735', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/d7cb2c2f269b9e70fae7cf08c16de704.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN630', '2022-09-03 21:45:00', NULL, NULL, '1', NULL, NULL, 1, NULL, NULL, 5, 0, '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (31, '410305683990', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-04/ef88fbd43b7d99b8916087a3843c0cdc.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN660', '2022-09-04 23:19:00', NULL, NULL, '1', NULL, NULL, 1, NULL, NULL, 5, 44, '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (32, '410308626596', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-04/b276eaa49fd18e61d0f181cf01dd8256.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN662', '2022-09-04 23:25:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 35, '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (33, '410688391724', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/a1c7708baeebd04294489303981bf1a4.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN663', '2022-09-05 22:54:00', NULL, NULL, '1', NULL, NULL, 2, NULL, NULL, 5, 38, '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (34, '410692286065', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/03d7e1fe2aac50ffea1f54332de9cc48.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN665', '2022-09-05 22:59:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (35, '410693529689', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/d20f19284a3ec6e8d5dfaa22fb60c4da.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN666', '2022-09-05 23:04:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (36, '410694952121', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/8bd4388f10a7c0fedef8d1513104b1ab.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN667', '2022-09-05 23:08:00', NULL, NULL, '1', NULL, NULL, 17, NULL, NULL, 5, 41, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (37, '410695996318', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/17d871fc332e40f04caff43fa952fed0.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN668', '2022-09-05 23:12:00', NULL, NULL, '1', NULL, NULL, 1, NULL, NULL, 5, 40, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (38, '410697172304', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/d611d19b8e7b76dc77287a4709cc3cfb.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN669', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (39, '411361540533', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/895026ef7ecadcd6f9fda2cfe446ac90.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN670', '2022-09-07 18:43:00', NULL, NULL, '1', NULL, NULL, 7, NULL, NULL, 5, 28, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (40, '411366495987', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/0194e1652ad7a11307157f30cb9e4f6f.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '665779472192', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (41, '411370161999', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/f5abdaf1b5b54114f50b08a45ed4a3e9.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '670461866109', '2022-09-07 18:58:00', NULL, NULL, '1', NULL, NULL, 2, NULL, NULL, 5, 0, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (42, '411378921081', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/cbebf578bbc128c9c701d6ca8bfd5f98.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '637993903547', '2022-09-07 19:26:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (43, '411379965590', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/b66cca1fa97d2f8abdad3af6b76717f8.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '668784844135', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (44, '411726911306', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/87f687ae1ad35b37f41184fc9751775a.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN686', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 45, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (45, '411728903206', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-08/9c2159800f4698b5ba78f39bb18fedc8.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (46, '411729694401', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/6e54ebddf5ae7f009c369c09b42deed2.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN692', '2022-09-08 19:14:00', NULL, NULL, '1', NULL, NULL, 7, NULL, NULL, 5, 36, '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (47, '411731178725', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-08/3d52f55f19e6062d22b9f92bbd625f60.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN694', '2022-09-08 19:19:00', NULL, '供应商无货准备下架', '1', NULL, NULL, 1, NULL, NULL, 5, 43, '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (48, '411732581938', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-27/01b7f53789a750c360e7e51850618299.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN697', '2022-09-08 19:22:00', NULL, NULL, '1', NULL, NULL, 8, NULL, NULL, 5, 32, '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (49, '412120506598', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/9341ee50b7003832ccee394d68a340bf.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0801', '2022-09-09 21:35:00', NULL, NULL, '1', NULL, NULL, 63, NULL, NULL, 5, 33, '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (50, '412133591017', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/6e17994bb795bfa7f00c1d89c24afb16.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN801', '2022-09-09 22:25:00', NULL, NULL, '1', NULL, NULL, 4, NULL, NULL, 5, 31, '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (51, '412137132774', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/779f5bd008d0a9f2c7ec85c4524ee087.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN802', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (52, '412138772165', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/0443f63986467ecc60b800b87f994ee0.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN805', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (53, '412139652425', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/b46bd47c3fdd61fcf36bff584778562a.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN807', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (54, '414594889986', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-16/238138bf7bc905fdd2b874e2f1e04059.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-09-16 21:53:00', NULL, NULL, '1', NULL, NULL, 3, NULL, NULL, 5, 0, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (55, '415222366821', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/eb3104f22378716c41323375ebf61a71.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-09-18 15:28:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (56, '418757536479', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/a2937266502b0e40b13c5d297f65f69a.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL805', '2022-09-28 19:06:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 47, '2022-10-08 20:36:23');
INSERT INTO `tao_goods` VALUES (57, '420535061032', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/64a7ae96630893e2986678cc0dbe85fa.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9938', '2022-10-06 13:06:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-08 20:36:23');
INSERT INTO `tao_goods` VALUES (58, '3572881699002051281', NULL, NULL, NULL, NULL, NULL, NULL, 'https://cbu01.alicdn.com/img/ibank/O1CN01PyeFAc2FOyCUPpZr7_!!2208857268871-0-cib.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN660', '2022-10-08 20:45:47', NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, 22, 44, '2022-10-08 20:45:53');
INSERT INTO `tao_goods` VALUES (59, '398847598958', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-06/1ddd0e51a7d17a4cbbb0b654d93bc03e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-08-06 20:45:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (60, '399063348248', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-07/a5377af55bc46da117fb838acefd4752.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-08-07 11:48:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (61, '399063851678', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/c245ce52dcf00faeb70fbeb70ff95759.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't651428823385', '2022-08-07 11:50:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (62, '407249067559', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-28/2f00e9b96e58363c6163eee632053cb0.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 't622135144835', '2022-08-28 11:05:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (63, '407356168572', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-28/9ec229b3320b6323a0af604193a48f94.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T624078788603', '2022-08-28 17:03:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (64, '408246660557', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/104e8f9c2637c2f40adc79cb4d632b0e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T610270951823', '2022-08-30 19:46:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (65, '408275614162', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/bd786b8f2ea7621fa6b25b61936da0ed.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'T610041890003', '2022-08-30 21:07:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (66, '411405520617', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/f44e84454b21878f86aa369afe25db9b.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '675027903686', '2022-09-07 21:01:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (67, '415140360909', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/7c541fde9014bf21b704b2f0c7222972.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN014', '2022-09-18 11:04:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (68, '415209134293', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/d1310043dee0d103927764faff1472a8.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2022-09-18 15:06:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (69, '418749496896', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-08/de29e8e044c1dece30901ede5b2147bb.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL805', '2022-09-28 18:48:00', NULL, '10.8全站推广出1单', '1', NULL, NULL, 0, NULL, NULL, 14, 47, '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (70, '421025454368', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-08/ccaab6402c058b1785e734f427c0f454.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL8990', '2022-10-08 13:27:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 0, '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (71, '421031955741', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-08/bf6649625f7a93f810c190c4eb6836bc.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0801', '2022-10-08 13:54:00', NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 14, 33, '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (72, '421771728900', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-11/74a3befbd651d6346d88a1dadb2f2038.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0801', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 33, '2022-10-11 19:26:16');
INSERT INTO `tao_goods` VALUES (73, '422383287651', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-13/b33268c1cf711a642e875428cab25dca.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN20220020', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 22, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (74, '422437259657', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-13/2c846bb7a2e6c721bf568b7c700ad5c6.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN180', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 48, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (75, '422742565233', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-14/0a7922b5a51156df616b9c0f799f7d35.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN665', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (76, '422744325067', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-14/a0e22024b4cfa11155cf757a9ff15b65.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (77, '423260246680', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-16/1db23144091189ca733a4b65741460d4.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (78, '423441709778', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/159c43ae0f01443810f4fb995e3661a6.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (79, '423486862283', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/72d62fa205cb8dcc0bfea512950bde89.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (80, '423492956829', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/7b0e9e0aa6ccc4db258f8f3272a352d0.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN683', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (81, '423502402446', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/5271991ad2674ff48d43edf9e7efed1e.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'HN0802', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (82, '423703312591', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-18/d194906f1b1f52cd52d166a4866ff5ef.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL333', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (83, '423758757026', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-18/a63bcd8016f12c69daa29d0233fc9880.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL906', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 55, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (84, '423990076571', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-19/12cb7a79e5365c49be8c43dfc7f5e456.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9098', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 49, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (85, '426190541480', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-27/279728174052d55e207e215fe84f03e9.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL3112', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-01 16:46:00');
INSERT INTO `tao_goods` VALUES (86, '426453461778', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-28/0a1915464ceeb27c320255acdf99e935.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL6010', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 54, '2022-11-01 16:46:01');
INSERT INTO `tao_goods` VALUES (87, '426460291580', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-29/01971b48a6ae4533c256274d122b7490.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9907', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 53, '2022-11-01 16:46:01');
INSERT INTO `tao_goods` VALUES (88, '429860405885', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-09/fb2edf70f36cbef1a8ee6019f19f523b.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9977', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 56, '2022-11-09 19:36:23');
INSERT INTO `tao_goods` VALUES (89, '429968867456', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-09/10709ca9f8cc1cf209602ae60ea55bcb.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL9962', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-09 19:36:23');
INSERT INTO `tao_goods` VALUES (90, '431646818746', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-15/28f855f48145107ce2aba17ce8b93f69.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL3689', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-15 18:43:39');
INSERT INTO `tao_goods` VALUES (91, '431656693618', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-15/35ff46e006092ca7ceb826857ddd38ac.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL6001', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 63, '2022-11-15 18:43:39');
INSERT INTO `tao_goods` VALUES (92, '432701863744', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-18/dc1beeb997c7c339ecf6130e6a982839.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL2035', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-19 17:21:15');
INSERT INTO `tao_goods` VALUES (93, '432930516051', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/9fe3b9a33770ff1c3fc31f0fc56e7fb0.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL1973', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (94, '432939563887', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/bfb8c3dbe870550cd8d75323822efa45.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL3705', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (95, '432951870483', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/9166c733d64538323e4d8a5e9dd4c143.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL1951', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (96, '432977920082', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-19/1cb96371ca0c0f4f9473f0ca8726ef22.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL016', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (97, '432987421029', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-19/13360e56062e9f960383f7a99eaf5d65.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL015', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (98, '433499680962', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/30d878d29b675481d678059ea15ddde3.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL016', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (99, '433495415698', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/a708a36aaf3a0bc9bd518d356f817ddd.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'JKL1856', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 0, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (100, '433742784706', NULL, NULL, NULL, NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-22/f1cb07df5e8ef2d11993c0415e0119f8.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'GZYYZ7277', NULL, NULL, NULL, '1', NULL, NULL, 0, NULL, NULL, 5, 65, '2022-11-30 14:18:24');
INSERT INTO `tao_goods` VALUES (101, '700462980460', NULL, NULL, NULL, NULL, NULL, NULL, 'https://gd2.alicdn.com/imgextra/i1/49616689/O1CN01ebLlLz1zHc5njEjYt_!!49616689.jpg_400x400.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'KH2012', '2023-02-09 00:00:00', NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, 6, 0, '2023-02-12 20:55:25');

-- ----------------------------
-- Table structure for tao_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods_sku`;
CREATE TABLE `tao_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tao_goods_id` bigint NOT NULL COMMENT '外键id',
  `num_iid` bigint NOT NULL COMMENT 'sku所属商品数字id',
  `iid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)',
  `sku_id` bigint NOT NULL COMMENT '商品skuid，阿里',
  `properties` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2',
  `properties_name` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……',
  `quantity` bigint NULL DEFAULT NULL COMMENT '属于这个sku的商品的数量，',
  `spec` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'specId',
  `price` double NULL DEFAULT NULL COMMENT '属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家设置的外部id。',
  `created` datetime NULL DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT 'sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku状态。	normal',
  `sku_spec_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `barcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品级别的条形码',
  `erp_goods_sku_id` int NULL DEFAULT NULL COMMENT 'erp商品SKUid',
  `erp_goods_id` int NULL DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2282 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_goods_sku
-- ----------------------------
INSERT INTO `tao_goods_sku` VALUES (1, 1, 392657083276, NULL, 1262178610550, NULL, NULL, 105, '复古蓝 S（80-95斤）', NULL, 'HN80264001', NULL, NULL, NULL, NULL, NULL, 400, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (2, 1, 392657083276, NULL, 1262178610548, NULL, NULL, 20, '黑灰色 XL（115-125斤）', NULL, 'HN80267504', NULL, NULL, NULL, NULL, NULL, 408, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (3, 1, 392657083276, NULL, 1262178610546, NULL, NULL, 20, '黑灰色 M（95-105斤）', NULL, 'HN80267502', NULL, NULL, NULL, NULL, NULL, 406, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (4, 1, 392657083276, NULL, 1262178610552, NULL, NULL, 105, '复古蓝 L（105-115斤）', NULL, 'HN80264003', NULL, NULL, NULL, NULL, NULL, 402, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (5, 1, 392657083276, NULL, 1262178610549, NULL, NULL, 20, '黑灰色 2XL（125-135斤）', NULL, 'HN80267505', NULL, NULL, NULL, NULL, NULL, 409, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (6, 1, 392657083276, NULL, 1236824368730, NULL, NULL, 20, '黑色 L（105-115斤）', NULL, '2720210080260103', NULL, NULL, NULL, NULL, NULL, 30, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (7, 1, 392657083276, NULL, 1262178610554, NULL, NULL, 115, '复古蓝 2XL（125-135斤）', NULL, 'HN80264005', NULL, NULL, NULL, NULL, NULL, 404, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (8, 1, 392657083276, NULL, 1236824368731, NULL, NULL, 20, '黑色 XL（115-125斤）', NULL, '2720210080260104', NULL, NULL, NULL, NULL, NULL, 31, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (9, 1, 392657083276, NULL, 1262178610553, NULL, NULL, 105, '复古蓝 XL（115-125斤）', NULL, 'HN80264004', NULL, NULL, NULL, NULL, NULL, 403, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (10, 1, 392657083276, NULL, 1262178610551, NULL, NULL, 105, '复古蓝 M（95-105斤）', NULL, 'HN80264002', NULL, NULL, NULL, NULL, NULL, 401, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (11, 1, 392657083276, NULL, 1236824368724, NULL, NULL, 212, '白色 M（95-105斤）', NULL, '2720210080260002', NULL, NULL, NULL, NULL, NULL, 24, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (12, 1, 392657083276, NULL, 1236824368737, NULL, NULL, 65, '宝蓝色 2XL（125-135斤）', NULL, '2720210080260205', NULL, NULL, NULL, NULL, NULL, 37, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (13, 1, 392657083276, NULL, 1262178610547, NULL, NULL, 20, '黑灰色 L（105-115斤）', NULL, 'HN80267503', NULL, NULL, NULL, NULL, NULL, 407, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (14, 1, 392657083276, NULL, 1236824368723, NULL, NULL, 223, '白色 S（80-95斤）', NULL, '2720210080260001', NULL, NULL, NULL, NULL, NULL, 23, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (15, 1, 392657083276, NULL, 1236824368742, NULL, NULL, 115, '浅蓝色 2XL（125-135斤）', NULL, '2720210080260305', NULL, NULL, NULL, NULL, NULL, 42, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (16, 1, 392657083276, NULL, 1236824368738, NULL, NULL, 112, '浅蓝色 S（80-95斤）', NULL, '2720210080260301', NULL, NULL, NULL, NULL, NULL, 38, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (17, 1, 392657083276, NULL, 1236824368740, NULL, NULL, 96, '浅蓝色 L（105-115斤）', NULL, '2720210080260303', NULL, NULL, NULL, NULL, NULL, 40, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (18, 1, 392657083276, NULL, 1236824368741, NULL, NULL, 122, '浅蓝色 XL（115-125斤）', NULL, '2720210080260304', NULL, NULL, NULL, NULL, NULL, 41, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (19, 1, 392657083276, NULL, 1236824368726, NULL, NULL, 204, '白色 XL（115-125斤）', NULL, '2720210080260004', NULL, NULL, NULL, NULL, NULL, 26, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (20, 1, 392657083276, NULL, 1236824368725, NULL, NULL, 193, '白色 L（105-115斤）', NULL, '2720210080260003', NULL, NULL, NULL, NULL, NULL, 25, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (21, 1, 392657083276, NULL, 1262178610545, NULL, NULL, 20, '黑灰色 S（80-95斤）', NULL, 'HN80267501', NULL, NULL, NULL, NULL, NULL, 405, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (22, 1, 392657083276, NULL, 1236824368735, NULL, NULL, 70, '宝蓝色 L（105-115斤）', NULL, '2720210080260203', NULL, NULL, NULL, NULL, NULL, 35, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (23, 1, 392657083276, NULL, 1236824368736, NULL, NULL, 71, '宝蓝色 XL（115-125斤）', NULL, '2720210080260204', NULL, NULL, NULL, NULL, NULL, 36, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (24, 1, 392657083276, NULL, 1236824368734, NULL, NULL, 83, '宝蓝色 M（95-105斤）', NULL, '2720210080260202', NULL, NULL, NULL, NULL, NULL, 34, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (25, 1, 392657083276, NULL, 1236824368732, NULL, NULL, 20, '黑色 2XL（125-135斤）', NULL, '2720210080260105', NULL, NULL, NULL, NULL, NULL, 32, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (26, 1, 392657083276, NULL, 1236824368727, NULL, NULL, 218, '白色 2XL（125-135斤）', NULL, '2720210080260005', NULL, NULL, NULL, NULL, NULL, 27, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (27, 1, 392657083276, NULL, 1236824368739, NULL, NULL, 93, '浅蓝色 M（95-105斤）', NULL, '2720210080260302', NULL, NULL, NULL, NULL, NULL, 39, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (28, 1, 392657083276, NULL, 1236824368729, NULL, NULL, 20, '黑色 M（95-105斤）', NULL, '2720210080260102', NULL, NULL, NULL, NULL, NULL, 29, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (29, 1, 392657083276, NULL, 1236824368728, NULL, NULL, 20, '黑色 S（80-95斤）', NULL, '2720210080260101', NULL, NULL, NULL, NULL, NULL, 28, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (30, 1, 392657083276, NULL, 1236824368733, NULL, NULL, 98, '宝蓝色 S（80-95斤）', NULL, '2720210080260201', NULL, NULL, NULL, NULL, NULL, 33, 9, NULL);
INSERT INTO `tao_goods_sku` VALUES (31, 2, 393216514010, NULL, 1249158140742, NULL, NULL, 69, '白色 M', NULL, '27202206080102', NULL, NULL, NULL, NULL, NULL, 59, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (32, 2, 393216514010, NULL, 1249158140748, NULL, NULL, 10, '黑灰色 L', NULL, '27202206080303', NULL, NULL, NULL, NULL, NULL, 70, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (33, 2, 393216514010, NULL, 1249158140744, NULL, NULL, 70, '白色 XL', NULL, '27202206080104', NULL, NULL, NULL, NULL, NULL, 61, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (34, 2, 393216514010, NULL, 1249158140749, NULL, NULL, 10, '黑灰色 XL', NULL, '27202206080304', NULL, NULL, NULL, NULL, NULL, 71, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (35, 2, 393216514010, NULL, 1249158140747, NULL, NULL, 10, '黑灰色 M', NULL, '27202206080302', NULL, NULL, NULL, NULL, NULL, 69, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (36, 2, 393216514010, NULL, 1238187231207, NULL, NULL, 10, '黑色 S', NULL, '27202206080201', NULL, NULL, NULL, NULL, NULL, 63, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (37, 2, 393216514010, NULL, 1238189648989, NULL, NULL, 175, '浅蓝色 L', NULL, '27202206080403', NULL, NULL, NULL, NULL, NULL, 75, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (38, 2, 393216514010, NULL, 1238187231209, NULL, NULL, 9, '黑色 L', NULL, '27202206080203', NULL, NULL, NULL, NULL, NULL, 65, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (39, 2, 393216514010, NULL, 1238189648988, NULL, NULL, 178, '浅蓝色 M', NULL, '27202206080402', NULL, NULL, NULL, NULL, NULL, 74, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (40, 2, 393216514010, NULL, 1249158140738, NULL, NULL, 67, '深蓝色 L', NULL, '27202206080503', NULL, NULL, NULL, NULL, NULL, 80, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (41, 2, 393216514010, NULL, 1238187231211, NULL, NULL, 9, '黑色 2XL', NULL, '27202206080205', NULL, NULL, NULL, NULL, NULL, 67, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (42, 2, 393216514010, NULL, 1238187231208, NULL, NULL, 10, '黑色 M', NULL, '27202206080202', NULL, NULL, NULL, NULL, NULL, 64, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (43, 2, 393216514010, NULL, 1249158140737, NULL, NULL, 66, '深蓝色 M', NULL, '27202206080502', NULL, NULL, NULL, NULL, NULL, 79, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (44, 2, 393216514010, NULL, 1238189648991, NULL, NULL, 178, '浅蓝色 2XL', NULL, '27202206080405', NULL, NULL, NULL, NULL, NULL, 77, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (45, 2, 393216514010, NULL, 1249158140739, NULL, NULL, 68, '深蓝色 XL', NULL, '27202206080504', NULL, NULL, NULL, NULL, NULL, 81, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (46, 2, 393216514010, NULL, 1249158140741, NULL, NULL, 70, '白色 S', NULL, '27202206080101', NULL, NULL, NULL, NULL, NULL, 58, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (47, 2, 393216514010, NULL, 1249158140745, NULL, NULL, 68, '白色 2XL', NULL, '27202206080105', NULL, NULL, NULL, NULL, NULL, 62, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (48, 2, 393216514010, NULL, 1238189648987, NULL, NULL, 175, '浅蓝色 S', NULL, '27202206080401', NULL, NULL, NULL, NULL, NULL, 73, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (49, 2, 393216514010, NULL, 1249158140746, NULL, NULL, 10, '黑灰色 S', NULL, '27202206080301', NULL, NULL, NULL, NULL, NULL, 68, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (50, 2, 393216514010, NULL, 1249158140750, NULL, NULL, 10, '黑灰色 2XL', NULL, '27202206080305', NULL, NULL, NULL, NULL, NULL, 72, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (51, 2, 393216514010, NULL, 1249158140736, NULL, NULL, 66, '深蓝色 S', NULL, '27202206080501', NULL, NULL, NULL, NULL, NULL, 78, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (52, 2, 393216514010, NULL, 1238187231210, NULL, NULL, 10, '黑色 XL', NULL, '27202206080204', NULL, NULL, NULL, NULL, NULL, 66, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (53, 2, 393216514010, NULL, 1238189648990, NULL, NULL, 178, '浅蓝色 XL', NULL, '27202206080404', NULL, NULL, NULL, NULL, NULL, 76, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (54, 2, 393216514010, NULL, 1249158140740, NULL, NULL, 69, '深蓝色 2XL', NULL, '27202206080505', NULL, NULL, NULL, NULL, NULL, 82, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (55, 2, 393216514010, NULL, 1249158140743, NULL, NULL, 69, '白色 L', NULL, '27202206080103', NULL, NULL, NULL, NULL, NULL, 60, 11, NULL);
INSERT INTO `tao_goods_sku` VALUES (56, 3, 393654097571, NULL, 1239269861271, NULL, NULL, 39, '黑色 L', NULL, '27202202700103', NULL, NULL, NULL, NULL, NULL, 85, 12, NULL);
INSERT INTO `tao_goods_sku` VALUES (57, 3, 393654097571, NULL, 1239269861273, NULL, NULL, 49, '黑色 2XL', NULL, '27202202700105', NULL, NULL, NULL, NULL, NULL, 87, 12, NULL);
INSERT INTO `tao_goods_sku` VALUES (58, 3, 393654097571, NULL, 1239269861269, NULL, NULL, 44, '黑色 S', NULL, '27202202700101', NULL, NULL, NULL, NULL, NULL, 83, 12, NULL);
INSERT INTO `tao_goods_sku` VALUES (59, 3, 393654097571, NULL, 1239269861270, NULL, NULL, 35, '黑色 M', NULL, '27202202700102', NULL, NULL, NULL, NULL, NULL, 84, 12, NULL);
INSERT INTO `tao_goods_sku` VALUES (60, 3, 393654097571, NULL, 1239269861272, NULL, NULL, 47, '黑色 XL', NULL, '27202202700104', NULL, NULL, NULL, NULL, NULL, 86, 12, NULL);
INSERT INTO `tao_goods_sku` VALUES (61, 4, 393659007414, NULL, 1239283006661, NULL, NULL, 134, '深灰色 XL', NULL, '27202208580204', NULL, NULL, NULL, NULL, NULL, 51, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (62, 4, 393659007414, NULL, 1239283006672, NULL, NULL, 135, '浅蓝色 2XL', NULL, '27202208580305', NULL, NULL, NULL, NULL, NULL, 57, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (63, 4, 393659007414, NULL, 1239283006666, NULL, NULL, 128, '黑色 XL', NULL, '27202208580104', NULL, NULL, NULL, NULL, NULL, 46, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (64, 4, 393659007414, NULL, 1239283006660, NULL, NULL, 123, '深灰色 L', NULL, '27202208580203', NULL, NULL, NULL, NULL, NULL, 50, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (65, 4, 393659007414, NULL, 1239283006662, NULL, NULL, 134, '深灰色 2XL', NULL, '27202208580205', NULL, NULL, NULL, NULL, NULL, 52, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (66, 4, 393659007414, NULL, 1239283006670, NULL, NULL, 120, '浅蓝色 L', NULL, '27202208580303', NULL, NULL, NULL, NULL, NULL, 55, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (67, 4, 393659007414, NULL, 1239283006659, NULL, NULL, 106, '深灰色 M', NULL, '27202208580202', NULL, NULL, NULL, NULL, NULL, 49, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (68, 4, 393659007414, NULL, 1239283006668, NULL, NULL, 102, '浅蓝色 S', NULL, '27202208580301', NULL, NULL, NULL, NULL, NULL, 53, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (69, 4, 393659007414, NULL, 1239283006669, NULL, NULL, 115, '浅蓝色 M', NULL, '27202208580302', NULL, NULL, NULL, NULL, NULL, 54, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (70, 4, 393659007414, NULL, 1239283006664, NULL, NULL, 123, '黑色 M', NULL, '27202208580102', NULL, NULL, NULL, NULL, NULL, 44, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (71, 4, 393659007414, NULL, 1239283006665, NULL, NULL, 106, '黑色 L', NULL, '27202208580103', NULL, NULL, NULL, NULL, NULL, 45, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (72, 4, 393659007414, NULL, 1239283006658, NULL, NULL, 112, '深灰色 S', NULL, '27202208580201', NULL, NULL, NULL, NULL, NULL, 48, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (73, 4, 393659007414, NULL, 1239283006667, NULL, NULL, 138, '黑色 2XL', NULL, '27202208580105', NULL, NULL, NULL, NULL, NULL, 47, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (74, 4, 393659007414, NULL, 1239283006671, NULL, NULL, 126, '浅蓝色 XL', NULL, '27202208580304', NULL, NULL, NULL, NULL, NULL, 56, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (75, 4, 393659007414, NULL, 1239283006663, NULL, NULL, 110, '黑色 S', NULL, '27202208580101', NULL, NULL, NULL, NULL, NULL, 43, 10, NULL);
INSERT INTO `tao_goods_sku` VALUES (76, 5, 394814708558, NULL, 1241979453566, NULL, NULL, 1000, '黑灰色 2XL', NULL, '28202206810305', NULL, NULL, NULL, NULL, NULL, 1078, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (77, 5, 394814708558, NULL, 1241979453562, NULL, NULL, 1000, '黑灰色 S', NULL, '28202206810301', NULL, NULL, NULL, NULL, NULL, 1074, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (78, 5, 394814708558, NULL, 1241979453565, NULL, NULL, 999, '黑灰色 XL', NULL, '28202206810304', NULL, NULL, NULL, NULL, NULL, 1077, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (79, 5, 394814708558, NULL, 1241979453552, NULL, NULL, 987, '复古蓝 S', NULL, '28202206810101', NULL, NULL, NULL, NULL, NULL, 88, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (80, 5, 394814708558, NULL, 1241979453561, NULL, NULL, 1000, '浅蓝色 2XL', NULL, '28202206810205', NULL, NULL, NULL, NULL, NULL, 97, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (81, 5, 394814708558, NULL, 1241979453557, NULL, NULL, 999, '浅蓝色 S', NULL, '28202206810201', NULL, NULL, NULL, NULL, NULL, 93, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (82, 5, 394814708558, NULL, 1241979453564, NULL, NULL, 999, '黑灰色 L', NULL, '28202206810303', NULL, NULL, NULL, NULL, NULL, 1076, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (83, 5, 394814708558, NULL, 1241979453555, NULL, NULL, 989, '复古蓝 XL', NULL, '28202206810104', NULL, NULL, NULL, NULL, NULL, 91, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (84, 5, 394814708558, NULL, 1241979453560, NULL, NULL, 999, '浅蓝色 XL', NULL, '28202206810204', NULL, NULL, NULL, NULL, NULL, 96, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (85, 5, 394814708558, NULL, 1241979453559, NULL, NULL, 1000, '浅蓝色 L', NULL, '28202206810203', NULL, NULL, NULL, NULL, NULL, 95, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (86, 5, 394814708558, NULL, 1241979453553, NULL, NULL, 985, '复古蓝 M', NULL, '28202206810102', NULL, NULL, NULL, NULL, NULL, 89, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (87, 5, 394814708558, NULL, 1241979453556, NULL, NULL, 994, '复古蓝 2XL', NULL, '28202206810105', NULL, NULL, NULL, NULL, NULL, 92, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (88, 5, 394814708558, NULL, 1241979453563, NULL, NULL, 997, '黑灰色 M', NULL, '28202206810302', NULL, NULL, NULL, NULL, NULL, 1075, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (89, 5, 394814708558, NULL, 1241979453554, NULL, NULL, 997, '复古蓝 L', NULL, '28202206810103', NULL, NULL, NULL, NULL, NULL, 90, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (90, 5, 394814708558, NULL, 1241979453558, NULL, NULL, 999, '浅蓝色 M', NULL, '28202206810202', NULL, NULL, NULL, NULL, NULL, 94, 13, NULL);
INSERT INTO `tao_goods_sku` VALUES (91, 6, 395429166799, NULL, 1243466497221, NULL, NULL, 317, '复古蓝 XL（30码115-125斤）', NULL, '28202106610104', NULL, NULL, NULL, NULL, NULL, 121, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (92, 6, 395429166799, NULL, 1243466497220, NULL, NULL, 351, '复古蓝 L（29码105-115斤）', NULL, '28202106610103', NULL, NULL, NULL, NULL, NULL, 120, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (93, 6, 395429166799, NULL, 1243466497222, NULL, NULL, 731, '复古蓝 2XL（31码125-135斤）', NULL, '28202106610105', NULL, NULL, NULL, NULL, NULL, 122, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (94, 6, 395429166799, NULL, 1243466497229, NULL, NULL, 952, '黑灰色 M（27-28码95-105斤）', NULL, '28202106610302', NULL, NULL, NULL, NULL, NULL, 129, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (95, 6, 395429166799, NULL, 1243466497228, NULL, NULL, 965, '黑灰色 S（25-26码95斤以内）', NULL, '28202106610301', NULL, NULL, NULL, NULL, NULL, 128, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (96, 6, 395429166799, NULL, 1243466497226, NULL, NULL, 941, '浅蓝色 XL（30码115-125斤）', NULL, '28202106610204', NULL, NULL, NULL, NULL, NULL, 126, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (97, 6, 395429166799, NULL, 1243466497218, NULL, NULL, 279, '复古蓝 S（25-26码95斤以内）', NULL, '28202106610101', NULL, NULL, NULL, NULL, NULL, 118, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (98, 6, 395429166799, NULL, 1243466497224, NULL, NULL, 920, '浅蓝色 M（27-28码95-105斤）', NULL, '28202106610202', NULL, NULL, NULL, NULL, NULL, 124, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (99, 6, 395429166799, NULL, 1243466497230, NULL, NULL, 951, '黑灰色 L（29码105-115斤）', NULL, '28202106610303', NULL, NULL, NULL, NULL, NULL, 130, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (100, 6, 395429166799, NULL, 1243466497232, NULL, NULL, 961, '黑灰色 2XL（31码125-135斤）', NULL, '28202106610305', NULL, NULL, NULL, NULL, NULL, 132, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (101, 6, 395429166799, NULL, 1243466497225, NULL, NULL, 911, '浅蓝色 L（29码105-115斤）', NULL, '28202106610203', NULL, NULL, NULL, NULL, NULL, 125, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (102, 6, 395429166799, NULL, 1243466497231, NULL, NULL, 973, '黑灰色 XL（30码115-125斤）', NULL, '28202106610304', NULL, NULL, NULL, NULL, NULL, 131, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (103, 6, 395429166799, NULL, 1243466497227, NULL, NULL, 954, '浅蓝色 2XL（31码125-135斤）', NULL, '28202106610205', NULL, NULL, NULL, NULL, NULL, 127, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (104, 6, 395429166799, NULL, 1243466497219, NULL, NULL, 430, '复古蓝 M（27-28码95-105斤）', NULL, '28202106610102', NULL, NULL, NULL, NULL, NULL, 119, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (105, 6, 395429166799, NULL, 1243466497223, NULL, NULL, 941, '浅蓝色 S（25-26码95斤以内）', NULL, '28202106610201', NULL, NULL, NULL, NULL, NULL, 123, 15, NULL);
INSERT INTO `tao_goods_sku` VALUES (106, 7, 395930868595, NULL, 1262362978280, NULL, NULL, 10, '黑色 2XL', NULL, '27202207080205', NULL, NULL, NULL, NULL, NULL, 112, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (107, 7, 395930868595, NULL, 1244694390444, NULL, NULL, 104, '灰色 S', NULL, '27202207080101', NULL, NULL, NULL, NULL, NULL, 103, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (108, 7, 395930868595, NULL, 1262362978278, NULL, NULL, 10, '黑色 L', NULL, '27202207080203', NULL, NULL, NULL, NULL, NULL, 110, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (109, 7, 395930868595, NULL, 1244694390446, NULL, NULL, 84, '灰色 L', NULL, '27202207080103', NULL, NULL, NULL, NULL, NULL, 105, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (110, 7, 395930868595, NULL, 1262362978277, NULL, NULL, 9, '黑色 M', NULL, '27202207080202', NULL, NULL, NULL, NULL, NULL, 109, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (111, 7, 395930868595, NULL, 1244694390445, NULL, NULL, 90, '灰色 M', NULL, '27202207080102', NULL, NULL, NULL, NULL, NULL, 104, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (112, 7, 395930868595, NULL, 1244694390447, NULL, NULL, 99, '灰色 XL', NULL, '27202207080104', NULL, NULL, NULL, NULL, NULL, 106, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (113, 7, 395930868595, NULL, 1244694390448, NULL, NULL, 101, '灰色 2XL', NULL, '27202207080105', NULL, NULL, NULL, NULL, NULL, 107, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (114, 7, 395930868595, NULL, 1262362978276, NULL, NULL, 10, '黑色 S', NULL, '27202207080201', NULL, NULL, NULL, NULL, NULL, 108, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (115, 7, 395930868595, NULL, 1262362978279, NULL, NULL, 10, '黑色 XL', NULL, '27202207080204', NULL, NULL, NULL, NULL, NULL, 111, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (116, 7, 395930868595, NULL, 1262362978285, NULL, NULL, 8, '浅蓝色 2XL', NULL, '27202207080305', NULL, NULL, NULL, NULL, NULL, 117, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (117, 7, 395930868595, NULL, 1262362978284, NULL, NULL, 10, '浅蓝色 XL', NULL, '27202207080304', NULL, NULL, NULL, NULL, NULL, 116, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (118, 7, 395930868595, NULL, 1262362978282, NULL, NULL, 10, '浅蓝色 M', NULL, '27202207080302', NULL, NULL, NULL, NULL, NULL, 114, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (119, 7, 395930868595, NULL, 1262362978281, NULL, NULL, 10, '浅蓝色 S', NULL, '27202207080301', NULL, NULL, NULL, NULL, NULL, 113, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (120, 7, 395930868595, NULL, 1262362978283, NULL, NULL, 9, '浅蓝色 L', NULL, '27202207080303', NULL, NULL, NULL, NULL, NULL, 115, 14, NULL);
INSERT INTO `tao_goods_sku` VALUES (121, 8, 398085327353, NULL, 1249444023929, NULL, NULL, 995, '浅蓝色 XS', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (122, 8, 398085327353, NULL, 1249444023917, NULL, NULL, 994, '黑色 XS', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (123, 8, 398085327353, NULL, 1249444023919, NULL, NULL, 976, '黑色 M', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (124, 8, 398085327353, NULL, 1249444023922, NULL, NULL, 981, '黑色 2XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (125, 8, 398085327353, NULL, 1249444023920, NULL, NULL, 979, '黑色 L', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (126, 8, 398085327353, NULL, 1249444023921, NULL, NULL, 985, '黑色 XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (127, 8, 398085327353, NULL, 1249444023931, NULL, NULL, 882, '浅蓝色 M', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (128, 8, 398085327353, NULL, 1249444023918, NULL, NULL, 987, '黑色 S', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (129, 8, 398085327353, NULL, 1249444023933, NULL, NULL, 910, '浅蓝色 XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (130, 8, 398085327353, NULL, 1249444023926, NULL, NULL, 881, '复古蓝 L', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (131, 8, 398085327353, NULL, 1249444023934, NULL, NULL, 915, '浅蓝色 2XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (132, 8, 398085327353, NULL, 1249444023925, NULL, NULL, 840, '复古蓝 M', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (133, 8, 398085327353, NULL, 1249444023930, NULL, NULL, 885, '浅蓝色 S', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (134, 8, 398085327353, NULL, 1249444023924, NULL, NULL, 915, '复古蓝 S', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (135, 8, 398085327353, NULL, 1249444023923, NULL, NULL, 990, '复古蓝 XS', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (136, 8, 398085327353, NULL, 1249444023927, NULL, NULL, 907, '复古蓝 XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (137, 8, 398085327353, NULL, 1249444023932, NULL, NULL, 891, '浅蓝色 L', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (138, 8, 398085327353, NULL, 1249444023928, NULL, NULL, 907, '复古蓝 2XL', NULL, 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (139, 9, 398667645632, NULL, 1250808763993, NULL, NULL, 94, '黑色 XL', NULL, '2720220270', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (140, 9, 398667645632, NULL, 1250808225395, NULL, NULL, 187, '黑色 S', NULL, '2720220270', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (141, 9, 398667645632, NULL, 1250808225397, NULL, NULL, 190, '黑色 L', NULL, '2720220270', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (142, 9, 398667645632, NULL, 1250808763994, NULL, NULL, 98, '黑色 2XL', NULL, '2720220270', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (143, 9, 398667645632, NULL, 1250808225396, NULL, NULL, 177, '黑色 M', NULL, '2720220270', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (144, 10, 401654801488, NULL, 1264138569397, NULL, NULL, 10, '藏青色 26', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (145, 10, 401654801488, NULL, 1264138569387, NULL, NULL, 10, '灰色 32', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (146, 10, 401654801488, NULL, 1264138569394, NULL, NULL, 10, '浅蓝色 31', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (147, 10, 401654801488, NULL, 1264138569403, NULL, NULL, 10, '藏青色 32', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (148, 10, 401654801488, NULL, 1264138569399, NULL, NULL, 10, '藏青色 28', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (149, 10, 401654801488, NULL, 1264138569389, NULL, NULL, 10, '浅蓝色 26', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (150, 10, 401654801488, NULL, 1264138569391, NULL, NULL, 10, '浅蓝色 28', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (151, 10, 401654801488, NULL, 1264138569388, NULL, NULL, 10, '浅蓝色 25', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (152, 10, 401654801488, NULL, 1264138569374, NULL, NULL, 10, '黑色 27', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (153, 10, 401654801488, NULL, 1264138569375, NULL, NULL, 10, '黑色 28', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (154, 10, 401654801488, NULL, 1264138569393, NULL, NULL, 10, '浅蓝色 30', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (155, 10, 401654801488, NULL, 1264138569384, NULL, NULL, 10, '灰色 29', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (156, 10, 401654801488, NULL, 1264138569386, NULL, NULL, 10, '灰色 31', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (157, 10, 401654801488, NULL, 1264138569390, NULL, NULL, 10, '浅蓝色 27', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (158, 10, 401654801488, NULL, 1264138569401, NULL, NULL, 10, '藏青色 30', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (159, 10, 401654801488, NULL, 1264138569372, NULL, NULL, 10, '黑色 25', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (160, 10, 401654801488, NULL, 1264138569392, NULL, NULL, 9, '浅蓝色 29', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (161, 10, 401654801488, NULL, 1264138569377, NULL, NULL, 10, '黑色 30', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (162, 10, 401654801488, NULL, 1264138569382, NULL, NULL, 10, '灰色 27', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (163, 10, 401654801488, NULL, 1264138569378, NULL, NULL, 10, '黑色 31', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (164, 10, 401654801488, NULL, 1264138569381, NULL, NULL, 10, '灰色 26', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (165, 10, 401654801488, NULL, 1264138569373, NULL, NULL, 10, '黑色 26', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (166, 10, 401654801488, NULL, 1264138569385, NULL, NULL, 10, '灰色 30', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (167, 10, 401654801488, NULL, 1264138569402, NULL, NULL, 10, '藏青色 31', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (168, 10, 401654801488, NULL, 1264138569398, NULL, NULL, 10, '藏青色 27', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (169, 10, 401654801488, NULL, 1264138569379, NULL, NULL, 10, '黑色 32', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (170, 10, 401654801488, NULL, 1264138569395, NULL, NULL, 10, '浅蓝色 32', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (171, 10, 401654801488, NULL, 1264138569396, NULL, NULL, 10, '藏青色 25', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (172, 10, 401654801488, NULL, 1264138569380, NULL, NULL, 10, '灰色 25', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (173, 10, 401654801488, NULL, 1264138569383, NULL, NULL, 10, '灰色 28', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (174, 10, 401654801488, NULL, 1264138569400, NULL, NULL, 10, '藏青色 29', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (175, 10, 401654801488, NULL, 1264138569376, NULL, NULL, 10, '黑色 29', NULL, 'HN0025', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (176, 11, 401781697078, NULL, 1257978437365, NULL, NULL, 1802, '浅蓝 M', NULL, '28202106780002', NULL, NULL, NULL, NULL, NULL, 159, 16, NULL);
INSERT INTO `tao_goods_sku` VALUES (177, 11, 401781697078, NULL, 1257978437367, NULL, NULL, 1855, '浅蓝 XL', NULL, '28202106780004', NULL, NULL, NULL, NULL, NULL, 161, 16, NULL);
INSERT INTO `tao_goods_sku` VALUES (178, 11, 401781697078, NULL, 1257978437366, NULL, NULL, 1815, '浅蓝 L', NULL, '28202106780003', NULL, NULL, NULL, NULL, NULL, 160, 16, NULL);
INSERT INTO `tao_goods_sku` VALUES (179, 11, 401781697078, NULL, 1257978437364, NULL, NULL, 1826, '浅蓝 S', NULL, '28202106780001', NULL, NULL, NULL, NULL, NULL, 158, 16, NULL);
INSERT INTO `tao_goods_sku` VALUES (180, 11, 401781697078, NULL, 1257978437368, NULL, NULL, 1866, '浅蓝 2XL', NULL, '28202106780005', NULL, NULL, NULL, NULL, NULL, 162, 16, NULL);
INSERT INTO `tao_goods_sku` VALUES (181, 12, 401781826934, NULL, 1257978913179, NULL, NULL, 987, '浅蓝色 XL', NULL, 'HN202200140304', NULL, NULL, NULL, NULL, NULL, 192, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (182, 12, 401781826934, NULL, 1257978913180, NULL, NULL, 995, '浅蓝色 2XL', NULL, 'HN202200140305', NULL, NULL, NULL, NULL, NULL, 193, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (183, 12, 401781826934, NULL, 1257978913169, NULL, NULL, 967, '黑色 XL', NULL, 'HN202200140104', NULL, NULL, NULL, NULL, NULL, 182, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (184, 12, 401781826934, NULL, 1257978913176, NULL, NULL, 980, '浅蓝色 S', NULL, 'HN202200140301', NULL, NULL, NULL, NULL, NULL, 189, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (185, 12, 401781826934, NULL, 1257978913167, NULL, NULL, 903, '黑色 M', NULL, 'HN202200140102', NULL, NULL, NULL, NULL, NULL, 180, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (186, 12, 401781826934, NULL, 1257978913173, NULL, NULL, 966, '复古蓝 L', NULL, 'HN202200140203', NULL, NULL, NULL, NULL, NULL, 186, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (187, 12, 401781826934, NULL, 1257978913168, NULL, NULL, 952, '黑色 L', NULL, 'HN202200140103', NULL, NULL, NULL, NULL, NULL, 181, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (188, 12, 401781826934, NULL, 1257978913166, NULL, NULL, 760, '黑色 S', NULL, 'HN202200140101', NULL, NULL, NULL, NULL, NULL, 179, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (189, 12, 401781826934, NULL, 1257978913174, NULL, NULL, 979, '复古蓝 XL', NULL, 'HN202200140204', NULL, NULL, NULL, NULL, NULL, 187, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (190, 12, 401781826934, NULL, 1257978913170, NULL, NULL, 979, '黑色 2XL', NULL, 'HN202200140105', NULL, NULL, NULL, NULL, NULL, 183, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (191, 12, 401781826934, NULL, 1257978913178, NULL, NULL, 987, '浅蓝色 L', NULL, 'HN202200140303', NULL, NULL, NULL, NULL, NULL, 191, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (192, 12, 401781826934, NULL, 1257978913175, NULL, NULL, 990, '复古蓝 2XL', NULL, 'HN202200140205', NULL, NULL, NULL, NULL, NULL, 188, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (193, 12, 401781826934, NULL, 1257978913172, NULL, NULL, 958, '复古蓝 M', NULL, 'HN202200140202', NULL, NULL, NULL, NULL, NULL, 185, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (194, 12, 401781826934, NULL, 1257978913177, NULL, NULL, 978, '浅蓝色 M', NULL, 'HN202200140302', NULL, NULL, NULL, NULL, NULL, 190, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (195, 12, 401781826934, NULL, 1257978913171, NULL, NULL, 967, '复古蓝 S', NULL, 'HN202200140201', NULL, NULL, NULL, NULL, NULL, 184, 18, NULL);
INSERT INTO `tao_goods_sku` VALUES (196, 13, 401993680807, NULL, 1258473180987, NULL, NULL, 100, '背带裤+纯棉白T S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (197, 13, 401993680807, NULL, 1258473180985, NULL, NULL, 100, '单件背带裤 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (198, 13, 401993680807, NULL, 1258473180989, NULL, NULL, 100, '背带裤+纯棉白T L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (199, 13, 401993680807, NULL, 1258473180983, NULL, NULL, 99, '单件背带裤 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (200, 13, 401993680807, NULL, 1258473180986, NULL, NULL, 100, '单件背带裤 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (201, 13, 401993680807, NULL, 1258473180984, NULL, NULL, 100, '单件背带裤 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (202, 13, 401993680807, NULL, 1258473180988, NULL, NULL, 100, '背带裤+纯棉白T M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (203, 13, 401993680807, NULL, 1258473180990, NULL, NULL, 100, '背带裤+纯棉白T XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (204, 14, 403434723538, NULL, 1261841872282, NULL, NULL, 45, '深蓝色 2XL', NULL, 'HN202200120105', NULL, NULL, NULL, NULL, NULL, 336, 24, NULL);
INSERT INTO `tao_goods_sku` VALUES (205, 14, 403434723538, NULL, 1261841872279, NULL, NULL, 32, '深蓝色 M', NULL, 'HN202200120102', NULL, NULL, NULL, NULL, NULL, 333, 24, NULL);
INSERT INTO `tao_goods_sku` VALUES (206, 14, 403434723538, NULL, 1261841872278, NULL, NULL, 37, '深蓝色 S', NULL, 'HN202200120101', NULL, NULL, NULL, NULL, NULL, 332, 24, NULL);
INSERT INTO `tao_goods_sku` VALUES (207, 14, 403434723538, NULL, 1261841872281, NULL, NULL, 45, '深蓝色 XL', NULL, 'HN202200120104', NULL, NULL, NULL, NULL, NULL, 335, 24, NULL);
INSERT INTO `tao_goods_sku` VALUES (208, 14, 403434723538, NULL, 1261841872280, NULL, NULL, 44, '深蓝色 L', NULL, 'HN202200120103', NULL, NULL, NULL, NULL, NULL, 334, 24, NULL);
INSERT INTO `tao_goods_sku` VALUES (209, 15, 403438406420, NULL, 1261849774936, NULL, NULL, 20, '蓝色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (210, 15, 403438406420, NULL, 1261851471320, NULL, NULL, 20, '蓝色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (211, 15, 403438406420, NULL, 1261849774929, NULL, NULL, 20, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (212, 15, 403438406420, NULL, 1261849774933, NULL, NULL, 20, '蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (213, 15, 403438406420, NULL, 1261849774935, NULL, NULL, 20, '蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (214, 15, 403438406420, NULL, 1261849774932, NULL, NULL, 20, '黑色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (215, 15, 403438406420, NULL, 1261849774934, NULL, NULL, 20, '蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (216, 15, 403438406420, NULL, 1261849774930, NULL, NULL, 20, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (217, 15, 403438406420, NULL, 1261851471319, NULL, NULL, 20, '黑色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (218, 15, 403438406420, NULL, 1261849774931, NULL, NULL, 20, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (219, 16, 403654853255, NULL, 1262268996969, NULL, NULL, 1001, '黑色 2XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (220, 16, 403654853255, NULL, 1294385941600, NULL, NULL, 20, '复古蓝 2XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (221, 16, 403654853255, NULL, 1262268996965, NULL, NULL, 1006, '黑色 S', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (222, 16, 403654853255, NULL, 1262268996980, NULL, NULL, 930, '浅蓝色 XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (223, 16, 403654853255, NULL, 1262268996964, NULL, NULL, 1014, '黑色 XS', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (224, 16, 403654853255, NULL, 1262268996981, NULL, NULL, 935, '浅蓝色 2XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (225, 16, 403654853255, NULL, 1294385941597, NULL, NULL, 20, '复古蓝 M', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (226, 16, 403654853255, NULL, 1294385941595, NULL, NULL, 20, '复古蓝 XS', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (227, 16, 403654853255, NULL, 1294385941599, NULL, NULL, 20, '复古蓝 XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (228, 16, 403654853255, NULL, 1262268996979, NULL, NULL, 869, '浅蓝色 L', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (229, 16, 403654853255, NULL, 1262268996967, NULL, NULL, 996, '黑色 L', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (230, 16, 403654853255, NULL, 1262268996978, NULL, NULL, 869, '浅蓝色 M', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (231, 16, 403654853255, NULL, 1262268996977, NULL, NULL, 872, '浅蓝色 S', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (232, 16, 403654853255, NULL, 1262268996966, NULL, NULL, 993, '黑色 M', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (233, 16, 403654853255, NULL, 1262268996976, NULL, NULL, 1015, '浅蓝色 XS', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (234, 16, 403654853255, NULL, 1262268996968, NULL, NULL, 1005, '黑色 XL', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (235, 16, 403654853255, NULL, 1294385941596, NULL, NULL, 20, '复古蓝 S', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (236, 16, 403654853255, NULL, 1294385941598, NULL, NULL, 20, '复古蓝 L', NULL, 'HN015', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (237, 17, 403877249755, NULL, 1262776022851, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (238, 17, 403877249755, NULL, 1262776022853, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (239, 17, 403877249755, NULL, 1262776022852, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (240, 17, 403877249755, NULL, 1262666161431, NULL, NULL, 1015, '黑色 M', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (241, 17, 403877249755, NULL, 1262666161432, NULL, NULL, 1018, '黑色 L', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (242, 17, 403877249755, NULL, 1262776022850, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (243, 17, 403877249755, NULL, 1262666161430, NULL, NULL, 1016, '黑色 S', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (244, 17, 403877249755, NULL, 1262666161429, NULL, NULL, 1017, '黑色 XS', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (245, 17, 403877249755, NULL, 1262776022849, NULL, NULL, 20, '浅蓝色 XS', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (246, 17, 403877249755, NULL, 1262666161433, NULL, NULL, 1017, '黑色 XL', NULL, 'HN0016', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (247, 18, 403877355587, NULL, 1262852160966, NULL, NULL, 20, '石板灰 25', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (248, 18, 403877355587, NULL, 1262666388065, NULL, NULL, 508, '浅蓝色 31', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (249, 18, 403877355587, NULL, 1262666388053, NULL, NULL, 434, '黑色 27', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (250, 18, 403877355587, NULL, 1262666388056, NULL, NULL, 462, '黑色 30', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (251, 18, 403877355587, NULL, 1262852160973, NULL, NULL, 20, '石板灰 32', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (252, 18, 403877355587, NULL, 1262666388059, NULL, NULL, 507, '浅蓝色 25', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (253, 18, 403877355587, NULL, 1262852160960, NULL, NULL, 20, '深灰色 27', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (254, 18, 403877355587, NULL, 1262852160972, NULL, NULL, 20, '石板灰 31', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (255, 18, 403877355587, NULL, 1262666388052, NULL, NULL, 461, '黑色 26', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (256, 18, 403877355587, NULL, 1262666388055, NULL, NULL, 444, '黑色 29', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (257, 18, 403877355587, NULL, 1262666388060, NULL, NULL, 461, '浅蓝色 26', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (258, 18, 403877355587, NULL, 1262852160959, NULL, NULL, 20, '深灰色 26', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (259, 18, 403877355587, NULL, 1262852160964, NULL, NULL, 20, '深灰色 31', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (260, 18, 403877355587, NULL, 1262666388066, NULL, NULL, 507, '浅蓝色 32', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (261, 18, 403877355587, NULL, 1262666388054, NULL, NULL, 423, '黑色 28', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (262, 18, 403877355587, NULL, 1262852160958, NULL, NULL, 20, '深灰色 25', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (263, 18, 403877355587, NULL, 1262852160967, NULL, NULL, 20, '石板灰 26', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (264, 18, 403877355587, NULL, 1262666388062, NULL, NULL, 468, '浅蓝色 28', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (265, 18, 403877355587, NULL, 1262852160961, NULL, NULL, 20, '深灰色 28', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (266, 18, 403877355587, NULL, 1262666388058, NULL, NULL, 480, '黑色 32', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (267, 18, 403877355587, NULL, 1262852160963, NULL, NULL, 20, '深灰色 30', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (268, 18, 403877355587, NULL, 1262852160965, NULL, NULL, 20, '深灰色 32', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (269, 18, 403877355587, NULL, 1262852160970, NULL, NULL, 20, '石板灰 29', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (270, 18, 403877355587, NULL, 1262852160969, NULL, NULL, 20, '石板灰 28', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (271, 18, 403877355587, NULL, 1262666388061, NULL, NULL, 453, '浅蓝色 27', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (272, 18, 403877355587, NULL, 1262666388057, NULL, NULL, 479, '黑色 31', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (273, 18, 403877355587, NULL, 1262666388051, NULL, NULL, 415, '黑色 25', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (274, 18, 403877355587, NULL, 1262852160962, NULL, NULL, 18, '深灰色 29', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (275, 18, 403877355587, NULL, 1262852160968, NULL, NULL, 20, '石板灰 27', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (276, 18, 403877355587, NULL, 1262666388063, NULL, NULL, 493, '浅蓝色 29', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (277, 18, 403877355587, NULL, 1262666388064, NULL, NULL, 493, '浅蓝色 30', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (278, 18, 403877355587, NULL, 1262852160971, NULL, NULL, 20, '石板灰 30', NULL, 'HN0020', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (279, 19, 403877444479, NULL, 1262855741579, NULL, NULL, 20, '黑色 25', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (280, 19, 403877444479, NULL, 1262855741584, NULL, NULL, 20, '灰色 29', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (281, 19, 403877444479, NULL, 1262666558181, NULL, NULL, 519, '黑色 31', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (282, 19, 403877444479, NULL, 1262666558178, NULL, NULL, 518, '黑色 28', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (283, 19, 403877444479, NULL, 1262855741580, NULL, NULL, 20, '灰色 25', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (284, 19, 403877444479, NULL, 1262855741585, NULL, NULL, 20, '灰色 30', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (285, 19, 403877444479, NULL, 1262666558176, NULL, NULL, 520, '黑色 26', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (286, 19, 403877444479, NULL, 1262666558180, NULL, NULL, 520, '黑色 30', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (287, 19, 403877444479, NULL, 1262855741586, NULL, NULL, 20, '灰色 31', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (288, 19, 403877444479, NULL, 1262855741581, NULL, NULL, 20, '灰色 26', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (289, 19, 403877444479, NULL, 1262666558179, NULL, NULL, 518, '黑色 29', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (290, 19, 403877444479, NULL, 1262666558177, NULL, NULL, 520, '黑色 27', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (291, 19, 403877444479, NULL, 1262855741587, NULL, NULL, 20, '灰色 32', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (292, 19, 403877444479, NULL, 1262855741583, NULL, NULL, 20, '灰色 28', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (293, 19, 403877444479, NULL, 1262666558182, NULL, NULL, 520, '黑色 32', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (294, 19, 403877444479, NULL, 1262855741582, NULL, NULL, 20, '灰色 27', NULL, 'HN0022', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (295, 20, 403877488703, NULL, 1262666698661, NULL, NULL, 9987, '黑色 31', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (296, 20, 403877488703, NULL, 1262742707196, NULL, NULL, 20, '海蓝色 29', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (297, 20, 403877488703, NULL, 1262742707198, NULL, NULL, 20, '海蓝色 31', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (298, 20, 403877488703, NULL, 1262666698659, NULL, NULL, 9912, '黑色 29', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (299, 20, 403877488703, NULL, 1262666698662, NULL, NULL, 9981, '黑色 32', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (300, 20, 403877488703, NULL, 1262742707205, NULL, NULL, 20, '深灰色 30', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (301, 20, 403877488703, NULL, 1262742707199, NULL, NULL, 20, '海蓝色 32', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (302, 20, 403877488703, NULL, 1262742707197, NULL, NULL, 20, '海蓝色 30', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (303, 20, 403877488703, NULL, 1262742707208, NULL, NULL, 20, '亮钢蓝 25', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (304, 20, 403877488703, NULL, 1262742707212, NULL, NULL, 20, '亮钢蓝 29', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (305, 20, 403877488703, NULL, 1262666698655, NULL, NULL, 9978, '黑色 25', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (306, 20, 403877488703, NULL, 1262742707209, NULL, NULL, 20, '亮钢蓝 26', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (307, 20, 403877488703, NULL, 1262742707211, NULL, NULL, 20, '亮钢蓝 28', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (308, 20, 403877488703, NULL, 1262742707210, NULL, NULL, 20, '亮钢蓝 27', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (309, 20, 403877488703, NULL, 1262666698656, NULL, NULL, 9918, '黑色 26', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (310, 20, 403877488703, NULL, 1262742707193, NULL, NULL, 20, '海蓝色 26', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (311, 20, 403877488703, NULL, 1262742707214, NULL, NULL, 20, '亮钢蓝 31', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (312, 20, 403877488703, NULL, 1262742707202, NULL, NULL, 20, '深灰色 27', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (313, 20, 403877488703, NULL, 1262666698660, NULL, NULL, 9923, '黑色 30', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (314, 20, 403877488703, NULL, 1262742707215, NULL, NULL, 20, '亮钢蓝 32', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (315, 20, 403877488703, NULL, 1262742707194, NULL, NULL, 20, '海蓝色 27', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (316, 20, 403877488703, NULL, 1262742707195, NULL, NULL, 20, '海蓝色 28', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (317, 20, 403877488703, NULL, 1262742707203, NULL, NULL, 20, '深灰色 28', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (318, 20, 403877488703, NULL, 1262666698658, NULL, NULL, 9876, '黑色 28', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (319, 20, 403877488703, NULL, 1262742707201, NULL, NULL, 20, '深灰色 26', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (320, 20, 403877488703, NULL, 1262742707192, NULL, NULL, 20, '海蓝色 25', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (321, 20, 403877488703, NULL, 1262742707207, NULL, NULL, 20, '深灰色 32', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (322, 20, 403877488703, NULL, 1262742707213, NULL, NULL, 20, '亮钢蓝 30', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (323, 20, 403877488703, NULL, 1262666698657, NULL, NULL, 9889, '黑色 27', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (324, 20, 403877488703, NULL, 1262742707204, NULL, NULL, 20, '深灰色 29', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (325, 20, 403877488703, NULL, 1262742707200, NULL, NULL, 20, '深灰色 25', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (326, 20, 403877488703, NULL, 1262742707206, NULL, NULL, 20, '深灰色 31', NULL, 'HN0023', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (327, 21, 403877607629, NULL, 1262666896377, NULL, NULL, 1011, '黑灰色 28', NULL, 'HN202200240228', NULL, NULL, NULL, NULL, NULL, 311, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (328, 21, 403877607629, NULL, 1262666896370, NULL, NULL, 1011, '浅蓝色 28', NULL, 'HN202200240328', NULL, NULL, NULL, NULL, NULL, 319, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (329, 21, 403877607629, NULL, 1262666896361, NULL, NULL, 1018, '黑色 26', NULL, 'HN202200240126', NULL, NULL, NULL, NULL, NULL, 301, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (330, 21, 403877607629, NULL, 1262666896386, NULL, NULL, 1013, '蓝灰色 30', NULL, 'HN202200240430', NULL, NULL, NULL, NULL, NULL, 329, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (331, 21, 403877607629, NULL, 1262666896374, NULL, NULL, 1015, '浅蓝色 32', NULL, 'HN202200240332', NULL, NULL, NULL, NULL, NULL, 323, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (332, 21, 403877607629, NULL, 1262666896378, NULL, NULL, 1020, '黑灰色 29', NULL, 'HN202200240229', NULL, NULL, NULL, NULL, NULL, 312, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (333, 21, 403877607629, NULL, 1262666896365, NULL, NULL, 1019, '黑色 30', NULL, 'HN202200240130', NULL, NULL, NULL, NULL, NULL, 305, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (334, 21, 403877607629, NULL, 1262666896385, NULL, NULL, 1018, '蓝灰色 29', NULL, 'HN202200240429', NULL, NULL, NULL, NULL, NULL, 328, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (335, 21, 403877607629, NULL, 1262666896381, NULL, NULL, 1019, '黑灰色 32', NULL, 'HN202200240232', NULL, NULL, NULL, NULL, NULL, 315, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (336, 21, 403877607629, NULL, 1262666896368, NULL, NULL, 1015, '浅蓝色 26', NULL, 'HN202200240326', NULL, NULL, NULL, NULL, NULL, 317, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (337, 21, 403877607629, NULL, 1262666896373, NULL, NULL, 1017, '浅蓝色 31', NULL, 'HN202200240331', NULL, NULL, NULL, NULL, NULL, 322, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (338, 21, 403877607629, NULL, 1262666896383, NULL, NULL, 1017, '蓝灰色 27', NULL, 'HN202200240427', NULL, NULL, NULL, NULL, NULL, 326, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (339, 21, 403877607629, NULL, 1262666896367, NULL, NULL, 1019, '黑色 32', NULL, 'HN202200240132', NULL, NULL, NULL, NULL, NULL, 307, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (340, 21, 403877607629, NULL, 1262666896387, NULL, NULL, 1018, '蓝灰色 31', NULL, 'HN202200240431', NULL, NULL, NULL, NULL, NULL, 330, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (341, 21, 403877607629, NULL, 1262666896388, NULL, NULL, 1015, '蓝灰色 32', NULL, 'HN202200240432', NULL, NULL, NULL, NULL, NULL, 331, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (342, 21, 403877607629, NULL, 1262666896380, NULL, NULL, 1020, '黑灰色 31', NULL, 'HN202200240231', NULL, NULL, NULL, NULL, NULL, 314, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (343, 21, 403877607629, NULL, 1262666896364, NULL, NULL, 1018, '黑色 29', NULL, 'HN202200240129', NULL, NULL, NULL, NULL, NULL, 304, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (344, 21, 403877607629, NULL, 1262666896372, NULL, NULL, 1010, '浅蓝色 30', NULL, 'HN202200240330', NULL, NULL, NULL, NULL, NULL, 321, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (345, 21, 403877607629, NULL, 1262666896363, NULL, NULL, 1018, '黑色 28', NULL, 'HN202200240128', NULL, NULL, NULL, NULL, NULL, 303, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (346, 21, 403877607629, NULL, 1262666896371, NULL, NULL, 1016, '浅蓝色 29', NULL, 'HN202200240329', NULL, NULL, NULL, NULL, NULL, 320, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (347, 21, 403877607629, NULL, 1262666896382, NULL, NULL, 1016, '蓝灰色 26', NULL, 'HN202200240426', NULL, NULL, NULL, NULL, NULL, 325, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (348, 21, 403877607629, NULL, 1262666896366, NULL, NULL, 1019, '黑色 31', NULL, 'HN202200240131', NULL, NULL, NULL, NULL, NULL, 306, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (349, 21, 403877607629, NULL, 1262666896362, NULL, NULL, 1019, '黑色 27', NULL, 'HN202200240127', NULL, NULL, NULL, NULL, NULL, 302, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (350, 21, 403877607629, NULL, 1262666896376, NULL, NULL, 1015, '黑灰色 27', NULL, 'HN202200240227', NULL, NULL, NULL, NULL, NULL, 310, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (351, 21, 403877607629, NULL, 1262666896369, NULL, NULL, 1012, '浅蓝色 27', NULL, 'HN202200240327', NULL, NULL, NULL, NULL, NULL, 318, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (352, 21, 403877607629, NULL, 1262666896375, NULL, NULL, 1015, '黑灰色 26', NULL, 'HN202200240226', NULL, NULL, NULL, NULL, NULL, 309, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (353, 21, 403877607629, NULL, 1262666896384, NULL, NULL, 1014, '蓝灰色 28', NULL, 'HN202200240428', NULL, NULL, NULL, NULL, NULL, 327, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (354, 21, 403877607629, NULL, 1262666896379, NULL, NULL, 1020, '黑灰色 30', NULL, 'HN202200240230', NULL, NULL, NULL, NULL, NULL, 313, 23, NULL);
INSERT INTO `tao_goods_sku` VALUES (355, 22, 403877716388, NULL, 1262667109644, NULL, NULL, 1020, '黑色 28', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (356, 22, 403877716388, NULL, 1262667109643, NULL, NULL, 1020, '黑色 27', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (357, 22, 403877716388, NULL, 1262783777281, NULL, NULL, 20, '蓝色 31', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (358, 22, 403877716388, NULL, 1262783777288, NULL, NULL, 20, '深灰色 30', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (359, 22, 403877716388, NULL, 1262667109647, NULL, NULL, 1019, '黑色 31', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (360, 22, 403877716388, NULL, 1262783777276, NULL, NULL, 20, '蓝色 26', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (361, 22, 403877716388, NULL, 1262783777289, NULL, NULL, 20, '深灰色 31', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (362, 22, 403877716388, NULL, 1262783777282, NULL, NULL, 20, '蓝色 32', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (363, 22, 403877716388, NULL, 1262783777290, NULL, NULL, 20, '深灰色 32', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (364, 22, 403877716388, NULL, 1262783777286, NULL, NULL, 20, '深灰色 28', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (365, 22, 403877716388, NULL, 1262783777279, NULL, NULL, 20, '蓝色 29', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (366, 22, 403877716388, NULL, 1262783777283, NULL, NULL, 20, '深灰色 25', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (367, 22, 403877716388, NULL, 1262667109648, NULL, NULL, 1020, '黑色 32', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (368, 22, 403877716388, NULL, 1262667109645, NULL, NULL, 1020, '黑色 29', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (369, 22, 403877716388, NULL, 1262783777277, NULL, NULL, 20, '蓝色 27', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (370, 22, 403877716388, NULL, 1262667109646, NULL, NULL, 1020, '黑色 30', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (371, 22, 403877716388, NULL, 1262783777285, NULL, NULL, 20, '深灰色 27', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (372, 22, 403877716388, NULL, 1262667109641, NULL, NULL, 1020, '黑色 25', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (373, 22, 403877716388, NULL, 1262667109642, NULL, NULL, 1020, '黑色 26', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (374, 22, 403877716388, NULL, 1262783777287, NULL, NULL, 20, '深灰色 29', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (375, 22, 403877716388, NULL, 1262783777275, NULL, NULL, 20, '蓝色 25', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (376, 22, 403877716388, NULL, 1262783777280, NULL, NULL, 20, '蓝色 30', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (377, 22, 403877716388, NULL, 1262783777278, NULL, NULL, 19, '蓝色 28', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (378, 22, 403877716388, NULL, 1262783777284, NULL, NULL, 20, '深灰色 26', NULL, 'HN0029', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (379, 23, 404300819650, NULL, 1263497350054, NULL, NULL, 100, '32 145斤到155斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (380, 23, 404300819650, NULL, 1263497350052, NULL, NULL, 100, '30 125斤到135斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (381, 23, 404300819650, NULL, 1263497350051, NULL, NULL, 100, '29 115斤到125斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (382, 23, 404300819650, NULL, 1263497350055, NULL, NULL, 100, '33 155斤到175斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (383, 23, 404300819650, NULL, 1263497350050, NULL, NULL, 100, '28 100斤到115斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (384, 23, 404300819650, NULL, 1263497350053, NULL, NULL, 100, '31 135斤到145斤左右', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (385, 24, 408225561862, NULL, 1271533011330, NULL, NULL, 220, '黑灰 28', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (386, 24, 408225561862, NULL, 1271533011332, NULL, NULL, 220, '黑灰 30', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (387, 24, 408225561862, NULL, 1271533011327, NULL, NULL, 220, '蓝灰 32', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (388, 24, 408225561862, NULL, 1271533011334, NULL, NULL, 220, '黑灰 32', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (389, 24, 408225561862, NULL, 1271533011331, NULL, NULL, 220, '黑灰 29', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (390, 24, 408225561862, NULL, 1271533011321, NULL, NULL, 220, '蓝灰 26', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (391, 24, 408225561862, NULL, 1271533011323, NULL, NULL, 220, '蓝灰 28', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (392, 24, 408225561862, NULL, 1271533011322, NULL, NULL, 220, '蓝灰 27', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (393, 24, 408225561862, NULL, 1271533011326, NULL, NULL, 220, '蓝灰 31', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (394, 24, 408225561862, NULL, 1271533011329, NULL, NULL, 220, '黑灰 27', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (395, 24, 408225561862, NULL, 1271533011325, NULL, NULL, 220, '蓝灰 30', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (396, 24, 408225561862, NULL, 1271533011333, NULL, NULL, 220, '黑灰 31', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (397, 24, 408225561862, NULL, 1271533011324, NULL, NULL, 220, '蓝灰 29', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (398, 24, 408225561862, NULL, 1271533011328, NULL, NULL, 220, '黑灰 26', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (399, 25, 409855932902, NULL, 1274875964281, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0180', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (400, 25, 409855932902, NULL, 1274875964278, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0180', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (401, 25, 409855932902, NULL, 1274875964279, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0180', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (402, 25, 409855932902, NULL, 1274875964282, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0180', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (403, 25, 409855932902, NULL, 1274875964280, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0180', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (404, 26, 409864423309, NULL, 1274883221799, NULL, NULL, 69, '蓝色 XL', NULL, 'HN1064004', NULL, NULL, NULL, NULL, NULL, 553, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (405, 26, 409864423309, NULL, 1274883221793, NULL, NULL, 69, '黑色 L', NULL, 'HN1060103', NULL, NULL, NULL, NULL, NULL, 547, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (406, 26, 409864423309, NULL, 1274883221792, NULL, NULL, 69, '黑色 M', NULL, 'HN1060102', NULL, NULL, NULL, NULL, NULL, 546, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (407, 26, 409864423309, NULL, 1274883221800, NULL, NULL, 70, '蓝色 2XL', NULL, 'HN1064005', NULL, NULL, NULL, NULL, NULL, 554, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (408, 26, 409864423309, NULL, 1274883221803, NULL, NULL, 70, '石板灰 L', NULL, 'HN1062903', NULL, NULL, NULL, NULL, NULL, 557, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (409, 26, 409864423309, NULL, 1274883221795, NULL, NULL, 68, '黑色 2XL', NULL, 'HN1060105', NULL, NULL, NULL, NULL, NULL, 549, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (410, 26, 409864423309, NULL, 1274883221797, NULL, NULL, 67, '蓝色 M', NULL, 'HN1064002', NULL, NULL, NULL, NULL, NULL, 551, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (411, 26, 409864423309, NULL, 1274883221798, NULL, NULL, 69, '蓝色 L', NULL, 'HN1064003', NULL, NULL, NULL, NULL, NULL, 552, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (412, 26, 409864423309, NULL, 1274883221804, NULL, NULL, 70, '石板灰 XL', NULL, 'HN1062904', NULL, NULL, NULL, NULL, NULL, 558, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (413, 26, 409864423309, NULL, 1274883221791, NULL, NULL, 70, '黑色 S', NULL, 'HN1060101', NULL, NULL, NULL, NULL, NULL, 545, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (414, 26, 409864423309, NULL, 1274883221805, NULL, NULL, 70, '石板灰 2XL', NULL, 'HN1062905', NULL, NULL, NULL, NULL, NULL, 559, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (415, 26, 409864423309, NULL, 1274883221796, NULL, NULL, 68, '蓝色 S', NULL, 'HN1064001', NULL, NULL, NULL, NULL, NULL, 550, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (416, 26, 409864423309, NULL, 1274883221794, NULL, NULL, 70, '黑色 XL', NULL, 'HN1060104', NULL, NULL, NULL, NULL, NULL, 548, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (417, 26, 409864423309, NULL, 1274883221802, NULL, NULL, 69, '石板灰 M', NULL, 'HN1062902', NULL, NULL, NULL, NULL, NULL, 556, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (418, 26, 409864423309, NULL, 1274883221801, NULL, NULL, 69, '石板灰 S', NULL, 'HN1062901', NULL, NULL, NULL, NULL, NULL, 555, 37, NULL);
INSERT INTO `tao_goods_sku` VALUES (419, 27, 409866847439, NULL, 1274887667603, NULL, NULL, 20, '浅蓝色 29', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (420, 27, 409866847439, NULL, 1274887667608, NULL, NULL, 18, '深蓝色 27', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (421, 27, 409866847439, NULL, 1274887667601, NULL, NULL, 20, '浅蓝色 27', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (422, 27, 409866847439, NULL, 1274887667610, NULL, NULL, 19, '深蓝色 29', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (423, 27, 409866847439, NULL, 1274887667602, NULL, NULL, 20, '浅蓝色 28', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (424, 27, 409866847439, NULL, 1274887667604, NULL, NULL, 20, '浅蓝色 30', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (425, 27, 409866847439, NULL, 1274887667600, NULL, NULL, 20, '浅蓝色 26', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (426, 27, 409866847439, NULL, 1274887667612, NULL, NULL, 20, '深蓝色 31', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (427, 27, 409866847439, NULL, 1274887667611, NULL, NULL, 20, '深蓝色 30', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (428, 27, 409866847439, NULL, 1274887667606, NULL, NULL, 20, '浅蓝色 32', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (429, 27, 409866847439, NULL, 1274887667605, NULL, NULL, 20, '浅蓝色 31', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (430, 27, 409866847439, NULL, 1274887667607, NULL, NULL, 18, '深蓝色 26', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (431, 27, 409866847439, NULL, 1274887667609, NULL, NULL, 20, '深蓝色 28', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (432, 27, 409866847439, NULL, 1274887667613, NULL, NULL, 19, '深蓝色 32', NULL, 'HN0222', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (433, 28, 409879757750, NULL, 1274915162081, NULL, NULL, 20, '深灰色 M', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (434, 28, 409879757750, NULL, 1274915162088, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (435, 28, 409879757750, NULL, 1274915162094, NULL, NULL, 20, '湖蓝色 2XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (436, 28, 409879757750, NULL, 1274915162085, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (437, 28, 409879757750, NULL, 1274915162090, NULL, NULL, 20, '湖蓝色 S', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (438, 28, 409879757750, NULL, 1274915162082, NULL, NULL, 20, '深灰色 L', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (439, 28, 409879757750, NULL, 1274915162080, NULL, NULL, 20, '深灰色 S', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (440, 28, 409879757750, NULL, 1274915162086, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (441, 28, 409879757750, NULL, 1274915162091, NULL, NULL, 20, '湖蓝色 M', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (442, 28, 409879757750, NULL, 1274915162092, NULL, NULL, 20, '湖蓝色 L', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (443, 28, 409879757750, NULL, 1274915162083, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (444, 28, 409879757750, NULL, 1274915162084, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (445, 28, 409879757750, NULL, 1274915162087, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (446, 28, 409879757750, NULL, 1274915162089, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (447, 28, 409879757750, NULL, 1274915162093, NULL, NULL, 20, '湖蓝色 XL', NULL, 'HN0620', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (448, 29, 409883128005, NULL, 1274920833073, NULL, NULL, 20, '黑色 L', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (449, 29, 409883128005, NULL, 1274920833090, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (450, 29, 409883128005, NULL, 1274920833087, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (451, 29, 409883128005, NULL, 1274920833079, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (452, 29, 409883128005, NULL, 1274920833074, NULL, NULL, 20, '黑色 XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (453, 29, 409883128005, NULL, 1274920833080, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (454, 29, 409883128005, NULL, 1274920833076, NULL, NULL, 20, '深灰色 S', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (455, 29, 409883128005, NULL, 1274920833077, NULL, NULL, 20, '深灰色 M', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (456, 29, 409883128005, NULL, 1274920833084, NULL, NULL, 20, '藏青色 XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (457, 29, 409883128005, NULL, 1274920833072, NULL, NULL, 20, '黑色 M', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (458, 29, 409883128005, NULL, 1274920833075, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (459, 29, 409883128005, NULL, 1274920833083, NULL, NULL, 20, '藏青色 L', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (460, 29, 409883128005, NULL, 1274920833078, NULL, NULL, 20, '深灰色 L', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (461, 29, 409883128005, NULL, 1274920833086, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (462, 29, 409883128005, NULL, 1274920833082, NULL, NULL, 20, '藏青色 M', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (463, 29, 409883128005, NULL, 1274920833089, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (464, 29, 409883128005, NULL, 1274920833088, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (465, 29, 409883128005, NULL, 1274920833081, NULL, NULL, 20, '藏青色 S', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (466, 29, 409883128005, NULL, 1274920833071, NULL, NULL, 20, '黑色 S', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (467, 29, 409883128005, NULL, 1274920833085, NULL, NULL, 20, '藏青色 2XL', NULL, 'HN0621', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (468, 30, 409885859735, NULL, 1274926586717, NULL, NULL, 20, '宝蓝色 L', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (469, 30, 409885859735, NULL, 1274926586713, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (470, 30, 409885859735, NULL, 1274926586712, NULL, NULL, 19, '深灰色 L', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (471, 30, 409885859735, NULL, 1274926586710, NULL, NULL, 20, '深灰色 S', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (472, 30, 409885859735, NULL, 1274926586715, NULL, NULL, 20, '宝蓝色 S', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (473, 30, 409885859735, NULL, 1274926586722, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (474, 30, 409885859735, NULL, 1274926586714, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (475, 30, 409885859735, NULL, 1274926586716, NULL, NULL, 20, '宝蓝色 M', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (476, 30, 409885859735, NULL, 1274926586719, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (477, 30, 409885859735, NULL, 1274926586723, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (478, 30, 409885859735, NULL, 1274926586724, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (479, 30, 409885859735, NULL, 1274926586711, NULL, NULL, 20, '深灰色 M', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (480, 30, 409885859735, NULL, 1274926586721, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (481, 30, 409885859735, NULL, 1274926586720, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (482, 30, 409885859735, NULL, 1274926586718, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN0630', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (483, 31, 410305683990, NULL, 1275780297875, NULL, NULL, 20, '宝蓝色 M', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (484, 31, 410305683990, NULL, 1275780297878, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (485, 31, 410305683990, NULL, 1275780297882, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (486, 31, 410305683990, NULL, 1275780297874, NULL, NULL, 20, '宝蓝色 S', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (487, 31, 410305683990, NULL, 1275780297880, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (488, 31, 410305683990, NULL, 1275780297873, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (489, 31, 410305683990, NULL, 1275780297879, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (490, 31, 410305683990, NULL, 1275780297872, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (491, 31, 410305683990, NULL, 1275780297869, NULL, NULL, 20, '深灰色 S', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (492, 31, 410305683990, NULL, 1275780297864, NULL, NULL, 20, '黑色 S', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (493, 31, 410305683990, NULL, 1275780297883, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (494, 31, 410305683990, NULL, 1275780297881, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (495, 31, 410305683990, NULL, 1275780297865, NULL, NULL, 20, '黑色 M', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (496, 31, 410305683990, NULL, 1275780297867, NULL, NULL, 20, '黑色 XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (497, 31, 410305683990, NULL, 1275780297876, NULL, NULL, 19, '宝蓝色 L', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (498, 31, 410305683990, NULL, 1275780297868, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (499, 31, 410305683990, NULL, 1275780297870, NULL, NULL, 20, '深灰色 M', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (500, 31, 410305683990, NULL, 1275780297866, NULL, NULL, 20, '黑色 L', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (501, 31, 410305683990, NULL, 1275780297877, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (502, 31, 410305683990, NULL, 1275780297871, NULL, NULL, 20, '深灰色 L', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (503, 32, 410308626596, NULL, 1275783538406, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0662', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (504, 32, 410308626596, NULL, 1275783538409, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0662', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (505, 32, 410308626596, NULL, 1275783538410, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0662', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (506, 32, 410308626596, NULL, 1275783538407, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0662', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (507, 32, 410308626596, NULL, 1275783538408, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0662', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (508, 33, 410688391724, NULL, 1276549759303, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (509, 33, 410688391724, NULL, 1276549759304, NULL, NULL, 20, '黑灰色 S', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (510, 33, 410688391724, NULL, 1276549759300, NULL, NULL, 19, '浅蓝色 M', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (511, 33, 410688391724, NULL, 1276549759308, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (512, 33, 410688391724, NULL, 1276549759307, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (513, 33, 410688391724, NULL, 1276549759299, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (514, 33, 410688391724, NULL, 1276549759305, NULL, NULL, 19, '黑灰色 M', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (515, 33, 410688391724, NULL, 1276549759306, NULL, NULL, 20, '黑灰色 L', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (516, 33, 410688391724, NULL, 1276549759302, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (517, 33, 410688391724, NULL, 1276549759301, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0663', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (518, 34, 410692286065, NULL, 1276552341638, NULL, NULL, 20, '黑色 L', NULL, 'HN0665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (519, 34, 410692286065, NULL, 1276552341639, NULL, NULL, 20, '黑色 XL', NULL, 'HN0665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (520, 34, 410692286065, NULL, 1276552341637, NULL, NULL, 20, '黑色 M', NULL, 'HN0665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (521, 34, 410692286065, NULL, 1276552341640, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (522, 34, 410692286065, NULL, 1276552341636, NULL, NULL, 20, '黑色 S', NULL, 'HN0665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (523, 35, 410693529689, NULL, 1276555714237, NULL, NULL, 20, '深天蓝 L', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (524, 35, 410693529689, NULL, 1276555714229, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (525, 35, 410693529689, NULL, 1276555714242, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (526, 35, 410693529689, NULL, 1276555714239, NULL, NULL, 20, '深天蓝 2XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (527, 35, 410693529689, NULL, 1276555714225, NULL, NULL, 20, '黑色 S', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (528, 35, 410693529689, NULL, 1276555714228, NULL, NULL, 20, '黑色 XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (529, 35, 410693529689, NULL, 1276555714243, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (530, 35, 410693529689, NULL, 1276555714241, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (531, 35, 410693529689, NULL, 1276555714232, NULL, NULL, 20, '深灰色 L', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (532, 35, 410693529689, NULL, 1276555714226, NULL, NULL, 20, '黑色 M', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (533, 35, 410693529689, NULL, 1276555714227, NULL, NULL, 20, '黑色 L', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (534, 35, 410693529689, NULL, 1276555714234, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (535, 35, 410693529689, NULL, 1276555714233, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (536, 35, 410693529689, NULL, 1276555714235, NULL, NULL, 20, '深天蓝 S', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (537, 35, 410693529689, NULL, 1276555714231, NULL, NULL, 20, '深灰色 M', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (538, 35, 410693529689, NULL, 1276555714244, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (539, 35, 410693529689, NULL, 1276555714236, NULL, NULL, 20, '深天蓝 M', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (540, 35, 410693529689, NULL, 1276555714240, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (541, 35, 410693529689, NULL, 1276555714230, NULL, NULL, 20, '深灰色 S', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (542, 35, 410693529689, NULL, 1276555714238, NULL, NULL, 20, '深天蓝 XL', NULL, 'HN0666', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (543, 36, 410694952121, NULL, 1276557736043, NULL, NULL, 18, '宝蓝色 S', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (544, 36, 410694952121, NULL, 1276557736045, NULL, NULL, 16, '宝蓝色 L', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (545, 36, 410694952121, NULL, 1276557736047, NULL, NULL, 19, '宝蓝色 2XL', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (546, 36, 410694952121, NULL, 1276557736039, NULL, NULL, 19, '浅蓝色 M', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (547, 36, 410694952121, NULL, 1276557736041, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (548, 36, 410694952121, NULL, 1276557736046, NULL, NULL, 17, '宝蓝色 XL', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (549, 36, 410694952121, NULL, 1276557736038, NULL, NULL, 18, '浅蓝色 S', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (550, 36, 410694952121, NULL, 1276557736044, NULL, NULL, 15, '宝蓝色 M', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (551, 36, 410694952121, NULL, 1276557736040, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (552, 36, 410694952121, NULL, 1276557736042, NULL, NULL, 19, '浅蓝色 2XL', NULL, 'HN0667', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (553, 37, 410695996318, NULL, 1276560236799, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN6681204', NULL, NULL, NULL, NULL, NULL, 592, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (554, 37, 410695996318, NULL, 1276560236801, NULL, NULL, 20, '深灰色 S', NULL, 'HN6687501', NULL, NULL, NULL, NULL, NULL, 594, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (555, 37, 410695996318, NULL, 1276560236804, NULL, NULL, 20, '深灰色 XL', NULL, 'HN6687504', NULL, NULL, NULL, NULL, NULL, 597, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (556, 37, 410695996318, NULL, 1276560236793, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN6685003', NULL, NULL, NULL, NULL, NULL, 586, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (557, 37, 410695996318, NULL, 1276560236798, NULL, NULL, 20, '宝蓝色 L', NULL, 'HN6681203', NULL, NULL, NULL, NULL, NULL, 591, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (558, 37, 410695996318, NULL, 1276560236797, NULL, NULL, 20, '宝蓝色 M', NULL, 'HN6681202', NULL, NULL, NULL, NULL, NULL, 590, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (559, 37, 410695996318, NULL, 1276560236794, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN6685004', NULL, NULL, NULL, NULL, NULL, 587, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (560, 37, 410695996318, NULL, 1276560236792, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN6685002', NULL, NULL, NULL, NULL, NULL, 585, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (561, 37, 410695996318, NULL, 1276560236791, NULL, NULL, 19, '浅蓝色 S', NULL, 'HN6685001', NULL, NULL, NULL, NULL, NULL, 584, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (562, 37, 410695996318, NULL, 1276560236796, NULL, NULL, 20, '宝蓝色 S', NULL, 'HN6681201', NULL, NULL, NULL, NULL, NULL, 589, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (563, 37, 410695996318, NULL, 1276560236805, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN6687505', NULL, NULL, NULL, NULL, NULL, 598, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (564, 37, 410695996318, NULL, 1276560236795, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN6685005', NULL, NULL, NULL, NULL, NULL, 588, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (565, 37, 410695996318, NULL, 1276560236803, NULL, NULL, 20, '深灰色 L', NULL, 'HN6687503', NULL, NULL, NULL, NULL, NULL, 596, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (566, 37, 410695996318, NULL, 1276560236800, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN6681205', NULL, NULL, NULL, NULL, NULL, 593, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (567, 37, 410695996318, NULL, 1276560236802, NULL, NULL, 20, '深灰色 M', NULL, 'HN6687502', NULL, NULL, NULL, NULL, NULL, 595, 40, NULL);
INSERT INTO `tao_goods_sku` VALUES (568, 38, 410697172304, NULL, 1276562723239, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (569, 38, 410697172304, NULL, 1276562723232, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (570, 38, 410697172304, NULL, 1276562723241, NULL, NULL, 20, '黑色 S', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (571, 38, 410697172304, NULL, 1276562723233, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (572, 38, 410697172304, NULL, 1276562723231, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (573, 38, 410697172304, NULL, 1276562723242, NULL, NULL, 20, '黑色 M', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (574, 38, 410697172304, NULL, 1276562723243, NULL, NULL, 20, '黑色 L', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (575, 38, 410697172304, NULL, 1276562723237, NULL, NULL, 20, '宝蓝色 M', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (576, 38, 410697172304, NULL, 1276562723238, NULL, NULL, 20, '宝蓝色 L', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (577, 38, 410697172304, NULL, 1276562723235, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (578, 38, 410697172304, NULL, 1276562723240, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (579, 38, 410697172304, NULL, 1276562723245, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (580, 38, 410697172304, NULL, 1276562723234, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (581, 38, 410697172304, NULL, 1276562723236, NULL, NULL, 20, '宝蓝色 S', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (582, 38, 410697172304, NULL, 1276562723244, NULL, NULL, 20, '黑色 XL', NULL, 'HN0669', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (583, 39, 411361540533, NULL, 1277927242201, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN6704005', NULL, NULL, NULL, NULL, NULL, 424, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (584, 39, 411361540533, NULL, 1277927242203, NULL, NULL, 19, '深灰色 L', NULL, 'HN6707503', NULL, NULL, NULL, NULL, NULL, 417, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (585, 39, 411361540533, NULL, 1277926678779, NULL, NULL, 20, '深灰色 S', NULL, 'HN6707501', NULL, NULL, NULL, NULL, NULL, 415, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (586, 39, 411361540533, NULL, 1277926678778, NULL, NULL, 19, '宝蓝色 S', NULL, 'HN6704001', NULL, NULL, NULL, NULL, NULL, 420, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (587, 39, 411361540533, NULL, 1277927242196, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN6705004', NULL, NULL, NULL, NULL, NULL, 413, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (588, 39, 411361540533, NULL, 1277927242197, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN6705005', NULL, NULL, NULL, NULL, NULL, 414, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (589, 39, 411361540533, NULL, 1277927242200, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN6704004', NULL, NULL, NULL, NULL, NULL, 423, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (590, 39, 411361540533, NULL, 1277927242204, NULL, NULL, 19, '深灰色 XL', NULL, 'HN6707504', NULL, NULL, NULL, NULL, NULL, 418, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (591, 39, 411361540533, NULL, 1277926678777, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN6705001', NULL, NULL, NULL, NULL, NULL, 410, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (592, 39, 411361540533, NULL, 1277927242194, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN6705002', NULL, NULL, NULL, NULL, NULL, 411, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (593, 39, 411361540533, NULL, 1277927242205, NULL, NULL, 19, '深灰色 2XL', NULL, 'HN6707505', NULL, NULL, NULL, NULL, NULL, 419, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (594, 39, 411361540533, NULL, 1277927242195, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN6705003', NULL, NULL, NULL, NULL, NULL, 412, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (595, 39, 411361540533, NULL, 1277927242202, NULL, NULL, 18, '深灰色 M', NULL, 'HN6707502', NULL, NULL, NULL, NULL, NULL, 416, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (596, 39, 411361540533, NULL, 1277927242198, NULL, NULL, 19, '宝蓝色 M', NULL, 'HN6704002', NULL, NULL, NULL, NULL, NULL, 421, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (597, 39, 411361540533, NULL, 1277927242199, NULL, NULL, 19, '宝蓝色 L', NULL, 'HN6704003', NULL, NULL, NULL, NULL, NULL, 422, 28, NULL);
INSERT INTO `tao_goods_sku` VALUES (598, 40, 411366495987, NULL, 1277929165137, NULL, NULL, 20, '黑色 L', NULL, 'HN0671', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (599, 40, 411366495987, NULL, 1277929165138, NULL, NULL, 20, '黑色 XL', NULL, 'HN0671', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (600, 40, 411366495987, NULL, 1277929165139, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0671', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (601, 40, 411366495987, NULL, 1277929165135, NULL, NULL, 20, '黑色 S', NULL, 'HN0671', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (602, 40, 411366495987, NULL, 1277929165136, NULL, NULL, 20, '黑色 M', NULL, 'HN0671', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (603, 41, 411370161999, NULL, 1277936821459, NULL, NULL, 19, '宝蓝色 L', NULL, 'HN0672', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (604, 41, 411370161999, NULL, 1277936821460, NULL, NULL, 20, '宝蓝色 XL', NULL, 'HN0672', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (605, 41, 411370161999, NULL, 1277936821457, NULL, NULL, 20, '宝蓝色 S', NULL, 'HN0672', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (606, 41, 411370161999, NULL, 1277936821458, NULL, NULL, 19, '宝蓝色 M', NULL, 'HN0672', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (607, 41, 411370161999, NULL, 1277936821461, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'HN0672', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (608, 42, 411378921081, NULL, 1277953926674, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (609, 42, 411378921081, NULL, 1277953926679, NULL, NULL, 20, '深灰色 XL', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (610, 42, 411378921081, NULL, 1277953926675, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (611, 42, 411378921081, NULL, 1277953926677, NULL, NULL, 20, '深灰色 M', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (612, 42, 411378921081, NULL, 1277953926671, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (613, 42, 411378921081, NULL, 1277953926678, NULL, NULL, 20, '深灰色 L', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (614, 42, 411378921081, NULL, 1277953926680, NULL, NULL, 20, '深灰色 2XL', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (615, 42, 411378921081, NULL, 1277953926672, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (616, 42, 411378921081, NULL, 1277953926676, NULL, NULL, 20, '深灰色 S', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (617, 42, 411378921081, NULL, 1277953926673, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0673', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (618, 43, 411379965590, NULL, 1277957033281, NULL, NULL, 20, '黑色 M', NULL, 'HN0675', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (619, 43, 411379965590, NULL, 1277957033284, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0675', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (620, 43, 411379965590, NULL, 1277957033280, NULL, NULL, 20, '黑色 S', NULL, 'HN0675', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (621, 43, 411379965590, NULL, 1277957033283, NULL, NULL, 20, '黑色 XL', NULL, 'HN0675', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (622, 43, 411379965590, NULL, 1277957033282, NULL, NULL, 20, '黑色 L', NULL, 'HN0675', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (623, 44, 411726911306, NULL, 1278685364127, NULL, NULL, 20, '黑灰色 M', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (624, 44, 411726911306, NULL, 1278685364117, NULL, NULL, 20, '白色 M', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (625, 44, 411726911306, NULL, 1278685364119, NULL, NULL, 20, '白色 XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (626, 44, 411726911306, NULL, 1278685364129, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (627, 44, 411726911306, NULL, 1278685364121, NULL, NULL, 20, '黑色 S', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (628, 44, 411726911306, NULL, 1278685364128, NULL, NULL, 20, '黑灰色 L', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (629, 44, 411726911306, NULL, 1278685364118, NULL, NULL, 20, '白色 L', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (630, 44, 411726911306, NULL, 1278685364130, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (631, 44, 411726911306, NULL, 1278685364134, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (632, 44, 411726911306, NULL, 1278685364122, NULL, NULL, 20, '黑色 M', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (633, 44, 411726911306, NULL, 1278685364132, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (634, 44, 411726911306, NULL, 1278685364133, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (635, 44, 411726911306, NULL, 1278685364124, NULL, NULL, 20, '黑色 XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (636, 44, 411726911306, NULL, 1278685364125, NULL, NULL, 20, '黑色 2XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (637, 44, 411726911306, NULL, 1278685364135, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (638, 44, 411726911306, NULL, 1278685364120, NULL, NULL, 20, '白色 2XL', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (639, 44, 411726911306, NULL, 1278685364131, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (640, 44, 411726911306, NULL, 1278685364126, NULL, NULL, 20, '黑灰色 S', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (641, 44, 411726911306, NULL, 1278685364123, NULL, NULL, 20, '黑色 L', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (642, 44, 411726911306, NULL, 1278685364116, NULL, NULL, 20, '白色 S', NULL, 'HN0686', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (643, 45, 411728903206, NULL, 1278687408574, NULL, NULL, 20, '彩色 S', NULL, 'HN0687', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (644, 45, 411728903206, NULL, 1278687408576, NULL, NULL, 20, '彩色 L', NULL, 'HN0687', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (645, 45, 411728903206, NULL, 1278687408575, NULL, NULL, 20, '彩色 M', NULL, 'HN0687', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (646, 45, 411728903206, NULL, 1278687408577, NULL, NULL, 20, '彩色 XL', NULL, 'HN0687', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (647, 45, 411728903206, NULL, 1278687408578, NULL, NULL, 20, '彩色 2XL', NULL, 'HN0687', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (648, 46, 411729694401, NULL, 1278690383970, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN6927505', NULL, NULL, NULL, NULL, NULL, 539, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (649, 46, 411729694401, NULL, 1278690383962, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN6925002', NULL, NULL, NULL, NULL, NULL, 541, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (650, 46, 411729694401, NULL, 1278690383964, NULL, NULL, 19, '浅蓝色 XL', NULL, 'HN6925004', NULL, NULL, NULL, NULL, NULL, 543, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (651, 46, 411729694401, NULL, 1278690383966, NULL, NULL, 18, '黑灰色 S', NULL, 'HN6927501', NULL, NULL, NULL, NULL, NULL, 535, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (652, 46, 411729694401, NULL, 1278690383961, NULL, NULL, 19, '浅蓝色 S', NULL, 'HN6925001', NULL, NULL, NULL, NULL, NULL, 540, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (653, 46, 411729694401, NULL, 1278690383963, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN6925003', NULL, NULL, NULL, NULL, NULL, 542, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (654, 46, 411729694401, NULL, 1278690383969, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN6927504', NULL, NULL, NULL, NULL, NULL, 538, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (655, 46, 411729694401, NULL, 1278690383968, NULL, NULL, 17, '黑灰色 L', NULL, 'HN6927503', NULL, NULL, NULL, NULL, NULL, 537, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (656, 46, 411729694401, NULL, 1278690383965, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN6925005', NULL, NULL, NULL, NULL, NULL, 544, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (657, 46, 411729694401, NULL, 1278690383967, NULL, NULL, 20, '黑灰色 M', NULL, 'HN6927502', NULL, NULL, NULL, NULL, NULL, 536, 36, NULL);
INSERT INTO `tao_goods_sku` VALUES (658, 47, 411731178725, NULL, 1278693303512, NULL, NULL, 20, '蓝色 M', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 624, 43, NULL);
INSERT INTO `tao_goods_sku` VALUES (659, 47, 411731178725, NULL, 1278693303514, NULL, NULL, 20, '蓝色 XL', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (660, 47, 411731178725, NULL, 1278693303516, NULL, NULL, 20, '黑灰色 S', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (661, 47, 411731178725, NULL, 1278693303520, NULL, NULL, 19, '黑灰色 2XL', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (662, 47, 411731178725, NULL, 1278693303517, NULL, NULL, 20, '黑灰色 M', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (663, 47, 411731178725, NULL, 1278693303515, NULL, NULL, 20, '蓝色 2XL', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (664, 47, 411731178725, NULL, 1278693303511, NULL, NULL, 20, '蓝色 S', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (665, 47, 411731178725, NULL, 1278693303519, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (666, 47, 411731178725, NULL, 1278693303518, NULL, NULL, 20, '黑灰色 L', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (667, 47, 411731178725, NULL, 1278693303513, NULL, NULL, 20, '蓝色 L', NULL, 'HN0694', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (668, 48, 411732581938, NULL, 1278695025347, NULL, NULL, 19, '黑灰色 L', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (669, 48, 411732581938, NULL, 1278695025352, NULL, NULL, 17, '浅蓝色 L', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (670, 48, 411732581938, NULL, 1278695025353, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (671, 48, 411732581938, NULL, 1278695025345, NULL, NULL, 20, '黑灰色 S', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (672, 48, 411732581938, NULL, 1278695025349, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (673, 48, 411732581938, NULL, 1278695025357, NULL, NULL, 20, '杏色 L', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (674, 48, 411732581938, NULL, 1278695025346, NULL, NULL, 19, '黑灰色 M', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (675, 48, 411732581938, NULL, 1278695025354, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (676, 48, 411732581938, NULL, 1278695025359, NULL, NULL, 20, '杏色 2XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (677, 48, 411732581938, NULL, 1278695025355, NULL, NULL, 20, '杏色 S', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (678, 48, 411732581938, NULL, 1278695025348, NULL, NULL, 19, '黑灰色 XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (679, 48, 411732581938, NULL, 1278695025358, NULL, NULL, 20, '杏色 XL', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (680, 48, 411732581938, NULL, 1278695025356, NULL, NULL, 20, '杏色 M', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (681, 48, 411732581938, NULL, 1278695025350, NULL, NULL, 19, '浅蓝色 S', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (682, 48, 411732581938, NULL, 1278695025351, NULL, NULL, 16, '浅蓝色 M', NULL, 'HN0697', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (683, 49, 412120506598, NULL, 1279515712395, NULL, NULL, 15, '黑灰色 XL', NULL, 'HN08017504', NULL, NULL, NULL, NULL, NULL, 498, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (684, 49, 412120506598, NULL, 1279515712388, NULL, NULL, 16, '黑色 M', NULL, 'HN08010102', NULL, NULL, NULL, NULL, NULL, 491, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (685, 49, 412120506598, NULL, 1279515712390, NULL, NULL, 19, '黑色 XL', NULL, 'HN08010104', NULL, NULL, NULL, NULL, NULL, 493, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (686, 49, 412120506598, NULL, 1279515712397, NULL, NULL, 19, '复古蓝 S', NULL, 'HN08014001', NULL, NULL, NULL, NULL, NULL, 505, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (687, 49, 412120506598, NULL, 1279515712405, NULL, NULL, 17, '蓝灰色 XL', NULL, 'HN08017504', NULL, NULL, NULL, NULL, NULL, 498, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (688, 49, 412120506598, NULL, 1279515712402, NULL, NULL, 18, '蓝灰色 S', NULL, 'HN08017501', NULL, NULL, NULL, NULL, NULL, 495, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (689, 49, 412120506598, NULL, 1279515712398, NULL, NULL, 17, '复古蓝 M', NULL, 'HN08014002', NULL, NULL, NULL, NULL, NULL, 506, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (690, 49, 412120506598, NULL, 1279515712400, NULL, NULL, 19, '复古蓝 XL', NULL, 'HN08014004', NULL, NULL, NULL, NULL, NULL, 508, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (691, 49, 412120506598, NULL, 1279515712389, NULL, NULL, 14, '黑色 L', NULL, 'HN08010103', NULL, NULL, NULL, NULL, NULL, 492, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (692, 49, 412120506598, NULL, 1279515712387, NULL, NULL, 18, '黑色 S', NULL, 'HN08010101', NULL, NULL, NULL, NULL, NULL, 490, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (693, 49, 412120506598, NULL, 1279515712401, NULL, NULL, 20, '复古蓝 2XL', NULL, 'HN08014005', NULL, NULL, NULL, NULL, NULL, 509, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (694, 49, 412120506598, NULL, 1279515712396, NULL, NULL, 17, '黑灰色 2XL', NULL, 'HN08017505', NULL, NULL, NULL, NULL, NULL, 499, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (695, 49, 412120506598, NULL, 1279515712406, NULL, NULL, 19, '蓝灰色 2XL', NULL, 'HN08017505', NULL, NULL, NULL, NULL, NULL, 499, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (696, 49, 412120506598, NULL, 1279515712393, NULL, NULL, 14, '黑灰色 M', NULL, 'HN08017502', NULL, NULL, NULL, NULL, NULL, 496, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (697, 49, 412120506598, NULL, 1279515712394, NULL, NULL, 11, '黑灰色 L', NULL, 'HN08017503', NULL, NULL, NULL, NULL, NULL, 497, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (698, 49, 412120506598, NULL, 1279515712391, NULL, NULL, 18, '黑色 2XL', NULL, 'HN08010105', NULL, NULL, NULL, NULL, NULL, 494, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (699, 49, 412120506598, NULL, 1279515712403, NULL, NULL, 14, '蓝灰色 M', NULL, 'HN08017502', NULL, NULL, NULL, NULL, NULL, 496, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (700, 49, 412120506598, NULL, 1279515712399, NULL, NULL, 19, '复古蓝 L', NULL, 'HN08014003', NULL, NULL, NULL, NULL, NULL, 507, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (701, 49, 412120506598, NULL, 1279515712392, NULL, NULL, 15, '黑灰色 S', NULL, 'HN08017501', NULL, NULL, NULL, NULL, NULL, 495, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (702, 49, 412120506598, NULL, 1279515712404, NULL, NULL, 10, '蓝灰色 L', NULL, 'HN08017503', NULL, NULL, NULL, NULL, NULL, 497, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (703, 50, 412133591017, NULL, 1279544038796, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (704, 50, 412133591017, NULL, 1279544038800, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (705, 50, 412133591017, NULL, 1279544038791, NULL, NULL, 20, '蓝灰色 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (706, 50, 412133591017, NULL, 1279544038779, NULL, NULL, 20, '黑色 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (707, 50, 412133591017, NULL, 1279544038794, NULL, NULL, 20, '蓝灰色 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (708, 50, 412133591017, NULL, 1279544038793, NULL, NULL, 19, '蓝灰色 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (709, 50, 412133591017, NULL, 1279544038803, NULL, NULL, 20, '杏色 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (710, 50, 412133591017, NULL, 1279544038780, NULL, NULL, 20, '黑色 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (711, 50, 412133591017, NULL, 1279544038790, NULL, NULL, 20, '复古蓝 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (712, 50, 412133591017, NULL, 1279544038778, NULL, NULL, 20, '黑色 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (713, 50, 412133591017, NULL, 1279544038805, NULL, NULL, 20, '杏色 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (714, 50, 412133591017, NULL, 1279544038784, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (715, 50, 412133591017, NULL, 1279544038786, NULL, NULL, 20, '复古蓝 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (716, 50, 412133591017, NULL, 1279544038797, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (717, 50, 412133591017, NULL, 1279544038776, NULL, NULL, 20, '黑色 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (718, 50, 412133591017, NULL, 1279544038799, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (719, 50, 412133591017, NULL, 1279544038782, NULL, NULL, 19, '黑灰色 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (720, 50, 412133591017, NULL, 1279544038787, NULL, NULL, 18, '复古蓝 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (721, 50, 412133591017, NULL, 1279544038795, NULL, NULL, 20, '蓝灰色 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (722, 50, 412133591017, NULL, 1279544038777, NULL, NULL, 20, '黑色 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (723, 50, 412133591017, NULL, 1279544038802, NULL, NULL, 20, '杏色 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (724, 50, 412133591017, NULL, 1279544038785, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (725, 50, 412133591017, NULL, 1279544038788, NULL, NULL, 19, '复古蓝 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (726, 50, 412133591017, NULL, 1279544038783, NULL, NULL, 19, '黑灰色 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (727, 50, 412133591017, NULL, 1279544038798, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (728, 50, 412133591017, NULL, 1279544038792, NULL, NULL, 20, '蓝灰色 M', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (729, 50, 412133591017, NULL, 1279544038789, NULL, NULL, 19, '复古蓝 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (730, 50, 412133591017, NULL, 1279544038781, NULL, NULL, 20, '黑灰色 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (731, 50, 412133591017, NULL, 1279544038804, NULL, NULL, 20, '杏色 XL', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (732, 50, 412133591017, NULL, 1279544038801, NULL, NULL, 20, '杏色 S', NULL, 'HN801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (733, 51, 412137132774, NULL, 1279549091913, NULL, NULL, 20, '黑灰色 S', NULL, 'HN802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (734, 51, 412137132774, NULL, 1279549091917, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (735, 51, 412137132774, NULL, 1279549091915, NULL, NULL, 20, '黑灰色 L', NULL, 'HN802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (736, 51, 412137132774, NULL, 1279549091914, NULL, NULL, 20, '黑灰色 M', NULL, 'HN802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (737, 51, 412137132774, NULL, 1279549091916, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (738, 52, 412138772165, NULL, 1279551031198, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (739, 52, 412138772165, NULL, 1279551031201, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (740, 52, 412138772165, NULL, 1279551031197, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (741, 52, 412138772165, NULL, 1279551031199, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (742, 52, 412138772165, NULL, 1279551031200, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (743, 53, 412139652425, NULL, 1279553631566, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (744, 53, 412139652425, NULL, 1279553631572, NULL, NULL, 20, '复古蓝 L', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (745, 53, 412139652425, NULL, 1279553631577, NULL, NULL, 20, '蓝灰色 L', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (746, 53, 412139652425, NULL, 1279553631578, NULL, NULL, 20, '蓝灰色 XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (747, 53, 412139652425, NULL, 1279553631575, NULL, NULL, 20, '蓝灰色 S', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (748, 53, 412139652425, NULL, 1279553631581, NULL, NULL, 20, '黑灰色 M', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (749, 53, 412139652425, NULL, 1279553631565, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (750, 53, 412139652425, NULL, 1279553631576, NULL, NULL, 20, '蓝灰色 M', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (751, 53, 412139652425, NULL, 1279553631571, NULL, NULL, 20, '复古蓝 M', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (752, 53, 412139652425, NULL, 1279553631567, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (753, 53, 412139652425, NULL, 1279553631574, NULL, NULL, 20, '复古蓝 2XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (754, 53, 412139652425, NULL, 1279553631583, NULL, NULL, 20, '黑灰色 XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (755, 53, 412139652425, NULL, 1279553631573, NULL, NULL, 20, '复古蓝 XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (756, 53, 412139652425, NULL, 1279553631568, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (757, 53, 412139652425, NULL, 1279553631579, NULL, NULL, 20, '蓝灰色 2XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (758, 53, 412139652425, NULL, 1279553631580, NULL, NULL, 20, '黑灰色 S', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (759, 53, 412139652425, NULL, 1279553631584, NULL, NULL, 20, '黑灰色 2XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (760, 53, 412139652425, NULL, 1279553631570, NULL, NULL, 20, '复古蓝 S', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (761, 53, 412139652425, NULL, 1279553631582, NULL, NULL, 20, '黑灰色 L', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (762, 53, 412139652425, NULL, 1279553631569, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN807', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (763, 54, 414594889986, NULL, 1284642162278, NULL, NULL, 20, '白色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (764, 54, 414594889986, NULL, 1284642162280, NULL, NULL, 19, '白色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (765, 54, 414594889986, NULL, 1284642162287, NULL, NULL, 20, '浅蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (766, 54, 414594889986, NULL, 1284642162286, NULL, NULL, 19, '黑色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (767, 54, 414594889986, NULL, 1284642162283, NULL, NULL, 20, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (768, 54, 414594889986, NULL, 1284642162281, NULL, NULL, 20, '白色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (769, 54, 414594889986, NULL, 1284642162291, NULL, NULL, 19, '浅蓝色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (770, 54, 414594889986, NULL, 1284642162277, NULL, NULL, 20, '白色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (771, 54, 414594889986, NULL, 1284642162284, NULL, NULL, 19, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (772, 54, 414594889986, NULL, 1284642162285, NULL, NULL, 19, '黑色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (773, 54, 414594889986, NULL, 1284642162279, NULL, NULL, 20, '白色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (774, 54, 414594889986, NULL, 1284642162282, NULL, NULL, 19, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (775, 54, 414594889986, NULL, 1284642162288, NULL, NULL, 20, '浅蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (776, 54, 414594889986, NULL, 1284642162289, NULL, NULL, 20, '浅蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (777, 54, 414594889986, NULL, 1284642162290, NULL, NULL, 20, '浅蓝色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (778, 55, 415222366821, NULL, 1285881278694, NULL, NULL, 20, '黑色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (779, 55, 415222366821, NULL, 1285881278693, NULL, NULL, 20, '白色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (780, 55, 415222366821, NULL, 1285881278697, NULL, NULL, 20, '浅蓝色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (781, 55, 415222366821, NULL, 1285881278695, NULL, NULL, 19, '粉红色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (782, 55, 415222366821, NULL, 1285881278696, NULL, NULL, 20, '杏色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (783, 56, 418757536479, NULL, 1292691249711, NULL, NULL, 50, '深蓝色加长款 XS', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 735, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (784, 56, 418757536479, NULL, 1292691249707, NULL, NULL, 49, '蓝色 M', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 731, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (785, 56, 418757536479, NULL, 1292691249708, NULL, NULL, 50, '蓝色 L', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 732, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (786, 56, 418757536479, NULL, 1292691249706, NULL, NULL, 50, '蓝色 S', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 730, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (787, 56, 418757536479, NULL, 1292691249713, NULL, NULL, 50, '深蓝色加长款 M', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 737, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (788, 56, 418757536479, NULL, 1292691249705, NULL, NULL, 50, '蓝色 XS', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 729, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (789, 56, 418757536479, NULL, 1292691249714, NULL, NULL, 50, '深蓝色加长款 L', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 738, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (790, 56, 418757536479, NULL, 1292691249712, NULL, NULL, 50, '深蓝色加长款 S', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 736, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (791, 56, 418757536479, NULL, 1292691249715, NULL, NULL, 50, '深蓝色加长款 XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 739, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (792, 56, 418757536479, NULL, 1292691249710, NULL, NULL, 50, '蓝色 2XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 734, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (793, 56, 418757536479, NULL, 1292691249716, NULL, NULL, 50, '深蓝色加长款 2XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 740, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (794, 56, 418757536479, NULL, 1292691249709, NULL, NULL, 50, '蓝色 XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 733, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (795, 57, 420535061032, NULL, 1295810387557, NULL, NULL, 50, '浅蓝九分 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1105, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (796, 57, 420535061032, NULL, 1295810387581, NULL, NULL, 50, '深蓝长款 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1307, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (797, 57, 420535061032, NULL, 1295810387555, NULL, NULL, 50, '黑色九分 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1089, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (798, 57, 420535061032, NULL, 1295810387566, NULL, NULL, 50, '深蓝九分 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1316, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (799, 57, 420535061032, NULL, 1295810387564, NULL, NULL, 50, '深蓝九分 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1314, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (800, 57, 420535061032, NULL, 1295810387585, NULL, NULL, 50, '深蓝长款 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1311, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (801, 57, 420535061032, NULL, 1295810387551, NULL, NULL, 50, '黑色九分 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1081, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (802, 57, 420535061032, NULL, 1295810387567, NULL, NULL, 50, '深蓝九分 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1317, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (803, 57, 420535061032, NULL, 1295810387569, NULL, NULL, 50, '黑色长款 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1082, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (804, 57, 420535061032, NULL, 1295810387578, NULL, NULL, 50, '浅蓝长款 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1112, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (805, 57, 420535061032, NULL, 1295810387583, NULL, NULL, 50, '深蓝长款 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1309, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (806, 57, 420535061032, NULL, 1295810387582, NULL, NULL, 50, '深蓝长款 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1308, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (807, 57, 420535061032, NULL, 1295810387559, NULL, NULL, 50, '浅蓝九分 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1109, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (808, 57, 420535061032, NULL, 1295810387561, NULL, NULL, 50, '浅蓝九分 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1113, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (809, 57, 420535061032, NULL, 1295810387562, NULL, NULL, 50, '深蓝九分 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1312, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (810, 57, 420535061032, NULL, 1295810387577, NULL, NULL, 50, '浅蓝长款 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1110, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (811, 57, 420535061032, NULL, 1295810387558, NULL, NULL, 50, '浅蓝九分 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1107, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (812, 57, 420535061032, NULL, 1295810387571, NULL, NULL, 50, '黑色长款 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1086, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (813, 57, 420535061032, NULL, 1295810387576, NULL, NULL, 50, '浅蓝长款 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1108, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (814, 57, 420535061032, NULL, 1295810387553, NULL, NULL, 50, '黑色九分 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1085, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (815, 57, 420535061032, NULL, 1295810387552, NULL, NULL, 50, '黑色九分 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1083, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (816, 57, 420535061032, NULL, 1295810387568, NULL, NULL, 50, '黑色长款 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1080, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (817, 57, 420535061032, NULL, 1295810387570, NULL, NULL, 50, '黑色长款 M', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1084, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (818, 57, 420535061032, NULL, 1295810387563, NULL, NULL, 50, '深蓝九分 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1313, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (819, 57, 420535061032, NULL, 1295810387580, NULL, NULL, 50, '深蓝长款 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1306, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (820, 57, 420535061032, NULL, 1295810387565, NULL, NULL, 50, '深蓝九分 L', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1315, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (821, 57, 420535061032, NULL, 1295810387560, NULL, NULL, 50, '浅蓝九分 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1111, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (822, 57, 420535061032, NULL, 1295810387554, NULL, NULL, 50, '黑色九分 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1087, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (823, 57, 420535061032, NULL, 1295810387573, NULL, NULL, 50, '黑色长款 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1090, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (824, 57, 420535061032, NULL, 1295810387556, NULL, NULL, 50, '浅蓝九分 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1103, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (825, 57, 420535061032, NULL, 1295810387574, NULL, NULL, 50, '浅蓝长款 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1104, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (826, 57, 420535061032, NULL, 1295810387584, NULL, NULL, 50, '深蓝长款 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1310, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (827, 57, 420535061032, NULL, 1295810387575, NULL, NULL, 50, '浅蓝长款 S', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1106, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (828, 57, 420535061032, NULL, 1295810387579, NULL, NULL, 50, '浅蓝长款 2XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1114, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (829, 57, 420535061032, NULL, 1295810387572, NULL, NULL, 50, '黑色长款 XL', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1088, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (830, 57, 420535061032, NULL, 1295810387550, NULL, NULL, 50, '黑色九分 XS', NULL, 'JKL9938', NULL, NULL, NULL, NULL, NULL, 1079, 62, NULL);
INSERT INTO `tao_goods_sku` VALUES (831, 59, 398847598958, NULL, 1251236772886, NULL, NULL, 15, '深灰色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (832, 59, 398847598958, NULL, 1251236772894, NULL, NULL, 17, '浅蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (833, 59, 398847598958, NULL, 1251236772887, NULL, NULL, 20, '深灰色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (834, 59, 398847598958, NULL, 1251236772892, NULL, NULL, 20, '黑色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (835, 59, 398847598958, NULL, 1251236772897, NULL, NULL, 19, '浅蓝色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (836, 59, 398847598958, NULL, 1251236772898, NULL, NULL, 20, '浅蓝色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (837, 59, 398847598958, NULL, 1251236772896, NULL, NULL, 14, '浅蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (838, 59, 398847598958, NULL, 1251236772885, NULL, NULL, 20, '深灰色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (839, 59, 398847598958, NULL, 1251236772891, NULL, NULL, 17, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (840, 59, 398847598958, NULL, 1251236772889, NULL, NULL, 20, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (841, 59, 398847598958, NULL, 1251236772890, NULL, NULL, 17, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (842, 59, 398847598958, NULL, 1251236772893, NULL, NULL, 19, '黑色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (843, 59, 398847598958, NULL, 1251236772884, NULL, NULL, 19, '深灰色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (844, 59, 398847598958, NULL, 1251236772895, NULL, NULL, 18, '浅蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (845, 59, 398847598958, NULL, 1251236772888, NULL, NULL, 20, '深灰色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (846, 60, 399063348248, NULL, 1251749918980, NULL, NULL, 100, '浅蓝色加长', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (847, 60, 399063348248, NULL, 1251749918984, NULL, NULL, 100, '黑色长裤', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (848, 60, 399063348248, NULL, 1251749918978, NULL, NULL, 100, '浅蓝色长裤', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (849, 60, 399063348248, NULL, 1251749918981, NULL, NULL, 100, '复古蓝加长', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (850, 60, 399063348248, NULL, 1251749918976, NULL, NULL, 99, '复古蓝长裤', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (851, 60, 399063348248, NULL, 1251749918983, NULL, NULL, 100, '黑色加长', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (852, 60, 399063348248, NULL, 1251749918979, NULL, NULL, 100, '复古蓝九分', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (853, 60, 399063348248, NULL, 1251749918982, NULL, NULL, 100, '黑色九分', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (854, 60, 399063348248, NULL, 1251749918977, NULL, NULL, 100, '浅蓝色九分', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (855, 61, 399063851678, NULL, 1276572950561, NULL, NULL, 20, '浅蓝色 XL', NULL, 'HN0678', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (856, 61, 399063851678, NULL, 1276572950560, NULL, NULL, 20, '浅蓝色 L', NULL, 'HN0678', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (857, 61, 399063851678, NULL, 1276572950559, NULL, NULL, 20, '浅蓝色 M', NULL, 'HN0678', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (858, 61, 399063851678, NULL, 1276572950562, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'HN0678', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (859, 61, 399063851678, NULL, 1276572950558, NULL, NULL, 20, '浅蓝色 S', NULL, 'HN0678', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (860, 62, 407249067559, NULL, 1269479069148, NULL, NULL, 20, '黑色 30', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (861, 62, 407249067559, NULL, 1269479069152, NULL, NULL, 20, '黑色 34', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (862, 62, 407249067559, NULL, 1269479069146, NULL, NULL, 20, '黑色 28', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (863, 62, 407249067559, NULL, 1269479069140, NULL, NULL, 20, '蓝色 30', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (864, 62, 407249067559, NULL, 1269479069151, NULL, NULL, 20, '黑色 33', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (865, 62, 407249067559, NULL, 1269477690312, NULL, NULL, 20, '黑色 26', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (866, 62, 407249067559, NULL, 1269479069142, NULL, NULL, 20, '蓝色 32', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (867, 62, 407249067559, NULL, 1269479069143, NULL, NULL, 20, '蓝色 33', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (868, 62, 407249067559, NULL, 1269479069150, NULL, NULL, 20, '黑色 32', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (869, 62, 407249067559, NULL, 1269479069145, NULL, NULL, 20, '黑色 27', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (870, 62, 407249067559, NULL, 1269479069137, NULL, NULL, 20, '蓝色 27', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (871, 62, 407249067559, NULL, 1269479069149, NULL, NULL, 20, '黑色 31', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (872, 62, 407249067559, NULL, 1269479069138, NULL, NULL, 20, '蓝色 28', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (873, 62, 407249067559, NULL, 1269477690311, NULL, NULL, 20, '蓝色 26', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (874, 62, 407249067559, NULL, 1269479069141, NULL, NULL, 20, '蓝色 31', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (875, 62, 407249067559, NULL, 1269479069139, NULL, NULL, 20, '蓝色 29', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (876, 62, 407249067559, NULL, 1269479069147, NULL, NULL, 20, '黑色 29', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (877, 62, 407249067559, NULL, 1269479069144, NULL, NULL, 20, '蓝色 34', NULL, 'KH9695', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (878, 63, 407356168572, NULL, 1269724202582, NULL, NULL, 20, '灰色 28', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (879, 63, 407356168572, NULL, 1269724202590, NULL, NULL, 20, '黑色 29', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (880, 63, 407356168572, NULL, 1269724202581, NULL, NULL, 20, '灰色 27', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (881, 63, 407356168572, NULL, 1269724202585, NULL, NULL, 20, '灰色 31', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (882, 63, 407356168572, NULL, 1269724202583, NULL, NULL, 20, '灰色 29', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (883, 63, 407356168572, NULL, 1269724202591, NULL, NULL, 20, '黑色 30', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (884, 63, 407356168572, NULL, 1269724202586, NULL, NULL, 20, '灰色 32', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (885, 63, 407356168572, NULL, 1269724202588, NULL, NULL, 20, '黑色 27', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (886, 63, 407356168572, NULL, 1269724202593, NULL, NULL, 20, '黑色 32', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (887, 63, 407356168572, NULL, 1269724202587, NULL, NULL, 20, '黑色 26', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (888, 63, 407356168572, NULL, 1269724202592, NULL, NULL, 20, '黑色 31', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (889, 63, 407356168572, NULL, 1269724202584, NULL, NULL, 20, '灰色 30', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (890, 63, 407356168572, NULL, 1269724202580, NULL, NULL, 20, '灰色 26', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (891, 63, 407356168572, NULL, 1269724202589, NULL, NULL, 20, '黑色 28', NULL, 'KH9709', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (892, 64, 408246660557, NULL, 1271567855666, NULL, NULL, 20, '浅蓝色 30', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (893, 64, 408246660557, NULL, 1271567855664, NULL, NULL, 20, '浅蓝色 28', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (894, 64, 408246660557, NULL, 1271567855671, NULL, NULL, 20, '深蓝色 28', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (895, 64, 408246660557, NULL, 1271567855661, NULL, NULL, 20, '灰色 32', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (896, 64, 408246660557, NULL, 1271567855660, NULL, NULL, 20, '灰色 31', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (897, 64, 408246660557, NULL, 1271567855669, NULL, NULL, 20, '深蓝色 26', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (898, 64, 408246660557, NULL, 1271567855673, NULL, NULL, 20, '深蓝色 30', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (899, 64, 408246660557, NULL, 1271567855672, NULL, NULL, 20, '深蓝色 29', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (900, 64, 408246660557, NULL, 1271567855663, NULL, NULL, 20, '浅蓝色 27', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (901, 64, 408246660557, NULL, 1271567855655, NULL, NULL, 20, '灰色 26', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (902, 64, 408246660557, NULL, 1271567855667, NULL, NULL, 20, '浅蓝色 31', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (903, 64, 408246660557, NULL, 1271567855656, NULL, NULL, 20, '灰色 27', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (904, 64, 408246660557, NULL, 1271567855659, NULL, NULL, 20, '灰色 30', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (905, 64, 408246660557, NULL, 1271567855658, NULL, NULL, 20, '灰色 29', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (906, 64, 408246660557, NULL, 1271567855657, NULL, NULL, 20, '灰色 28', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (907, 64, 408246660557, NULL, 1271567855674, NULL, NULL, 20, '深蓝色 31', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (908, 64, 408246660557, NULL, 1271567855668, NULL, NULL, 20, '浅蓝色 32', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (909, 64, 408246660557, NULL, 1271567855675, NULL, NULL, 20, '深蓝色 32', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (910, 64, 408246660557, NULL, 1271567855662, NULL, NULL, 20, '浅蓝色 26', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (911, 64, 408246660557, NULL, 1271567855670, NULL, NULL, 20, '深蓝色 27', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (912, 64, 408246660557, NULL, 1271567855665, NULL, NULL, 20, '浅蓝色 29', NULL, 'KH9685', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (913, 65, 408275614162, NULL, 1271623290129, NULL, NULL, 20, '黑灰 32', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (914, 65, 408275614162, NULL, 1271623290119, NULL, NULL, 20, '蓝灰 29', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (915, 65, 408275614162, NULL, 1271623290118, NULL, NULL, 20, '蓝灰 28', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (916, 65, 408275614162, NULL, 1271623290116, NULL, NULL, 20, '蓝灰 26', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (917, 65, 408275614162, NULL, 1271623290126, NULL, NULL, 20, '黑灰 29', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (918, 65, 408275614162, NULL, 1271623290121, NULL, NULL, 20, '蓝灰 31', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (919, 65, 408275614162, NULL, 1271623290127, NULL, NULL, 20, '黑灰 30', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (920, 65, 408275614162, NULL, 1271623290125, NULL, NULL, 20, '黑灰 28', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (921, 65, 408275614162, NULL, 1271623290122, NULL, NULL, 20, '蓝灰 32', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (922, 65, 408275614162, NULL, 1271623290120, NULL, NULL, 20, '蓝灰 30', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (923, 65, 408275614162, NULL, 1271623290117, NULL, NULL, 20, '蓝灰 27', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (924, 65, 408275614162, NULL, 1271623290124, NULL, NULL, 20, '黑灰 27', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (925, 65, 408275614162, NULL, 1271623290123, NULL, NULL, 20, '黑灰 26', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (926, 65, 408275614162, NULL, 1271623290128, NULL, NULL, 20, '黑灰 31', NULL, 'KH9688', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (927, 66, 411405520617, NULL, 1278013335025, NULL, NULL, 20, '宝蓝色 2XL', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (928, 66, 411405520617, NULL, 1278013335019, NULL, NULL, 20, '浅蓝色 XL', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (929, 66, 411405520617, NULL, 1278013335018, NULL, NULL, 20, '浅蓝色 L', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (930, 66, 411405520617, NULL, 1278013335020, NULL, NULL, 20, '浅蓝色 2XL', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (931, 66, 411405520617, NULL, 1278013335023, NULL, NULL, 20, '宝蓝色 L', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (932, 66, 411405520617, NULL, 1278013335024, NULL, NULL, 20, '宝蓝色 XL', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (933, 66, 411405520617, NULL, 1278013335017, NULL, NULL, 20, '浅蓝色 M', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (934, 66, 411405520617, NULL, 1278013335016, NULL, NULL, 20, '浅蓝色 S', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (935, 66, 411405520617, NULL, 1278013335021, NULL, NULL, 20, '宝蓝色 S', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (936, 66, 411405520617, NULL, 1278013335022, NULL, NULL, 20, '宝蓝色 M', NULL, 'KH22318', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (937, 67, 415140360909, NULL, 1285730382209, NULL, NULL, 50, '黑色 S', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (938, 67, 415140360909, NULL, 1285730382215, NULL, NULL, 49, '浅蓝色 M', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (939, 67, 415140360909, NULL, 1285730382219, NULL, NULL, 50, '宝蓝色 S', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (940, 67, 415140360909, NULL, 1285730382211, NULL, NULL, 50, '黑色 L', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (941, 67, 415140360909, NULL, 1285730382212, NULL, NULL, 50, '黑色 XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (942, 67, 415140360909, NULL, 1285730382223, NULL, NULL, 50, '宝蓝色 2XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (943, 67, 415140360909, NULL, 1285730382213, NULL, NULL, 50, '黑色 2XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (944, 67, 415140360909, NULL, 1285730382216, NULL, NULL, 50, '浅蓝色 L', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (945, 67, 415140360909, NULL, 1285730382214, NULL, NULL, 50, '浅蓝色 S', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (946, 67, 415140360909, NULL, 1285730382221, NULL, NULL, 49, '宝蓝色 L', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (947, 67, 415140360909, NULL, 1285730382217, NULL, NULL, 50, '浅蓝色 XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (948, 67, 415140360909, NULL, 1285730382210, NULL, NULL, 50, '黑色 M', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (949, 67, 415140360909, NULL, 1285730382222, NULL, NULL, 50, '宝蓝色 XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (950, 67, 415140360909, NULL, 1285730382220, NULL, NULL, 50, '宝蓝色 M', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (951, 67, 415140360909, NULL, 1285730382218, NULL, NULL, 50, '浅蓝色 2XL', NULL, 'HN014', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (952, 68, 415209134293, NULL, 1285863953219, NULL, NULL, 50, '白色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (953, 68, 415209134293, NULL, 1285863953220, NULL, NULL, 50, '黑色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (954, 68, 415209134293, NULL, 1285863953221, NULL, NULL, 50, '粉红色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (955, 68, 415209134293, NULL, 1285863953222, NULL, NULL, 50, '杏色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (956, 68, 415209134293, NULL, 1285863953223, NULL, NULL, 50, '浅蓝色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (957, 69, 418749496896, NULL, 1292679844924, NULL, NULL, 49, '深蓝色长款 2XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (958, 69, 418749496896, NULL, 1292679844920, NULL, NULL, 50, '深蓝色长款 S', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (959, 69, 418749496896, NULL, 1292679844926, NULL, NULL, 50, '蓝色 S', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 729, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (960, 69, 418749496896, NULL, 1292679844929, NULL, NULL, 50, '蓝色 XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (961, 69, 418749496896, NULL, 1292679844927, NULL, NULL, 50, '蓝色 M', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (962, 69, 418749496896, NULL, 1292679844919, NULL, NULL, 50, '深蓝色长款 XS', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (963, 69, 418749496896, NULL, 1292679844921, NULL, NULL, 49, '深蓝色长款 M', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (964, 69, 418749496896, NULL, 1292679844922, NULL, NULL, 50, '深蓝色长款 L', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (965, 69, 418749496896, NULL, 1292679844923, NULL, NULL, 50, '深蓝色长款 XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (966, 69, 418749496896, NULL, 1292679844930, NULL, NULL, 50, '蓝色 2XL', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (967, 69, 418749496896, NULL, 1292679844928, NULL, NULL, 50, '蓝色 L', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (968, 69, 418749496896, NULL, 1292679844925, NULL, NULL, 50, '蓝色 XS', NULL, 'JKL805', NULL, NULL, NULL, NULL, NULL, 729, 47, NULL);
INSERT INTO `tao_goods_sku` VALUES (969, 70, 421025454368, NULL, 1296578397962, NULL, NULL, 50, '蓝色 M', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (970, 70, 421025454368, NULL, 1296578397963, NULL, NULL, 50, '蓝色 L', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (971, 70, 421025454368, NULL, 1296578397967, NULL, NULL, 50, '黑色 S', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (972, 70, 421025454368, NULL, 1296578397965, NULL, NULL, 50, '蓝色 2XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (973, 70, 421025454368, NULL, 1296578397964, NULL, NULL, 50, '蓝色 XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (974, 70, 421025454368, NULL, 1296578397968, NULL, NULL, 50, '黑色 M', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (975, 70, 421025454368, NULL, 1296578397960, NULL, NULL, 50, '蓝色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (976, 70, 421025454368, NULL, 1296578397961, NULL, NULL, 50, '蓝色 S', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (977, 70, 421025454368, NULL, 1296578397970, NULL, NULL, 50, '黑色 XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (978, 70, 421025454368, NULL, 1296578397969, NULL, NULL, 50, '黑色 L', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (979, 70, 421025454368, NULL, 1296578397966, NULL, NULL, 50, '黑色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (980, 70, 421025454368, NULL, 1296578397971, NULL, NULL, 50, '黑色 2XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (981, 71, 421031955741, NULL, 1296587850812, NULL, NULL, 50, '蓝灰色加绒 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (982, 71, 421031955741, NULL, 1296587850789, NULL, NULL, 50, '复古蓝 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (983, 71, 421031955741, NULL, 1296587850799, NULL, NULL, 50, '杏色 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (984, 71, 421031955741, NULL, 1296587850814, NULL, NULL, 50, '蓝灰色加绒 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (985, 71, 421031955741, NULL, 1296587850813, NULL, NULL, 50, '蓝灰色加绒 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (986, 71, 421031955741, NULL, 1296587850816, NULL, NULL, 50, '复古蓝加绒 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (987, 71, 421031955741, NULL, 1296587850800, NULL, NULL, 50, '杏色 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (988, 71, 421031955741, NULL, 1296587850809, NULL, NULL, 50, '黑灰色加绒 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (989, 71, 421031955741, NULL, 1296587850771, NULL, NULL, 50, '黑色 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (990, 71, 421031955741, NULL, 1296587850773, NULL, NULL, 50, '黑色 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (991, 71, 421031955741, NULL, 1296587850804, NULL, NULL, 50, '黑色加绒 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (992, 71, 421031955741, NULL, 1296587850803, NULL, NULL, 50, '黑色加绒 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (993, 71, 421031955741, NULL, 1296587850784, NULL, NULL, 50, '蓝灰色 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (994, 71, 421031955741, NULL, 1296587850787, NULL, NULL, 50, '复古蓝 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (995, 71, 421031955741, NULL, 1296587850815, NULL, NULL, 50, '蓝灰色加绒 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (996, 71, 421031955741, NULL, 1296587850808, NULL, NULL, 50, '黑灰色加绒 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (997, 71, 421031955741, NULL, 1296587850791, NULL, NULL, 50, '浅蓝色 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (998, 71, 421031955741, NULL, 1296587850802, NULL, NULL, 50, '黑色加绒 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (999, 71, 421031955741, NULL, 1296587850774, NULL, NULL, 50, '黑色 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1000, 71, 421031955741, NULL, 1296587850817, NULL, NULL, 50, '复古蓝加绒 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1001, 71, 421031955741, NULL, 1296587850776, NULL, NULL, 50, '黑灰色 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1002, 71, 421031955741, NULL, 1296587850823, NULL, NULL, 50, '浅蓝色加绒 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1003, 71, 421031955741, NULL, 1296587850775, NULL, NULL, 50, '黑色 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1004, 71, 421031955741, NULL, 1296587850782, NULL, NULL, 50, '蓝灰色 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1005, 71, 421031955741, NULL, 1296587850801, NULL, NULL, 50, '黑色加绒 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1006, 71, 421031955741, NULL, 1296587850811, NULL, NULL, 50, '蓝灰色加绒 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1007, 71, 421031955741, NULL, 1296587850795, NULL, NULL, 50, '浅蓝色 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1008, 71, 421031955741, NULL, 1296587850820, NULL, NULL, 50, '复古蓝加绒 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1009, 71, 421031955741, NULL, 1296587850792, NULL, NULL, 50, '浅蓝色 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1010, 71, 421031955741, NULL, 1296587850779, NULL, NULL, 50, '黑灰色 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1011, 71, 421031955741, NULL, 1296587850783, NULL, NULL, 50, '蓝灰色 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1012, 71, 421031955741, NULL, 1296587850793, NULL, NULL, 50, '浅蓝色 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1013, 71, 421031955741, NULL, 1296587850794, NULL, NULL, 50, '浅蓝色 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1014, 71, 421031955741, NULL, 1296587850818, NULL, NULL, 50, '复古蓝加绒 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1015, 71, 421031955741, NULL, 1296587850781, NULL, NULL, 50, '蓝灰色 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1016, 71, 421031955741, NULL, 1296587850798, NULL, NULL, 50, '杏色 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1017, 71, 421031955741, NULL, 1296587850785, NULL, NULL, 50, '蓝灰色 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1018, 71, 421031955741, NULL, 1296587850772, NULL, NULL, 50, '黑色 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1019, 71, 421031955741, NULL, 1296587850788, NULL, NULL, 50, '复古蓝 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1020, 71, 421031955741, NULL, 1296587850790, NULL, NULL, 50, '复古蓝 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1021, 71, 421031955741, NULL, 1296587850822, NULL, NULL, 50, '浅蓝色加绒 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1022, 71, 421031955741, NULL, 1296587850825, NULL, NULL, 50, '浅蓝色加绒 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1023, 71, 421031955741, NULL, 1296587850810, NULL, NULL, 50, '黑灰色加绒 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1024, 71, 421031955741, NULL, 1296587850780, NULL, NULL, 50, '黑灰色 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1025, 71, 421031955741, NULL, 1296587850786, NULL, NULL, 50, '复古蓝 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1026, 71, 421031955741, NULL, 1296587850777, NULL, NULL, 50, '黑灰色 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1027, 71, 421031955741, NULL, 1296587850796, NULL, NULL, 50, '杏色 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1028, 71, 421031955741, NULL, 1296587850797, NULL, NULL, 50, '杏色 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1029, 71, 421031955741, NULL, 1296587850807, NULL, NULL, 50, '黑灰色加绒 M', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1030, 71, 421031955741, NULL, 1296587850778, NULL, NULL, 50, '黑灰色 L', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1031, 71, 421031955741, NULL, 1296587850824, NULL, NULL, 50, '浅蓝色加绒 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1032, 71, 421031955741, NULL, 1296587850806, NULL, NULL, 50, '黑灰色加绒 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1033, 71, 421031955741, NULL, 1296587850821, NULL, NULL, 50, '浅蓝色加绒 S', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1034, 71, 421031955741, NULL, 1296587850819, NULL, NULL, 50, '复古蓝加绒 XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1035, 71, 421031955741, NULL, 1296587850805, NULL, NULL, 50, '黑色加绒 2XL', NULL, 'HN0801', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1036, 31, 410305683990, NULL, 1297861756228, NULL, NULL, 19, '复古蓝 L', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1037, 31, 410305683990, NULL, 1297861756227, NULL, NULL, 20, '复古蓝 M', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1038, 31, 410305683990, NULL, 1297861756229, NULL, NULL, 20, '复古蓝 XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1039, 31, 410305683990, NULL, 1297861756226, NULL, NULL, 20, '复古蓝 S', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1040, 31, 410305683990, NULL, 1297861756230, NULL, NULL, 20, '复古蓝 2XL', NULL, 'HN0660', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1041, 49, 412120506598, NULL, 1297847604596, NULL, NULL, 1050, '蓝灰色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 762, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1042, 49, 412120506598, NULL, 1297847604597, NULL, NULL, 1050, '蓝灰色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 763, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1043, 49, 412120506598, NULL, 1297847604601, NULL, NULL, 1050, '复古蓝加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 767, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1044, 49, 412120506598, NULL, 1297847604587, NULL, NULL, 1050, '黑色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 753, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1045, 49, 412120506598, NULL, 1297848305476, NULL, NULL, 1050, '杏色 L', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 748, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1046, 49, 412120506598, NULL, 1297847604603, NULL, NULL, 1050, '复古蓝加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 769, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1047, 49, 412120506598, NULL, 1297847604586, NULL, NULL, 1050, '黑色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 752, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1048, 49, 412120506598, NULL, 1297848305469, NULL, NULL, 1050, '浅蓝色 S', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 741, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1049, 49, 412120506598, NULL, 1297847604595, NULL, NULL, 1050, '蓝灰色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 761, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1050, 49, 412120506598, NULL, 1297848305474, NULL, NULL, 1050, '杏色 S', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 746, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1051, 49, 412120506598, NULL, 1297847604591, NULL, NULL, 1050, '黑灰色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 757, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1052, 49, 412120506598, NULL, 1297847604604, NULL, NULL, 1050, '复古蓝加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 770, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1053, 49, 412120506598, NULL, 1297847604608, NULL, NULL, 1050, '浅蓝色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 774, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1054, 49, 412120506598, NULL, 1297848305475, NULL, NULL, 1050, '杏色 M', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 747, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1055, 49, 412120506598, NULL, 1297847604606, NULL, NULL, 1050, '浅蓝色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 772, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1056, 49, 412120506598, NULL, 1297848305478, NULL, NULL, 1050, '杏色 2XL', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 750, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1057, 49, 412120506598, NULL, 1297847604609, NULL, NULL, 1050, '浅蓝色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 775, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1058, 49, 412120506598, NULL, 1297847604599, NULL, NULL, 1050, '蓝灰色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 765, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1059, 49, 412120506598, NULL, 1297847604607, NULL, NULL, 1050, '浅蓝色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 773, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1060, 49, 412120506598, NULL, 1297847604593, NULL, NULL, 1050, '黑灰色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 759, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1061, 49, 412120506598, NULL, 1297848305471, NULL, NULL, 1050, '浅蓝色 L', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 743, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1062, 49, 412120506598, NULL, 1297847604590, NULL, NULL, 1050, '黑灰色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 756, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1063, 49, 412120506598, NULL, 1297847604600, NULL, NULL, 1050, '复古蓝加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 766, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1064, 49, 412120506598, NULL, 1297847604585, NULL, NULL, 1050, '黑色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 751, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1065, 49, 412120506598, NULL, 1297847604592, NULL, NULL, 1050, '黑灰色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 758, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1066, 49, 412120506598, NULL, 1297848305472, NULL, NULL, 1050, '浅蓝色 XL', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 744, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1067, 49, 412120506598, NULL, 1297847604605, NULL, NULL, 1050, '浅蓝色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 771, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1068, 49, 412120506598, NULL, 1297847604589, NULL, NULL, 1050, '黑色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 755, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1069, 49, 412120506598, NULL, 1297847604602, NULL, NULL, 1050, '复古蓝加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 768, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1070, 49, 412120506598, NULL, 1297847604598, NULL, NULL, 1050, '蓝灰色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 764, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1071, 49, 412120506598, NULL, 1297848305470, NULL, NULL, 1050, '浅蓝色 M', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 742, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1072, 49, 412120506598, NULL, 1297847604588, NULL, NULL, 1050, '黑色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 754, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1073, 49, 412120506598, NULL, 1297847604594, NULL, NULL, 1050, '黑灰色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 760, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1074, 49, 412120506598, NULL, 1297848305473, NULL, NULL, 1050, '浅蓝色 2XL', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 745, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1075, 49, 412120506598, NULL, 1297848305477, NULL, NULL, 1050, '杏色 XL', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 749, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1076, 72, 421771728900, NULL, 1297849667188, NULL, NULL, 50, '蓝灰色 S', NULL, 'HN08017501', NULL, NULL, NULL, NULL, NULL, 495, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1077, 72, 421771728900, NULL, 1297849667191, NULL, NULL, 50, '蓝灰色 XL', NULL, 'HN08017504', NULL, NULL, NULL, NULL, NULL, 498, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1078, 72, 421771728900, NULL, 1297849667222, NULL, NULL, 50, '复古蓝加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1079, 72, 421771728900, NULL, 1297849667178, NULL, NULL, 50, '黑灰色 S', NULL, 'HN08017501', NULL, NULL, NULL, NULL, NULL, 495, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1080, 72, 421771728900, NULL, 1297849667206, NULL, NULL, 49, '黑色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1081, 72, 421771728900, NULL, 1297849667189, NULL, NULL, 50, '蓝灰色 M', NULL, 'HN08017502', NULL, NULL, NULL, NULL, NULL, 496, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1082, 72, 421771728900, NULL, 1297849667180, NULL, NULL, 50, '黑灰色 L', NULL, 'HN08017503', NULL, NULL, NULL, NULL, NULL, 497, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1083, 72, 421771728900, NULL, 1297849667214, NULL, NULL, 50, '蓝灰色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1084, 72, 421771728900, NULL, 1297849667216, NULL, NULL, 50, '蓝灰色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1085, 72, 421771728900, NULL, 1297849667207, NULL, NULL, 50, '黑色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1086, 72, 421771728900, NULL, 1297849667187, NULL, NULL, 50, '复古蓝 2XL', NULL, 'HN08014005', NULL, NULL, NULL, NULL, NULL, 509, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1087, 72, 421771728900, NULL, 1297849667210, NULL, NULL, 50, '黑灰色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1088, 72, 421771728900, NULL, 1297849667209, NULL, NULL, 50, '黑灰色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1089, 72, 421771728900, NULL, 1297849667205, NULL, NULL, 50, '黑色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1090, 72, 421771728900, NULL, 1297849667215, NULL, NULL, 50, '蓝灰色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1091, 72, 421771728900, NULL, 1297849667220, NULL, NULL, 50, '复古蓝加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1092, 72, 421771728900, NULL, 1297849667225, NULL, NULL, 50, '浅蓝色加绒 L', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1093, 72, 421771728900, NULL, 1297849667182, NULL, NULL, 50, '黑灰色 2XL', NULL, 'HN08017505', NULL, NULL, NULL, NULL, NULL, 499, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1094, 72, 421771728900, NULL, 1297849667196, NULL, NULL, 50, '浅蓝色 XL', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1095, 72, 421771728900, NULL, 1297849667193, NULL, NULL, 50, '浅蓝色 S', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1096, 72, 421771728900, NULL, 1297849667226, NULL, NULL, 50, '浅蓝色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1097, 72, 421771728900, NULL, 1297849667190, NULL, NULL, 50, '蓝灰色 L', NULL, 'HN08017503', NULL, NULL, NULL, NULL, NULL, 497, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1098, 72, 421771728900, NULL, 1297849667203, NULL, NULL, 50, '黑色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1099, 72, 421771728900, NULL, 1297849667212, NULL, NULL, 50, '黑灰色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1100, 72, 421771728900, NULL, 1297849667221, NULL, NULL, 50, '复古蓝加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1101, 72, 421771728900, NULL, 1297849667174, NULL, NULL, 50, '黑色 M', NULL, 'HN08010102', NULL, NULL, NULL, NULL, NULL, 491, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1102, 72, 421771728900, NULL, 1297849667183, NULL, NULL, 50, '复古蓝 S', NULL, 'HN08014001', NULL, NULL, NULL, NULL, NULL, 505, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1103, 72, 421771728900, NULL, 1297849667204, NULL, NULL, 50, '黑色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1104, 72, 421771728900, NULL, 1297849667198, NULL, NULL, 50, '杏色 S', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1105, 72, 421771728900, NULL, 1297849667227, NULL, NULL, 50, '浅蓝色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1106, 72, 421771728900, NULL, 1297849667179, NULL, NULL, 50, '黑灰色 M', NULL, 'HN08017502', NULL, NULL, NULL, NULL, NULL, 496, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1107, 72, 421771728900, NULL, 1297849667181, NULL, NULL, 50, '黑灰色 XL', NULL, 'HN08017504', NULL, NULL, NULL, NULL, NULL, 498, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1108, 72, 421771728900, NULL, 1297849667217, NULL, NULL, 50, '蓝灰色加绒 2XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1109, 72, 421771728900, NULL, 1297849667219, NULL, NULL, 50, '复古蓝加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1110, 72, 421771728900, NULL, 1297849667224, NULL, NULL, 50, '浅蓝色加绒 M', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1111, 72, 421771728900, NULL, 1297849667199, NULL, NULL, 50, '杏色 M', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1112, 72, 421771728900, NULL, 1297849667176, NULL, NULL, 50, '黑色 XL', NULL, 'HN08010104', NULL, NULL, NULL, NULL, NULL, 493, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1113, 72, 421771728900, NULL, 1297849667200, NULL, NULL, 50, '杏色 L', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1114, 72, 421771728900, NULL, 1297849667186, NULL, NULL, 50, '复古蓝 XL', NULL, 'HN08014004', NULL, NULL, NULL, NULL, NULL, 508, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1115, 72, 421771728900, NULL, 1297849667218, NULL, NULL, 50, '复古蓝加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1116, 72, 421771728900, NULL, 1297849667208, NULL, NULL, 50, '黑灰色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1117, 72, 421771728900, NULL, 1297849667213, NULL, NULL, 50, '蓝灰色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1118, 72, 421771728900, NULL, 1297849667184, NULL, NULL, 50, '复古蓝 M', NULL, 'HN08014002', NULL, NULL, NULL, NULL, NULL, 506, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1119, 72, 421771728900, NULL, 1297849667194, NULL, NULL, 50, '浅蓝色 M', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1120, 72, 421771728900, NULL, 1297849667223, NULL, NULL, 50, '浅蓝色加绒 S', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1121, 72, 421771728900, NULL, 1297849667173, NULL, NULL, 50, '黑色 S', NULL, 'HN08010101', NULL, NULL, NULL, NULL, NULL, 490, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1122, 72, 421771728900, NULL, 1297849667175, NULL, NULL, 50, '黑色 L', NULL, 'HN08010103', NULL, NULL, NULL, NULL, NULL, 492, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1123, 72, 421771728900, NULL, 1297849667177, NULL, NULL, 50, '黑色 2XL', NULL, 'HN08010105', NULL, NULL, NULL, NULL, NULL, 494, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1124, 72, 421771728900, NULL, 1297849667201, NULL, NULL, 50, '杏色 XL', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1125, 72, 421771728900, NULL, 1297849667195, NULL, NULL, 50, '浅蓝色 L', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1126, 72, 421771728900, NULL, 1297849667197, NULL, NULL, 50, '浅蓝色 2XL', NULL, 'HN0801Q', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1127, 72, 421771728900, NULL, 1297849667202, NULL, NULL, 50, '杏色 2XL', NULL, 'HN0801X', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1128, 72, 421771728900, NULL, 1297849667185, NULL, NULL, 50, '复古蓝 L', NULL, 'HN08014003', NULL, NULL, NULL, NULL, NULL, 507, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1129, 72, 421771728900, NULL, 1297849667211, NULL, NULL, 50, '黑灰色加绒 XL', NULL, 'HN0801J', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1130, 72, 421771728900, NULL, 1297849667192, NULL, NULL, 50, '蓝灰色 2XL', NULL, 'HN08017505', NULL, NULL, NULL, NULL, NULL, 499, 33, NULL);
INSERT INTO `tao_goods_sku` VALUES (1131, 5, 394814708558, NULL, 1300815075470, NULL, NULL, 100, '蓝灰色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1132, 5, 394814708558, NULL, 1300815075468, NULL, NULL, 100, '蓝灰色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1133, 5, 394814708558, NULL, 1300815075466, NULL, NULL, 100, '蓝灰色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1134, 5, 394814708558, NULL, 1300815075467, NULL, NULL, 100, '蓝灰色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1135, 5, 394814708558, NULL, 1300815075469, NULL, NULL, 100, '蓝灰色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1136, 6, 395429166799, NULL, 1300789840464, NULL, NULL, 100, '黑色 M（27-28码95-105斤）', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1137, 6, 395429166799, NULL, 1300789840465, NULL, NULL, 100, '黑色 L（29码105-115斤）', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1138, 6, 395429166799, NULL, 1300789840467, NULL, NULL, 100, '黑色 2XL（31码125-135斤）', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1139, 6, 395429166799, NULL, 1300789840466, NULL, NULL, 100, '黑色 XL（30码115-125斤）', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1140, 6, 395429166799, NULL, 1300789840463, NULL, NULL, 100, '黑色 S（25-26码95斤以内）', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1141, 73, 422383287651, NULL, 1298984457787, NULL, NULL, 500, '浅蓝色 27', NULL, 'HN202200200327', NULL, NULL, NULL, NULL, NULL, 286, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1142, 73, 422383287651, NULL, 1298984457817, NULL, NULL, 500, '浅蓝色加绒 25', NULL, 'HN2022002015025', NULL, NULL, NULL, NULL, NULL, 800, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1143, 73, 422383287651, NULL, 1298984457815, NULL, NULL, 500, '蓝灰色加绒 31', NULL, 'HN2022002012931', NULL, NULL, NULL, NULL, NULL, 798, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1144, 73, 422383287651, NULL, 1298984457822, NULL, NULL, 500, '浅蓝色加绒 30', NULL, 'HN2022002015030', NULL, NULL, NULL, NULL, NULL, 805, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1145, 73, 422383287651, NULL, 1298984457792, NULL, NULL, 500, '浅蓝色 32', NULL, 'HN202200200332', NULL, NULL, NULL, NULL, NULL, 291, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1146, 73, 422383287651, NULL, 1298984457813, NULL, NULL, 500, '蓝灰色加绒 29', NULL, 'HN2022002012929', NULL, NULL, NULL, NULL, NULL, 796, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1147, 73, 422383287651, NULL, 1298984457764, NULL, NULL, 500, '黑色 28', NULL, 'HN202200200128', NULL, NULL, NULL, NULL, NULL, 271, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1148, 73, 422383287651, NULL, 1298984457801, NULL, NULL, 500, '黑灰色加绒 25', NULL, 'HN2022002017525', NULL, NULL, NULL, NULL, NULL, 784, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1149, 73, 422383287651, NULL, 1298984457790, NULL, NULL, 500, '浅蓝色 30', NULL, 'HN202200200330', NULL, NULL, NULL, NULL, NULL, 289, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1150, 73, 422383287651, NULL, 1298984457802, NULL, NULL, 500, '黑灰色加绒 26', NULL, 'HN2022002017526', NULL, NULL, NULL, NULL, NULL, 785, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1151, 73, 422383287651, NULL, 1298984457782, NULL, NULL, 500, '蓝灰色 30', NULL, 'HN202200200430', NULL, NULL, NULL, NULL, NULL, 297, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1152, 73, 422383287651, NULL, 1298984457781, NULL, NULL, 500, '蓝灰色 29', NULL, 'HN202200200429', NULL, NULL, NULL, NULL, NULL, 296, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1153, 73, 422383287651, NULL, 1298984457803, NULL, NULL, 500, '黑灰色加绒 27', NULL, 'HN2022002017527', NULL, NULL, NULL, NULL, NULL, 786, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1154, 73, 422383287651, NULL, 1298984457768, NULL, NULL, 500, '黑色 32', NULL, 'HN202200200132', NULL, NULL, NULL, NULL, NULL, 275, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1155, 73, 422383287651, NULL, 1298984457779, NULL, NULL, 500, '蓝灰色 27', NULL, 'HN202200200427', NULL, NULL, NULL, NULL, NULL, 294, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1156, 73, 422383287651, NULL, 1298984457769, NULL, NULL, 500, '黑灰色 25', NULL, 'HN202200200225', NULL, NULL, NULL, NULL, NULL, 276, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1157, 73, 422383287651, NULL, 1298984457809, NULL, NULL, 500, '蓝灰色加绒 25', NULL, 'HN2022002012925', NULL, NULL, NULL, NULL, NULL, 792, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1158, 73, 422383287651, NULL, 1298984457772, NULL, NULL, 500, '黑灰色 28', NULL, 'HN202200200228', NULL, NULL, NULL, NULL, NULL, 279, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1159, 73, 422383287651, NULL, 1298984457814, NULL, NULL, 500, '蓝灰色加绒 30', NULL, 'HN2022002012930', NULL, NULL, NULL, NULL, NULL, 797, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1160, 73, 422383287651, NULL, 1298984457771, NULL, NULL, 500, '黑灰色 27', NULL, 'HN202200200227', NULL, NULL, NULL, NULL, NULL, 278, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1161, 73, 422383287651, NULL, 1298984457773, NULL, NULL, 500, '黑灰色 29', NULL, 'HN202200200229', NULL, NULL, NULL, NULL, NULL, 280, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1162, 73, 422383287651, NULL, 1298984457793, NULL, NULL, 500, '黑色加绒 25', NULL, 'HN2022002010125', NULL, NULL, NULL, NULL, NULL, 776, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1163, 73, 422383287651, NULL, 1298984457798, NULL, NULL, 500, '黑色加绒 30', NULL, 'HN2022002010130', NULL, NULL, NULL, NULL, NULL, 781, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1164, 73, 422383287651, NULL, 1298984457794, NULL, NULL, 500, '黑色加绒 26', NULL, 'HN2022002010126', NULL, NULL, NULL, NULL, NULL, 777, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1165, 73, 422383287651, NULL, 1298984457811, NULL, NULL, 500, '蓝灰色加绒 27', NULL, 'HN2022002012927', NULL, NULL, NULL, NULL, NULL, 794, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1166, 73, 422383287651, NULL, 1298984457786, NULL, NULL, 500, '浅蓝色 26', NULL, 'HN202200200326', NULL, NULL, NULL, NULL, NULL, 285, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1167, 73, 422383287651, NULL, 1298984457800, NULL, NULL, 500, '黑色加绒 32', NULL, 'HN2022002010132', NULL, NULL, NULL, NULL, NULL, 783, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1168, 73, 422383287651, NULL, 1298984457788, NULL, NULL, 500, '浅蓝色 28', NULL, 'HN202200200328', NULL, NULL, NULL, NULL, NULL, 287, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1169, 73, 422383287651, NULL, 1298984457761, NULL, NULL, 500, '黑色 25', NULL, 'HN202200200125', NULL, NULL, NULL, NULL, NULL, 268, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1170, 73, 422383287651, NULL, 1298984457805, NULL, NULL, 500, '黑灰色加绒 29', NULL, 'HN2022002017529', NULL, NULL, NULL, NULL, NULL, 788, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1171, 73, 422383287651, NULL, 1298984457780, NULL, NULL, 500, '蓝灰色 28', NULL, 'HN202200200428', NULL, NULL, NULL, NULL, NULL, 295, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1172, 73, 422383287651, NULL, 1298984457778, NULL, NULL, 500, '蓝灰色 26', NULL, 'HN202200200426', NULL, NULL, NULL, NULL, NULL, 293, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1173, 73, 422383287651, NULL, 1298984457765, NULL, NULL, 500, '黑色 29', NULL, 'HN202200200129', NULL, NULL, NULL, NULL, NULL, 272, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1174, 73, 422383287651, NULL, 1298984457791, NULL, NULL, 500, '浅蓝色 31', NULL, 'HN202200200331', NULL, NULL, NULL, NULL, NULL, 290, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1175, 73, 422383287651, NULL, 1298984457789, NULL, NULL, 500, '浅蓝色 29', NULL, 'HN202200200329', NULL, NULL, NULL, NULL, NULL, 288, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1176, 73, 422383287651, NULL, 1298984457795, NULL, NULL, 500, '黑色加绒 27', NULL, 'HN2022002010127', NULL, NULL, NULL, NULL, NULL, 778, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1177, 73, 422383287651, NULL, 1298984457796, NULL, NULL, 500, '黑色加绒 28', NULL, 'HN2022002010128', NULL, NULL, NULL, NULL, NULL, 779, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1178, 73, 422383287651, NULL, 1298984457804, NULL, NULL, 500, '黑灰色加绒 28', NULL, 'HN2022002017528', NULL, NULL, NULL, NULL, NULL, 787, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1179, 73, 422383287651, NULL, 1298984457820, NULL, NULL, 500, '浅蓝色加绒 28', NULL, 'HN2022002015028', NULL, NULL, NULL, NULL, NULL, 803, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1180, 73, 422383287651, NULL, 1298984457816, NULL, NULL, 500, '蓝灰色加绒 32', NULL, 'HN2022002012932', NULL, NULL, NULL, NULL, NULL, 799, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1181, 73, 422383287651, NULL, 1298984457824, NULL, NULL, 500, '浅蓝色加绒 32', NULL, 'HN2022002015032', NULL, NULL, NULL, NULL, NULL, 807, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1182, 73, 422383287651, NULL, 1298984457808, NULL, NULL, 500, '黑灰色加绒 32', NULL, 'HN2022002017532', NULL, NULL, NULL, NULL, NULL, 791, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1183, 73, 422383287651, NULL, 1298984457766, NULL, NULL, 500, '黑色 30', NULL, 'HN202200200130', NULL, NULL, NULL, NULL, NULL, 273, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1184, 73, 422383287651, NULL, 1298984457774, NULL, NULL, 500, '黑灰色 30', NULL, 'HN202200200230', NULL, NULL, NULL, NULL, NULL, 281, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1185, 73, 422383287651, NULL, 1298984457783, NULL, NULL, 500, '蓝灰色 31', NULL, 'HN202200200431', NULL, NULL, NULL, NULL, NULL, 298, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1186, 73, 422383287651, NULL, 1298984457819, NULL, NULL, 500, '浅蓝色加绒 27', NULL, 'HN2022002015027', NULL, NULL, NULL, NULL, NULL, 802, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1187, 73, 422383287651, NULL, 1298984457823, NULL, NULL, 500, '浅蓝色加绒 31', NULL, 'HN2022002015031', NULL, NULL, NULL, NULL, NULL, 806, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1188, 73, 422383287651, NULL, 1298984457806, NULL, NULL, 500, '黑灰色加绒 30', NULL, 'HN2022002017530', NULL, NULL, NULL, NULL, NULL, 789, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1189, 73, 422383287651, NULL, 1298984457775, NULL, NULL, 500, '黑灰色 31', NULL, 'HN202200200231', NULL, NULL, NULL, NULL, NULL, 282, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1190, 73, 422383287651, NULL, 1298984457797, NULL, NULL, 499, '黑色加绒 29', NULL, 'HN2022002010129', NULL, NULL, NULL, NULL, NULL, 780, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1191, 73, 422383287651, NULL, 1298984457777, NULL, NULL, 500, '蓝灰色 25', NULL, 'HN202200200425', NULL, NULL, NULL, NULL, NULL, 292, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1192, 73, 422383287651, NULL, 1298984457810, NULL, NULL, 500, '蓝灰色加绒 26', NULL, 'HN2022002012926', NULL, NULL, NULL, NULL, NULL, 793, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1193, 73, 422383287651, NULL, 1298984457767, NULL, NULL, 500, '黑色 31', NULL, 'HN202200200131', NULL, NULL, NULL, NULL, NULL, 274, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1194, 73, 422383287651, NULL, 1298984457812, NULL, NULL, 500, '蓝灰色加绒 28', NULL, 'HN2022002012928', NULL, NULL, NULL, NULL, NULL, 795, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1195, 73, 422383287651, NULL, 1298984457763, NULL, NULL, 500, '黑色 27', NULL, 'HN202200200127', NULL, NULL, NULL, NULL, NULL, 270, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1196, 73, 422383287651, NULL, 1298984457762, NULL, NULL, 500, '黑色 26', NULL, 'HN202200200126', NULL, NULL, NULL, NULL, NULL, 269, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1197, 73, 422383287651, NULL, 1298984457776, NULL, NULL, 500, '黑灰色 32', NULL, 'HN202200200232', NULL, NULL, NULL, NULL, NULL, 283, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1198, 73, 422383287651, NULL, 1298984457785, NULL, NULL, 500, '浅蓝色 25', NULL, 'HN202200200325', NULL, NULL, NULL, NULL, NULL, 284, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1199, 73, 422383287651, NULL, 1298984457799, NULL, NULL, 500, '黑色加绒 31', NULL, 'HN2022002010131', NULL, NULL, NULL, NULL, NULL, 782, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1200, 73, 422383287651, NULL, 1298984457770, NULL, NULL, 500, '黑灰色 26', NULL, 'HN202200200226', NULL, NULL, NULL, NULL, NULL, 277, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1201, 73, 422383287651, NULL, 1298984457807, NULL, NULL, 500, '黑灰色加绒 31', NULL, 'HN2022002017531', NULL, NULL, NULL, NULL, NULL, 790, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1202, 73, 422383287651, NULL, 1298984457821, NULL, NULL, 500, '浅蓝色加绒 29', NULL, 'HN2022002015029', NULL, NULL, NULL, NULL, NULL, 804, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1203, 73, 422383287651, NULL, 1298984457818, NULL, NULL, 500, '浅蓝色加绒 26', NULL, 'HN2022002015026', NULL, NULL, NULL, NULL, NULL, 801, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1204, 73, 422383287651, NULL, 1298984457784, NULL, NULL, 500, '蓝灰色 32', NULL, 'HN202200200435', NULL, NULL, NULL, NULL, NULL, 299, 22, NULL);
INSERT INTO `tao_goods_sku` VALUES (1205, 74, 422437259657, NULL, 1299097648611, NULL, NULL, 100, '浅蓝色 M', NULL, 'HN1805002', NULL, NULL, NULL, NULL, NULL, 809, 48, NULL);
INSERT INTO `tao_goods_sku` VALUES (1206, 74, 422437259657, NULL, 1299097648610, NULL, NULL, 100, '浅蓝色 S', NULL, 'HN1805001', NULL, NULL, NULL, NULL, NULL, 808, 48, NULL);
INSERT INTO `tao_goods_sku` VALUES (1207, 74, 422437259657, NULL, 1299097648614, NULL, NULL, 100, '浅蓝色 2XL', NULL, 'HN1805005', NULL, NULL, NULL, NULL, NULL, 812, 48, NULL);
INSERT INTO `tao_goods_sku` VALUES (1208, 74, 422437259657, NULL, 1299097648613, NULL, NULL, 100, '浅蓝色 XL', NULL, 'HN1805004', NULL, NULL, NULL, NULL, NULL, 811, 48, NULL);
INSERT INTO `tao_goods_sku` VALUES (1209, 74, 422437259657, NULL, 1299097648612, NULL, NULL, 100, '浅蓝色 L', NULL, 'HN1805003', NULL, NULL, NULL, NULL, NULL, 810, 48, NULL);
INSERT INTO `tao_goods_sku` VALUES (1210, 75, 422742565233, NULL, 1299618145899, NULL, NULL, 50, '黑色 M', NULL, 'HN665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1211, 75, 422742565233, NULL, 1299618145902, NULL, NULL, 50, '黑色 S', NULL, 'HN665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1212, 75, 422742565233, NULL, 1299618145898, NULL, NULL, 50, '黑色 2XL', NULL, 'HN665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1213, 75, 422742565233, NULL, 1299618145900, NULL, NULL, 50, '黑色 XL', NULL, 'HN665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1214, 75, 422742565233, NULL, 1299618145901, NULL, NULL, 50, '黑色 L', NULL, 'HN665', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1215, 76, 422744325067, NULL, 1299618998188, NULL, NULL, 100, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1216, 76, 422744325067, NULL, 1299618998187, NULL, NULL, 100, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1217, 76, 422744325067, NULL, 1299618998189, NULL, NULL, 100, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1218, 76, 422744325067, NULL, 1299618998185, NULL, NULL, 100, '蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1219, 76, 422744325067, NULL, 1299618998186, NULL, NULL, 100, '蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1220, 76, 422744325067, NULL, 1299618998184, NULL, NULL, 100, '蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1221, 77, 423260246680, NULL, 1300536155526, NULL, NULL, 50, '烟灰色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1222, 77, 423260246680, NULL, 1300536155554, NULL, NULL, 50, '烟灰色加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1223, 77, 423260246680, NULL, 1300536155519, NULL, NULL, 50, '黑色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1224, 77, 423260246680, NULL, 1300536155537, NULL, NULL, 50, '蓝灰色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1225, 77, 423260246680, NULL, 1300536155525, NULL, NULL, 50, '烟灰色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1226, 77, 423260246680, NULL, 1300536155518, NULL, NULL, 50, '黑色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1227, 77, 423260246680, NULL, 1300536155563, NULL, NULL, 50, '蓝灰色加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1228, 77, 423260246680, NULL, 1300536155528, NULL, NULL, 50, '烟灰色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1229, 77, 423260246680, NULL, 1300536155552, NULL, NULL, 50, '黑色加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1230, 77, 423260246680, NULL, 1300536155549, NULL, NULL, 50, '黑色加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1231, 77, 423260246680, NULL, 1300536155541, NULL, NULL, 50, '浅蓝色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1232, 77, 423260246680, NULL, 1300536155543, NULL, NULL, 50, '浅蓝色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1233, 77, 423260246680, NULL, 1300536155567, NULL, NULL, 50, '浅蓝色加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1234, 77, 423260246680, NULL, 1300536155550, NULL, NULL, 50, '黑色加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1235, 77, 423260246680, NULL, 1300536155559, NULL, NULL, 50, '烟灰色加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1236, 77, 423260246680, NULL, 1300536155530, NULL, NULL, 50, '烟灰色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1237, 77, 423260246680, NULL, 1300536155531, NULL, NULL, 50, '烟灰色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1238, 77, 423260246680, NULL, 1300536155547, NULL, NULL, 50, '黑色加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1239, 77, 423260246680, NULL, 1300536155522, NULL, NULL, 50, '黑色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1240, 77, 423260246680, NULL, 1300536155556, NULL, NULL, 50, '烟灰色加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1241, 77, 423260246680, NULL, 1300536155527, NULL, NULL, 50, '烟灰色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1242, 77, 423260246680, NULL, 1300536155571, NULL, NULL, 50, '浅蓝色加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1243, 77, 423260246680, NULL, 1300536155538, NULL, NULL, 50, '蓝灰色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1244, 77, 423260246680, NULL, 1300536155566, NULL, NULL, 50, '蓝灰色加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1245, 77, 423260246680, NULL, 1300536155570, NULL, NULL, 50, '浅蓝色加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1246, 77, 423260246680, NULL, 1300536155521, NULL, NULL, 50, '黑色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1247, 77, 423260246680, NULL, 1300536155564, NULL, NULL, 50, '蓝灰色加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1248, 77, 423260246680, NULL, 1300536155539, NULL, NULL, 50, '浅蓝色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1249, 77, 423260246680, NULL, 1300536155544, NULL, NULL, 50, '浅蓝色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1250, 77, 423260246680, NULL, 1300536155562, NULL, NULL, 50, '蓝灰色加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1251, 77, 423260246680, NULL, 1300536155524, NULL, NULL, 50, '黑色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1252, 77, 423260246680, NULL, 1300536155557, NULL, NULL, 50, '烟灰色加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1253, 77, 423260246680, NULL, 1300536155529, NULL, NULL, 50, '烟灰色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1254, 77, 423260246680, NULL, 1300536155573, NULL, NULL, 50, '浅蓝色加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1255, 77, 423260246680, NULL, 1300536155523, NULL, NULL, 50, '黑色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1256, 77, 423260246680, NULL, 1300536155535, NULL, NULL, 50, '蓝灰色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1257, 77, 423260246680, NULL, 1300536155520, NULL, NULL, 50, '黑色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1258, 77, 423260246680, NULL, 1300536155555, NULL, NULL, 50, '烟灰色加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1259, 77, 423260246680, NULL, 1300536155540, NULL, NULL, 50, '浅蓝色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1260, 77, 423260246680, NULL, 1300536155551, NULL, NULL, 50, '黑色加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1261, 77, 423260246680, NULL, 1300536155572, NULL, NULL, 50, '浅蓝色加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1262, 77, 423260246680, NULL, 1300536155561, NULL, NULL, 50, '蓝灰色加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1263, 77, 423260246680, NULL, 1300536155560, NULL, NULL, 50, '蓝灰色加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1264, 77, 423260246680, NULL, 1300536155545, NULL, NULL, 50, '浅蓝色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1265, 77, 423260246680, NULL, 1300536155569, NULL, NULL, 50, '浅蓝色加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1266, 77, 423260246680, NULL, 1300536155533, NULL, NULL, 50, '蓝灰色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1267, 77, 423260246680, NULL, 1300536155558, NULL, NULL, 50, '烟灰色加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1268, 77, 423260246680, NULL, 1300536155534, NULL, NULL, 50, '蓝灰色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1269, 77, 423260246680, NULL, 1300536155546, NULL, NULL, 50, '黑色加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1270, 77, 423260246680, NULL, 1300536155565, NULL, NULL, 50, '蓝灰色加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1271, 77, 423260246680, NULL, 1300536155568, NULL, NULL, 50, '浅蓝色加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1272, 77, 423260246680, NULL, 1300536155542, NULL, NULL, 50, '浅蓝色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1273, 77, 423260246680, NULL, 1300536155553, NULL, NULL, 50, '烟灰色加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1274, 77, 423260246680, NULL, 1300536155532, NULL, NULL, 50, '蓝灰色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1275, 77, 423260246680, NULL, 1300536155536, NULL, NULL, 50, '蓝灰色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1276, 77, 423260246680, NULL, 1300536155548, NULL, NULL, 50, '黑色加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1277, 78, 423441709778, NULL, 1300835762157, NULL, NULL, 50, '米黄 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1278, 78, 423441709778, NULL, 1300835762149, NULL, NULL, 50, '黑色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1279, 78, 423441709778, NULL, 1300835762148, NULL, NULL, 50, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1280, 78, 423441709778, NULL, 1300835762164, NULL, NULL, 50, '青草色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1281, 78, 423441709778, NULL, 1300835762167, NULL, NULL, 50, '天空蓝 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1282, 78, 423441709778, NULL, 1300835762165, NULL, NULL, 50, '青草色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1283, 78, 423441709778, NULL, 1300835762154, NULL, NULL, 50, '米黄 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1284, 78, 423441709778, NULL, 1300835762151, NULL, NULL, 50, '粉红色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1285, 78, 423441709778, NULL, 1300835762147, NULL, NULL, 50, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1286, 78, 423441709778, NULL, 1300835762150, NULL, NULL, 50, '粉红色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1287, 78, 423441709778, NULL, 1300835762152, NULL, NULL, 50, '粉红色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1288, 78, 423441709778, NULL, 1300835762169, NULL, NULL, 50, '天空蓝 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1289, 78, 423441709778, NULL, 1300835762162, NULL, NULL, 50, '青草色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1290, 78, 423441709778, NULL, 1300835762158, NULL, NULL, 50, '紫色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1291, 78, 423441709778, NULL, 1300835762160, NULL, NULL, 50, '紫色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1292, 78, 423441709778, NULL, 1300835762146, NULL, NULL, 50, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1293, 78, 423441709778, NULL, 1300835762166, NULL, NULL, 50, '天空蓝 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1294, 78, 423441709778, NULL, 1300835762163, NULL, NULL, 50, '青草色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1295, 78, 423441709778, NULL, 1300835762155, NULL, NULL, 50, '米黄 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1296, 78, 423441709778, NULL, 1300835762159, NULL, NULL, 50, '紫色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1297, 78, 423441709778, NULL, 1300835762156, NULL, NULL, 50, '米黄 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1298, 78, 423441709778, NULL, 1300835762161, NULL, NULL, 50, '紫色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1299, 78, 423441709778, NULL, 1300835762153, NULL, NULL, 50, '粉红色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1300, 78, 423441709778, NULL, 1300835762168, NULL, NULL, 50, '天空蓝 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1301, 79, 423486862283, NULL, 1300918958614, NULL, NULL, 50, '蓝色 M', NULL, 'HN0804', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1302, 79, 423486862283, NULL, 1300918958616, NULL, NULL, 50, '蓝色 XL', NULL, 'HN0804', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1303, 79, 423486862283, NULL, 1300918958617, NULL, NULL, 50, '蓝色 2XL', NULL, 'HN0804', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1304, 79, 423486862283, NULL, 1300918958615, NULL, NULL, 50, '蓝色 L', NULL, 'HN0804', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1305, 79, 423486862283, NULL, 1300918958613, NULL, NULL, 50, '蓝色 S', NULL, 'HN0804', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1306, 80, 423492956829, NULL, 1300930893642, NULL, NULL, 50, '复古蓝 XL', NULL, 'HN683', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1307, 80, 423492956829, NULL, 1300930893639, NULL, NULL, 50, '复古蓝 S', NULL, 'HN683', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1308, 80, 423492956829, NULL, 1300930893640, NULL, NULL, 50, '复古蓝 M', NULL, 'HN683', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1309, 80, 423492956829, NULL, 1300930893641, NULL, NULL, 50, '复古蓝 L', NULL, 'HN683', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1310, 80, 423492956829, NULL, 1300930893643, NULL, NULL, 50, '复古蓝 2XL', NULL, 'HN683', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1311, 81, 423502402446, NULL, 1300950070710, NULL, NULL, 100, '黑色 L', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1312, 81, 423502402446, NULL, 1300950070713, NULL, NULL, 100, '黑灰色 S', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1313, 81, 423502402446, NULL, 1300950070721, NULL, NULL, 100, '复古蓝 XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1314, 81, 423502402446, NULL, 1300950070727, NULL, NULL, 100, '蓝灰色 2XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1315, 81, 423502402446, NULL, 1300950070708, NULL, NULL, 100, '黑色 S', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1316, 81, 423502402446, NULL, 1300950070723, NULL, NULL, 100, '蓝灰色 S', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1317, 81, 423502402446, NULL, 1300950070709, NULL, NULL, 100, '黑色 M', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1318, 81, 423502402446, NULL, 1300950070726, NULL, NULL, 100, '蓝灰色 XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1319, 81, 423502402446, NULL, 1300950070724, NULL, NULL, 100, '蓝灰色 M', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1320, 81, 423502402446, NULL, 1300950070712, NULL, NULL, 100, '黑色 2XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1321, 81, 423502402446, NULL, 1300950070718, NULL, NULL, 100, '复古蓝 S', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1322, 81, 423502402446, NULL, 1300950070719, NULL, NULL, 100, '复古蓝 M', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1323, 81, 423502402446, NULL, 1300950070717, NULL, NULL, 100, '黑灰色 2XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1324, 81, 423502402446, NULL, 1300950070725, NULL, NULL, 100, '蓝灰色 L', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1325, 81, 423502402446, NULL, 1300950070711, NULL, NULL, 100, '黑色 XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1326, 81, 423502402446, NULL, 1300950070720, NULL, NULL, 100, '复古蓝 L', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1327, 81, 423502402446, NULL, 1300950070722, NULL, NULL, 100, '复古蓝 2XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1328, 81, 423502402446, NULL, 1300950070714, NULL, NULL, 100, '黑灰色 M', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1329, 81, 423502402446, NULL, 1300950070715, NULL, NULL, 100, '黑灰色 L', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1330, 81, 423502402446, NULL, 1300950070716, NULL, NULL, 100, '黑灰色 XL', NULL, 'HN0802', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1331, 82, 423703312591, NULL, 1301302432802, NULL, NULL, 100, '卡其色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1332, 82, 423703312591, NULL, 1301302432705, NULL, NULL, 100, '酒红色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1333, 82, 423703312591, NULL, 1301302432748, NULL, NULL, 100, '咖啡色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1334, 82, 423703312591, NULL, 1301302432781, NULL, NULL, 100, '宝蓝色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1335, 82, 423703312591, NULL, 1301302432779, NULL, NULL, 100, '宝蓝色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1336, 82, 423703312591, NULL, 1301302432699, NULL, NULL, 100, '酒红色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1337, 82, 423703312591, NULL, 1301302432769, NULL, NULL, 100, '灰色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1338, 82, 423703312591, NULL, 1301302432727, NULL, NULL, 100, '白色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1339, 82, 423703312591, NULL, 1301302432741, NULL, NULL, 100, '咖啡色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1340, 82, 423703312591, NULL, 1301302432776, NULL, NULL, 100, '灰色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1341, 82, 423703312591, NULL, 1301302432719, NULL, NULL, 100, '白色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1342, 82, 423703312591, NULL, 1301302432744, NULL, NULL, 100, '咖啡色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1343, 82, 423703312591, NULL, 1301302432754, NULL, NULL, 100, '深紫色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1344, 82, 423703312591, NULL, 1301302432760, NULL, NULL, 100, '墨绿色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1345, 82, 423703312591, NULL, 1301302432691, NULL, NULL, 100, '红色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1346, 82, 423703312591, NULL, 1301302432756, NULL, NULL, 100, '深紫色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1347, 82, 423703312591, NULL, 1301302432713, NULL, NULL, 100, '黑色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1348, 82, 423703312591, NULL, 1301302432740, NULL, NULL, 100, '咖啡色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1349, 82, 423703312591, NULL, 1301302432764, NULL, NULL, 100, '墨绿色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1350, 82, 423703312591, NULL, 1301302432689, NULL, NULL, 100, '红色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1351, 82, 423703312591, NULL, 1301302432692, NULL, NULL, 100, '红色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1352, 82, 423703312591, NULL, 1301302432758, NULL, NULL, 100, '深紫色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1353, 82, 423703312591, NULL, 1301302432762, NULL, NULL, 100, '墨绿色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1354, 82, 423703312591, NULL, 1301302432721, NULL, NULL, 100, '白色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1355, 82, 423703312591, NULL, 1301302432724, NULL, NULL, 100, '白色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1356, 82, 423703312591, NULL, 1301302432706, NULL, NULL, 100, '酒红色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1357, 82, 423703312591, NULL, 1301302432767, NULL, NULL, 100, '墨绿色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1358, 82, 423703312591, NULL, 1301302432801, NULL, NULL, 100, '卡其色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1359, 82, 423703312591, NULL, 1301302432785, NULL, NULL, 100, '宝蓝色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1360, 82, 423703312591, NULL, 1301302432772, NULL, NULL, 100, '灰色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1361, 82, 423703312591, NULL, 1301302432703, NULL, NULL, 100, '酒红色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1362, 82, 423703312591, NULL, 1301302432759, NULL, NULL, 100, '墨绿色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1363, 82, 423703312591, NULL, 1301302432730, NULL, NULL, 100, '藏蓝 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1364, 82, 423703312591, NULL, 1301302432787, NULL, NULL, 100, '宝蓝色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1365, 82, 423703312591, NULL, 1301302432729, NULL, NULL, 100, '藏蓝 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1366, 82, 423703312591, NULL, 1301302432737, NULL, NULL, 100, '藏蓝 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1367, 82, 423703312591, NULL, 1301302432765, NULL, NULL, 100, '墨绿色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1368, 82, 423703312591, NULL, 1301302432788, NULL, NULL, 100, '宝蓝色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1369, 82, 423703312591, NULL, 1301302432693, NULL, NULL, 100, '红色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1370, 82, 423703312591, NULL, 1301302432804, NULL, NULL, 100, '卡其色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1371, 82, 423703312591, NULL, 1301302432786, NULL, NULL, 100, '宝蓝色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1372, 82, 423703312591, NULL, 1301302432797, NULL, NULL, 100, '海军兰 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1373, 82, 423703312591, NULL, 1301302432690, NULL, NULL, 100, '红色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1374, 82, 423703312591, NULL, 1301302432770, NULL, NULL, 100, '灰色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1375, 82, 423703312591, NULL, 1301302432778, NULL, NULL, 100, '灰色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1376, 82, 423703312591, NULL, 1301302432757, NULL, NULL, 100, '深紫色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1377, 82, 423703312591, NULL, 1301302432807, NULL, NULL, 100, '卡其色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1378, 82, 423703312591, NULL, 1301302432704, NULL, NULL, 100, '酒红色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1379, 82, 423703312591, NULL, 1301302432714, NULL, NULL, 100, '黑色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1380, 82, 423703312591, NULL, 1301302432716, NULL, NULL, 100, '黑色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1381, 82, 423703312591, NULL, 1301302432782, NULL, NULL, 100, '宝蓝色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1382, 82, 423703312591, NULL, 1301302432723, NULL, NULL, 100, '白色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1383, 82, 423703312591, NULL, 1301302432796, NULL, NULL, 100, '海军兰 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1384, 82, 423703312591, NULL, 1301302432789, NULL, NULL, 100, '海军兰 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1385, 82, 423703312591, NULL, 1301302432700, NULL, NULL, 100, '酒红色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1386, 82, 423703312591, NULL, 1301302432694, NULL, NULL, 100, '红色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1387, 82, 423703312591, NULL, 1301302432742, NULL, NULL, 100, '咖啡色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1388, 82, 423703312591, NULL, 1301302432777, NULL, NULL, 100, '灰色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1389, 82, 423703312591, NULL, 1301302432738, NULL, NULL, 100, '藏蓝 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1390, 82, 423703312591, NULL, 1301302432728, NULL, NULL, 100, '白色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1391, 82, 423703312591, NULL, 1301302432753, NULL, NULL, 100, '深紫色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1392, 82, 423703312591, NULL, 1301302432734, NULL, NULL, 100, '藏蓝 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1393, 82, 423703312591, NULL, 1301302432749, NULL, NULL, 100, '深紫色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1394, 82, 423703312591, NULL, 1301302432803, NULL, NULL, 100, '卡其色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1395, 82, 423703312591, NULL, 1301302432743, NULL, NULL, 100, '咖啡色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1396, 82, 423703312591, NULL, 1301302432768, NULL, NULL, 100, '墨绿色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1397, 82, 423703312591, NULL, 1301302432726, NULL, NULL, 100, '白色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1398, 82, 423703312591, NULL, 1301302432695, NULL, NULL, 100, '红色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1399, 82, 423703312591, NULL, 1301302432775, NULL, NULL, 100, '灰色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1400, 82, 423703312591, NULL, 1301302432793, NULL, NULL, 100, '海军兰 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1401, 82, 423703312591, NULL, 1301302432798, NULL, NULL, 100, '海军兰 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1402, 82, 423703312591, NULL, 1301302432794, NULL, NULL, 100, '海军兰 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1403, 82, 423703312591, NULL, 1301302432799, NULL, NULL, 100, '卡其色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1404, 82, 423703312591, NULL, 1301302432751, NULL, NULL, 100, '深紫色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1405, 82, 423703312591, NULL, 1301302432697, NULL, NULL, 100, '红色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1406, 82, 423703312591, NULL, 1301302432739, NULL, NULL, 100, '咖啡色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1407, 82, 423703312591, NULL, 1301302432806, NULL, NULL, 100, '卡其色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1408, 82, 423703312591, NULL, 1301302432792, NULL, NULL, 100, '海军兰 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1409, 82, 423703312591, NULL, 1301302432736, NULL, NULL, 100, '藏蓝 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1410, 82, 423703312591, NULL, 1301302432784, NULL, NULL, 100, '宝蓝色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1411, 82, 423703312591, NULL, 1301302432712, NULL, NULL, 100, '黑色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1412, 82, 423703312591, NULL, 1301302432763, NULL, NULL, 100, '墨绿色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1413, 82, 423703312591, NULL, 1301302432701, NULL, NULL, 100, '酒红色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1414, 82, 423703312591, NULL, 1301302432710, NULL, NULL, 100, '黑色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1415, 82, 423703312591, NULL, 1301302432783, NULL, NULL, 100, '宝蓝色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1416, 82, 423703312591, NULL, 1301302432718, NULL, NULL, 100, '黑色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1417, 82, 423703312591, NULL, 1301302432707, NULL, NULL, 100, '酒红色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1418, 82, 423703312591, NULL, 1301302432702, NULL, NULL, 100, '酒红色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1419, 82, 423703312591, NULL, 1301302432722, NULL, NULL, 100, '白色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1420, 82, 423703312591, NULL, 1301302432774, NULL, NULL, 100, '灰色 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1421, 82, 423703312591, NULL, 1301302432790, NULL, NULL, 100, '海军兰 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1422, 82, 423703312591, NULL, 1301302432750, NULL, NULL, 100, '深紫色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1423, 82, 423703312591, NULL, 1301302432720, NULL, NULL, 100, '白色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1424, 82, 423703312591, NULL, 1301302432711, NULL, NULL, 100, '黑色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1425, 82, 423703312591, NULL, 1301302432745, NULL, NULL, 100, '咖啡色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1426, 82, 423703312591, NULL, 1301302432735, NULL, NULL, 100, '藏蓝 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1427, 82, 423703312591, NULL, 1301302432747, NULL, NULL, 100, '咖啡色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1428, 82, 423703312591, NULL, 1301302432795, NULL, NULL, 100, '海军兰 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1429, 82, 423703312591, NULL, 1301302432773, NULL, NULL, 100, '灰色 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1430, 82, 423703312591, NULL, 1301302432708, NULL, NULL, 100, '酒红色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1431, 82, 423703312591, NULL, 1301302432800, NULL, NULL, 100, '卡其色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1432, 82, 423703312591, NULL, 1301302432791, NULL, NULL, 100, '海军兰 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1433, 82, 423703312591, NULL, 1301302432725, NULL, NULL, 100, '白色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1434, 82, 423703312591, NULL, 1301302432771, NULL, NULL, 100, '灰色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1435, 82, 423703312591, NULL, 1301302432733, NULL, NULL, 100, '藏蓝 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1436, 82, 423703312591, NULL, 1301302432715, NULL, NULL, 100, '黑色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1437, 82, 423703312591, NULL, 1301302432698, NULL, NULL, 100, '红色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1438, 82, 423703312591, NULL, 1301302432696, NULL, NULL, 100, '红色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1439, 82, 423703312591, NULL, 1301302432731, NULL, NULL, 100, '藏蓝 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1440, 82, 423703312591, NULL, 1301302432717, NULL, NULL, 100, '黑色 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1441, 82, 423703312591, NULL, 1301302432761, NULL, NULL, 100, '墨绿色 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1442, 82, 423703312591, NULL, 1301302432755, NULL, NULL, 100, '深紫色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1443, 82, 423703312591, NULL, 1301302432808, NULL, NULL, 100, '卡其色 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1444, 82, 423703312591, NULL, 1301302432732, NULL, NULL, 100, '藏蓝 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1445, 82, 423703312591, NULL, 1301302432780, NULL, NULL, 100, '宝蓝色 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1446, 82, 423703312591, NULL, 1301302432766, NULL, NULL, 100, '墨绿色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1447, 82, 423703312591, NULL, 1301302432709, NULL, NULL, 100, '黑色 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1448, 82, 423703312591, NULL, 1301302432746, NULL, NULL, 100, '咖啡色 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1449, 82, 423703312591, NULL, 1301302432805, NULL, NULL, 100, '卡其色 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1450, 82, 423703312591, NULL, 1301302432752, NULL, NULL, 100, '深紫色 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1451, 83, 423758757026, NULL, 1301404846098, NULL, NULL, 100, '复古蓝 S', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1452, 83, 423758757026, NULL, 1301404846101, NULL, NULL, 100, '复古蓝 XL', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1453, 83, 423758757026, NULL, 1301404846099, NULL, NULL, 100, '复古蓝 M', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1454, 83, 423758757026, NULL, 1301404846103, NULL, NULL, 100, '浅蓝色 XS', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1455, 83, 423758757026, NULL, 1301404846097, NULL, NULL, 100, '复古蓝 XS', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 987, 55, NULL);
INSERT INTO `tao_goods_sku` VALUES (1456, 83, 423758757026, NULL, 1301404846104, NULL, NULL, 100, '浅蓝色 S', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1457, 83, 423758757026, NULL, 1301404846107, NULL, NULL, 100, '浅蓝色 XL', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1458, 83, 423758757026, NULL, 1301404846106, NULL, NULL, 100, '浅蓝色 L', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1459, 83, 423758757026, NULL, 1301404846100, NULL, NULL, 100, '复古蓝 L', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1460, 83, 423758757026, NULL, 1301404846105, NULL, NULL, 100, '浅蓝色 M', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1461, 83, 423758757026, NULL, 1301404846102, NULL, NULL, 100, '复古蓝 2XL', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1462, 83, 423758757026, NULL, 1301404846108, NULL, NULL, 100, '浅蓝色 2XL', NULL, 'JKL906', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1463, 84, 423990076571, NULL, 1301814344129, NULL, NULL, 100, '蓝灰色 29', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 865, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1464, 84, 423990076571, NULL, 1301814344122, NULL, NULL, 100, '复古蓝 29', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 858, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1465, 84, 423990076571, NULL, 1301814344119, NULL, NULL, 100, '复古蓝 26', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 855, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1466, 84, 423990076571, NULL, 1301814344132, NULL, NULL, 100, '蓝灰色 32', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 868, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1467, 84, 423990076571, NULL, 1301814344126, NULL, NULL, 100, '蓝灰色 26', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 862, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1468, 84, 423990076571, NULL, 1301814344133, NULL, NULL, 100, '黑色 26', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 869, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1469, 84, 423990076571, NULL, 1301814344120, NULL, NULL, 100, '复古蓝 27', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 856, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1470, 84, 423990076571, NULL, 1301814344128, NULL, NULL, 100, '蓝灰色 28', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 864, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1471, 84, 423990076571, NULL, 1301814344127, NULL, NULL, 100, '蓝灰色 27', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 863, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1472, 84, 423990076571, NULL, 1301814344138, NULL, NULL, 100, '黑色 31', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 874, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1473, 84, 423990076571, NULL, 1301814344124, NULL, NULL, 100, '复古蓝 31', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 860, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1474, 84, 423990076571, NULL, 1301814344136, NULL, NULL, 100, '黑色 29', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 872, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1475, 84, 423990076571, NULL, 1301814344135, NULL, NULL, 100, '黑色 28', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 871, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1476, 84, 423990076571, NULL, 1301814344131, NULL, NULL, 100, '蓝灰色 31', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 867, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1477, 84, 423990076571, NULL, 1301814344137, NULL, NULL, 100, '黑色 30', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 873, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1478, 84, 423990076571, NULL, 1301814344139, NULL, NULL, 100, '黑色 32', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 875, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1479, 84, 423990076571, NULL, 1301814344130, NULL, NULL, 100, '蓝灰色 30', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 866, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1480, 84, 423990076571, NULL, 1301814344134, NULL, NULL, 100, '黑色 27', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 870, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1481, 84, 423990076571, NULL, 1301814344123, NULL, NULL, 100, '复古蓝 30', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 859, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1482, 84, 423990076571, NULL, 1301814344121, NULL, NULL, 100, '复古蓝 28', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 857, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1483, 84, 423990076571, NULL, 1301814344125, NULL, NULL, 100, '复古蓝 32', NULL, 'JKL9098', NULL, NULL, NULL, NULL, NULL, 861, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1484, 84, 423990076571, NULL, 1305326156472, NULL, NULL, 100, '黑色加绒长裤 30', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 852, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1485, 84, 423990076571, NULL, 1305326156470, NULL, NULL, 100, '黑色加绒长裤 28', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 850, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1486, 84, 423990076571, NULL, 1305326156452, NULL, NULL, 100, '黑色长裤 31', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 832, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1487, 84, 423990076571, NULL, 1305326156460, NULL, NULL, 100, '复古蓝加绒长裤 32', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 840, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1488, 84, 423990076571, NULL, 1305326156444, NULL, NULL, 100, '蓝灰色长裤 30', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 824, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1489, 84, 423990076571, NULL, 1305326156442, NULL, NULL, 100, '蓝灰色长裤 28', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 822, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1490, 84, 423990076571, NULL, 1305326156468, NULL, NULL, 100, '黑色加绒长裤 26', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 848, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1491, 84, 423990076571, NULL, 1305326156437, NULL, NULL, 100, '复古蓝长裤 30', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 817, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1492, 84, 423990076571, NULL, 1305326156434, NULL, NULL, 99, '复古蓝长裤 27', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 814, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1493, 84, 423990076571, NULL, 1305326156441, NULL, NULL, 100, '蓝灰色长裤 27', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 821, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1494, 84, 423990076571, NULL, 1305326156450, NULL, NULL, 100, '黑色长裤 29', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 830, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1495, 84, 423990076571, NULL, 1305326156473, NULL, NULL, 100, '黑色加绒长裤 31', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 853, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1496, 84, 423990076571, NULL, 1305326156469, NULL, NULL, 100, '黑色加绒长裤 27', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 849, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1497, 84, 423990076571, NULL, 1305326156433, NULL, NULL, 100, '复古蓝长裤 26', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 813, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1498, 84, 423990076571, NULL, 1305326156439, NULL, NULL, 100, '复古蓝长裤 32', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 819, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1499, 84, 423990076571, NULL, 1305326156455, NULL, NULL, 100, '复古蓝加绒长裤 27', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 835, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1500, 84, 423990076571, NULL, 1305326156457, NULL, NULL, 100, '复古蓝加绒长裤 29', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 837, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1501, 84, 423990076571, NULL, 1305326156465, NULL, NULL, 100, '蓝灰色加绒长裤 30', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 845, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1502, 84, 423990076571, NULL, 1305326156443, NULL, NULL, 100, '蓝灰色长裤 29', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 823, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1503, 84, 423990076571, NULL, 1305326156448, NULL, NULL, 100, '黑色长裤 27', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 828, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1504, 84, 423990076571, NULL, 1305326156440, NULL, NULL, 100, '蓝灰色长裤 26', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 820, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1505, 84, 423990076571, NULL, 1305326156454, NULL, NULL, 100, '复古蓝加绒长裤 26', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 834, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1506, 84, 423990076571, NULL, 1305326156451, NULL, NULL, 100, '黑色长裤 30', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 831, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1507, 84, 423990076571, NULL, 1305326156456, NULL, NULL, 99, '复古蓝加绒长裤 28', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 836, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1508, 84, 423990076571, NULL, 1305326156459, NULL, NULL, 100, '复古蓝加绒长裤 31', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 839, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1509, 84, 423990076571, NULL, 1305326156449, NULL, NULL, 100, '黑色长裤 28', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 829, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1510, 84, 423990076571, NULL, 1305326156453, NULL, NULL, 100, '黑色长裤 32', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 833, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1511, 84, 423990076571, NULL, 1305326156446, NULL, NULL, 100, '蓝灰色长裤 32', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 826, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1512, 84, 423990076571, NULL, 1305326156436, NULL, NULL, 100, '复古蓝长裤 29', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 816, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1513, 84, 423990076571, NULL, 1305326156463, NULL, NULL, 100, '蓝灰色加绒长裤 28', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 843, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1514, 84, 423990076571, NULL, 1305326156445, NULL, NULL, 99, '蓝灰色长裤 31', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 825, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1515, 84, 423990076571, NULL, 1305326156474, NULL, NULL, 100, '黑色加绒长裤 32', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 854, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1516, 84, 423990076571, NULL, 1305326156438, NULL, NULL, 100, '复古蓝长裤 31', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 818, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1517, 84, 423990076571, NULL, 1305326156435, NULL, NULL, 99, '复古蓝长裤 28', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 815, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1518, 84, 423990076571, NULL, 1305326156458, NULL, NULL, 100, '复古蓝加绒长裤 30', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 838, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1519, 84, 423990076571, NULL, 1305326156461, NULL, NULL, 100, '蓝灰色加绒长裤 26', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 841, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1520, 84, 423990076571, NULL, 1305326156464, NULL, NULL, 100, '蓝灰色加绒长裤 29', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 844, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1521, 84, 423990076571, NULL, 1305326156462, NULL, NULL, 100, '蓝灰色加绒长裤 27', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 842, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1522, 84, 423990076571, NULL, 1305326156466, NULL, NULL, 99, '蓝灰色加绒长裤 31', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 846, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1523, 84, 423990076571, NULL, 1305326156471, NULL, NULL, 100, '黑色加绒长裤 29', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 851, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1524, 84, 423990076571, NULL, 1305326156467, NULL, NULL, 100, '蓝灰色加绒长裤 32', NULL, 'JKL9098CKJR', NULL, NULL, NULL, NULL, NULL, 847, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1525, 84, 423990076571, NULL, 1305326156447, NULL, NULL, 100, '黑色长裤 26', NULL, 'JKL9098CK', NULL, NULL, NULL, NULL, NULL, 827, 49, NULL);
INSERT INTO `tao_goods_sku` VALUES (1526, 85, 426190541480, NULL, 1305765412474, NULL, NULL, 100, '深蓝色 XL', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1527, 85, 426190541480, NULL, 1305765412466, NULL, NULL, 100, '烟灰色 S', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1528, 85, 426190541480, NULL, 1305765412471, NULL, NULL, 100, '深蓝色 S', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1529, 85, 426190541480, NULL, 1305765412467, NULL, NULL, 100, '烟灰色 M', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1530, 85, 426190541480, NULL, 1305765412473, NULL, NULL, 100, '深蓝色 L', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1531, 85, 426190541480, NULL, 1305765412468, NULL, NULL, 100, '烟灰色 L', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1532, 85, 426190541480, NULL, 1305765412470, NULL, NULL, 100, '烟灰色 2XL', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1533, 85, 426190541480, NULL, 1305765412472, NULL, NULL, 100, '深蓝色 M', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1534, 85, 426190541480, NULL, 1305765412475, NULL, NULL, 100, '深蓝色 2XL', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1535, 85, 426190541480, NULL, 1305765412469, NULL, NULL, 100, '烟灰色 XL', NULL, 'JKL3112', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1536, 86, 426453461778, NULL, 1306230875151, NULL, NULL, 100, '蓝色 30', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1537, 86, 426453461778, NULL, 1306230875152, NULL, NULL, 100, '蓝色 31', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1538, 86, 426453461778, NULL, 1306230875156, NULL, NULL, 100, '黑灰 29', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1539, 86, 426453461778, NULL, 1306230875149, NULL, NULL, 100, '蓝色 28', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1540, 86, 426453461778, NULL, 1306230875157, NULL, NULL, 100, '黑灰 30', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1541, 86, 426453461778, NULL, 1306230875153, NULL, NULL, 100, '黑灰 26', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1542, 86, 426453461778, NULL, 1306230875147, NULL, NULL, 100, '蓝色 26', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1543, 86, 426453461778, NULL, 1306230875148, NULL, NULL, 100, '蓝色 27', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1544, 86, 426453461778, NULL, 1306230875150, NULL, NULL, 100, '蓝色 29', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1545, 86, 426453461778, NULL, 1306230875154, NULL, NULL, 100, '黑灰 27', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1546, 86, 426453461778, NULL, 1306230875155, NULL, NULL, 100, '黑灰 28', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1547, 86, 426453461778, NULL, 1306230875158, NULL, NULL, 100, '黑灰 31', NULL, 'JKL6010', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1548, 87, 426460291580, NULL, 1306248813005, NULL, NULL, 100, '卡其色 28', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 912, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1549, 87, 426460291580, NULL, 1306248813004, NULL, NULL, 100, '卡其色 27', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 909, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1550, 87, 426460291580, NULL, 1306248813009, NULL, NULL, 100, '卡其色 32', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 924, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1551, 87, 426460291580, NULL, 1306248813016, NULL, NULL, 100, '卡灰 31', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 969, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1552, 87, 426460291580, NULL, 1306248813012, NULL, NULL, 99, '卡灰 27', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 957, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1553, 87, 426460291580, NULL, 1306248813022, NULL, NULL, 100, '米白色 29', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 939, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1554, 87, 426460291580, NULL, 1306248661999, NULL, NULL, 100, '黑色 30', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 894, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1555, 87, 426460291580, NULL, 1306248813003, NULL, NULL, 100, '卡其色 26', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 906, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1556, 87, 426460291580, NULL, 1306248813007, NULL, NULL, 100, '卡其色 30', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 918, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1557, 87, 426460291580, NULL, 1306248661998, NULL, NULL, 100, '黑色 29', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 891, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1558, 87, 426460291580, NULL, 1306248813000, NULL, NULL, 100, '黑色 31', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 897, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1559, 87, 426460291580, NULL, 1306248813006, NULL, NULL, 100, '卡其色 29', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 915, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1560, 87, 426460291580, NULL, 1306248813017, NULL, NULL, 100, '卡灰 32', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 972, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1561, 87, 426460291580, NULL, 1306248813021, NULL, NULL, 100, '米白色 28', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 936, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1562, 87, 426460291580, NULL, 1306248813024, NULL, NULL, 100, '米白色 31', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 945, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1563, 87, 426460291580, NULL, 1306248813011, NULL, NULL, 100, '卡灰 26', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 954, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1564, 87, 426460291580, NULL, 1306248813013, NULL, NULL, 100, '卡灰 28', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 960, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1565, 87, 426460291580, NULL, 1306248813002, NULL, NULL, 100, '卡其色 25', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 903, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1566, 87, 426460291580, NULL, 1306248813025, NULL, NULL, 100, '米白色 32', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 948, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1567, 87, 426460291580, NULL, 1306248813019, NULL, NULL, 100, '米白色 26', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 930, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1568, 87, 426460291580, NULL, 1306248661996, NULL, NULL, 100, '黑色 27', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 885, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1569, 87, 426460291580, NULL, 1306248813023, NULL, NULL, 100, '米白色 30', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 942, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1570, 87, 426460291580, NULL, 1306248813015, NULL, NULL, 100, '卡灰 30', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 966, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1571, 87, 426460291580, NULL, 1306248813020, NULL, NULL, 100, '米白色 27', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 933, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1572, 87, 426460291580, NULL, 1306248661995, NULL, NULL, 100, '黑色 26', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 882, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1573, 87, 426460291580, NULL, 1306248813018, NULL, NULL, 100, '米白色 25', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 927, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1574, 87, 426460291580, NULL, 1306248813001, NULL, NULL, 100, '黑色 32', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 900, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1575, 87, 426460291580, NULL, 1306248813014, NULL, NULL, 100, '卡灰 29', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 963, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1576, 87, 426460291580, NULL, 1306248661994, NULL, NULL, 100, '黑色 25', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 880, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1577, 87, 426460291580, NULL, 1306248813008, NULL, NULL, 100, '卡其色 31', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 921, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1578, 87, 426460291580, NULL, 1306248661997, NULL, NULL, 100, '黑色 28', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 888, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1579, 87, 426460291580, NULL, 1306248813010, NULL, NULL, 100, '卡灰 25', NULL, 'JKL9907', NULL, NULL, NULL, NULL, NULL, 951, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1580, 5, 394814708558, NULL, 1312048359777, NULL, NULL, 983, '蓝色 M', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1069, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1581, 5, 394814708558, NULL, 1312048359780, NULL, NULL, 994, '蓝色 2XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1072, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1582, 5, 394814708558, NULL, 1312049473907, NULL, NULL, 0, '蓝色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1067, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1583, 5, 394814708558, NULL, 1312049473909, NULL, NULL, 100, '黑灰色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1073, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1584, 5, 394814708558, NULL, 1312048359778, NULL, NULL, 997, '蓝色 L', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1070, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1585, 5, 394814708558, NULL, 1312049473910, NULL, NULL, 0, '蓝灰色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1586, 5, 394814708558, NULL, 1312048359776, NULL, NULL, 987, '蓝色 S', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1068, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1587, 5, 394814708558, NULL, 1312048359779, NULL, NULL, 987, '蓝色 XL', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 1071, 61, NULL);
INSERT INTO `tao_goods_sku` VALUES (1588, 5, 394814708558, NULL, 1312049473908, NULL, NULL, 0, '浅蓝色 XS', NULL, 'JKL8990', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1589, 6, 395429166799, NULL, 1312070165525, NULL, NULL, 100, '深蓝色加绒 27', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1061, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1590, 6, 395429166799, NULL, 1312070165514, NULL, NULL, 100, '浅蓝色 32', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1050, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1591, 6, 395429166799, NULL, 1312070165519, NULL, NULL, 100, '深蓝色 29', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1055, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1592, 6, 395429166799, NULL, 1312070165509, NULL, NULL, 99, '浅蓝色 27', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1045, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1593, 6, 395429166799, NULL, 1312070165507, NULL, NULL, 100, '浅蓝色 25', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1043, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1594, 6, 395429166799, NULL, 1312070165513, NULL, NULL, 100, '浅蓝色 31', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1049, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1595, 6, 395429166799, NULL, 1312070165524, NULL, NULL, 100, '深蓝色加绒 26', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1060, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1596, 6, 395429166799, NULL, 1312070165516, NULL, NULL, 100, '深蓝色 26', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1052, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1597, 6, 395429166799, NULL, 1312070165510, NULL, NULL, 100, '浅蓝色 28', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1046, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1598, 6, 395429166799, NULL, 1312070165515, NULL, NULL, 100, '深蓝色 25', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1051, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1599, 6, 395429166799, NULL, 1312070165518, NULL, NULL, 100, '深蓝色 28', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1054, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1600, 6, 395429166799, NULL, 1312070165517, NULL, NULL, 100, '深蓝色 27', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1053, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1601, 6, 395429166799, NULL, 1312070165529, NULL, NULL, 100, '深蓝色加绒 31', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1065, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1602, 6, 395429166799, NULL, 1312070165527, NULL, NULL, 100, '深蓝色加绒 29', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1063, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1603, 6, 395429166799, NULL, 1312070165526, NULL, NULL, 100, '深蓝色加绒 28', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1062, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1604, 6, 395429166799, NULL, 1312070165528, NULL, NULL, 100, '深蓝色加绒 30', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1064, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1605, 6, 395429166799, NULL, 1312070165522, NULL, NULL, 100, '深蓝色 32', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1058, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1606, 6, 395429166799, NULL, 1312070165530, NULL, NULL, 100, '深蓝色加绒 32', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1066, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1607, 6, 395429166799, NULL, 1312070165508, NULL, NULL, 100, '浅蓝色 26', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1044, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1608, 6, 395429166799, NULL, 1312070165512, NULL, NULL, 100, '浅蓝色 30', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1048, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1609, 6, 395429166799, NULL, 1312070165520, NULL, NULL, 100, '深蓝色 30', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1056, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1610, 6, 395429166799, NULL, 1312070165523, NULL, NULL, 100, '深蓝色加绒 25', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1059, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1611, 6, 395429166799, NULL, 1312070165511, NULL, NULL, 100, '浅蓝色 29', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1047, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1612, 6, 395429166799, NULL, 1312070165521, NULL, NULL, 100, '深蓝色 31', NULL, 'JKL9950', NULL, NULL, NULL, NULL, NULL, 1057, 60, NULL);
INSERT INTO `tao_goods_sku` VALUES (1613, 87, 426460291580, NULL, 1308303884195, NULL, NULL, 100, '卡其九分加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 914, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1614, 87, 426460291580, NULL, 1308303884186, NULL, NULL, 99, '黑色九分加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 887, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1615, 87, 426460291580, NULL, 1308303884213, NULL, NULL, 100, '卡灰九分加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 968, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1616, 87, 426460291580, NULL, 1308303884214, NULL, NULL, 100, '卡灰九分加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 971, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1617, 87, 426460291580, NULL, 1308302794013, NULL, NULL, 100, '黑色八分 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 886, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1618, 87, 426460291580, NULL, 1308303884203, NULL, NULL, 100, '米白九分加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 938, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1619, 87, 426460291580, NULL, 1308303884200, NULL, NULL, 100, '米白九分加绒 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 929, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1620, 87, 426460291580, NULL, 1308303884191, NULL, NULL, 100, '黑色九分加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 902, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1621, 87, 426460291580, NULL, 1308302794031, NULL, NULL, 100, '卡灰八分 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 964, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1622, 87, 426460291580, NULL, 1308303884187, NULL, NULL, 100, '黑色九分加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 890, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1623, 87, 426460291580, NULL, 1308302794034, NULL, NULL, 100, '卡灰八分 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 973, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1624, 87, 426460291580, NULL, 1308302794041, NULL, NULL, 100, '米白色八分 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 946, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1625, 87, 426460291580, NULL, 1308303884185, NULL, NULL, 100, '黑色九分加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 884, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1626, 87, 426460291580, NULL, 1308302794020, NULL, NULL, 100, '卡其八分 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 907, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1627, 87, 426460291580, NULL, 1308303884205, NULL, NULL, 100, '米白九分加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 944, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1628, 87, 426460291580, NULL, 1308303884207, NULL, NULL, 100, '米白九分加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 950, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1629, 87, 426460291580, NULL, 1308303884209, NULL, NULL, 99, '卡灰九分加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 956, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1630, 87, 426460291580, NULL, 1308302794022, NULL, NULL, 100, '卡其八分 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 913, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1631, 87, 426460291580, NULL, 1308302794030, NULL, NULL, 100, '卡灰八分 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 961, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1632, 87, 426460291580, NULL, 1308303884208, NULL, NULL, 100, '卡灰九分加绒 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 953, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1633, 87, 426460291580, NULL, 1308302794028, NULL, NULL, 100, '卡灰八分 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 955, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1634, 87, 426460291580, NULL, 1308302794026, NULL, NULL, 100, '卡其八分 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 925, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1635, 87, 426460291580, NULL, 1308303884202, NULL, NULL, 100, '米白九分加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 935, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1636, 87, 426460291580, NULL, 1308302794039, NULL, NULL, 100, '米白色八分 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 940, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1637, 87, 426460291580, NULL, 1308303884211, NULL, NULL, 100, '卡灰九分加绒 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 962, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1638, 87, 426460291580, NULL, 1308302794037, NULL, NULL, 100, '米白色八分 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 934, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1639, 87, 426460291580, NULL, 1308303884193, NULL, NULL, 100, '卡其九分加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 908, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1640, 87, 426460291580, NULL, 1308302794014, NULL, NULL, 100, '黑色八分 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 888, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1641, 87, 426460291580, NULL, 1308303884189, NULL, NULL, 100, '黑色九分加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 896, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1642, 87, 426460291580, NULL, 1308302794040, NULL, NULL, 100, '米白色八分 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 943, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1643, 87, 426460291580, NULL, 1308302794019, NULL, NULL, 100, '卡其八分 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 904, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1644, 87, 426460291580, NULL, 1308302794027, NULL, NULL, 100, '卡灰八分 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 952, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1645, 87, 426460291580, NULL, 1308303884212, NULL, NULL, 100, '卡灰九分加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 965, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1646, 87, 426460291580, NULL, 1308302794024, NULL, NULL, 100, '卡其八分 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 919, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1647, 87, 426460291580, NULL, 1308302794025, NULL, NULL, 100, '卡其八分 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 922, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1648, 87, 426460291580, NULL, 1308302794036, NULL, NULL, 100, '米白色八分 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 931, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1649, 87, 426460291580, NULL, 1308303884196, NULL, NULL, 100, '卡其九分加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 917, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1650, 87, 426460291580, NULL, 1308303884198, NULL, NULL, 100, '卡其九分加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 923, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1651, 87, 426460291580, NULL, 1308303884206, NULL, NULL, 100, '米白九分加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 947, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1652, 87, 426460291580, NULL, 1308302794042, NULL, NULL, 100, '米白色八分 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 949, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1653, 87, 426460291580, NULL, 1308303884192, NULL, NULL, 100, '卡其九分加绒 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 905, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1654, 87, 426460291580, NULL, 1308302794035, NULL, NULL, 100, '米白色八分 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 928, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1655, 87, 426460291580, NULL, 1308302794023, NULL, NULL, 100, '卡其八分 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 916, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1656, 87, 426460291580, NULL, 1308303884184, NULL, NULL, 100, '黑色九分加绒 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 881, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1657, 87, 426460291580, NULL, 1308302794018, NULL, NULL, 100, '黑色八分 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 901, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1658, 87, 426460291580, NULL, 1308303884210, NULL, NULL, 100, '卡灰九分加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 959, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1659, 87, 426460291580, NULL, 1308303884199, NULL, NULL, 100, '卡其九分加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 926, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1660, 87, 426460291580, NULL, 1308303884194, NULL, NULL, 100, '卡其九分加绒 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 911, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1661, 87, 426460291580, NULL, 1308302794029, NULL, NULL, 100, '卡灰八分 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 958, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1662, 87, 426460291580, NULL, 1308303884190, NULL, NULL, 100, '黑色九分加绒 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 899, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1663, 87, 426460291580, NULL, 1308303884201, NULL, NULL, 100, '米白九分加绒 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 932, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1664, 87, 426460291580, NULL, 1308302794016, NULL, NULL, 100, '黑色八分 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 895, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1665, 87, 426460291580, NULL, 1308303884197, NULL, NULL, 100, '卡其九分加绒 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 920, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1666, 87, 426460291580, NULL, 1308303884188, NULL, NULL, 100, '黑色九分加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 893, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1667, 87, 426460291580, NULL, 1308302794012, NULL, NULL, 100, '黑色八分 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 883, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1668, 87, 426460291580, NULL, 1308302794032, NULL, NULL, 100, '卡灰八分 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 967, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1669, 87, 426460291580, NULL, 1308303884204, NULL, NULL, 100, '米白九分加绒 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 941, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1670, 87, 426460291580, NULL, 1308302794033, NULL, NULL, 100, '卡灰八分 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 970, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1671, 87, 426460291580, NULL, 1308303884215, NULL, NULL, 100, '卡灰九分加绒 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 974, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1672, 87, 426460291580, NULL, 1308302794015, NULL, NULL, 100, '黑色八分 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 892, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1673, 87, 426460291580, NULL, 1308302794011, NULL, NULL, 100, '黑色八分 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 880, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1674, 87, 426460291580, NULL, 1308302794021, NULL, NULL, 100, '卡其八分 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 910, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1675, 87, 426460291580, NULL, 1308302794038, NULL, NULL, 100, '米白色八分 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 937, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1676, 87, 426460291580, NULL, 1308302794017, NULL, NULL, 100, '黑色八分 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 898, 53, NULL);
INSERT INTO `tao_goods_sku` VALUES (1677, 88, 429860405885, NULL, 1312014329097, NULL, NULL, 100, '锁边加长款（165以上） XL', NULL, 'JKL99774004JC', NULL, NULL, NULL, NULL, NULL, 1008, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1678, 88, 429860405885, NULL, 1312014329092, NULL, NULL, 100, '锁边长款（165以下） 2XL', NULL, 'JKL99774005CK', NULL, NULL, NULL, NULL, NULL, 1009, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1679, 88, 429860405885, NULL, 1312014329085, NULL, NULL, 100, '毛边加长款（165以上） XL', NULL, 'JKL99784004JC', NULL, NULL, NULL, NULL, NULL, 1040, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1680, 88, 429860405885, NULL, 1312014329090, NULL, NULL, 100, '锁边长款（165以下） L', NULL, 'JKL99774003CK', NULL, NULL, NULL, NULL, NULL, 1005, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1681, 88, 429860405885, NULL, 1312014329093, NULL, NULL, 100, '锁边加长款（165以上） XS', NULL, 'JKL99774009JC', NULL, NULL, NULL, NULL, NULL, 1000, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1682, 88, 429860405885, NULL, 1312014329083, NULL, NULL, 100, '毛边加长款（165以上） M', NULL, 'JKL99784002JC', NULL, NULL, NULL, NULL, NULL, 1036, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1683, 88, 429860405885, NULL, 1312014329078, NULL, NULL, 100, '毛边长款（165以下） L', NULL, 'JKL99784003CK', NULL, NULL, NULL, NULL, NULL, 1037, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1684, 88, 429860405885, NULL, 1312014329089, NULL, NULL, 100, '锁边长款（165以下） M', NULL, 'JKL99774002CK', NULL, NULL, NULL, NULL, NULL, 1003, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1685, 88, 429860405885, NULL, 1312014329091, NULL, NULL, 100, '锁边长款（165以下） XL', NULL, 'JKL99774004CK', NULL, NULL, NULL, NULL, NULL, 1007, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1686, 88, 429860405885, NULL, 1312014329075, NULL, NULL, 100, '毛边长款（165以下） XS', NULL, 'JKL99784009CK', NULL, NULL, NULL, NULL, NULL, 1031, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1687, 88, 429860405885, NULL, 1312014329076, NULL, NULL, 100, '毛边长款（165以下） S', NULL, 'JKL99784001CK', NULL, NULL, NULL, NULL, NULL, 1033, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1688, 88, 429860405885, NULL, 1312014329087, NULL, NULL, 100, '锁边长款（165以下） XS', NULL, 'JKL99774009CK', NULL, NULL, NULL, NULL, NULL, 999, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1689, 88, 429860405885, NULL, 1312014329088, NULL, NULL, 100, '锁边长款（165以下） S', NULL, 'JKL99774001CK', NULL, NULL, NULL, NULL, NULL, 1001, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1690, 88, 429860405885, NULL, 1312014329084, NULL, NULL, 100, '毛边加长款（165以上） L', NULL, 'JKL99784003JC', NULL, NULL, NULL, NULL, NULL, 1038, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1691, 88, 429860405885, NULL, 1312014329096, NULL, NULL, 100, '锁边加长款（165以上） L', NULL, 'JKL99774003JC', NULL, NULL, NULL, NULL, NULL, 1006, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1692, 88, 429860405885, NULL, 1312014329079, NULL, NULL, 100, '毛边长款（165以下） XL', NULL, 'JKL99784004CK', NULL, NULL, NULL, NULL, NULL, 1039, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1693, 88, 429860405885, NULL, 1312014329082, NULL, NULL, 100, '毛边加长款（165以上） S', NULL, 'JKL99784001JC', NULL, NULL, NULL, NULL, NULL, 1034, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1694, 88, 429860405885, NULL, 1312014329086, NULL, NULL, 100, '毛边加长款（165以上） 2XL', NULL, 'JKL99784005JC', NULL, NULL, NULL, NULL, NULL, 1042, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1695, 88, 429860405885, NULL, 1312014329094, NULL, NULL, 100, '锁边加长款（165以上） S', NULL, 'JKL99774001JC', NULL, NULL, NULL, NULL, NULL, 1002, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1696, 88, 429860405885, NULL, 1312014329080, NULL, NULL, 100, '毛边长款（165以下） 2XL', NULL, 'JKL99784005CK', NULL, NULL, NULL, NULL, NULL, 1041, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1697, 88, 429860405885, NULL, 1312014329077, NULL, NULL, 100, '毛边长款（165以下） M', NULL, 'JKL99784002CK', NULL, NULL, NULL, NULL, NULL, 1035, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1698, 88, 429860405885, NULL, 1312014329095, NULL, NULL, 100, '锁边加长款（165以上） M', NULL, 'JKL99774002JC', NULL, NULL, NULL, NULL, NULL, 1004, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1699, 88, 429860405885, NULL, 1312014329081, NULL, NULL, 100, '毛边加长款（165以上） XS', NULL, 'JKL99784009JC', NULL, NULL, NULL, NULL, NULL, 1032, 59, NULL);
INSERT INTO `tao_goods_sku` VALUES (1700, 88, 429860405885, NULL, 1312014329098, NULL, NULL, 100, '锁边加长款（165以上） 2XL', NULL, 'JKL99774005JC', NULL, NULL, NULL, NULL, NULL, 1010, 56, NULL);
INSERT INTO `tao_goods_sku` VALUES (1701, 89, 429968867456, NULL, 1312203466678, NULL, NULL, 100, '蓝色 27', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1702, 89, 429968867456, NULL, 1312203466690, NULL, NULL, 100, '灰色 31', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1703, 89, 429968867456, NULL, 1312203466680, NULL, NULL, 100, '蓝色 29', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1704, 89, 429968867456, NULL, 1312203466679, NULL, NULL, 100, '蓝色 28', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1705, 89, 429968867456, NULL, 1312203466683, NULL, NULL, 100, '蓝色 32', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1706, 89, 429968867456, NULL, 1312203466687, NULL, NULL, 100, '灰色 28', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1707, 89, 429968867456, NULL, 1312203466677, NULL, NULL, 100, '蓝色 26', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1708, 89, 429968867456, NULL, 1312203466684, NULL, NULL, 100, '灰色 25', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1709, 89, 429968867456, NULL, 1312203466676, NULL, NULL, 100, '蓝色 25', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1710, 89, 429968867456, NULL, 1312203466691, NULL, NULL, 100, '灰色 32', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1711, 89, 429968867456, NULL, 1312203466688, NULL, NULL, 100, '灰色 29', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1712, 89, 429968867456, NULL, 1312203466685, NULL, NULL, 100, '灰色 26', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1713, 89, 429968867456, NULL, 1312203466682, NULL, NULL, 100, '蓝色 31', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1714, 89, 429968867456, NULL, 1312203466686, NULL, NULL, 100, '灰色 27', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1715, 89, 429968867456, NULL, 1312203466681, NULL, NULL, 100, '蓝色 30', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1716, 89, 429968867456, NULL, 1312203466689, NULL, NULL, 100, '灰色 30', NULL, 'JKL9962', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1717, 12, 401781826934, NULL, 1312259695962, NULL, NULL, 100, '黑色 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1718, 12, 401781826934, NULL, 1312259695963, NULL, NULL, 100, '黑色 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1719, 12, 401781826934, NULL, 1312259695988, NULL, NULL, 100, '黑色长款 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1720, 12, 401781826934, NULL, 1312259695945, NULL, NULL, 99, '深蓝色 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1721, 12, 401781826934, NULL, 1312259695954, NULL, NULL, 100, '浅蓝色 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1722, 12, 401781826934, NULL, 1312259695956, NULL, NULL, 100, '浅蓝色 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1723, 12, 401781826934, NULL, 1312259695958, NULL, NULL, 100, '浅蓝色 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1724, 12, 401781826934, NULL, 1312259695983, NULL, NULL, 100, '浅蓝 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1725, 12, 401781826934, NULL, 1312259695960, NULL, NULL, 100, '黑色 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1726, 12, 401781826934, NULL, 1312259695979, NULL, NULL, 100, '浅蓝 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1727, 12, 401781826934, NULL, 1312259695972, NULL, NULL, 100, '深蓝 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1728, 12, 401781826934, NULL, 1312259695957, NULL, NULL, 100, '浅蓝色 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1729, 12, 401781826934, NULL, 1312259695959, NULL, NULL, 100, '浅蓝色 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1730, 12, 401781826934, NULL, 1312259695977, NULL, NULL, 100, '浅蓝 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1731, 12, 401781826934, NULL, 1312259695990, NULL, NULL, 100, '黑色长款 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1732, 12, 401781826934, NULL, 1312259695949, NULL, NULL, 100, '深蓝色 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1733, 12, 401781826934, NULL, 1312259695975, NULL, NULL, 100, '深蓝 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1734, 12, 401781826934, NULL, 1312259695970, NULL, NULL, 100, '深蓝 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1735, 12, 401781826934, NULL, 1312259695944, NULL, NULL, 100, '深蓝色 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1736, 12, 401781826934, NULL, 1312259695969, NULL, NULL, 100, '深蓝 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1737, 12, 401781826934, NULL, 1312259695973, NULL, NULL, 100, '深蓝 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1738, 12, 401781826934, NULL, 1312259695991, NULL, NULL, 100, '黑色长款 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1739, 12, 401781826934, NULL, 1312259695961, NULL, NULL, 100, '黑色 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1740, 12, 401781826934, NULL, 1312259695951, NULL, NULL, 100, '深蓝色 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1741, 12, 401781826934, NULL, 1312259695968, NULL, NULL, 100, '深蓝 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1742, 12, 401781826934, NULL, 1312259695965, NULL, NULL, 100, '黑色 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1743, 12, 401781826934, NULL, 1312259695952, NULL, NULL, 100, '浅蓝色 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1744, 12, 401781826934, NULL, 1312259695946, NULL, NULL, 100, '深蓝色 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1745, 12, 401781826934, NULL, 1312259695985, NULL, NULL, 100, '黑色长款 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1746, 12, 401781826934, NULL, 1312259695976, NULL, NULL, 100, '浅蓝 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1747, 12, 401781826934, NULL, 1312259695947, NULL, NULL, 100, '深蓝色 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1748, 12, 401781826934, NULL, 1312259695978, NULL, NULL, 100, '浅蓝 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1749, 12, 401781826934, NULL, 1312259695953, NULL, NULL, 100, '浅蓝色 26', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1750, 12, 401781826934, NULL, 1312259695980, NULL, NULL, 100, '浅蓝 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1751, 12, 401781826934, NULL, 1312259695984, NULL, NULL, 100, '黑色长款 25', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1752, 12, 401781826934, NULL, 1312259695966, NULL, NULL, 100, '黑色 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1753, 12, 401781826934, NULL, 1312259695967, NULL, NULL, 100, '黑色 32', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1754, 12, 401781826934, NULL, 1312259695987, NULL, NULL, 100, '黑色长款 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1755, 12, 401781826934, NULL, 1312259695971, NULL, NULL, 100, '深蓝 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1756, 12, 401781826934, NULL, 1312259695982, NULL, NULL, 100, '浅蓝 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1757, 12, 401781826934, NULL, 1312259695981, NULL, NULL, 100, '浅蓝 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1758, 12, 401781826934, NULL, 1312259695964, NULL, NULL, 100, '黑色 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1759, 12, 401781826934, NULL, 1312259695955, NULL, NULL, 100, '浅蓝色 28', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1760, 12, 401781826934, NULL, 1312259695974, NULL, NULL, 100, '深蓝 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1761, 12, 401781826934, NULL, 1312259695948, NULL, NULL, 100, '深蓝色 29', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1762, 12, 401781826934, NULL, 1312259695950, NULL, NULL, 100, '深蓝色 31', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1763, 12, 401781826934, NULL, 1312259695989, NULL, NULL, 100, '黑色长款 30', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1764, 12, 401781826934, NULL, 1312259695986, NULL, NULL, 100, '黑色长款 27', NULL, 'JKL9909', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1765, 21, 403877607629, NULL, 1312601942987, NULL, NULL, 1000, '深蓝 27', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1766, 21, 403877607629, NULL, 1312601942992, NULL, NULL, 1000, '深蓝 32', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1767, 21, 403877607629, NULL, 1312601942989, NULL, NULL, 1000, '深蓝 29', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1768, 21, 403877607629, NULL, 1312601942983, NULL, NULL, 1000, '浅蓝色 25', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1769, 21, 403877607629, NULL, 1312601942988, NULL, NULL, 1000, '深蓝 28', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1770, 21, 403877607629, NULL, 1312601942984, NULL, NULL, 1000, '蓝灰色 25', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1771, 21, 403877607629, NULL, 1312601942986, NULL, NULL, 1000, '深蓝 26', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1772, 21, 403877607629, NULL, 1312601942991, NULL, NULL, 1000, '深蓝 31', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1773, 21, 403877607629, NULL, 1312601942990, NULL, NULL, 1000, '深蓝 30', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1774, 21, 403877607629, NULL, 1312601942981, NULL, NULL, 1000, '黑色 25', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1775, 21, 403877607629, NULL, 1312601942982, NULL, NULL, 1000, '黑灰色 25', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1776, 21, 403877607629, NULL, 1312601942985, NULL, NULL, 1000, '深蓝 25', NULL, 'JKL8967', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1777, 82, 423703312591, NULL, 1314707340353, NULL, NULL, 100, '黑色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1778, 82, 423703312591, NULL, 1314708624494, NULL, NULL, 100, '咖啡色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1779, 82, 423703312591, NULL, 1314708624520, NULL, NULL, 100, '墨绿色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1780, 82, 423703312591, NULL, 1314707340343, NULL, NULL, 100, '酒红色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1781, 82, 423703312591, NULL, 1314708624493, NULL, NULL, 100, '咖啡色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1782, 82, 423703312591, NULL, 1314708624504, NULL, NULL, 100, '深紫色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1783, 82, 423703312591, NULL, 1314709895298, NULL, NULL, 100, '宝蓝色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1784, 82, 423703312591, NULL, 1314707340347, NULL, NULL, 100, '酒红色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1785, 82, 423703312591, NULL, 1314708624511, NULL, NULL, 100, '墨绿色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1786, 82, 423703312591, NULL, 1314707340357, NULL, NULL, 100, '黑色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1787, 82, 423703312591, NULL, 1314707340358, NULL, NULL, 100, '黑色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1788, 82, 423703312591, NULL, 1314709895303, NULL, NULL, 100, '卡其色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1789, 82, 423703312591, NULL, 1314707340375, NULL, NULL, 100, '藏蓝色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1790, 82, 423703312591, NULL, 1314709895292, NULL, NULL, 100, '宝蓝色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1791, 82, 423703312591, NULL, 1314709895305, NULL, NULL, 100, '卡其色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1792, 82, 423703312591, NULL, 1314704618609, NULL, NULL, 100, '大红加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1793, 82, 423703312591, NULL, 1314707340361, NULL, NULL, 100, '白色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1794, 82, 423703312591, NULL, 1314708624525, NULL, NULL, 100, '灰色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1795, 82, 423703312591, NULL, 1314704618616, NULL, NULL, 100, '大红加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1796, 82, 423703312591, NULL, 1314707340369, NULL, NULL, 100, '白色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1797, 82, 423703312591, NULL, 1314708624500, NULL, NULL, 100, '咖啡色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1798, 82, 423703312591, NULL, 1314708624523, NULL, NULL, 100, '灰色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1799, 82, 423703312591, NULL, 1314708624522, NULL, NULL, 100, '灰色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1800, 82, 423703312591, NULL, 1314709895304, NULL, NULL, 100, '卡其色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1801, 82, 423703312591, NULL, 1314707340364, NULL, NULL, 100, '白色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1802, 82, 423703312591, NULL, 1314707340351, NULL, NULL, 100, '黑色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1803, 82, 423703312591, NULL, 1314708624502, NULL, NULL, 100, '深紫色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1804, 82, 423703312591, NULL, 1314708624510, NULL, NULL, 100, '深紫色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1805, 82, 423703312591, NULL, 1314709895301, NULL, NULL, 100, '宝蓝色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1806, 82, 423703312591, NULL, 1314708624496, NULL, NULL, 100, '咖啡色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1807, 82, 423703312591, NULL, 1314708624509, NULL, NULL, 100, '深紫色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1808, 82, 423703312591, NULL, 1314707340374, NULL, NULL, 100, '藏蓝色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1809, 82, 423703312591, NULL, 1314708624501, NULL, NULL, 100, '深紫色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1810, 82, 423703312591, NULL, 1314708624517, NULL, NULL, 100, '墨绿色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1811, 82, 423703312591, NULL, 1314707340348, NULL, NULL, 100, '酒红色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1812, 82, 423703312591, NULL, 1314707340366, NULL, NULL, 100, '白色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1813, 82, 423703312591, NULL, 1314707340341, NULL, NULL, 100, '酒红色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1814, 82, 423703312591, NULL, 1314708624521, NULL, NULL, 100, '灰色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1815, 82, 423703312591, NULL, 1314708624507, NULL, NULL, 100, '深紫色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1816, 82, 423703312591, NULL, 1314709895297, NULL, NULL, 100, '宝蓝色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1817, 82, 423703312591, NULL, 1314704618617, NULL, NULL, 100, '大红加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1818, 82, 423703312591, NULL, 1314708624499, NULL, NULL, 100, '咖啡色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1819, 82, 423703312591, NULL, 1314709895299, NULL, NULL, 100, '宝蓝色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1820, 82, 423703312591, NULL, 1314709895294, NULL, NULL, 100, '宝蓝色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1821, 82, 423703312591, NULL, 1314707340342, NULL, NULL, 100, '酒红色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1822, 82, 423703312591, NULL, 1314707340356, NULL, NULL, 100, '黑色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1823, 82, 423703312591, NULL, 1314707340344, NULL, NULL, 100, '酒红色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1824, 82, 423703312591, NULL, 1314704618615, NULL, NULL, 100, '大红加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1825, 82, 423703312591, NULL, 1314708624524, NULL, NULL, 100, '灰色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1826, 82, 423703312591, NULL, 1314707340378, NULL, NULL, 100, '藏蓝色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1827, 82, 423703312591, NULL, 1314707340367, NULL, NULL, 100, '白色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1828, 82, 423703312591, NULL, 1314708624515, NULL, NULL, 100, '墨绿色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1829, 82, 423703312591, NULL, 1314709895302, NULL, NULL, 100, '卡其色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1830, 82, 423703312591, NULL, 1314707340379, NULL, NULL, 100, '藏蓝色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1831, 82, 423703312591, NULL, 1314708624512, NULL, NULL, 100, '墨绿色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1832, 82, 423703312591, NULL, 1314708624527, NULL, NULL, 100, '灰色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1833, 82, 423703312591, NULL, 1314707340352, NULL, NULL, 100, '黑色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1834, 82, 423703312591, NULL, 1314708624495, NULL, NULL, 100, '咖啡色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1835, 82, 423703312591, NULL, 1314707340363, NULL, NULL, 100, '白色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1836, 82, 423703312591, NULL, 1314708624497, NULL, NULL, 100, '咖啡色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1837, 82, 423703312591, NULL, 1314707340346, NULL, NULL, 100, '酒红色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1838, 82, 423703312591, NULL, 1314704618618, NULL, NULL, 100, '大红加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1839, 82, 423703312591, NULL, 1314709895309, NULL, NULL, 100, '卡其色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1840, 82, 423703312591, NULL, 1314708624528, NULL, NULL, 100, '灰色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1841, 82, 423703312591, NULL, 1314708624503, NULL, NULL, 100, '深紫色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1842, 82, 423703312591, NULL, 1314709895296, NULL, NULL, 100, '宝蓝色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1843, 82, 423703312591, NULL, 1314708624518, NULL, NULL, 100, '墨绿色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1844, 82, 423703312591, NULL, 1314707340354, NULL, NULL, 100, '黑色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1845, 82, 423703312591, NULL, 1314707340372, NULL, NULL, 100, '藏蓝色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1846, 82, 423703312591, NULL, 1314707340362, NULL, NULL, 100, '白色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1847, 82, 423703312591, NULL, 1314707340345, NULL, NULL, 100, '酒红色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1848, 82, 423703312591, NULL, 1314707340355, NULL, NULL, 100, '黑色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1849, 82, 423703312591, NULL, 1314704618613, NULL, NULL, 100, '大红加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1850, 82, 423703312591, NULL, 1314709895306, NULL, NULL, 100, '卡其色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1851, 82, 423703312591, NULL, 1314707340373, NULL, NULL, 100, '藏蓝色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1852, 82, 423703312591, NULL, 1314707340368, NULL, NULL, 100, '白色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1853, 82, 423703312591, NULL, 1314709895310, NULL, NULL, 100, '卡其色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1854, 82, 423703312591, NULL, 1314709895308, NULL, NULL, 100, '卡其色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1855, 82, 423703312591, NULL, 1314708624516, NULL, NULL, 100, '墨绿色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1856, 82, 423703312591, NULL, 1314704618614, NULL, NULL, 100, '大红加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1857, 82, 423703312591, NULL, 1314707340350, NULL, NULL, 100, '酒红色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1858, 82, 423703312591, NULL, 1314707340380, NULL, NULL, 100, '藏蓝色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1859, 82, 423703312591, NULL, 1314707340377, NULL, NULL, 100, '藏蓝色加绒 31', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1860, 82, 423703312591, NULL, 1314704618612, NULL, NULL, 100, '大红加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1861, 82, 423703312591, NULL, 1314707340371, NULL, NULL, 100, '藏蓝色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1862, 82, 423703312591, NULL, 1314709895295, NULL, NULL, 100, '宝蓝色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1863, 82, 423703312591, NULL, 1314708624529, NULL, NULL, 100, '灰色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1864, 82, 423703312591, NULL, 1314708624492, NULL, NULL, 100, '咖啡色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1865, 82, 423703312591, NULL, 1314707340376, NULL, NULL, 100, '藏蓝色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1866, 82, 423703312591, NULL, 1314709895311, NULL, NULL, 100, '卡其色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1867, 82, 423703312591, NULL, 1314708624526, NULL, NULL, 100, '灰色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1868, 82, 423703312591, NULL, 1314709895293, NULL, NULL, 100, '宝蓝色加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1869, 82, 423703312591, NULL, 1314707340360, NULL, NULL, 100, '黑色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1870, 82, 423703312591, NULL, 1314707340349, NULL, NULL, 100, '酒红色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1871, 82, 423703312591, NULL, 1314708624506, NULL, NULL, 100, '深紫色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1872, 82, 423703312591, NULL, 1314704618611, NULL, NULL, 100, '大红加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1873, 82, 423703312591, NULL, 1314708624519, NULL, NULL, 100, '墨绿色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1874, 82, 423703312591, NULL, 1314708624508, NULL, NULL, 100, '深紫色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1875, 82, 423703312591, NULL, 1314707340365, NULL, NULL, 100, '白色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1876, 82, 423703312591, NULL, 1314704618610, NULL, NULL, 100, '大红加绒 26', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1877, 82, 423703312591, NULL, 1314709895300, NULL, NULL, 100, '宝蓝色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1878, 82, 423703312591, NULL, 1314708624505, NULL, NULL, 100, '深紫色加绒 29', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1879, 82, 423703312591, NULL, 1314708624530, NULL, NULL, 100, '灰色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1880, 82, 423703312591, NULL, 1314709895307, NULL, NULL, 100, '卡其色加绒 30', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1881, 82, 423703312591, NULL, 1314708624491, NULL, NULL, 100, '咖啡色加绒 25', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1882, 82, 423703312591, NULL, 1314707340370, NULL, NULL, 100, '白色加绒 34', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1883, 82, 423703312591, NULL, 1314708624498, NULL, NULL, 100, '咖啡色加绒 32', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1884, 82, 423703312591, NULL, 1314708624514, NULL, NULL, 100, '墨绿色加绒 28', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1885, 82, 423703312591, NULL, 1314708624513, NULL, NULL, 100, '墨绿色加绒 27', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1886, 82, 423703312591, NULL, 1314707340359, NULL, NULL, 100, '黑色加绒 33', NULL, 'JKL333', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1887, 90, 431646818746, NULL, 1315016127254, NULL, NULL, 100, '八分薄绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1888, 90, 431646818746, NULL, 1315016127255, NULL, NULL, 100, '八分薄绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1889, 90, 431646818746, NULL, 1315016127263, NULL, NULL, 100, '九分单裤 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1890, 90, 431646818746, NULL, 1315016127270, NULL, NULL, 100, '九分薄绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1891, 90, 431646818746, NULL, 1315016127247, NULL, NULL, 100, '八分单裤 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1892, 90, 431646818746, NULL, 1315016127266, NULL, NULL, 100, '九分单裤 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1893, 90, 431646818746, NULL, 1315016127265, NULL, NULL, 100, '九分单裤 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1894, 90, 431646818746, NULL, 1315016127249, NULL, NULL, 100, '八分单裤 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1895, 90, 431646818746, NULL, 1315016127271, NULL, NULL, 100, '九分薄绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1896, 90, 431646818746, NULL, 1315016127268, NULL, NULL, 100, '九分薄绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1897, 90, 431646818746, NULL, 1315016127251, NULL, NULL, 100, '八分薄绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1898, 90, 431646818746, NULL, 1315016127258, NULL, NULL, 100, '八分加绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1899, 90, 431646818746, NULL, 1315016127262, NULL, NULL, 100, '九分单裤 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1900, 90, 431646818746, NULL, 1315016127246, NULL, NULL, 100, '八分单裤 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1901, 90, 431646818746, NULL, 1315016127277, NULL, NULL, 100, '九分加绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1902, 90, 431646818746, NULL, 1315016127250, NULL, NULL, 100, '八分薄绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1903, 90, 431646818746, NULL, 1315016127253, NULL, NULL, 100, '八分薄绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1904, 90, 431646818746, NULL, 1315016127244, NULL, NULL, 100, '八分单裤 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1905, 90, 431646818746, NULL, 1315016127252, NULL, NULL, 100, '八分薄绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1906, 90, 431646818746, NULL, 1315016127259, NULL, NULL, 100, '八分加绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1907, 90, 431646818746, NULL, 1315016127267, NULL, NULL, 100, '九分单裤 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1908, 90, 431646818746, NULL, 1315016127276, NULL, NULL, 100, '九分加绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1909, 90, 431646818746, NULL, 1315016127264, NULL, NULL, 100, '九分单裤 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1910, 90, 431646818746, NULL, 1315016127261, NULL, NULL, 100, '八分加绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1911, 90, 431646818746, NULL, 1315016127278, NULL, NULL, 100, '九分加绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1912, 90, 431646818746, NULL, 1315016127279, NULL, NULL, 100, '九分加绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1913, 90, 431646818746, NULL, 1315016127260, NULL, NULL, 100, '八分加绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1914, 90, 431646818746, NULL, 1315016127274, NULL, NULL, 100, '九分加绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1915, 90, 431646818746, NULL, 1315016127273, NULL, NULL, 100, '九分薄绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1916, 90, 431646818746, NULL, 1315016127248, NULL, NULL, 100, '八分单裤 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1917, 90, 431646818746, NULL, 1315016127275, NULL, NULL, 100, '九分加绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1918, 90, 431646818746, NULL, 1315016127272, NULL, NULL, 100, '九分薄绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1919, 90, 431646818746, NULL, 1315016127269, NULL, NULL, 100, '九分薄绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1920, 90, 431646818746, NULL, 1315016127245, NULL, NULL, 100, '八分单裤 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1921, 90, 431646818746, NULL, 1315016127256, NULL, NULL, 100, '八分加绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1922, 90, 431646818746, NULL, 1315016127257, NULL, NULL, 100, '八分加绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1923, 91, 431656693618, NULL, 1315037060999, NULL, NULL, 100, '米白色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1165, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1924, 91, 431656693618, NULL, 1315037060973, NULL, NULL, 100, '卡其色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1145, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1925, 91, 431656693618, NULL, 1315037060964, NULL, NULL, 100, '黑色（加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1128, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1926, 91, 431656693618, NULL, 1315037060966, NULL, NULL, 100, '卡其色 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1131, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1927, 91, 431656693618, NULL, 1315037060994, NULL, NULL, 100, '卡灰色（加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1156, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1928, 91, 431656693618, NULL, 1315037060955, NULL, NULL, 100, '黑色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1125, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1929, 91, 431656693618, NULL, 1315037060996, NULL, NULL, 100, '卡灰色（加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1160, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1930, 91, 431656693618, NULL, 1315037139001, NULL, NULL, 100, '米白色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1169, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1931, 91, 431656693618, NULL, 1315037060988, NULL, NULL, 100, '卡灰色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1159, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1932, 91, 431656693618, NULL, 1315037060998, NULL, NULL, 100, '米白色 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1163, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1933, 91, 431656693618, NULL, 1315037060959, NULL, NULL, 99, '黑色（加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1118, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1934, 91, 431656693618, NULL, 1315037060957, NULL, NULL, 100, '黑色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1129, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1935, 91, 431656693618, NULL, 1315037139012, NULL, NULL, 100, '米白色（加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1176, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1936, 91, 431656693618, NULL, 1315037060965, NULL, NULL, 100, '黑色（加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1130, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1937, 91, 431656693618, NULL, 1315037060997, NULL, NULL, 100, '卡灰色（加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1162, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1938, 91, 431656693618, NULL, 1315037060950, NULL, NULL, 100, '黑色 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1115, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1939, 91, 431656693618, NULL, 1315037060963, NULL, NULL, 100, '黑色（加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1126, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1940, 91, 431656693618, NULL, 1315037060961, NULL, NULL, 100, '黑色（加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1122, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1941, 91, 431656693618, NULL, 1315037060954, NULL, NULL, 100, '黑色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1123, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1942, 91, 431656693618, NULL, 1315037139013, NULL, NULL, 100, '米白色（加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1178, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1943, 91, 431656693618, NULL, 1315037060983, NULL, NULL, 100, '卡灰色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1149, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1944, 91, 431656693618, NULL, 1315037060956, NULL, NULL, 100, '黑色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1127, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1945, 91, 431656693618, NULL, 1315037060951, NULL, NULL, 100, '黑色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1117, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1946, 91, 431656693618, NULL, 1315037139008, NULL, NULL, 100, '米白色（加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1168, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1947, 91, 431656693618, NULL, 1315037060987, NULL, NULL, 100, '卡灰色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1157, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1948, 91, 431656693618, NULL, 1315037060976, NULL, NULL, 100, '卡其色（加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1136, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1949, 91, 431656693618, NULL, 1315037060981, NULL, NULL, 100, '卡其色（加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1146, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1950, 91, 431656693618, NULL, 1315037139005, NULL, NULL, 100, '米白色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1177, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1951, 91, 431656693618, NULL, 1315037060967, NULL, NULL, 100, '卡其色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1133, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1952, 91, 431656693618, NULL, 1315037060953, NULL, NULL, 100, '黑色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1121, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1953, 91, 431656693618, NULL, 1315037139007, NULL, NULL, 100, '米白色（加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1166, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1954, 91, 431656693618, NULL, 1315037060995, NULL, NULL, 100, '卡灰色（加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1158, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1955, 91, 431656693618, NULL, 1315037139010, NULL, NULL, 100, '米白色（加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1172, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1956, 91, 431656693618, NULL, 1315037139004, NULL, NULL, 100, '米白色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1175, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1957, 91, 431656693618, NULL, 1315037060989, NULL, NULL, 100, '卡灰色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1161, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1958, 91, 431656693618, NULL, 1315037060985, NULL, NULL, 100, '卡灰色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1153, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1959, 91, 431656693618, NULL, 1315037060974, NULL, NULL, 100, '卡其色（加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1132, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1960, 91, 431656693618, NULL, 1315037060990, NULL, NULL, 100, '卡灰色（加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1148, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1961, 91, 431656693618, NULL, 1315037060992, NULL, NULL, 100, '卡灰色（加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1152, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1962, 91, 431656693618, NULL, 1315037060986, NULL, NULL, 100, '卡灰色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1155, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1963, 91, 431656693618, NULL, 1315037060960, NULL, NULL, 100, '黑色（加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1120, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1964, 91, 431656693618, NULL, 1315037060969, NULL, NULL, 100, '卡其色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1137, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1965, 91, 431656693618, NULL, 1315037060972, NULL, NULL, 100, '卡其色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1143, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1966, 91, 431656693618, NULL, 1315037060971, NULL, NULL, 100, '卡其色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1141, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1967, 91, 431656693618, NULL, 1315037139002, NULL, NULL, 100, '米白色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1171, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1968, 91, 431656693618, NULL, 1315037139011, NULL, NULL, 100, '米白色（加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1174, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1969, 91, 431656693618, NULL, 1315037060979, NULL, NULL, 100, '卡其色（加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1142, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1970, 91, 431656693618, NULL, 1315037060980, NULL, NULL, 100, '卡其色（加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1144, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1971, 91, 431656693618, NULL, 1315037060952, NULL, NULL, 100, '黑色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1119, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1972, 91, 431656693618, NULL, 1315037060962, NULL, NULL, 100, '黑色（加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1124, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1973, 91, 431656693618, NULL, 1315037060978, NULL, NULL, 100, '卡其色（加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1140, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1974, 91, 431656693618, NULL, 1315037060977, NULL, NULL, 100, '卡其色（加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1138, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1975, 91, 431656693618, NULL, 1315037139009, NULL, NULL, 100, '米白色（加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1170, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1976, 91, 431656693618, NULL, 1315037139003, NULL, NULL, 100, '米白色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1173, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1977, 91, 431656693618, NULL, 1315037060970, NULL, NULL, 100, '卡其色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1139, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1978, 91, 431656693618, NULL, 1315037060958, NULL, NULL, 100, '黑色（加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1116, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1979, 91, 431656693618, NULL, 1315037060984, NULL, NULL, 100, '卡灰色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1151, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1980, 91, 431656693618, NULL, 1315037139006, NULL, NULL, 100, '米白色（加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1164, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1981, 91, 431656693618, NULL, 1315037060968, NULL, NULL, 100, '卡其色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1135, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1982, 91, 431656693618, NULL, 1315037060982, NULL, NULL, 100, '卡灰色 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1147, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1983, 91, 431656693618, NULL, 1315037060993, NULL, NULL, 100, '卡灰色（加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1154, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1984, 91, 431656693618, NULL, 1315037139000, NULL, NULL, 100, '米白色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1167, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1985, 91, 431656693618, NULL, 1315037060991, NULL, NULL, 100, '卡灰色（加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1150, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1986, 91, 431656693618, NULL, 1315037060975, NULL, NULL, 100, '卡其色（加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1134, 63, NULL);
INSERT INTO `tao_goods_sku` VALUES (1987, 92, 432701863744, NULL, 1316793142326, NULL, NULL, 100, '黑色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1988, 92, 432701863744, NULL, 1316793142327, NULL, NULL, 100, '黑色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1989, 92, 432701863744, NULL, 1316793142318, NULL, NULL, 100, '黑色撞色（九分） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1990, 92, 432701863744, NULL, 1316793142322, NULL, NULL, 100, '黑色 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1991, 92, 432701863744, NULL, 1316793142321, NULL, NULL, 100, '黑色撞色（九分） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1992, 92, 432701863744, NULL, 1316793142316, NULL, NULL, 100, '黑色撞色（九分） XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1993, 92, 432701863744, NULL, 1316793142320, NULL, NULL, 100, '黑色撞色（九分） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1994, 92, 432701863744, NULL, 1316793142324, NULL, NULL, 100, '黑色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1995, 92, 432701863744, NULL, 1316793142319, NULL, NULL, 100, '黑色撞色（九分） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1996, 92, 432701863744, NULL, 1316793142323, NULL, NULL, 100, '黑色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1997, 92, 432701863744, NULL, 1316793142317, NULL, NULL, 100, '黑色撞色（九分） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1998, 92, 432701863744, NULL, 1316793142325, NULL, NULL, 100, '黑色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (1999, 93, 432930516051, NULL, 1317172515738, NULL, NULL, 100, '复古蓝 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 1232, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2000, 93, 432930516051, NULL, 1317172515741, NULL, NULL, 100, '复古蓝 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 1238, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2001, 93, 432930516051, NULL, 1317172515748, NULL, NULL, 100, '复古蓝（加绒） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 1241, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2002, 93, 432930516051, NULL, 1317172515742, NULL, NULL, 100, '复古蓝 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 1240, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2003, 93, 432930516051, NULL, 1317172515737, NULL, NULL, 100, '复古蓝 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 1230, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2004, 93, 432930516051, NULL, 1317172515746, NULL, NULL, 100, '复古蓝（加绒） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 1237, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2005, 93, 432930516051, NULL, 1317172515740, NULL, NULL, 100, '复古蓝 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 1236, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2006, 93, 432930516051, NULL, 1317172515745, NULL, NULL, 100, '复古蓝（加绒） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 1235, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2007, 93, 432930516051, NULL, 1317172515743, NULL, NULL, 100, '复古蓝（加绒） XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 1231, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2008, 93, 432930516051, NULL, 1317172515747, NULL, NULL, 100, '复古蓝（加绒） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 1239, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2009, 93, 432930516051, NULL, 1317172515744, NULL, NULL, 100, '复古蓝（加绒） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 1233, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2010, 93, 432930516051, NULL, 1317172515739, NULL, NULL, 100, '复古蓝 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 1234, 66, NULL);
INSERT INTO `tao_goods_sku` VALUES (2011, 94, 432939563887, NULL, 1317186166417, NULL, NULL, 100, '八分抓绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2012, 94, 432939563887, NULL, 1317186166412, NULL, NULL, 100, '九分单裤 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2013, 94, 432939563887, NULL, 1317186166422, NULL, NULL, 100, '九分抓绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2014, 94, 432939563887, NULL, 1317186166416, NULL, NULL, 100, '八分抓绒 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2015, 94, 432939563887, NULL, 1317186166403, NULL, NULL, 100, '八分单裤 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2016, 94, 432939563887, NULL, 1317186166405, NULL, NULL, 100, '八分单裤 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2017, 94, 432939563887, NULL, 1317186166406, NULL, NULL, 100, '八分单裤 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2018, 94, 432939563887, NULL, 1317186166404, NULL, NULL, 100, '八分单裤 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2019, 94, 432939563887, NULL, 1317186166413, NULL, NULL, 100, '九分单裤 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2020, 94, 432939563887, NULL, 1317186166407, NULL, NULL, 100, '八分单裤 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2021, 94, 432939563887, NULL, 1317186166410, NULL, NULL, 100, '九分单裤 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2022, 94, 432939563887, NULL, 1317186166411, NULL, NULL, 100, '九分单裤 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2023, 94, 432939563887, NULL, 1317186166425, NULL, NULL, 100, '九分抓绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2024, 94, 432939563887, NULL, 1317186166424, NULL, NULL, 100, '九分抓绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2025, 94, 432939563887, NULL, 1317186166419, NULL, NULL, 100, '八分抓绒 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2026, 94, 432939563887, NULL, 1317186166415, NULL, NULL, 100, '八分抓绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2027, 94, 432939563887, NULL, 1317186166402, NULL, NULL, 100, '八分单裤 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2028, 94, 432939563887, NULL, 1317186166408, NULL, NULL, 100, '九分单裤 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2029, 94, 432939563887, NULL, 1317186166421, NULL, NULL, 100, '九分抓绒 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2030, 94, 432939563887, NULL, 1317186166409, NULL, NULL, 100, '九分单裤 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2031, 94, 432939563887, NULL, 1317186166414, NULL, NULL, 100, '八分抓绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2032, 94, 432939563887, NULL, 1317186166418, NULL, NULL, 100, '八分抓绒 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2033, 94, 432939563887, NULL, 1317186166420, NULL, NULL, 100, '九分抓绒 XS', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2034, 94, 432939563887, NULL, 1317186166423, NULL, NULL, 100, '九分抓绒 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2035, 95, 432951870483, NULL, 1317207478166, NULL, NULL, 100, '深蓝色（长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1262, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2036, 95, 432951870483, NULL, 1317207478168, NULL, NULL, 100, '深蓝色（长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1270, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2037, 95, 432951870483, NULL, 1317207478181, NULL, NULL, 100, '深蓝色（加长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1260, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2038, 95, 432951870483, NULL, 1317207478176, NULL, NULL, 100, '复古蓝（长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1302, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2039, 95, 432951870483, NULL, 1317207478194, NULL, NULL, 100, '深蓝色（长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1247, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2040, 95, 432951870483, NULL, 1317207478216, NULL, NULL, 100, '深蓝色（加长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1273, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2041, 95, 432951870483, NULL, 1317207478219, NULL, NULL, 100, '复古蓝（加长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1285, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2042, 95, 432951870483, NULL, 1317207478206, NULL, NULL, 100, '复古蓝（长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1295, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2043, 95, 432951870483, NULL, 1317207478208, NULL, NULL, 100, '复古蓝（长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1303, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2044, 95, 432951870483, NULL, 1317207478169, NULL, NULL, 100, '复古蓝（长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1274, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2045, 95, 432951870483, NULL, 1317207478205, NULL, NULL, 100, '复古蓝（长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1291, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2046, 95, 432951870483, NULL, 1317207478221, NULL, NULL, 100, '复古蓝（加长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1293, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2047, 95, 432951870483, NULL, 1317207478174, NULL, NULL, 100, '复古蓝（长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1294, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2048, 95, 432951870483, NULL, 1317207478185, NULL, NULL, 100, '复古蓝（加长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1276, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2049, 95, 432951870483, NULL, 1317207478197, NULL, NULL, 100, '深蓝色（长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1259, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2050, 95, 432951870483, NULL, 1317207478183, NULL, NULL, 100, '深蓝色（加长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2051, 95, 432951870483, NULL, 1317207478188, NULL, NULL, 100, '复古蓝（加长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1288, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2052, 95, 432951870483, NULL, 1317207478207, NULL, NULL, 100, '复古蓝（长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1299, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2053, 95, 432951870483, NULL, 1317207478217, NULL, NULL, 100, '复古蓝（加长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1277, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2054, 95, 432951870483, NULL, 1317207478165, NULL, NULL, 100, '深蓝色（长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1258, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2055, 95, 432951870483, NULL, 1317207478196, NULL, NULL, 100, '深蓝色（长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1255, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2056, 95, 432951870483, NULL, 1317207478184, NULL, NULL, 100, '深蓝色（加长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1272, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2057, 95, 432951870483, NULL, 1317207478204, NULL, NULL, 100, '复古蓝（长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1287, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2058, 95, 432951870483, NULL, 1317207478211, NULL, NULL, 100, '深蓝色（加长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1253, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2059, 95, 432951870483, NULL, 1317207478170, NULL, NULL, 100, '复古蓝（长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1278, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2060, 95, 432951870483, NULL, 1317207478192, NULL, NULL, 100, '复古蓝（加长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1304, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2061, 95, 432951870483, NULL, 1317207478172, NULL, NULL, 100, '复古蓝（长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1286, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2062, 95, 432951870483, NULL, 1317207478178, NULL, NULL, 100, '深蓝色（加长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1248, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2063, 95, 432951870483, NULL, 1317207478209, NULL, NULL, 100, '深蓝色（加长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1245, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2064, 95, 432951870483, NULL, 1317207478195, NULL, NULL, 100, '深蓝色（长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1251, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2065, 95, 432951870483, NULL, 1317207478180, NULL, NULL, 100, '深蓝色（加长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1256, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2066, 95, 432951870483, NULL, 1317207478189, NULL, NULL, 100, '复古蓝（加长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1292, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2067, 95, 432951870483, NULL, 1317207478200, NULL, NULL, 100, '深蓝色（长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1271, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2068, 95, 432951870483, NULL, 1317207478171, NULL, NULL, 100, '复古蓝（长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1282, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2069, 95, 432951870483, NULL, 1317207478198, NULL, NULL, 100, '深蓝色（长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1263, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2070, 95, 432951870483, NULL, 1317207478186, NULL, NULL, 100, '复古蓝（加长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1280, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2071, 95, 432951870483, NULL, 1317207478187, NULL, NULL, 100, '复古蓝（加长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1284, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2072, 95, 432951870483, NULL, 1317207478203, NULL, NULL, 100, '复古蓝（长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1283, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2073, 95, 432951870483, NULL, 1317207478223, NULL, NULL, 100, '复古蓝（加长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1301, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2074, 95, 432951870483, NULL, 1317207478163, NULL, NULL, 100, '深蓝色（长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1250, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2075, 95, 432951870483, NULL, 1317207478164, NULL, NULL, 100, '深蓝色（长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1254, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2076, 95, 432951870483, NULL, 1317207478182, NULL, NULL, 100, '深蓝色（加长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1264, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2077, 95, 432951870483, NULL, 1317207478179, NULL, NULL, 100, '深蓝色（加长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 1252, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2078, 95, 432951870483, NULL, 1317207478173, NULL, NULL, 100, '复古蓝（长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1290, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2079, 95, 432951870483, NULL, 1317207478199, NULL, NULL, 100, '深蓝色（长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1267, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2080, 95, 432951870483, NULL, 1317207478201, NULL, NULL, 100, '复古蓝（长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1275, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2081, 95, 432951870483, NULL, 1317207478202, NULL, NULL, 100, '复古蓝（长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1279, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2082, 95, 432951870483, NULL, 1317207478212, NULL, NULL, 100, '深蓝色（加长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1257, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2083, 95, 432951870483, NULL, 1317207478213, NULL, NULL, 100, '深蓝色（加长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 1261, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2084, 95, 432951870483, NULL, 1317207478218, NULL, NULL, 100, '复古蓝（加长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1281, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2085, 95, 432951870483, NULL, 1317207478214, NULL, NULL, 100, '深蓝色（加长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1265, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2086, 95, 432951870483, NULL, 1317207478191, NULL, NULL, 100, '复古蓝（加长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1300, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2087, 95, 432951870483, NULL, 1317207478210, NULL, NULL, 100, '深蓝色（加长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1249, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2088, 95, 432951870483, NULL, 1317207478177, NULL, NULL, 100, '深蓝色（加长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1244, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2089, 95, 432951870483, NULL, 1317207478190, NULL, NULL, 100, '复古蓝（加长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1296, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2090, 95, 432951870483, NULL, 1317207478222, NULL, NULL, 100, '复古蓝（加长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 1297, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2091, 95, 432951870483, NULL, 1317207478193, NULL, NULL, 100, '深蓝色（长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1243, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2092, 95, 432951870483, NULL, 1317207478220, NULL, NULL, 100, '复古蓝（加长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 1289, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2093, 95, 432951870483, NULL, 1317207478167, NULL, NULL, 100, '深蓝色（长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1266, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2094, 95, 432951870483, NULL, 1317207478162, NULL, NULL, 100, '深蓝色（长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 1246, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2095, 95, 432951870483, NULL, 1317207478161, NULL, NULL, 100, '深蓝色（长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 1242, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2096, 95, 432951870483, NULL, 1317207478175, NULL, NULL, 100, '复古蓝（长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1298, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2097, 95, 432951870483, NULL, 1317207478215, NULL, NULL, 100, '深蓝色（加长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 1269, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2098, 95, 432951870483, NULL, 1317207478224, NULL, NULL, 100, '复古蓝（加长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 1305, 67, NULL);
INSERT INTO `tao_goods_sku` VALUES (2099, 96, 432977920082, NULL, 1317250246880, NULL, NULL, 100, '深蓝色（长裤） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2100, 96, 432977920082, NULL, 1317250246891, NULL, NULL, 100, '浅蓝色（加长） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2101, 96, 432977920082, NULL, 1317250246879, NULL, NULL, 100, '深蓝色（长裤） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2102, 96, 432977920082, NULL, 1317250246892, NULL, NULL, 100, '浅蓝色（加长） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2103, 96, 432977920082, NULL, 1317250246884, NULL, NULL, 100, '浅蓝色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2104, 96, 432977920082, NULL, 1317250246889, NULL, NULL, 100, '深蓝色（加长） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2105, 96, 432977920082, NULL, 1317250246886, NULL, NULL, 100, '深蓝色（加长） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2106, 96, 432977920082, NULL, 1317250246882, NULL, NULL, 100, '浅蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2107, 96, 432977920082, NULL, 1317250246887, NULL, NULL, 100, '深蓝色（加长） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2108, 96, 432977920082, NULL, 1317250246893, NULL, NULL, 100, '浅蓝色（加长） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2109, 96, 432977920082, NULL, 1317250246890, NULL, NULL, 100, '深蓝色（加长） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2110, 96, 432977920082, NULL, 1317250246888, NULL, NULL, 100, '深蓝色（加长） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2111, 96, 432977920082, NULL, 1317250246877, NULL, NULL, 100, '深蓝色（长裤） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2112, 96, 432977920082, NULL, 1317250246885, NULL, NULL, 100, '浅蓝色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2113, 96, 432977920082, NULL, 1317250246881, NULL, NULL, 100, '浅蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2114, 96, 432977920082, NULL, 1317250246876, NULL, NULL, 100, '深蓝色（长裤） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2115, 96, 432977920082, NULL, 1317250246878, NULL, NULL, 100, '深蓝色（长裤） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2116, 96, 432977920082, NULL, 1317250246883, NULL, NULL, 100, '浅蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2117, 96, 432977920082, NULL, 1317250246894, NULL, NULL, 100, '浅蓝色（加长） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2118, 96, 432977920082, NULL, 1317250246895, NULL, NULL, 100, '浅蓝色（加长） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2119, 97, 432987421029, NULL, 1317264242865, NULL, NULL, 100, '深蓝（长裤） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2120, 97, 432987421029, NULL, 1317264242875, NULL, NULL, 100, '深蓝（加长） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2121, 97, 432987421029, NULL, 1317264242871, NULL, NULL, 100, '浅蓝色 M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2122, 97, 432987421029, NULL, 1317264242883, NULL, NULL, 100, '浅蓝色（加长） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2123, 97, 432987421029, NULL, 1317264242882, NULL, NULL, 100, '浅蓝色（加长） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2124, 97, 432987421029, NULL, 1317264242869, NULL, NULL, 100, '深蓝（长裤） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2125, 97, 432987421029, NULL, 1317264242874, NULL, NULL, 100, '浅蓝色 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2126, 97, 432987421029, NULL, 1317264242868, NULL, NULL, 100, '深蓝（长裤） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2127, 97, 432987421029, NULL, 1317264242872, NULL, NULL, 100, '浅蓝色 L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2128, 97, 432987421029, NULL, 1317264242866, NULL, NULL, 100, '深蓝（长裤） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2129, 97, 432987421029, NULL, 1317264242870, NULL, NULL, 100, '浅蓝色 S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2130, 97, 432987421029, NULL, 1317264242884, NULL, NULL, 100, '浅蓝色（加长） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2131, 97, 432987421029, NULL, 1317264242877, NULL, NULL, 100, '深蓝（加长） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2132, 97, 432987421029, NULL, 1317264242876, NULL, NULL, 100, '深蓝（加长） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2133, 97, 432987421029, NULL, 1317264242880, NULL, NULL, 100, '浅蓝色（加长） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2134, 97, 432987421029, NULL, 1317264242873, NULL, NULL, 100, '浅蓝色 XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2135, 97, 432987421029, NULL, 1317264242878, NULL, NULL, 100, '深蓝（加长） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2136, 97, 432987421029, NULL, 1317264242879, NULL, NULL, 100, '深蓝（加长） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2137, 97, 432987421029, NULL, 1317264242867, NULL, NULL, 100, '深蓝（长裤） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2138, 97, 432987421029, NULL, 1317264242881, NULL, NULL, 100, '浅蓝色（加长） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2139, 98, 433499680962, NULL, 1318135707031, NULL, NULL, 100, '中蓝（长裤） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2140, 98, 433499680962, NULL, 1318135707044, NULL, NULL, 100, '中蓝（加长款） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2141, 98, 433499680962, NULL, 1318135707033, NULL, NULL, 100, '中蓝（长裤） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2142, 98, 433499680962, NULL, 1318135707040, NULL, NULL, 100, '深蓝（加长款） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2143, 98, 433499680962, NULL, 1318135707042, NULL, NULL, 100, '中蓝（加长款） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2144, 98, 433499680962, NULL, 1318135707027, NULL, NULL, 100, '深蓝（长裤） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2145, 98, 433499680962, NULL, 1318135707038, NULL, NULL, 100, '深蓝（加长款） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2146, 98, 433499680962, NULL, 1318135707030, NULL, NULL, 100, '深蓝（长裤） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2147, 98, 433499680962, NULL, 1318135707035, NULL, NULL, 100, '中蓝（长裤） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2148, 98, 433499680962, NULL, 1318135707032, NULL, NULL, 100, '中蓝（长裤） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2149, 98, 433499680962, NULL, 1318135707028, NULL, NULL, 100, '深蓝（长裤） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2150, 98, 433499680962, NULL, 1318135707029, NULL, NULL, 100, '深蓝（长裤） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2151, 98, 433499680962, NULL, 1318135707039, NULL, NULL, 100, '深蓝（加长款） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2152, 98, 433499680962, NULL, 1318135707041, NULL, NULL, 100, '中蓝（加长款） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2153, 98, 433499680962, NULL, 1318135707043, NULL, NULL, 100, '中蓝（加长款） L', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2154, 98, 433499680962, NULL, 1318135707037, NULL, NULL, 100, '深蓝（加长款） M', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2155, 98, 433499680962, NULL, 1318135707045, NULL, NULL, 100, '中蓝（加长款） 2XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2156, 98, 433499680962, NULL, 1318135707026, NULL, NULL, 100, '深蓝（长裤） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2157, 98, 433499680962, NULL, 1318135707034, NULL, NULL, 100, '中蓝（长裤） XL', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2158, 98, 433499680962, NULL, 1318135707036, NULL, NULL, 100, '深蓝（加长款） S', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2159, 99, 433495415698, NULL, 1318175941084, NULL, NULL, 100, '复古蓝（长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2160, 99, 433495415698, NULL, 1318159290557, NULL, NULL, 100, '浅蓝色（加长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2161, 99, 433495415698, NULL, 1318175941064, NULL, NULL, 100, '黑灰（长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2162, 99, 433495415698, NULL, 1318175941072, NULL, NULL, 100, '黑灰（加长加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2163, 99, 433495415698, NULL, 1318159290494, NULL, NULL, 100, '黑灰（九分） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2164, 99, 433495415698, NULL, 1318159290512, NULL, NULL, 100, '黑灰（加长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2165, 99, 433495415698, NULL, 1318159290523, NULL, NULL, 100, '复古蓝（九分） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2166, 99, 433495415698, NULL, 1318175941088, NULL, NULL, 100, '复古蓝（长裤加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2167, 99, 433495415698, NULL, 1318159290556, NULL, NULL, 100, '浅蓝色（长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2168, 99, 433495415698, NULL, 1318159290529, NULL, NULL, 100, '复古蓝（长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2169, 99, 433495415698, NULL, 1318159290508, NULL, NULL, 100, '黑灰（长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2170, 99, 433495415698, NULL, 1318175941083, NULL, NULL, 100, '复古蓝（九分加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2171, 99, 433495415698, NULL, 1318175941059, NULL, NULL, 100, '黑灰（九分加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2172, 99, 433495415698, NULL, 1318159290499, NULL, NULL, 100, '黑灰（九分） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2173, 99, 433495415698, NULL, 1318159290527, NULL, NULL, 100, '复古蓝（长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2174, 99, 433495415698, NULL, 1318159290528, NULL, NULL, 100, '复古蓝（长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2175, 99, 433495415698, NULL, 1318159290509, NULL, NULL, 100, '黑灰（加长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2176, 99, 433495415698, NULL, 1318175941075, NULL, NULL, 100, '黑灰（加长加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2177, 99, 433495415698, NULL, 1318175941078, NULL, NULL, 100, '复古蓝（九分加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2178, 99, 433495415698, NULL, 1318175941056, NULL, NULL, 100, '黑灰（九分加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2179, 99, 433495415698, NULL, 1318175941073, NULL, NULL, 100, '黑灰（加长加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2180, 99, 433495415698, NULL, 1318175941099, NULL, NULL, 100, '复古蓝（加长加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2181, 99, 433495415698, NULL, 1318159290495, NULL, NULL, 100, '黑灰（九分） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2182, 99, 433495415698, NULL, 1318159290525, NULL, NULL, 100, '复古蓝（长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2183, 99, 433495415698, NULL, 1318159290534, NULL, NULL, 100, '复古蓝（加长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2184, 99, 433495415698, NULL, 1318159290545, NULL, NULL, 100, '浅蓝色 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2185, 99, 433495415698, NULL, 1318159290542, NULL, NULL, 100, '浅蓝色 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2186, 99, 433495415698, NULL, 1318175941082, NULL, NULL, 100, '复古蓝（九分加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2187, 99, 433495415698, NULL, 1318159290543, NULL, NULL, 100, '浅蓝色 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2188, 99, 433495415698, NULL, 1318159290531, NULL, NULL, 100, '复古蓝（长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2189, 99, 433495415698, NULL, 1318159290547, NULL, NULL, 100, '浅蓝色 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2190, 99, 433495415698, NULL, 1318159290507, NULL, NULL, 100, '黑灰（长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2191, 99, 433495415698, NULL, 1318175941057, NULL, NULL, 100, '黑灰（九分加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2192, 99, 433495415698, NULL, 1318159290533, NULL, NULL, 100, '复古蓝（加长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2193, 99, 433495415698, NULL, 1318159290518, NULL, NULL, 100, '复古蓝（九分） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2194, 99, 433495415698, NULL, 1318159290540, NULL, NULL, 100, '复古蓝（加长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2195, 99, 433495415698, NULL, 1318159290500, NULL, NULL, 100, '黑灰（九分） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2196, 99, 433495415698, NULL, 1318159290538, NULL, NULL, 100, '复古蓝（加长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2197, 99, 433495415698, NULL, 1318159290506, NULL, NULL, 100, '黑灰（长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2198, 99, 433495415698, NULL, 1318159290503, NULL, NULL, 100, '黑灰（长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2199, 99, 433495415698, NULL, 1318159290521, NULL, NULL, 100, '复古蓝（九分） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2200, 99, 433495415698, NULL, 1318159290541, NULL, NULL, 100, '浅蓝色 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2201, 99, 433495415698, NULL, 1318159290515, NULL, NULL, 100, '黑灰（加长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2202, 99, 433495415698, NULL, 1318175941065, NULL, NULL, 100, '黑灰（长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2203, 99, 433495415698, NULL, 1318175941077, NULL, NULL, 100, '复古蓝（九分加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2204, 99, 433495415698, NULL, 1318175941093, NULL, NULL, 100, '复古蓝（加长加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2205, 99, 433495415698, NULL, 1318159290555, NULL, NULL, 100, '浅蓝色（长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2206, 99, 433495415698, NULL, 1318175941086, NULL, NULL, 100, '复古蓝（长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2207, 99, 433495415698, NULL, 1318175941054, NULL, NULL, 100, '黑灰（九分加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2208, 99, 433495415698, NULL, 1318159290510, NULL, NULL, 100, '黑灰（加长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2209, 99, 433495415698, NULL, 1318175941070, NULL, NULL, 100, '黑灰（加长加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2210, 99, 433495415698, NULL, 1318175941066, NULL, NULL, 100, '黑灰（长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2211, 99, 433495415698, NULL, 1318159290513, NULL, NULL, 100, '黑灰（加长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2212, 99, 433495415698, NULL, 1318159290553, NULL, NULL, 100, '浅蓝色（长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2213, 99, 433495415698, NULL, 1318159290551, NULL, NULL, 100, '浅蓝色（长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2214, 99, 433495415698, NULL, 1318175941081, NULL, NULL, 100, '复古蓝（九分加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2215, 99, 433495415698, NULL, 1318175941060, NULL, NULL, 100, '黑灰（长裤加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2216, 99, 433495415698, NULL, 1318175941089, NULL, NULL, 100, '复古蓝（长裤加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2217, 99, 433495415698, NULL, 1318159290522, NULL, NULL, 100, '复古蓝（九分） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2218, 99, 433495415698, NULL, 1318159290501, NULL, NULL, 100, '黑灰（长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2219, 99, 433495415698, NULL, 1318159290563, NULL, NULL, 100, '浅蓝色（加长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2220, 99, 433495415698, NULL, 1318159290517, NULL, NULL, 100, '复古蓝（九分） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2221, 99, 433495415698, NULL, 1318159290561, NULL, NULL, 100, '浅蓝色（加长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2222, 99, 433495415698, NULL, 1318159290498, NULL, NULL, 100, '黑灰（九分） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2223, 99, 433495415698, NULL, 1318159290524, NULL, NULL, 100, '复古蓝（九分） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2224, 99, 433495415698, NULL, 1318175941063, NULL, NULL, 100, '黑灰（长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2225, 99, 433495415698, NULL, 1318159290546, NULL, NULL, 100, '浅蓝色 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2226, 99, 433495415698, NULL, 1318159290520, NULL, NULL, 100, '复古蓝（九分） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2227, 99, 433495415698, NULL, 1318175941097, NULL, NULL, 100, '复古蓝（加长加绒） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2228, 99, 433495415698, NULL, 1318159290552, NULL, NULL, 100, '浅蓝色（长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2229, 99, 433495415698, NULL, 1318175941094, NULL, NULL, 100, '复古蓝（加长加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2230, 99, 433495415698, NULL, 1318159290497, NULL, NULL, 100, '黑灰（九分） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2231, 99, 433495415698, NULL, 1318175941090, NULL, NULL, 100, '复古蓝（长裤加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2232, 99, 433495415698, NULL, 1318175941080, NULL, NULL, 100, '复古蓝（九分加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2233, 99, 433495415698, NULL, 1318159290554, NULL, NULL, 100, '浅蓝色（长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2234, 99, 433495415698, NULL, 1318175941061, NULL, NULL, 100, '黑灰（长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2235, 99, 433495415698, NULL, 1318175941085, NULL, NULL, 100, '复古蓝（长裤加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2236, 99, 433495415698, NULL, 1318159290564, NULL, NULL, 100, '浅蓝色（加长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2237, 99, 433495415698, NULL, 1318159290496, NULL, NULL, 100, '黑灰（九分） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2238, 99, 433495415698, NULL, 1318175941092, NULL, NULL, 100, '复古蓝（加长加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2239, 99, 433495415698, NULL, 1318175941068, NULL, NULL, 100, '黑灰（加长加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2240, 99, 433495415698, NULL, 1318175941058, NULL, NULL, 100, '黑灰（九分加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2241, 99, 433495415698, NULL, 1318175941071, NULL, NULL, 100, '黑灰（加长加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2242, 99, 433495415698, NULL, 1318175941074, NULL, NULL, 100, '黑灰（加长加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2243, 99, 433495415698, NULL, 1318175941052, NULL, NULL, 100, '黑灰（九分加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2244, 99, 433495415698, NULL, 1318175941055, NULL, NULL, 100, '黑灰（九分加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2245, 99, 433495415698, NULL, 1318159290514, NULL, NULL, 100, '黑灰（加长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2246, 99, 433495415698, NULL, 1318159290532, NULL, NULL, 100, '复古蓝（长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2247, 99, 433495415698, NULL, 1318175941091, NULL, NULL, 100, '复古蓝（长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2248, 99, 433495415698, NULL, 1318159290502, NULL, NULL, 100, '黑灰（长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2249, 99, 433495415698, NULL, 1318159290536, NULL, NULL, 100, '复古蓝（加长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2250, 99, 433495415698, NULL, 1318159290516, NULL, NULL, 100, '黑灰（加长裤） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2251, 99, 433495415698, NULL, 1318175941062, NULL, NULL, 100, '黑灰（长裤加绒） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2252, 99, 433495415698, NULL, 1318159290550, NULL, NULL, 100, '浅蓝色（长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2253, 99, 433495415698, NULL, 1318175941095, NULL, NULL, 100, '复古蓝（加长加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2254, 99, 433495415698, NULL, 1318159290544, NULL, NULL, 100, '浅蓝色 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2255, 99, 433495415698, NULL, 1318159290493, NULL, NULL, 100, '黑灰（九分） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2256, 99, 433495415698, NULL, 1318159290504, NULL, NULL, 100, '黑灰（长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2257, 99, 433495415698, NULL, 1318175941087, NULL, NULL, 100, '复古蓝（长裤加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2258, 99, 433495415698, NULL, 1318175941079, NULL, NULL, 100, '复古蓝（九分加绒） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2259, 99, 433495415698, NULL, 1318159290560, NULL, NULL, 100, '浅蓝色（加长裤） 28', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2260, 99, 433495415698, NULL, 1318159290539, NULL, NULL, 100, '复古蓝（加长裤） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2261, 99, 433495415698, NULL, 1318159290548, NULL, NULL, 100, '浅蓝色 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2262, 99, 433495415698, NULL, 1318159290562, NULL, NULL, 100, '浅蓝色（加长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2263, 99, 433495415698, NULL, 1318159290558, NULL, NULL, 100, '浅蓝色（加长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2264, 99, 433495415698, NULL, 1318175941076, NULL, NULL, 100, '复古蓝（九分加绒） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2265, 99, 433495415698, NULL, 1318159290530, NULL, NULL, 100, '复古蓝（长裤） 30', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2266, 99, 433495415698, NULL, 1318175941069, NULL, NULL, 100, '黑灰（加长加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2267, 99, 433495415698, NULL, 1318159290505, NULL, NULL, 100, '黑灰（长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2268, 99, 433495415698, NULL, 1318159290537, NULL, NULL, 100, '复古蓝（加长裤） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2269, 99, 433495415698, NULL, 1318175941067, NULL, NULL, 100, '黑灰（长裤加绒） 32', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2270, 99, 433495415698, NULL, 1318175941096, NULL, NULL, 100, '复古蓝（加长加绒） 29', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2271, 99, 433495415698, NULL, 1318159290511, NULL, NULL, 100, '黑灰（加长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2272, 99, 433495415698, NULL, 1318159290519, NULL, NULL, 100, '复古蓝（九分） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2273, 99, 433495415698, NULL, 1318159290526, NULL, NULL, 100, '复古蓝（长裤） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2274, 99, 433495415698, NULL, 1318159290559, NULL, NULL, 100, '浅蓝色（加长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2275, 99, 433495415698, NULL, 1318159290535, NULL, NULL, 100, '复古蓝（加长裤） 27', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2276, 99, 433495415698, NULL, 1318175941098, NULL, NULL, 100, '复古蓝（加长加绒） 31', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2277, 99, 433495415698, NULL, 1318159290549, NULL, NULL, 100, '浅蓝色（长裤） 25', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2278, 99, 433495415698, NULL, 1318175941053, NULL, NULL, 100, '黑灰（九分加绒） 26', NULL, '', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);
INSERT INTO `tao_goods_sku` VALUES (2279, 100, 433742784706, NULL, 1318560053562, NULL, NULL, 100, '绿色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 1229, 65, NULL);
INSERT INTO `tao_goods_sku` VALUES (2280, 100, 433742784706, NULL, 1318560053561, NULL, NULL, 100, '黑色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 1227, 65, NULL);
INSERT INTO `tao_goods_sku` VALUES (2281, 100, 433742784706, NULL, 1318560053563, NULL, NULL, 99, '咖啡色 均码', NULL, '', NULL, NULL, NULL, NULL, NULL, 1228, 65, NULL);

-- ----------------------------
-- Table structure for tao_order
-- ----------------------------
DROP TABLE IF EXISTS `tao_order`;
CREATE TABLE `tao_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` int NOT NULL DEFAULT 0 COMMENT '店铺id',
  `tid` bigint NOT NULL COMMENT '交易编号 (父订单的交易编号)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易标题，以店铺名作为此标题的值。',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。',
  `seller_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5',
  `has_buyer_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '判断订单是否有买家留言，有买家留言返回true，否则返回false',
  `credit_card_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用信用卡支付金额数',
  `step_trade_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)',
  `step_paid_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的已付金额（万人团订单已付金额）',
  `buyer_open_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家OpenUid',
  `mark_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空',
  `buyer_nick` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '买家昵称',
  `num_iid` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品数字编号',
  `num` int NULL DEFAULT NULL COMMENT '商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。',
  `price` float NULL DEFAULT NULL COMMENT '商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分',
  `total_fee` float NULL DEFAULT NULL COMMENT '商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` float NULL DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07',
  `post_fee` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `discount_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `payment` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `received_payment` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `available_confirm_fee` float NULL DEFAULT NULL COMMENT '交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分',
  `cod_fee` float NULL DEFAULT NULL COMMENT '货到付款服务费。',
  `cod_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家货到付款服务费',
  `seller_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家货到付款服务费',
  `express_agency_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递代收款。',
  `commission_fee` float NULL DEFAULT NULL COMMENT '交易佣金。',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。',
  `created` datetime NOT NULL COMMENT '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '卖家发货时间。格式:yyyy-MM-dd HH:mm:ss',
  `end_time` datetime NULL DEFAULT NULL COMMENT '交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss',
  `seller_memo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家备忘信息',
  `buyer_memo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家备注',
  `buyer_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '买家留言',
  `point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家使用积分,下单时生成，且一直不变。格式:100;单位:个.',
  `real_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个',
  `buyer_obtain_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `receivingTime` datetime NULL DEFAULT NULL COMMENT '收货时间，这里返回的是完全收货时间',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)',
  `trade_memo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '交易备注。',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '数据库创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '数据库更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据库更新人',
  `oaid` varchar(2552) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '（收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址aid字段',
  `receiver_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人国籍',
  `receiver_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人街道地址',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的电话号码',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值:true(已评价),false(未评价)',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `buyer_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false',
  `buyer_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家下单的地区',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `buyer_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝账号',
  `buyer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家邮件地址',
  `seller_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝账号',
  `has_post_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)',
  `timeout_action_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同',
  `snapshot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易快照地址',
  `promotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易促销详细信息',
  `yfx_fee` float NULL DEFAULT NULL COMMENT '订单的运费险，单位为元',
  `send_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单将在此时间前发出，主要用于预售订单',
  `is_part_consign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order
-- ----------------------------
INSERT INTO `tao_order` VALUES (1, 6, 1631273557325601885, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 28.90, 28.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-31 18:14:00', '2022-07-31 18:14:00', '2022-07-31 18:14:00', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432700565699461', 0, '2022-07-31 18:13:59', '2024-01-16 13:44:26', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (2, 6, 1634650644223535380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:54:56', '2022-08-05 18:54:56', '2022-08-05 18:54:56', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409379', 0, '2022-08-05 18:54:56', '2022-08-05 19:52:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (3, 6, 1635222253871665598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:48:51', '2022-08-05 18:48:51', '2022-08-05 18:48:51', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409767', 0, '2022-08-05 18:48:51', '2024-01-28 19:55:37', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (4, 6, 1635963673656309898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:26:01', '2022-08-06 18:26:01', '2022-08-06 18:26:01', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752762', 0, '2022-08-06 18:26:01', '2022-08-09 19:19:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (5, 6, 1638101679063535380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:34:24', '2022-08-09 19:34:24', '2022-08-09 19:34:24', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432716874752516', 0, '2022-08-09 19:34:24', '2022-08-09 22:45:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (6, 6, 2802458485756587847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:20:20', '2022-08-06 18:20:20', '2022-08-06 18:20:20', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752302', 0, '2022-08-06 18:20:20', '2022-08-09 19:20:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (7, 6, 1638388920088435398, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-10 17:17:21', '2022-08-10 17:17:21', '2022-08-10 17:17:21', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432718792062072', 0, '2022-08-10 17:17:21', '2022-08-10 19:47:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (8, 6, 1639000560200588828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-11 18:26:09', '2022-08-11 18:26:09', '2022-08-11 18:26:09', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432720544409446', 0, '2022-08-11 18:26:09', '2022-08-12 19:50:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (9, 6, 2803060765578343137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:24:17', '2022-08-06 18:24:17', '2022-08-06 18:24:17', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752032', 0, '2022-08-06 18:24:17', '2022-08-09 19:19:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (10, 6, 1639678765959282960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-11 18:24:58', '2022-08-11 18:24:58', '2022-08-11 18:24:58', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '中通快递', '78605337159555', 0, '2022-08-11 18:24:58', '2022-08-12 19:50:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (11, 6, 2803069443945496644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 19:32:52', '2022-08-05 19:32:52', '2022-08-05 19:32:52', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409961', 0, '2022-08-05 19:32:52', '2022-08-05 19:41:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (12, 6, 1640039089142149277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-11 18:27:07', '2022-08-11 18:27:07', '2022-08-11 18:27:07', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432720552181285', 0, '2022-08-11 18:27:07', '2022-08-12 19:50:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (13, 6, 1640069402434910729, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-11 18:28:22', '2022-08-11 18:28:22', '2022-08-11 18:28:22', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432720547617821', 0, '2022-08-11 18:28:22', '2022-08-12 19:49:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (14, 6, 1641540792944799598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-13 19:06:15', '2022-08-13 19:06:15', '2022-08-13 19:06:15', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432723807527213', 0, '2022-08-13 19:06:15', '2022-08-13 21:24:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (15, 6, 1642459225787395472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-13 19:08:09', '2022-08-13 19:08:09', '2022-08-13 19:08:09', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432723807527023', 0, '2022-08-13 19:08:09', '2022-08-13 21:23:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (16, 6, 1642473483353670599, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-13 19:09:13', '2022-08-13 19:09:13', '2022-08-13 19:09:13', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432723807526979', 0, '2022-08-13 19:09:13', '2024-01-16 15:04:52', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (17, 6, 1645143458981500079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-16 19:17:01', '2022-08-16 19:17:01', '2022-08-16 19:17:01', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432728674221907', 0, '2022-08-16 19:17:01', '2022-08-16 19:49:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (18, 6, 1645147956136238382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-17 18:18:37', '2022-08-17 18:18:37', '2022-08-17 18:18:37', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432730372496826', 0, '2022-08-17 18:18:37', '2022-08-17 19:51:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (19, 6, 1646030496778058766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:19:41', '2022-08-18 19:19:41', '2022-08-18 19:19:41', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189595068', 0, '2022-08-18 19:19:41', '2022-08-18 19:46:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (20, 6, 2803379438025412245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:23:12', '2022-08-06 18:23:12', '2022-08-06 18:23:12', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752122', 0, '2022-08-06 18:23:12', '2022-08-09 19:19:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (21, 6, 1646522582072053096, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-17 19:01:05', '2022-08-17 19:01:05', '2022-08-17 19:01:05', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432730372496544', 0, '2022-08-17 19:01:05', '2022-08-17 19:50:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (22, 6, 2803541439021384333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:21:47', '2022-08-06 18:21:47', '2022-08-06 18:21:47', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752212', 0, '2022-08-06 18:21:47', '2022-08-09 19:20:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (23, 6, 1647209246565575386, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:23:04', '2022-08-18 19:23:04', '2022-08-18 19:23:04', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189594715', 0, '2022-08-18 19:23:04', '2022-08-18 19:44:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (24, 6, 1647477879589747479, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:37:22', '2022-08-18 19:37:22', '2022-08-18 19:37:22', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732194247917', 0, '2022-08-18 19:37:22', '2022-08-18 19:39:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (25, 6, 2803676041615853522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:27:22', '2022-08-06 18:27:22', '2022-08-06 18:27:22', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752672', 0, '2022-08-06 18:27:22', '2022-08-09 19:18:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (26, 6, 2803823065336497560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:28:44', '2022-08-06 18:28:44', '2022-08-06 18:28:44', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752582', 0, '2022-08-06 18:28:44', '2022-08-09 19:18:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (27, 6, 1649326118935313381, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-21 19:27:21', '2022-08-21 19:27:21', '2022-08-21 19:27:21', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432737498051156', 0, '2022-08-21 19:27:21', '2022-08-21 19:50:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (28, 6, 2804237174661134517, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-06 18:30:01', '2022-08-06 18:30:01', '2022-08-06 18:30:01', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432711322752492', 0, '2022-08-06 18:30:01', '2022-08-09 19:18:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (29, 6, 2806128469605311766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 10:14:35', '2022-08-12 10:14:35', '2022-08-12 10:14:35', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '000000', 0, '2022-08-12 10:14:35', '2022-08-12 10:14:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (30, 6, 1653154394408665996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-25 20:12:35', '2022-08-25 20:12:35', '2022-08-25 20:12:35', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432745220903636', 0, '2022-08-25 20:12:35', '2022-08-25 20:23:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (31, 6, 2806463700630730938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:23:55', '2022-08-09 19:23:55', '2022-08-09 19:23:55', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432714519516515', 0, '2022-08-09 19:23:55', '2022-08-09 19:24:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (32, 6, 1654118401554519282, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-26 19:53:24', '2022-08-26 19:53:24', '2022-08-26 19:53:24', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432747058224996', 0, '2022-08-26 19:53:24', '2022-08-26 20:49:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (33, 6, 2807235686784026944, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:26:51', '2022-08-09 19:26:51', '2022-08-09 19:26:51', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432714519516703', 0, '2022-08-09 19:26:51', '2022-08-09 19:27:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (34, 6, 2807896683249463307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:25:30', '2022-08-09 19:25:30', '2022-08-09 19:25:30', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432714519516609', 0, '2022-08-09 19:25:30', '2022-08-09 19:25:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (35, 6, 1664188610043377195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 19.90, 19.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-06 23:05:35', NULL, '2022-09-06 23:05:57', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012001081470', 0, '2022-09-07 18:06:01', '2024-01-07 16:03:56', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (36, 6, 2809380888296826747, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:31:08', '2022-08-09 19:31:08', '2022-08-09 19:31:08', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432716874752606', 0, '2022-08-09 19:31:08', '2022-08-09 22:46:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (37, 6, 1664990796806753993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 24.90, 24.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-08 13:44:02', NULL, '2022-09-08 13:44:12', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012093953057', 0, '2022-09-08 19:50:50', '2022-09-08 21:22:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (38, 6, 2810157841775119046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:30:02', '2022-08-09 19:30:02', '2022-08-09 19:30:02', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432716874752796', 0, '2022-08-09 19:30:02', '2022-08-09 22:46:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (39, 6, 1666956540494199587, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 34.90, 34.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-10 17:43:28', NULL, '2022-09-10 17:43:32', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012292164995', 0, '2022-09-10 19:28:38', '2022-09-11 18:15:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (40, 6, 2810277795520609508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-09 19:28:55', '2022-08-09 19:28:55', '2022-08-09 19:28:55', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432716874752426', 0, '2022-08-09 19:28:55', '2022-08-09 22:46:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (41, 6, 2811933036666454704, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-10 17:15:20', '2022-08-10 17:15:20', '2022-08-10 17:15:20', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432718792062162', 0, '2022-08-10 17:15:20', '2022-08-10 19:48:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (42, 6, 2814908799866290421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-11 18:29:23', '2022-08-11 18:29:23', '2022-08-11 18:29:23', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432720552180903', 0, '2022-08-11 18:29:23', '2022-08-12 19:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (43, 6, 2814967981966512411, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 19:54:07', '2022-08-12 19:54:07', '2022-08-12 19:54:07', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432722269061442', 0, '2022-08-12 19:54:07', '2022-08-12 20:03:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (44, 6, 2815872879709626454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 19:55:09', '2022-08-12 19:55:09', '2022-08-12 19:55:09', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432722269061353', 0, '2022-08-12 19:55:09', '2022-08-12 20:02:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (45, 6, 2816024978330891142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-12 19:56:03', '2022-08-12 19:56:03', '2022-08-12 19:56:03', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432722269061264', 0, '2022-08-12 19:56:03', '2022-08-12 20:02:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (46, 6, 2817362126131487212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-13 19:07:19', '2022-08-13 19:07:19', '2022-08-13 19:07:19', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432723807527118', 0, '2022-08-13 19:07:19', '2022-08-13 21:24:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (47, 6, 2821066273607033246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-15 19:56:21', '2022-08-15 19:56:21', '2022-08-15 19:56:21', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432727009545994', 0, '2022-08-15 19:56:21', '2022-08-16 09:28:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (48, 6, 2821131792906086156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-15 19:57:17', '2022-08-15 19:57:17', '2022-08-15 19:57:17', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432727009545801', 0, '2022-08-15 19:57:17', '2022-08-16 09:27:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (49, 6, 1668790597296915884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 51.91, 51.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-11 21:32:48', NULL, '2022-09-11 21:33:08', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012393584895', 0, '2022-09-12 19:19:49', '2022-09-12 19:43:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (50, 6, 1681236338785922394, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 43.49, 43.49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-25 14:51:29', NULL, '2022-09-25 14:51:37', NULL, NULL, '送腰带', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3013527906908', 0, '2022-09-25 18:31:43', '2022-09-27 17:01:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (51, 6, 2821439630766120201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-15 19:55:28', '2022-08-15 19:55:28', '2022-08-15 19:55:28', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432727009546049', 0, '2022-08-15 19:55:28', '2022-08-16 09:28:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (52, 6, 2824177932760871937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-17 18:19:35', '2022-08-17 18:19:35', '2022-08-17 18:19:35', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432730372496732', 0, '2022-08-17 18:19:35', '2022-08-17 19:51:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (53, 6, 1683558230877541495, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 49.63, 49.63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-27 10:15:53', NULL, '2022-09-27 10:15:57', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '不要腰带', '极兔速递', 'JT3013717179230', 0, '2022-09-27 17:12:03', '2022-09-27 20:17:50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (54, 6, 1707397970934272173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 52.30, 52.30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-19 14:56:17', NULL, '2022-10-19 14:58:35', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '432854235143832', 4, '2022-10-19 17:54:54', '2022-10-19 19:28:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (55, 6, 1719046705687156592, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 67.15, 67.15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-30 10:27:56', NULL, '2022-10-30 10:43:37', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '773189893623897', 4, '2022-10-30 15:13:17', '2022-10-30 19:05:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (56, 6, 1727577552380645780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 69.22, 69.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 14:12:16', NULL, '2022-11-06 14:12:43', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '773191590346950', 4, '2022-11-06 17:19:32', '2022-11-06 18:45:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (57, 6, 1732019991903645780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 69.22, 69.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-10 09:28:11', NULL, '2022-11-10 09:28:19', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '773192240748155', 4, '2022-11-10 17:12:48', '2022-11-10 18:04:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (58, 6, 1747680279246507087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 52.30, 52.30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-23 10:50:31', NULL, '2022-11-23 10:50:36', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '432931916667103', 4, '2022-11-23 18:13:01', '2022-11-23 18:13:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (59, 6, 2788451498824204701, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 68.80, 68.80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-07-30 10:31:54', '2022-07-30 10:31:54', '2022-07-30 10:31:54', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432698835564622', 0, '2022-07-30 10:31:53', '2022-07-31 19:56:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (60, 6, 2791618416440640000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 28.90, 28.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-01 12:39:31', '2022-08-01 12:39:31', '2022-08-01 12:39:31', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432702683305097', 0, '2022-08-01 12:39:31', '2022-08-02 13:13:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (61, 6, 2824824564086115520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-17 18:20:51', '2022-08-17 18:20:51', '2022-08-17 18:20:51', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432730372496638', 0, '2022-08-17 18:20:51', '2022-08-17 19:50:28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (62, 6, 2825385264263717249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:17:49', '2022-08-18 19:17:49', '2022-08-18 19:17:49', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189595254', 0, '2022-08-18 19:17:49', '2022-08-18 19:46:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (63, 6, 2791875816618556115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 28.90, 28.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-01 12:41:45', '2022-08-01 12:41:45', '2022-08-01 12:41:45', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432702683304937', 0, '2022-08-01 12:41:44', '2022-08-02 13:13:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (64, 6, 2794387284993651835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 28.90, 28.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-02 19:15:12', '2022-08-02 19:15:12', '2022-08-02 19:15:12', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432704536834253', 0, '2022-08-02 19:15:12', '2022-08-03 19:16:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (65, 6, 2826089316520532138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 59.84, 59.84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:20:48', '2022-08-18 19:20:48', '2022-08-18 19:20:48', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189594999', 0, '2022-08-18 19:20:48', '2022-08-18 19:45:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (66, 6, 2826557209416120201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:18:51', '2022-08-18 19:18:51', '2022-08-18 19:18:51', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189595161', 0, '2022-08-18 19:18:51', '2022-08-18 19:46:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (67, 6, 2794909754785461846, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 43.90, 43.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-02 19:25:47', '2022-08-02 19:25:47', '2022-08-02 19:25:47', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432704536834161', 0, '2022-08-02 19:25:46', '2022-08-03 19:15:42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (68, 6, 2827254996108810615, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:23:54', '2022-08-18 19:23:54', '2022-08-18 19:23:54', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189594623', 0, '2022-08-18 19:23:54', '2022-08-18 19:38:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (69, 6, 2797896566867104830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-03 19:21:02', '2022-08-03 19:21:02', '2022-08-03 19:21:02', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432706257999725', 0, '2022-08-03 19:21:01', '2022-08-03 19:37:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (70, 6, 2828255115947158925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-18 19:22:06', '2022-08-18 19:22:06', '2022-08-18 19:22:06', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432732189594807', 0, '2022-08-18 19:22:06', '2022-08-18 19:44:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (71, 6, 2798109939719431759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-03 19:19:42', '2022-08-03 19:19:42', '2022-08-03 19:19:42', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432706257999822', 0, '2022-08-03 19:19:41', '2022-08-03 19:38:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (72, 6, 2830086181549556227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-19 19:03:26', '2022-08-19 19:03:26', '2022-08-19 19:03:26', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432733936340176', 0, '2022-08-19 19:03:26', '2022-08-19 21:01:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (73, 6, 2833459166397538046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-21 19:26:23', '2022-08-21 19:26:23', '2022-08-21 19:26:23', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432737498051245', 0, '2022-08-21 19:26:23', '2022-08-21 19:51:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (74, 6, 2799354781289326116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-04 19:04:08', '2022-08-04 19:04:08', '2022-08-04 19:04:08', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432708000082578', 0, '2022-08-04 19:04:07', '2022-08-04 20:07:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (75, 6, 2800972080243121364, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:53:58', '2022-08-05 18:53:58', '2022-08-05 18:53:58', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409476', 0, '2022-08-05 18:53:58', '2022-08-05 19:52:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (76, 6, 2833487605081053215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-21 19:28:07', '2022-08-21 19:28:07', '2022-08-21 19:28:07', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432737498051067', 0, '2022-08-21 19:28:07', '2022-08-21 19:49:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (77, 6, 2800981981958381045, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 35.92, 35.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:47:40', '2022-08-05 18:47:40', '2022-08-05 18:47:40', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409864', 0, '2022-08-05 18:47:40', '2022-08-05 19:48:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (78, 6, 2834586612989989214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 17:25:13', '2022-08-22 17:25:13', '2022-08-22 17:25:13', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432739376980052', 0, '2022-08-22 17:25:13', '2022-08-23 19:53:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (79, 6, 2801304685533500951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 69.46, 69.46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:51:24', '2022-08-05 18:51:24', '2022-08-05 18:51:24', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409670', 0, '2022-08-05 18:51:24', '2022-08-05 19:50:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (80, 6, 2802425367037543128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-05 18:52:49', '2022-08-05 18:52:49', '2022-08-05 18:52:49', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432709738409573', 0, '2022-08-05 18:52:49', '2022-08-05 19:51:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (81, 6, 2835997560685460338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-23 19:54:11', '2022-08-23 19:54:11', '2022-08-23 19:54:11', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432741412357862', 0, '2022-08-23 19:54:11', '2022-08-24 19:40:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (82, 6, 2836651827420622606, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-22 17:26:21', '2022-08-22 17:26:21', '2022-08-22 17:26:21', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432739376979983', 0, '2022-08-22 17:26:21', '2022-08-23 19:52:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (83, 6, 2838936061398720816, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 47.92, 47.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-23 19:59:52', '2022-08-23 19:59:52', '2022-08-23 19:59:52', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432741412357672', 0, '2022-08-23 19:59:52', '2022-08-24 19:40:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (84, 6, 2839011483867148800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-23 19:54:59', '2022-08-23 19:54:59', '2022-08-23 19:54:59', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432741412357767', 0, '2022-08-23 19:54:59', '2022-08-24 19:40:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (85, 6, 2840584645454757805, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-24 19:41:38', '2022-08-24 19:41:38', '2022-08-24 19:41:38', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432743309404365', 0, '2022-08-24 19:41:38', '2022-08-24 19:46:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (86, 6, 2855773766822325815, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-31 17:43:01', '2022-08-31 17:43:01', '2022-08-31 17:43:01', NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '韵达速递', '432756595827114', 0, '2022-08-31 17:43:01', '2022-08-31 19:48:59', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (87, 6, 2863795574656667447, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 47.92, 47.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-03 15:34:29', NULL, '2022-09-03 15:34:33', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3011645933337', 0, '2022-09-03 18:08:20', '2022-09-03 19:47:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (88, 6, 2871618367375154549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 27.90, 27.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-06 20:03:11', NULL, '2022-09-06 20:03:13', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012001081492', 0, '2022-09-07 18:06:01', '2022-09-07 19:20:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (89, 6, 2871656887230113338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 27.90, 27.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-06 20:05:01', NULL, '2022-09-06 20:05:02', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012001081492', 0, '2022-09-07 18:06:01', '2022-09-07 19:20:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (90, 6, 2872120393981932527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 25.14, 25.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-06 22:50:50', NULL, '2022-09-06 22:50:57', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012001081481', 0, '2022-09-07 18:06:01', '2022-09-07 19:20:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (91, 6, 2873372763545381646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 55.92, 55.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-07 09:17:05', NULL, '2022-09-07 09:17:22', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012001081469', 0, '2022-09-07 18:06:01', '2022-09-07 19:21:10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (92, 6, 2882180559719256611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-11 15:10:21', NULL, '2022-09-11 15:10:28', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012313812238', 0, '2022-09-11 18:20:17', '2022-09-11 20:03:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (93, 6, 2894222592323299060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 53.91, 53.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-18 13:56:25', NULL, '2022-09-18 13:56:28', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3012900266448', 0, '2022-09-18 20:25:12', '2022-09-18 20:33:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (94, 6, 2899913437459231759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 39.52, 39.52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 21:23:12', NULL, '2022-09-20 21:40:20', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3013085384696', 0, '2022-09-20 22:05:07', '2022-09-20 22:17:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (95, 6, 2900221419737927908, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.92, 29.92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-20 18:13:56', NULL, '2022-09-20 18:13:58', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', NULL, '极兔速递', 'JT3013083656908', 0, '2022-09-20 20:30:31', '2022-09-20 22:17:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (96, 6, 2923690718502279654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 54.90, 54.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-02 01:22:04', NULL, '2022-10-02 01:23:13', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '\'', '极兔速递', 'JT3014110318112', 0, '2022-10-02 17:14:28', '2022-10-02 19:51:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (97, 6, 2927935514314953754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 53.61, 53.61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-04 07:32:38', NULL, '2022-10-04 07:32:44', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '\'', '极兔速递', 'JT3014278403520', 0, '2022-10-04 19:23:44', '2022-10-04 19:58:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (98, 6, 2934328755836161104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 133.03, 133.03, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-06 23:58:12', NULL, '2022-10-06 23:58:21', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '\'', '极兔速递', 'JT3014544579342', 0, '2022-10-07 18:10:19', '2022-10-07 20:27:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (99, 6, 2989950941864043634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 63.90, 63.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-10-31 21:21:23', NULL, '2022-10-31 21:21:40', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '773190534080476', 4, '2022-11-01 18:50:16', '2022-11-01 19:09:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (100, 6, 2996431995920305209, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 53.91, 53.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-02 01:40:10', NULL, '2022-11-02 01:40:12', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '432883942432533', 4, '2022-11-02 15:11:44', '2022-11-02 16:39:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (101, 6, 3007753525735252502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 29.01, 29.01, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-06 14:18:00', NULL, '2022-11-06 14:18:02', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '432893399430806', 4, '2022-11-06 17:19:32', '2022-11-06 18:45:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (102, 6, 3020629500584706539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 56.85, 56.85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-11-11 07:55:56', NULL, '2022-11-11 07:56:08', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '773192733587587', 4, '2022-11-11 12:56:22', '2022-11-11 18:22:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (103, 6, 3068371695265649519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 58.11, 58.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-03 15:19:34', NULL, '2022-12-03 15:19:39', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '432947479125602', 4, '2022-12-03 18:46:25', '2022-12-03 18:52:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (104, 6, 3176359130095573624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 87.21, 87.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-01 07:46:58', NULL, '2023-02-01 07:47:07', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '中通快递', '78653479793989', 4, '2023-02-01 16:00:23', '2023-02-01 21:39:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (105, 6, 3198002834286896419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 24.00, 24.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-13 00:04:10', NULL, '2023-02-13 00:04:20', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433063122463688', 4, '2023-02-13 19:19:15', '2023-02-13 20:01:31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (106, 6, 3199194974134669907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 23.13, 23.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-13 17:21:51', NULL, '2023-02-13 17:21:58', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433063114339003', 4, '2023-02-13 19:19:15', '2023-02-13 20:01:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (107, 6, 3200980287903658205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 84.90, 84.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 14:11:28', NULL, '2023-02-14 14:11:34', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '申通快递', '78657308957007', 4, '2023-02-14 17:17:27', '2023-02-15 17:14:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (108, 6, 3202795730989743130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 23.13, 23.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-15 15:33:52', NULL, '2023-02-15 15:34:00', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433067053019083', 4, '2023-02-15 17:22:05', '2023-02-15 17:35:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (109, 6, 3203383969440472843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 23.13, 23.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-15 23:16:19', NULL, '2023-02-15 23:16:29', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433069082682593', 4, '2023-02-16 18:04:18', '2023-02-16 18:11:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (110, 6, 3207092509128923220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 84.90, 84.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-17 21:32:52', NULL, '2023-02-17 21:32:56', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '中通快递', '78658550530176', 4, '2023-02-18 16:31:49', '2023-02-21 19:46:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (111, 6, 3212109471054044857, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 84.90, 84.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-20 08:08:45', NULL, '2023-02-20 08:08:47', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433079039535713', 4, '2023-02-21 19:45:23', '2023-02-21 19:46:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (112, 6, 3214812817200681765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 82.21, 82.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-21 19:31:08', NULL, '2023-02-21 19:31:21', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433079025482626', 4, '2023-02-21 20:03:58', '2023-02-21 20:47:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (113, 6, 3217043487978326218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 84.90, 84.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-22 17:46:00', NULL, '2023-02-22 17:46:07', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433080943458113', 4, '2023-02-22 18:10:19', '2023-02-22 19:18:26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (114, 6, 3236924701745643410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 44.90, 44.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-04 20:06:23', NULL, '2023-03-04 20:06:39', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433100961138996', 4, '2023-03-05 14:38:03', '2023-03-05 16:19:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (115, 6, 3237115646950643410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 44.90, 44.90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-04 20:07:06', NULL, '2023-03-04 20:07:09', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433100961138996', 4, '2023-03-05 14:38:03', '2023-03-05 16:19:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_order` VALUES (116, 6, 3238963057148759844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 0.00, 0.00, 82.21, 82.21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-05 12:48:00', NULL, '2023-03-05 12:50:20', NULL, NULL, '', '', '', NULL, NULL, NULL, NULL, '等待买家确认收货', '', '韵达速递', '433101363722890', 4, '2023-03-05 14:38:03', '2023-03-05 21:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tao_order_item`;
CREATE TABLE `tao_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tid` bigint NOT NULL COMMENT '订单id',
  `oid` bigint NOT NULL COMMENT '子订单编号',
  `total_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.',
  `divide_order_fee` float NULL DEFAULT NULL COMMENT '分摊之后的实付金额',
  `part_mjz_discount` float NULL DEFAULT NULL COMMENT '优惠分摊',
  `payment` float NULL DEFAULT NULL COMMENT '子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `pic_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '商品数字ID',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID',
  `outer_iid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。',
  `outer_sku_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
  `sku_properties_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'SKU的值。如：机身颜色:黑色;手机套餐:官方标配',
  `item_meal_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `snapshot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单快照URL',
  `timeout_action_time` datetime NULL DEFAULT NULL COMMENT '订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss',
  `item_memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品备注',
  `buyer_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家类型，可选值为：B（商城商家），C（普通卖家）',
  `cid` bigint NULL DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `is_oversold` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	是否超卖',
  `end_time` datetime NULL DEFAULT NULL COMMENT '子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断',
  `order_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)',
  `is_service_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是服务订单，是返回true，否返回false。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）',
  `logistics_company` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单发货的快递公司名称',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单所在包裹的运单号',
  `bind_oid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货',
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:\r\nTRADE_NO_CREATE_PAY(没有创建支付宝交易)\r\nWAIT_BUYER_PAY(等待买家付款)\r\nWAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)\r\nWAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)\r\nTRADE_BUYER_SIGNED(买家已签收,货到付款专用)\r\nTRADE_FINISHED(交易成功)\r\nTRADE_CLOSED(付款以后用户退款成功，交易自动关闭)\r\nTRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)\r\nPAY_PENDING(国际信用卡支付付款确认中)',
  `refund_status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'NO_REFUND' COMMENT '退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近退款ID',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order_item
-- ----------------------------
INSERT INTO `tao_order_item` VALUES (3, 2788451498824204701, 2788451498824204701, 34.40, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 34.40, 0, 0, '272021008026', '2720210080260005', '白色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '174018204093200147', NULL);
INSERT INTO `tao_order_item` VALUES (4, 2788451498824204701, 2788451498824204701, 34.40, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 34.40, 0, 0, '272021008026', '2720210080260205', '深蓝色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '174008953672200147', NULL);
INSERT INTO `tao_order_item` VALUES (5, 1631273557325601885, 1631273557325601885, 28.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 28.90, 0, 0, '272021008026', '2720210080260105', '黑色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '0', NULL);
INSERT INTO `tao_order_item` VALUES (6, 2791618416440640000, 2791618416440640000, 28.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 28.90, 0, 0, '272021008026', '2720210080260202', '深蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '174760311645640000', NULL);
INSERT INTO `tao_order_item` VALUES (7, 2791875816618556115, 2791875816618556115, 28.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 28.90, 0, 0, '272021008026', '2720210080260302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '0', NULL);
INSERT INTO `tao_order_item` VALUES (8, 2794387284993651835, 2794387284993651835, 28.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 28.90, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (9, 2794909754785461846, 2794909754785461846, 43.90, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 43.90, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (10, 2798109939719431759, 2798109939719431759, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260301', '浅蓝色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '174530628624435917', NULL);
INSERT INTO `tao_order_item` VALUES (11, 2797896566867104830, 2797896566867104830, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (12, 2799354781289326116, 2799354781289326116, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', 39.52, 0, 0, '2720220858', '27202208580201', '黑灰色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (13, 2800981981958381045, 2800981981958381045, 35.92, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 35.92, 0, 0, '2720220858', '27202208580105', '黑色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (14, 1635222253871665598, 1635222253871665598, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260303', '浅蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '105324169380669855', NULL);
INSERT INTO `tao_order_item` VALUES (15, 2801304685533500951, 2801304685533500951, 29.94, NULL, NULL, NULL, NULL, NULL, '270牛仔短裤', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 29.94, 0, 0, '2720220207', '27202202070101', '黑色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (16, 2801304685533500951, 2801304685533500951, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', 39.52, 0, 0, '2720220858', '27202208580302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (17, 2802425367037543128, 2802425367037543128, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580104', '黑色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (18, 2800972080243121364, 2800972080243121364, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175552813527126413', NULL);
INSERT INTO `tao_order_item` VALUES (19, 1634650644223535380, 1634650644223535380, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580104', '黑色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (20, 2803069443945496644, 2803069443945496644, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', 39.52, 0, 0, '2720220858', '27202208580204', '黑灰色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175092482372494466', NULL);
INSERT INTO `tao_order_item` VALUES (21, 2802458485756587847, 2802458485756587847, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (22, 2803541439021384333, 2803541439021384333, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260203', '深蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (23, 2803379438025412245, 2803379438025412245, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (24, 2803060765578343137, 2803060765578343137, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (25, 1635963673656309898, 1635963673656309898, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', 39.52, 0, 0, '2720220858', '27202208580302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (26, 2803676041615853522, 2803676041615853522, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260102', '黑色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (27, 2803823065336497560, 2803823065336497560, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260205', '深蓝色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175461194594496075', NULL);
INSERT INTO `tao_order_item` VALUES (28, 2804237174661134517, 2804237174661134517, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175059146148131745', NULL);
INSERT INTO `tao_order_item` VALUES (29, 2806463700630730938, 2806463700630730938, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260003', '白色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (30, 2807896683249463307, 2807896683249463307, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260003', '白色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (31, 2807235686784026944, 2807235686784026944, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (32, 2810277795520609508, 2810277795520609508, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260304', '浅蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (33, 2810157841775119046, 2810157841775119046, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260204', '深蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (34, 2809380888296826747, 2809380888296826747, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260204', '深蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '105655441623824767', NULL);
INSERT INTO `tao_order_item` VALUES (35, 1638101679063535380, 1638101679063535380, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', 39.52, 0, 0, '2720220858', '27202208580303', '浅蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (36, 2811933036666454704, 2811933036666454704, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260203', '深蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (37, 1638388920088435398, 1638388920088435398, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260003', '白色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (38, 1639678765959282960, 1639678765959282960, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260303', '浅蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175555874222286029', NULL);
INSERT INTO `tao_order_item` VALUES (39, 1639000560200588828, 1639000560200588828, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260104', '黑色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (40, 1640039089142149277, 1640039089142149277, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260205', '深蓝色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (41, 1640069402434910729, 1640069402434910729, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260002', '白色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (42, 2814908799866290421, 2814908799866290421, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (43, 2806128469605311766, 2806128469605311766, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '174964968310316617', NULL);
INSERT INTO `tao_order_item` VALUES (44, 2814967981966512411, 2814967981966512411, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580101', '黑色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (45, 2815872879709626454, 2815872879709626454, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260005', '白色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175673665740625464', NULL);
INSERT INTO `tao_order_item` VALUES (46, 2816024978330891142, 2816024978330891142, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260304', '浅蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (47, 1641540792944799598, 1641540792944799598, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260205', '深蓝色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (48, 2817362126131487212, 2817362126131487212, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580101', '黑色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (49, 1642459225787395472, 1642459225787395472, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260304', '浅蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (50, 1642473483353670599, 1642473483353670599, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260105', '黑色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (51, 2821439630766120201, 2821439630766120201, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260304', '浅蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '175970162913120102', NULL);
INSERT INTO `tao_order_item` VALUES (52, 2821066273607033246, 2821066273607033246, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260302', '浅蓝色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (53, 2821131792906086156, 2821131792906086156, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260003', '白色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (54, 1645143458981500079, 1645143458981500079, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260305', '浅蓝色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (55, 1645147956136238382, 1645147956136238382, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (56, 2824177932760871937, 2824177932760871937, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', 39.52, 0, 0, '2720220858', '27202208580301', '浅蓝色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (57, 2824824564086115520, 2824824564086115520, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260203', '深蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (58, 1646522582072053096, 1646522582072053096, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260105', '黑色,2XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (59, 2825385264263717249, 2825385264263717249, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260301', '浅蓝色,S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (60, 2826557209416120201, 2826557209416120201, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260203', '深蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (61, 1646030496778058766, 1646030496778058766, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (62, 2826089316520532138, 2826089316520532138, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260104', '黑色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (63, 2826089316520532138, 2826089316520532138, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (64, 2828255115947158925, 2828255115947158925, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', 39.52, 0, 0, '2720220858', '27202208580202', '黑灰色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (65, 1647209246565575386, 1647209246565575386, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260303', '浅蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (66, 2827254996108810615, 2827254996108810615, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (67, 1647477879589747479, 1647477879589747479, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260002', '白色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (68, 2830086181549556227, 2830086181549556227, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260002', '白色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (69, 2833459166397538046, 2833459166397538046, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260304', '浅蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (70, 1649326118935313381, 1649326118935313381, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260002', '白色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (71, 2833487605081053215, 2833487605081053215, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260303', '浅蓝色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (72, 2834586612989989214, 2834586612989989214, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (73, 2836651827420622606, 2836651827420622606, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (74, 2835997560685460338, 2835997560685460338, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260204', '深蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (75, 2839011483867148800, 2839011483867148800, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260103', '黑色,L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '177098796584140088', NULL);
INSERT INTO `tao_order_item` VALUES (76, 2838936061398720816, 2838936061398720816, 47.92, NULL, NULL, NULL, NULL, NULL, 'HN0015裤脚开叉牛仔裤', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 47.92, 0, 0, 'HN20220015', 'HN202200150229', '复古蓝,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (77, 2840584645454757805, 2840584645454757805, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260204', '深蓝色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '177634911027750578', NULL);
INSERT INTO `tao_order_item` VALUES (78, 1653154394408665996, 1653154394408665996, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580104', '黑色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '106476564604669659', NULL);
INSERT INTO `tao_order_item` VALUES (79, 1654118401554519282, 1654118401554519282, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 29.92, 0, 0, '272021008026', '2720210080260004', '白色,XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (80, 2855773766822325815, 2855773766822325815, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 39.52, 0, 0, '2720220858', '27202208580102', '黑色,M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (81, 2863795574656667447, 2863795574656667447, 47.92, NULL, NULL, NULL, NULL, NULL, 'HN0015裤脚开叉牛仔裤', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 59.90, NULL, NULL, 'HN20220015', NULL, '颜色分类：复古蓝;尺寸：M[91-100斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (82, 2873372763545381646, 2873372763545381646, 55.92, NULL, NULL, NULL, NULL, NULL, 'HN0630松紧腰九分老爹哈伦裤', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 69.90, NULL, NULL, 'HN0630', NULL, '颜色分类：浅蓝色;尺寸：S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (83, 1664188610043377195, 1664188610043377195, 19.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 39.90, NULL, NULL, '2720218026', '2720218026', '颜色分类：深蓝色;尺寸：L[101-110]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (84, 2872120393981932527, 2872120393981932527, 24.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：黑灰色;尺寸：M[91-100斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '179419141878932725', NULL);
INSERT INTO `tao_order_item` VALUES (85, 2871656887230113338, 2871656887230113338, 27.90, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：黑灰色;尺寸：L[101-110斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (86, 2871618367375154549, 2871618367375154549, 27.90, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：浅蓝色;尺寸：L[101-110斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (87, 1664990796806753993, 1664990796806753993, 24.90, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'http://img.huayikeji.com/geq3vm4dcvntd6vnzclxhbh481v1jx5p', 39.90, NULL, NULL, '2720218026', NULL, '颜色分类：浅蓝色;尺寸：2XL[121-125斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (88, 1666956540494199587, 1666956540494199587, 34.90, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：黑灰色;尺寸：S[90斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (89, 2882180559719256611, 2882180559719256611, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：黑色;尺寸：L[101-110斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '179683094483251166', NULL);
INSERT INTO `tao_order_item` VALUES (90, 1668790597296915884, 1668790597296915884, 51.91, NULL, NULL, NULL, NULL, NULL, 'HN023小直筒牛仔裤', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 59.90, NULL, NULL, 'HN023', NULL, '颜色分类：复古蓝;尺寸：27', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (91, 2894222592323299060, 2894222592323299060, 53.91, NULL, NULL, NULL, NULL, NULL, 'HN0014前开叉微喇叭牛仔裤', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 59.90, NULL, NULL, 'HN0014', NULL, '颜色分类：浅蓝色;尺寸：M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (92, 2900221419737927908, 2900221419737927908, 29.92, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'http://img.huayikeji.com/geq3vm4dcvntd6vnzclxhbh481v1jx5p', 39.90, NULL, NULL, '2720218026', NULL, '颜色分类：黑色;尺寸：L[101-110]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (93, 2899913437459231759, 2899913437459231759, 39.52, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, NULL, '2720220858', NULL, '颜色分类：黑色;尺寸：XL[111-120斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (94, 1681236338785922394, 1681236338786922394, 43.49, NULL, NULL, NULL, NULL, NULL, 'HN621高腰直筒宽松破洞牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 59.90, NULL, NULL, 'HN621', NULL, '颜色分类：黑灰色;尺寸：L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (95, 1683558230877541495, 1683558230878541495, 49.63, NULL, NULL, NULL, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 59.90, NULL, 578, 'HN022', 'HN0222927', '颜色分类：蓝灰色;尺寸：27', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '108941522538549514', NULL);
INSERT INTO `tao_order_item` VALUES (96, 2923690718502279654, 2923690718502279654, 54.90, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', 54.90, NULL, 55, '2720220858', '27202208580303', '颜色分类：浅蓝色;尺寸：L[101-110斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (97, 2927935514314953754, 2927935514314953754, 53.61, NULL, NULL, NULL, NULL, NULL, 'HN023小直筒牛仔裤', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 59.90, NULL, 395, 'HN023', 'HN0230128', '颜色分类：黑色;尺寸：28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (98, 2934328755836161104, 2934328755837161104, 97.10, NULL, NULL, NULL, NULL, NULL, 'HN0020九分铅笔小脚裤子', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 59.90, NULL, 286, 'HN20220020', 'HN202200200327', '颜色分类：浅蓝色;尺寸：27', NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (99, 2934328755836161104, 2934328755838161104, 35.93, NULL, NULL, NULL, NULL, NULL, 'HN660高腰直筒牛仔裤女腰围可调春秋季', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 59.90, NULL, 649, 'HN660', 'HN6604002', '颜色分类：复古蓝;尺寸：M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (100, 1707397970934272173, 1707397970934272173, 52.30, NULL, NULL, NULL, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 59.90, NULL, 571, 'HN022', 'HN0220127', '颜色分类：黑色;尺寸：27', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (101, 1719046705687156592, 1719046705687156592, 67.15, NULL, NULL, NULL, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 89.90, NULL, 738, 'JKL805', 'JKL80512003', '颜色分类：深蓝色加长款;尺寸：L', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (102, 2989950941864043634, 2989950941864043634, 63.90, NULL, NULL, NULL, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 89.90, NULL, 737, 'JKL805', 'JKL80512002', '颜色分类：深蓝色加长款;尺寸：M', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (103, 2996431995920305209, 2996431995920305209, 53.91, NULL, NULL, NULL, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 59.90, NULL, 570, 'HN022', 'HN0220126', '颜色分类：黑色;尺寸：26', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '188634457153300952', NULL);
INSERT INTO `tao_order_item` VALUES (104, 3007753525735252502, 3007753525735252502, 29.01, NULL, NULL, NULL, NULL, NULL, '858牛仔短裤', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', 54.90, NULL, 46, '2720220858', '27202208580104', '颜色分类：黑色;尺寸：XL[111-120斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (105, 1727577552380645780, 1727577552380645780, 69.22, NULL, NULL, NULL, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 89.90, NULL, 739, 'JKL805', 'JKL80512004', '颜色分类：深蓝色加长款;尺寸：XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '112173313472648057', NULL);
INSERT INTO `tao_order_item` VALUES (106, 1732019991903645780, 1732019991903645780, 69.22, NULL, NULL, NULL, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 89.90, NULL, 733, 'JKL805', 'JKL8051204', '颜色分类：深蓝色[九分款];尺寸：XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (107, 3020629500584706539, 3020629500584706539, 56.85, NULL, NULL, NULL, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 89.90, NULL, 730, 'JKL805', 'JKL8051201', '颜色分类：深蓝色[九分款];尺寸：S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '190685196805703965', NULL);
INSERT INTO `tao_order_item` VALUES (108, 1747680279246507087, 1747680279246507087, 52.30, NULL, NULL, NULL, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 59.90, NULL, 570, 'HN022', 'HN0220126', '颜色分类：黑色;尺寸：26', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '114179089881508770', NULL);
INSERT INTO `tao_order_item` VALUES (109, 3068371695265649519, 3068371695265649519, 58.11, NULL, NULL, NULL, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 59.90, NULL, 577, 'HN022', 'HN0222926', '颜色分类：蓝灰色;尺寸：26', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (110, 3176359130095573624, 3176359130095573624, 87.21, NULL, NULL, NULL, NULL, NULL, 'JKL6010松紧腰哈伦裤', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 89.90, NULL, 985, 'JKL6010', 'JKL60107530', '颜色分类：黑灰色;尺寸：30', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (111, 3199194974134669907, 3199194974134669907, 23.13, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 39.90, NULL, 36, '2720218026', '2720210080260204', '颜色分类：深蓝色;尺寸：XL[111-120斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (112, 3198002834286896419, 3198002834286896419, 24.00, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 39.90, NULL, 42, '2720218026', '2720210080260305', '颜色分类：浅蓝色;尺寸：2XL[121-125斤]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'REFUNDING', '205639742516891964', NULL);
INSERT INTO `tao_order_item` VALUES (113, 3200980287903658205, 3200980287903658205, 84.90, NULL, NULL, NULL, NULL, NULL, 'JKL3112松紧腰束脚哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 129.00, NULL, 1318, 'JKL3112', 'JKL31121201', '颜色分类：深蓝色;尺寸：S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (114, 3202795730989743130, 3202795730989743130, 23.13, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 39.90, NULL, 35, '2720218026', '2720210080260203', '颜色分类：深蓝色;尺寸：L[101-110]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (115, 3203383969440472843, 3203383969440472843, 21.56, NULL, NULL, NULL, NULL, NULL, '8026牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 39.90, NULL, 35, '2720218026', '2720210080260203', '颜色分类：深蓝色;尺寸：L[101-110]', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (116, 3207092509128923220, 3207092509128923220, 84.90, NULL, NULL, NULL, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 129.00, NULL, 1337, 'KH9734', 'KH97345028', '颜色分类：浅蓝色;尺寸：28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (117, 3212109471054044857, 3212109471054044857, 84.90, NULL, NULL, NULL, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 129.00, NULL, 1335, 'KH9734', 'KH97345026', '颜色分类：浅蓝色;尺寸：26', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (118, 3214812817200681765, 3214812817200681765, 82.21, NULL, NULL, NULL, NULL, NULL, 'KH9826小脚牛仔裤女', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 129.90, NULL, 1351, 'KH9826', 'KH98260128', '颜色分类：黑色;尺寸：28', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (119, 3217043487978326218, 3217043487978326218, 84.90, NULL, NULL, NULL, NULL, NULL, 'JKL3112松紧腰束脚哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 129.00, NULL, 1321, 'JKL3112', 'JKL31121204', '颜色分类：深蓝色;尺寸：XL', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (120, 3238963057148759844, 3238963057148759844, 82.21, NULL, NULL, NULL, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 129.00, NULL, 1336, 'KH9734', 'KH97345027', '颜色分类：浅蓝色;尺寸：27', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (121, 3237115646950643410, 3237115646950643410, 44.90, NULL, NULL, NULL, NULL, NULL, 'HN858牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 79.00, NULL, 53, 'HN858', '27202208580301', '颜色分类：浅蓝色;尺寸：S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (122, 3236924701745643410, 3236924701745643410, 44.90, NULL, NULL, NULL, NULL, NULL, 'HN858牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 79.00, NULL, 43, 'HN858', '27202208580101', '颜色分类：黑色;尺寸：S', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (123, 123323243, 123323243, 21.00, 0.00, 0.00, NULL, NULL, NULL, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 21.00, NULL, NULL, 'HNP182', 'HNP1821505', '白色 2XL ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '', NULL, '');
INSERT INTO `tao_order_item` VALUES (124, 32, 32, 21.00, 0.00, 0.00, NULL, NULL, NULL, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 21.00, NULL, NULL, 'HNP182', 'HNP1825001', '浅蓝色 S ', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2', '', NULL, '');

-- ----------------------------
-- Table structure for tao_refund
-- ----------------------------
DROP TABLE IF EXISTS `tao_refund`;
CREATE TABLE `tao_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款id',
  `dispute_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `tid` bigint NULL DEFAULT NULL COMMENT '淘宝交易单号（订单号）',
  `oid` bigint NULL DEFAULT NULL COMMENT '子订单号。如果是单笔交易oid会等于tid',
  `payment` float NULL DEFAULT NULL COMMENT '支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `price` float NULL DEFAULT NULL COMMENT '商品价格。',
  `total_fee` float NULL DEFAULT NULL COMMENT '交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` float NULL DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `split_seller_fee` float NULL DEFAULT NULL COMMENT '	分账给卖家的钱',
  `split_taobao_fee` float NULL DEFAULT NULL COMMENT '分账给淘宝的钱',
  `created` datetime NULL DEFAULT NULL COMMENT '退款申请时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '更新时间。格式:yyyy-MM-dd HH:mm:ss',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `cs_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自\"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81\"',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家收货地址',
  `advance_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;',
  `alipay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `good_return_time` datetime NULL DEFAULT NULL COMMENT '退货时间。格式:yyyy-MM-dd HH:mm:ss',
  `good_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:true(是),false(否)',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '申请退款的商品数字编号',
  `num` bigint NOT NULL DEFAULT 0 COMMENT '退货数量',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部商家编码',
  `reason` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `refund_phase` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款阶段，可选值：onsale/aftersale',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).',
  `desc` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款说明',
  `company_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `sid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退货运单号',
  `send_time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家发货时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '	完结时间。格式:yyyy-MM-dd HH:mm:ss',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sku` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品SKU信息',
  `buyer_open_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家openUid',
  `buyer_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家昵称',
  `combine_item_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合品信息\r\nnum_iid	String	2342344	商品数字编号\r\nitem_name	String	测试商品	商品标题\r\nquantity	Number	123	数量\r\nsku_id	String	123	sku_id\r\nouter_iid	String	123	商家外部编码(可与商家外部系统对接)\r\nouter_sku_id	String	123	123',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_refund
-- ----------------------------

-- ----------------------------
-- Table structure for tao_shop
-- ----------------------------
DROP TABLE IF EXISTS `tao_shop`;
CREATE TABLE `tao_shop`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `type` int NOT NULL COMMENT '对应第三方平台Id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺url',
  `sort` int NOT NULL DEFAULT 9 COMMENT '排序',
  `status` int NULL DEFAULT 0 COMMENT '状态（1正常2已删除）',
  `modify_on` bigint NOT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `seller_id` bigint NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id，淘宝天猫开放平台使用',
  `app_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appkey',
  `app_sercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appsercet',
  `access_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `expires_in` bigint NULL DEFAULT NULL COMMENT '到期',
  `access_token_begin` bigint NULL DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint NULL DEFAULT NULL COMMENT '刷新token过期时间',
  `api_request_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据中心-店铺' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_shop
-- ----------------------------
INSERT INTO `tao_shop` VALUES (1, '天猫旗舰店', 1, '', 98, 1, 0, '', 2200787809358, '31014100', '7b0769269b0c0ca88949791c14eb3a5c', '610140071d1070a37cecea89f1c1f3d6e5d19bf4b58dd942200787809358', NULL, NULL, NULL, NULL, 'http://gw.api.taobao.com/router/rest');
INSERT INTO `tao_shop` VALUES (2, '京东旗舰店', 2, NULL, 9, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_shop` VALUES (3, '抖音旗舰店', 3, 'http://openapi.jinritemai.com', 87, 1, 1653672695, NULL, 4463798, '7249607407477720636', '36a12497-fb9d-4b54-8cd1-fd1617346687', '', NULL, NULL, NULL, NULL, '2');
INSERT INTO `tao_shop` VALUES (5, '拼多多旗舰店', 4, NULL, 99, 1, 1680698886, 'pdd10006159121', 100061591, NULL, NULL, '87f8044d2a5f45a489aa3a952785b0d35e61788a', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
