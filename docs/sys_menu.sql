/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : qihang-erp

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 19/05/2024 18:46:07
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
  `system_id` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统id（oms用在oms系统）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2086 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 'oms', 0, 99, '/system', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '商品管理', '', 0, 9, 'goods', '', '', 1, 0, 'M', '0', '0', '', 'theme', 'admin', '2023-12-29 13:29:44', '', '', '');
INSERT INTO `sys_menu` VALUES (4, '采购管理', NULL, 0, 1, 'purchase', '', '', 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-24 17:06:13', '至简官网地址');
INSERT INTO `sys_menu` VALUES (5, '销售管理', 'oms', 0, 2, '/sale', '', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-29 16:53:03', 'admin', '2024-05-11 09:16:33', '');
INSERT INTO `sys_menu` VALUES (6, '发货管理', 'oms', 0, 3, '/ship', '', '', 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-01-01 14:08:04', 'admin', '2024-01-03 14:07:29', '');
INSERT INTO `sys_menu` VALUES (7, '售后管理', 'oms', 0, 4, '/saleafter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2024-01-03 14:23:55', 'admin', '2024-01-12 19:47:33', '');
INSERT INTO `sys_menu` VALUES (8, '店铺管理', 'oms', 0, 7, '/shop', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2024-04-12 16:46:19', 'admin', '2024-04-24 11:17:09', '');
INSERT INTO `sys_menu` VALUES (9, '库存管理', '', 0, 5, 'wms', '', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-31 12:14:33', 'admin', '2024-04-23 15:43:32', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 'oms', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 'oms', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-27 15:00:27', '', '', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', '', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-27 15:00:27', '', '', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 'oms', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 'oms', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-12 16:44:52', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 'oms', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 'oms', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-27 15:00:27', '', '', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 'oms', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-27 15:00:27', '', '', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 'oms', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-27 15:00:27', '', '', '登录日志菜单');
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
INSERT INTO `sys_menu` VALUES (2029, '店铺退款管理', 'oms', 7, 2, 'shop_refund', 'shop/refund/index', '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-12-31 17:29:03', 'admin', '2024-05-04 18:57:32', '');
INSERT INTO `sys_menu` VALUES (2030, '手动创建订单', 'oms', 5, 1, 'order/create', 'sale/order/create', '', 1, 0, 'C', '1', '0', '', 'documentation', 'admin', '2023-12-31 20:01:22', 'admin', '2024-03-24 19:32:32', '');
INSERT INTO `sys_menu` VALUES (2032, '订单拉取日志', 'oms', 5, 3, 'order/pull_log', 'shop/order_pull_log', '', 1, 0, 'C', '0', '1', '', 'upload', 'admin', '2023-12-31 20:04:12', 'admin', '2024-05-04 18:56:46', '');
INSERT INTO `sys_menu` VALUES (2033, '订单管理', 'oms', 5, 1, 'order_list', 'sale/order/index', '', 1, 0, 'C', '0', '0', '', 'list', 'admin', '2023-12-31 20:05:05', 'admin', '2024-05-05 18:07:27', '');
INSERT INTO `sys_menu` VALUES (2036, '店铺订单管理', 'oms', 5, 2, 'shop_order', 'shop/order_index', '', 1, 0, 'C', '0', '0', '', 'excel', 'admin', '2024-01-01 14:14:42', 'admin', '2024-05-04 18:55:37', '');
INSERT INTO `sys_menu` VALUES (2046, '出库管理', NULL, 9, 5, 'stockOut', 'wms/stockOutEntry', NULL, 1, 0, 'C', '0', '0', '', 'link', 'admin', '2024-01-03 11:00:53', 'admin', '2024-01-12 15:52:19', '');
INSERT INTO `sys_menu` VALUES (2047, '库存查询', NULL, 9, 6, 'goodsInventory', 'goods/goodsInventory', NULL, 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2024-01-03 11:01:14', 'admin', '2024-01-09 17:55:33', '');
INSERT INTO `sys_menu` VALUES (2048, '库存盘点', NULL, 9, 9, 'pan', NULL, NULL, 1, 0, 'C', '0', '1', '', 'bug', 'admin', '2024-01-03 11:01:43', 'admin', '2024-01-09 19:57:08', '');
INSERT INTO `sys_menu` VALUES (2049, '打包发货', 'oms', 6, 3, 'ship_order', 'shipping/shipOrder/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-01-03 14:09:18', 'admin', '2024-05-02 10:47:38', '');
INSERT INTO `sys_menu` VALUES (2051, '物流跟踪', 'oms', 6, 4, 'ship_logistics', 'shipping/shipOrder/logistics', NULL, 1, 0, 'C', '0', '0', '', 'email', 'admin', '2024-01-03 14:13:12', 'admin', '2024-05-02 10:50:34', '');
INSERT INTO `sys_menu` VALUES (2052, '物流公司管理', 'oms', 6, 9, 'logistics_company', 'shipping/logistics/company', NULL, 1, 0, 'C', '0', '0', '', 'checkbox', 'admin', '2024-01-03 14:14:09', 'admin', '2024-04-24 13:53:14', '');
INSERT INTO `sys_menu` VALUES (2054, '退款管理', 'oms', 7, 1, 'refund_list', 'sale/refund', NULL, 1, 0, 'C', '0', '0', '', 'size', 'admin', '2024-01-03 14:24:36', 'admin', '2024-05-05 20:14:23', '');
INSERT INTO `sys_menu` VALUES (2059, '备货清单', 'oms', 6, 1, 'stocking', 'shipping/stocking', '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-01-09 11:51:52', 'admin', '2024-05-01 21:34:33', '');
INSERT INTO `sys_menu` VALUES (2060, '拣货出库', '', 6, 2, 'stockout', 'shipping/stockOut', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-01-09 13:39:00', 'admin', '2024-04-26 13:51:21', '');
INSERT INTO `sys_menu` VALUES (2061, '库位管理', NULL, 9, 99, 'stock_location', 'wms/location', NULL, 1, 0, 'C', '0', '0', '', 'education', 'admin', '2024-01-09 13:54:30', 'admin', '2024-01-09 14:50:33', '');
INSERT INTO `sys_menu` VALUES (2063, '发货费用', '', 6, 5, 'ship_fee', 'shipping/shipFee', NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2024-01-12 18:35:31', 'admin', '2024-05-02 10:50:58', '');
INSERT INTO `sys_menu` VALUES (2066, '添加商品', NULL, 2, 2, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'component', 'admin', '2024-01-14 19:42:11', 'admin', '2024-04-14 18:50:36', '');
INSERT INTO `sys_menu` VALUES (2067, '商品SKU管理', NULL, 2, 3, 'spec_list', 'goods/spec', NULL, 1, 0, 'C', '0', '0', '', 'theme', 'admin', '2024-01-16 14:17:39', 'admin', '2024-04-14 18:51:13', '');
INSERT INTO `sys_menu` VALUES (2079, '平台设置', 'oms', 8, 20, 'platform', 'shop/platform', NULL, 1, 0, 'C', '0', '0', NULL, 'date-range', 'admin', '2024-04-12 16:58:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '售后处理查询', 'oms', 7, 3, 'result_list', 'afterSale/index', NULL, 1, 0, 'C', '0', '0', '', 'time', 'admin', '2024-04-15 14:23:40', 'admin', '2024-05-05 20:27:37', '');
INSERT INTO `sys_menu` VALUES (2084, '店铺商品管理', 'oms', 8, 1, 'goods_list', 'shop/goods/', NULL, 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2024-04-15 14:52:16', 'admin', '2024-04-15 14:52:27', '');
INSERT INTO `sys_menu` VALUES (2085, '采购账单管理', NULL, 4, 4, 'bill', 'scm/purchase/bill', NULL, 1, 0, 'C', '0', '0', '', 'money', 'admin', '2024-04-24 17:03:07', 'admin', '2024-05-02 10:59:08', '');

SET FOREIGN_KEY_CHECKS = 1;
