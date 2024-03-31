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

 Date: 31/03/2024 20:26:51
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
) ENGINE = InnoDB AUTO_INCREMENT = 2079 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '订单管理', 0, 1, '/order', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-17 15:03:46', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '售后管理', 0, 2, '/jd', 'Layout', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-17 15:00:03', '至简官网地址');
INSERT INTO `sys_menu` VALUES (3, '店铺设置', 0, 9, '/dou', 'Layout', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-29 13:29:44', '', '', '');
INSERT INTO `sys_menu` VALUES (4, '商品管理', 0, 5, '/goods', 'Layout', '', 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-12-29 16:53:03', 'admin', '2024-03-31 20:23:51', '');
INSERT INTO `sys_menu` VALUES (5, '系统设置', 0, 99, '/system', 'Layout', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (100, '订单查询', 1, 1, 'order_list', 'order/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-17 15:03:59', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '订单更新日志', 1, 4, 'tao/goods/list', 'system/role/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-29 09:30:42', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '店铺订单管理', 1, 2, 'tao/refund/list', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-29 09:30:09', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (104, '退款查询', 2, 1, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-29 09:31:24', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '退款更新日志', 2, 6, 'jd/goods/list', 'system/dict/index', '', 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '店铺退款管理', 2, 2, 'jd/refund/list', 'system/config/index', '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-29 09:31:17', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (108, '店铺管理', 3, 9, 'dou/order/list', 'scm/supplier/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 09:14:02', 'admin', '2023-12-29 09:17:27.514466', '');
INSERT INTO `sys_menu` VALUES (109, '店铺商品管理', 4, 10, 'dou/goods/list', 'goods/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 13:31:01', 'admin', '2024-03-29 09:31:44', '');
INSERT INTO `sys_menu` VALUES (110, '开放平台设置', 3, 88, 'dou/refund/list', 'goods/category/index', '', 1, 0, 'C', '0', '0', '', 'peoples', 'admin', '2023-12-29 13:32:41', 'admin', '2023-12-29 15:02:22.220534', '');
INSERT INTO `sys_menu` VALUES (112, 'ERP商品管理', 4, 1, 'list', 'goods/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2024-03-18 07:45:13', '');
INSERT INTO `sys_menu` VALUES (116, '用户管理', 5, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (117, '菜单管理', 5, 1, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', '', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (2078, '添加ERP商品', 4, 9, 'goods_add', 'goods/create', NULL, 1, 0, 'C', '0', '0', NULL, 'checkbox', 'admin', '2024-03-18 07:59:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '字典管理', 5, 9, 'dict', 'system/dict/index', NULL, 1, 0, 'C', '0', '0', '', 'dict', 'admin', '2024-03-18 08:43:55', 'admin', '2024-03-18 08:44:08', '');
INSERT INTO `sys_menu` VALUES (2080, '发货管理', 0, 3, 'shipping', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'guide', 'admin', '2024-03-31 20:24:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '发货管理', 2080, 1, 'ship', NULL, NULL, 1, 0, 'C', '0', '0', NULL, 'button', 'admin', '2024-03-31 20:24:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '快递公司库', 2080, 2, 'logistics_company', NULL, NULL, 1, 0, 'C', '0', '0', NULL, 'cascader', 'admin', '2024-03-31 20:25:47', '', NULL, '');

SET FOREIGN_KEY_CHECKS = 1;
