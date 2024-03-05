/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : qihang-oms

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 05/03/2024 15:59:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jd_goods
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods`;
CREATE TABLE `jd_goods`  (
  `id` bigint(0) NOT NULL,
  `ware_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `ware_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	商品外部ID,商家自行设置的ID（便于关联京东商品）',
  `item_num` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品货号',
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品的条形码.UPC码,SN码,PLU码统称为条形码',
  `
modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品最后一次修改时间',
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品创建时间，只读属性',
  `offline_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后下架时间',
  `online_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最后上架时间',
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货地',
  `
pack_listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包装清单',
  `wrap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包装规格',
  `weight` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `length` double DEFAULT NULL,
  `mobile_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `after_sales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `market_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cost_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jd_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock_num` int(0) DEFAULT NULL,
  `jd_shop_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sell_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_sale_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `spu_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `jd_goods_sku`;
CREATE TABLE `jd_goods_sku`  (
  `id` bigint(0) NOT NULL,
  `goods_id` bigint(0) DEFAULT NULL COMMENT '外键（jd_goods表id）',
  `ware_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jd_price` decimal(10, 2) DEFAULT NULL,
  `outer_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock_num` int(0) DEFAULT NULL,
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_spu_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jd_order
-- ----------------------------
DROP TABLE IF EXISTS `jd_order`;
CREATE TABLE `jd_order`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单id',
  `vender_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家id',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）',
  `
order_total_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）',
  `order_seller_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单货款金额（订单总金额-商家优惠金额）',
  `order_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。',
  `freight_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品的运费',
  `seller_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家优惠金额',
  `order_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为\'等待境内发货\'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码',
  `order_state_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单状态说明（中文）',
  `delivery_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）',
  `invoice_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）',
  `invoice_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '普通发票纳税人识别码',
  `order_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家下单时订单备注',
  `
order_start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单时间',
  `order_end_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `
telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `
full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city_id` int(0) DEFAULT NULL,
  `county_id` int(0) DEFAULT NULL,
  `town_id` int(0) DEFAULT NULL,
  `vender_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `balance_used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息',
  `return_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回',
  `payment_confirm_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回',
  `waybill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `logistics_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回',
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单更新时间',
  `direct_parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `order_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单来源。如：移动端订单',
  `store_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '京仓订单/云仓订单/空“”',
  `id_sop_shipmenttype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否京配。68=京配，69=京配自提',
  `real_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `
open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息 ',
  `open_id_buyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段',
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `jd_order_item`;
CREATE TABLE `jd_order_item`  (
  `id` bigint(0) NOT NULL,
  `order_id` bigint(0) NOT NULL COMMENT '外键id（jd_order表id）',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '京东内部SKU的ID',
  `outer_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU外部ID（极端情况下不保证返回，建议从商品接口获取',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品的名称+SKU规格',
  `jd_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'SKU的京东价',
  `gift_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '赠送积分',
  `ware_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）',
  `item_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数量',
  `product_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `new_store_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jd_refund
-- ----------------------------
DROP TABLE IF EXISTS `jd_refund`;
CREATE TABLE `jd_refund`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款单id',
  `buyer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户帐号',
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `check_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核日期',
  `apply_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '申请时间',
  `apply_refund_sum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款金额',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过',
  `check_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2078 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

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
  `id` int(0) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台名',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台编码',
  `app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `redirect_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台回调uri',
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接口访问地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_platform
-- ----------------------------
INSERT INTO `sys_platform` VALUES (1, '天猫', 'TMALL', '12175777', '368dbbd183a77d551735be13f59bbcda', NULL, NULL);
INSERT INTO `sys_platform` VALUES (2, '京东', 'JD', 'FB4CC3688E6F9065D4FF510A53BB60FF', '40e8c8b2427f4e6db8f4a39af27d719e', 'http://www.qumei.com', 'https://api.jd.com/routerjson');
INSERT INTO `sys_platform` VALUES (3, '抖店', 'DOUDIAN', NULL, NULL, NULL, NULL);
INSERT INTO `sys_platform` VALUES (4, '拼多多', 'PDD', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_shop
-- ----------------------------
DROP TABLE IF EXISTS `sys_shop`;
CREATE TABLE `sys_shop`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `type` int(0) NOT NULL COMMENT '对应第三方平台Id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '店铺url',
  `sort` int(0) NOT NULL DEFAULT 9 COMMENT '排序',
  `status` int(0) DEFAULT 0 COMMENT '状态（1正常2已删除）',
  `modify_on` bigint(0) NOT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `seller_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id，淘宝天猫开放平台使用',
  `app_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Appkey',
  `app_sercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Appsercet',
  `access_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `expires_in` bigint(0) DEFAULT NULL COMMENT '到期',
  `access_token_begin` bigint(0) DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint(0) DEFAULT NULL COMMENT '刷新token过期时间',
  `api_request_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据中心-店铺' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_shop
-- ----------------------------
INSERT INTO `sys_shop` VALUES (1, '天猫旗舰店', 1, '', 98, 1, 0, '', 59972781, '31014100', '7b0769269b0c0ca88949791c14eb3a5c', '6102522199aaa4a42a2e6be95d0a5e18657c1576ec563a0351855490', NULL, NULL, NULL, NULL, 'http://gw.api.taobao.com/router/rest');
INSERT INTO `sys_shop` VALUES (2, '京东旗舰店', 2, NULL, 9, 0, 0, NULL, 0, NULL, NULL, '8abd974c62c34778935b34b5952e6f68izdk', 31535999, NULL, '919b21a3b9d247d08d7701cb8bcc2432ote5', NULL, NULL);
INSERT INTO `sys_shop` VALUES (3, '抖音旗舰店', 3, 'http://openapi.jinritemai.com', 87, 1, 1653672695, NULL, 4463798, '7249607407477720636', '36a12497-fb9d-4b54-8cd1-fd1617346687', '', NULL, NULL, NULL, NULL, '2');
INSERT INTO `sys_shop` VALUES (5, '拼多多旗舰店', 4, NULL, 99, 1, 1680698886, 'pdd10006159121', 100061591, NULL, NULL, '87f8044d2a5f45a489aa3a952785b0d35e61788a', NULL, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '启航oms', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-03-05 14:10:19', 'admin', '2023-08-07 19:31:37', '', '2024-03-05 14:10:18', '管理员');

-- ----------------------------
-- Table structure for tao_goods
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods`;
CREATE TABLE `tao_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `iid` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品id',
  `num_iid` bigint(0) DEFAULT NULL COMMENT '商品数字id',
  `title` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品标题',
  `nick` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '卖家昵称',
  `type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品类型(fixed:一口价;auction:拍卖)注：取消团购',
  `cid` bigint(0) DEFAULT NULL COMMENT '商品所属的叶子类目 id',
  `seller_cids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品所属的店铺内卖家自定义类目列表',
  `pic_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '主图',
  `num` int(0) DEFAULT NULL COMMENT '商品数量',
  `props` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品属性 格式：pid:vid;pid:vid',
  `valid_thru` int(0) DEFAULT NULL COMMENT '有效期,7或者14（默认是7天）',
  `has_discount` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '支持会员打折,true/false',
  `has_invoice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否有发票,true/false',
  `has_warranty` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否有保修,true/false',
  `has_showcase` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '橱窗推荐,true/false',
  `modified` datetime(0) DEFAULT NULL COMMENT '商品修改时间（格式：yyyy-MM-dd HH:mm:ss）',
  `delist_time` datetime(0) DEFAULT NULL COMMENT '下架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `postage_id` int(0) DEFAULT NULL COMMENT '宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。需要授权才能获取。',
  `list_time` datetime(0) DEFAULT NULL COMMENT '上架时间（格式：yyyy-MM-dd HH:mm:ss）',
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品价格，格式：5.00；单位：元；精确到：分',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `is_ex` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否在外部网店显示',
  `is_virtual` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '虚拟商品的状态字段',
  `is_taobao` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否在淘宝显示',
  `sold_quantity` int(0) DEFAULT 0 COMMENT '商品销量',
  `is_cspu` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '是否为达尔文挂接成功了的商品',
  `first_starts_time` datetime(0) DEFAULT NULL COMMENT '商品首次上架时间',
  `shop_id` int(0) NOT NULL COMMENT '店铺id',
  `erp_goods_id` int(0) DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tao_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods_sku`;
CREATE TABLE `tao_goods_sku`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tao_goods_id` bigint(0) DEFAULT NULL COMMENT '外键id',
  `num_iid` bigint(0) NOT NULL COMMENT 'sku所属商品数字id',
  `iid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)',
  `sku_id` bigint(0) NOT NULL COMMENT '商品skuid，阿里',
  `properties` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2',
  `properties_name` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……',
  `quantity` bigint(0) DEFAULT NULL COMMENT '属于这个sku的商品的数量，',
  `spec` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT 'specId',
  `price` double DEFAULT NULL COMMENT '属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商家设置的外部id。',
  `created` datetime(0) DEFAULT NULL COMMENT 'sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `modified` datetime(0) DEFAULT NULL COMMENT 'sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss',
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku状态。	normal',
  `sku_spec_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '表示SKu上的产品规格信息',
  `barcode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品级别的条形码',
  `erp_goods_sku_id` int(0) DEFAULT NULL COMMENT 'erp商品SKUid',
  `erp_goods_id` int(0) DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tao_order
-- ----------------------------
DROP TABLE IF EXISTS `tao_order`;
CREATE TABLE `tao_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` int(0) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `tid` bigint(0) NOT NULL COMMENT '交易编号 (父订单的交易编号)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易标题，以店铺名作为此标题的值。',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。',
  `seller_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5',
  `has_buyer_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '判断订单是否有买家留言，有买家留言返回true，否则返回false',
  `credit_card_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '使用信用卡支付金额数',
  `step_trade_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)',
  `step_paid_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分阶段付款的已付金额（万人团订单已付金额）',
  `buyer_open_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家OpenUid',
  `mark_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空',
  `buyer_nick` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '买家昵称',
  `num_iid` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品数字编号',
  `num` int(0) DEFAULT NULL COMMENT '商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。',
  `price` float DEFAULT NULL COMMENT '商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分',
  `total_fee` float DEFAULT NULL COMMENT '商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` float DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07',
  `post_fee` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `discount_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `payment` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `received_payment` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `available_confirm_fee` float DEFAULT NULL COMMENT '交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分',
  `cod_fee` float DEFAULT NULL COMMENT '货到付款服务费。',
  `cod_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家货到付款服务费',
  `seller_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家货到付款服务费',
  `express_agency_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递代收款。',
  `commission_fee` float DEFAULT NULL COMMENT '交易佣金。',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。',
  `created` datetime(0) NOT NULL COMMENT '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime(0) DEFAULT NULL COMMENT '交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。',
  `consign_time` datetime(0) DEFAULT NULL COMMENT '卖家发货时间。格式:yyyy-MM-dd HH:mm:ss',
  `end_time` datetime(0) DEFAULT NULL COMMENT '交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss',
  `seller_memo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '卖家备忘信息',
  `buyer_memo` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '买家备注',
  `buyer_message` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '买家留言',
  `point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家使用积分,下单时生成，且一直不变。格式:100;单位:个.',
  `real_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个',
  `buyer_obtain_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `receiving_time` datetime(0) DEFAULT NULL COMMENT '收货时间，这里返回的是完全收货时间',
  `status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)',
  `trade_memo` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '交易备注。',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int(0) DEFAULT 0 COMMENT 'erp发货状态',
  `create_time` datetime(0) DEFAULT NULL COMMENT '数据库创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '数据库更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据库更新人',
  `oaid` varchar(2552) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '（收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址aid字段',
  `receiver_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人国籍',
  `receiver_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人街道地址',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人的电话号码',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家是否已评价。可选值:true(已评价),false(未评价)',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家昵称',
  `buyer_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false',
  `buyer_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家下单的地区',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `buyer_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家支付宝账号',
  `buyer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家邮件地址',
  `seller_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家支付宝账号',
  `has_post_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)',
  `timeout_action_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同',
  `snapshot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易快照地址',
  `promotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易促销详细信息',
  `yfx_fee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单的运费险，单位为元',
  `has_yfx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单中是否包含运费险订单，如果包含运费险订单返回true，不包含运费险订单，返回false',
  `send_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单将在此时间前发出，主要用于预售订单',
  `is_part_consign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false',
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流运单号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1763461704736792578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tao_order
-- ----------------------------
INSERT INTO `tao_order` VALUES (1763461702060826625, 0, 3789698150943880841, '曲美家具官方旗舰店', 'fixed', '4', 'false', '10498.00', NULL, NULL, 'AAHlHVMUAAJ_dKyzaDU1JqQr', NULL, '爱**', NULL, NULL, NULL, 23741, 0, 0.00, 3000.00, 10536.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-24 13:07:17', '2024-03-01 15:13:36', '2024-02-24 13:07:25', '2024-02-28 13:41:05', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1bmZEXUhXiag0ic62zer6AhiaLGIO8AEUhaUTVP4Gwp50PyzwXHILneTVPWcUIh3FhDmWNq41', NULL, NULL, '北京', '北京市', '大兴区', '博兴街道', '博*街道博兴七**号院中海**号院**号楼****', NULL, '李**', '*******6493', NULL, NULL, NULL, '0', NULL, '2024022422001195041420773498', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3789698150943880841');
INSERT INTO `tao_order` VALUES (1763461702320873474, 0, 3796332661220370339, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAFxHVMUAAJ_dKyzaDXiuDRo', NULL, 't**', NULL, NULL, NULL, 3999, 0, 0.00, 1000.00, 999.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-01 14:58:29', '2024-03-01 14:58:33', '2024-03-01 14:58:33', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1GxCvG2oEOl0ZhKJ4S53yp5IovsXGnfIB2cawlqARYAO5E8D4jB9mtNVBDD15XxplXTVE0', NULL, NULL, '江苏省', '泰州市', '泰兴市', '济川街道', '济*街道泰兴富泰华庭**号楼***室', NULL, '陈**', '*******3878', NULL, NULL, NULL, '0', NULL, '2024030122001131971446896321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3796332661220370339');
INSERT INTO `tao_order` VALUES (1763461702400565250, 0, 3796593735415370339, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAFxHVMUAAJ_dKyzaDXiuDRo', NULL, 't**', NULL, NULL, NULL, 3999, 0, 0.00, 1000.00, 999.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-01 14:57:47', '2024-03-01 14:57:52', '2024-03-01 14:57:51', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1GxCvG2oEOl0ZhKJ4S53yp5IovsXGnfIB2cawlqARYAO5E8D4jB9mtNVBDD15XxplXTVE0', NULL, NULL, '江苏省', '泰州市', '泰兴市', '济川街道', '济*街道泰兴富泰华庭**号楼***室', NULL, '陈**', '*******3878', NULL, NULL, NULL, '0', NULL, '2024030122001131971447533379', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3796593735415370339');
INSERT INTO `tao_order` VALUES (1763461702526394370, 0, 3774942720698271104, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAGPHVMUAAJ_dKyzaDWC1lCs', NULL, '金**', NULL, NULL, NULL, 2599, 0, 0.00, 1000.00, 999.00, 999.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-12 12:59:55', '2024-03-01 13:45:46', '2024-02-12 13:00:04', '2024-02-27 15:57:05', '2024-03-01 13:45:46', NULL, NULL, '', NULL, NULL, NULL, NULL, 'TRADE_FINISHED', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1DoTpqkZlSY8023vZ4icpBztvpld53Cxhjp5IXe33geXKBhruVyCckmIOTV2jVukG5IHiaoH', NULL, NULL, '山东省', '日照市', '东港区', '秦楼街道', '秦*街道**路生活印象*期**号**单元****室', NULL, '王**', '*******8793', NULL, NULL, NULL, '0', NULL, '2024021222001183911419166451', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3774942720698271104');
INSERT INTO `tao_order` VALUES (1763461702736109570, 0, 3791151361154695910, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAFjHVMUAAJ_dKyzaDW2BRlU', NULL, '岁**', NULL, NULL, NULL, 12599, 0, 0.00, 3000.00, 4389.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-25 22:01:07', '2024-03-01 13:36:42', '2024-02-25 22:01:20', '2024-03-01 13:36:43', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '13eMggP4iaBsho3iaTDUZodMSLPp5GNIDB9WUID0W12eTDgTVDkU0znf896UHSzCkYBmwe9n', NULL, NULL, '山东省', '烟台市', '芝罘区', '世回尧街道', '世**街道青**路***号金象泰翰林苑', NULL, '李**', '*******2095', NULL, NULL, NULL, '0', NULL, '2024022522001197111443250405', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3791151361154695910');
INSERT INTO `tao_order` VALUES (1763461702866132993, 0, 3796207345637527441, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAE9HVMUAAJ_dKyzaDX7aDZp', NULL, 't**', NULL, NULL, NULL, 4963, 0, 0.00, 1000.00, 2299.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-01 13:19:48', '2024-03-01 13:20:15', '2024-03-01 13:20:00', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1bhibPTekQ9Vico6BCjHicSUS6j5e9RRZkeyPzqeo41ibibkp5UTVZQC2wdLEQ0BssjpbscJyZy', NULL, NULL, '辽宁省', '鞍山市', '铁东区', '新兴街道', '新*街**园*道丰**园', NULL, '欧**', '*******3211', NULL, NULL, NULL, '0', NULL, '2024030122001181171413874834', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3796207345637527441');
INSERT INTO `tao_order` VALUES (1763461702950019073, 0, 3789530136787795741, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAGxHVMUAAJ_dKyzaDUr3-KK', NULL, '诚**', NULL, NULL, NULL, 11987, 0, 0.00, 1260.00, 4689.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-24 17:34:04', '2024-03-01 13:14:16', '2024-02-24 18:04:52', '2024-02-28 17:12:48', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1BVk7ZPNPKQcmM64e3SSFPX82qPDC22Wnichp5IATTkibquAnwpohTV7PTAoS4AWJk3JN8bV', NULL, NULL, '广东省', '佛山市', '顺德区', '大良街道', '大*街道德**路**号美的世茂滨**号**栋****', NULL, '李**', '*******6001', NULL, NULL, NULL, '0', NULL, '2024022422001128981450872493', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3789530136787795741');
INSERT INTO `tao_order` VALUES (1763461703121985538, 0, 3669992569885634587, '曲美家具官方旗舰店', 'fixed', '4', 'false', NULL, NULL, NULL, 'AAE0HVMUAAJ_dKyzaDUX1w1-', NULL, 'm**', NULL, NULL, NULL, 12447, 0, 0.00, 2123.26, 5385.74, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-09 20:06:14', '2024-03-01 13:03:53', '2023-12-09 20:06:22', NULL, '2024-03-01 13:03:53', NULL, NULL, '', NULL, NULL, NULL, NULL, 'TRADE_CLOSED', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1J0g4DqmX9ohiblcUIiadgIpp5DWia1O4BFNiaern8zZok3JUTVsB9FzY5Tjqw8p9x3XI4zbJ8', NULL, NULL, '内蒙古自治区', '鄂尔多斯市', '东胜区', '纺织街道', '纺*街道 南湖国**号楼**楼', NULL, '马**', '*******1871', '', NULL, NULL, '0', NULL, '2023120922001159721409912184', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3669992569885634587');
INSERT INTO `tao_order` VALUES (1763461703184900098, 0, 2071423130448007172, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAG2HVMUAAJ_dKyzaDVbgV_A', NULL, 'l**', NULL, NULL, NULL, 5499, 0, 0.00, 1500.00, 1499.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-01 11:54:46', '2024-03-01 12:33:23', '2024-03-01 11:56:34', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1BeVpv29jT70unC4MuXWTcia92kCjD1Wjyh7p5DLicHQEwsTVpS2pxS5ibRcqDJkN2ibtCoNhy', NULL, NULL, '河北省', '秦皇岛市', '海港区', '西港镇', '西*镇横**路**号兴龙紫云府二区**栋***', NULL, '李**', '*******8988', NULL, NULL, NULL, '0', NULL, '2024030122001164231451363057', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2071423130448007172');
INSERT INTO `tao_order` VALUES (1763461703235231745, 0, 3688817689575561971, '曲美家具官方旗舰店', 'fixed', '4', 'true', NULL, NULL, NULL, 'AAGkHVMUAAJ_dKyzaDUHVaXo', NULL, 'u**', NULL, NULL, NULL, 3099, 0, 0.00, 0.00, 99.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-17 22:32:13', '2024-03-01 11:16:55', '2023-12-17 22:32:20', '2024-03-01 11:16:55', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1BpCLtqfvCqSkX14Op57oCZMEmkFiahR6xWSnJuaicZVhZzibZ1Rcy0kjfTViblNELQFyunwMib', NULL, NULL, '广东省', '深圳市', '宝安区', '福永街道', '福*街道凤凰第一工业区岭**路**号(启程达****.*)', NULL, 'N**', '*******4058', NULL, NULL, NULL, '0', NULL, '2023121722001120931431424781', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3688817689575561971');
INSERT INTO `tao_order` VALUES (1763461703298146305, 0, 3783348831664536350, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAFkHVMUAAJ_dKyzaDUFEKRw', NULL, '彼**', NULL, NULL, NULL, 3999, 0, 0.00, 460.00, 999.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-19 12:53:20', '2024-03-01 11:07:33', '2024-02-19 12:53:34', '2024-02-27 18:28:06', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1f5DpnW4a4uqEicSiap5gDUQMfiahMKHbHcmN6wpmMPICqkXTVYYJJtEgziacNAFn46a1kOyXia', NULL, NULL, '山东省', '淄博市', '博山区', '域城镇', '域*镇凤**路小顶**园', NULL, '赵**', '*******1231', NULL, NULL, NULL, '0', NULL, '2024021922001179131402514963', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3783348831664536350');
INSERT INTO `tao_order` VALUES (1763461703382032386, 0, 3787081023607147346, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAGsHVMUAAJ_dKyzaDU2dUCG', NULL, 'n**', NULL, NULL, NULL, 5499, 0, 0.00, 540.00, 1499.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-22 08:56:29', '2024-03-01 10:47:23', '2024-02-22 08:56:43', '2024-02-28 14:03:26', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '13NJy0F4FoYNu9ZcJX2lR7xzp5Vic7TVEcXqZKRx5kmyxAs0iaWCpUbqWRsLlmxMLBAf6mico', NULL, NULL, '山东省', '滨州市', '滨城区', '彭李街道', '彭*街道滨州市黄**路渤海**路**大*公寓**单元***，送家有人', NULL, '张**', '*******9172', NULL, NULL, NULL, '0', NULL, '2024022222001143691456423959', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3787081023607147346');
INSERT INTO `tao_order` VALUES (1763461703486889986, 0, 2059690980059856688, '曲美家具官方旗舰店', 'fixed', '0', 'false', '959.41', NULL, NULL, 'AAE0HVMUAAJ_dKyzaDU1FhkV', NULL, '暖**', NULL, NULL, NULL, 3999, 0, 0.00, 493.14, 965.86, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-17 20:19:33', '2024-03-01 10:07:33', '2024-02-17 20:19:44', '2024-02-27 18:28:06', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1QY4HWcc4WQlCBGaxRibTu3x9Yg3eZOp5sEUG9gToTVwITFmNupgB4PV7Jy0neebNicA1u4o', NULL, NULL, '山东省', '菏泽市', '巨野县', '永丰街道', '永*街道**县住房**乡**局', NULL, '王**', '*******0069', NULL, NULL, NULL, '0', NULL, '2024021722001124561457096458', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2059690980059856688');
INSERT INTO `tao_order` VALUES (1763461703583358977, 0, 2015148426521453386, '曲美家具官方旗舰店', 'fixed', '4', 'false', NULL, NULL, NULL, 'AAEEHVMUAAJ_dKyzaDUwFxTu', NULL, 'w**', NULL, NULL, NULL, 9299, 0, 0.00, 831.53, 4167.47, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-10 22:21:57', '2024-03-01 09:56:54', '2023-11-10 22:22:04', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1So7vGNfPWa48ED8nQJGTrrCGfhic5NGMp5ibgeic4haxFmAmnyoVibtSTVUEyrIxkXrCPpzsv', NULL, NULL, '湖北省', '襄阳市', '樊城区', '清河口街道', '清**街**城区雍江国际二期*-*-****', NULL, '崔**', '*******7186', NULL, NULL, NULL, '0', NULL, '2023111022001103361447695832', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2015148426521453386');
INSERT INTO `tao_order` VALUES (1763461703688216578, 0, 3660375531496890667, '曲美家具官方旗舰店', 'fixed', '4', 'false', '999.00', NULL, NULL, 'AAHuHVMUAAJ_dKyzaDXGULjl', NULL, 'q**', NULL, NULL, NULL, 3999, 0, 0.00, 1000.00, 999.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-04 10:42:32', '2024-03-01 09:52:55', '2023-12-04 10:42:38', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1OZ5XAr5L4ib2wXOONImiaRoHBzuhp5icBK6EZOIeLTVPiagDNK2A1AVvR9IJfQK81uUkicFGZl', NULL, NULL, '福建省', '厦门市', '集美区', '杏林街道', '杏*街道杏**园博六里***园**小**号楼*梯****', NULL, '篱**', '*******7717', NULL, NULL, NULL, '0', NULL, '2023120422001170661430531017', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3660375531496890667');
INSERT INTO `tao_order` VALUES (1763461703767908353, 0, 2069949036635682270, '曲美家具官方旗舰店', 'fixed', '0', 'true', '4099.00', NULL, NULL, 'AAHnHVMUAAJ_dKyzaDUcZKMJ', NULL, '王**', NULL, NULL, NULL, 9058, 0, 0.00, 1000.00, 4099.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 13:21:54', '2024-03-01 09:36:54', '2024-02-29 13:22:39', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1TRCanDvjRdCHvC74K4uAj1cAwdBf80hp58qTViaDkm1uTT6orcPjibWjUahQiaZIaW96SicLC', NULL, NULL, '吉林省', '长春市', '二道区', '远达街道', '远*街道北远**街中海寰宇天下***栋****室', NULL, '王**', '*******6497', NULL, NULL, NULL, '0', NULL, '2024022922001104151426502377', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2069949036635682270');
INSERT INTO `tao_order` VALUES (1763461703814045698, 0, 2061163777446449496, '曲美家具官方旗舰店', 'fixed', '0', 'false', '1697.00', NULL, NULL, 'AAGzHVMUAAJ_dKyzaDUHRrL5', NULL, 't**', NULL, NULL, NULL, 7999, 0, 0.00, 820.00, 1699.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-19 15:07:53', '2024-03-01 09:36:54', '2024-02-19 15:08:07', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1A6Chialib4yTV6p54JTVVxEbZw1TGPvlJRIAR5b6ibwYITQ7sH8HqIpiaxwrPuPzOxQTsdw9ib', NULL, NULL, '河北省', '秦皇岛市', '海港区', '燕山大街街道', '燕**街*道达润上邦****单元****', NULL, '顾**', '*******0006', NULL, NULL, NULL, '0', NULL, '2024021922001197971436219209', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2061163777446449496');
INSERT INTO `tao_order` VALUES (1763461703860183041, 0, 2007439927555924591, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAGlHVMUAAJ_dKyzaDUrzNWe', NULL, '云**', NULL, NULL, NULL, 6699, 0, 0.00, 1424.44, 4174.56, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-31 21:38:36', '2024-03-01 09:21:24', '2023-10-31 21:38:49', '2024-03-01 09:21:25', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '18Vyicu885tL41GZ9oFprmiauZ4FPSrWOKP1p53o2ySzhnXzhEibYicUfTuxnOQ7KniTVcibA6Ss', NULL, NULL, '山西省', '晋中市', '灵石县', '东城管理委员会', '东城管理委员会星泰翠**号**单元***室', NULL, '郭**', '*******5150', NULL, NULL, NULL, '0', NULL, '2023103122001198621406739570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2007439927555924591');
INSERT INTO `tao_order` VALUES (1763461703902126082, 0, 2006998315593924591, '曲美家具官方旗舰店', 'fixed', '4', 'false', NULL, NULL, NULL, 'AAGlHVMUAAJ_dKyzaDUrzNWe', NULL, '云**', NULL, NULL, NULL, 15491, 0, 0.00, 1830.78, 6267.22, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-31 21:12:02', '2024-03-01 09:21:24', '2023-10-31 21:12:18', '2024-03-01 09:21:24', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'SELLER_CONSIGNED_PART', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '18Vyicu885tL41GZ9oFprmiauZ4FPSrWOKP1p53o2ySzhnXzhEibYicUfTuxnOQ7KniTVcibA6Ss', NULL, NULL, '山西省', '晋中市', '灵石县', '东城管理委员会', '东城管理委员会星泰翠**号**单元***室', NULL, '郭**', '*******5150', NULL, NULL, NULL, '0', NULL, '2023103122001198621413871778', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2006998315593924591');
INSERT INTO `tao_order` VALUES (1763461703952457730, 0, 2007700098397924591, '曲美家具官方旗舰店', 'fixed', '4', 'false', NULL, NULL, NULL, 'AAGlHVMUAAJ_dKyzaDUrzNWe', NULL, '云**', NULL, NULL, NULL, 6999, 0, 0.00, 1130.74, 2668.26, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-10-31 21:31:19', '2024-03-01 09:21:23', '2023-10-31 21:31:27', '2024-03-01 09:21:24', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '18Vyicu885tL41GZ9oFprmiauZ4FPSrWOKP1p53o2ySzhnXzhEibYicUfTuxnOQ7KniTVcibA6Ss', NULL, NULL, '山西省', '晋中市', '灵石县', '东城管理委员会', '东城管理委员会星泰翠**号**单元***室', NULL, '郭**', '*******5150', NULL, NULL, NULL, '0', NULL, '2023103122001198621414006860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2007700098397924591');
INSERT INTO `tao_order` VALUES (1763461704002789377, 0, 2064899246055440182, '曲美家具官方旗舰店', 'fixed', '0', 'true', '2683.21', NULL, NULL, 'AAEMHVMUAAJ_dKyzaDUqRvPu', NULL, 'y**', NULL, NULL, NULL, 11999, 0, 0.00, 980.00, 2699.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-23 15:36:07', '2024-03-01 09:19:44', '2024-02-23 15:36:21', '2024-03-01 09:19:45', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1zyj6bkwhicHgLu5c4vYuZ9GnYYGItHPwV9rIibKVY3EsHsmn49KEhibjQuMzHExlp5iTVbEeG', NULL, NULL, '湖南省', '长沙市', '雨花区', '黎托街道', '黎*街道古**路中隆国际御玺***单元***', NULL, '刘**', '*******6126', NULL, NULL, NULL, '0', NULL, '2024022322001156871456769889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2064899246055440182');
INSERT INTO `tao_order` VALUES (1763461704057315329, 0, 2038664427774676567, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAEnHVMUAAJ_dKyzaDWvYiE6', NULL, '大**', NULL, NULL, NULL, 8637, 0, 0.00, 3500.00, 3598.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-29 19:48:00', '2024-03-01 09:17:40', '2023-12-29 19:48:40', '2024-03-01 09:17:40', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'SELLER_CONSIGNED_PART', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1xbzjVT5xlkNfZwIT6PoUCEth6iasE3KpXwcMOewd404XLn2ib6ricr27pLpDPJdp5htTVDfz', NULL, NULL, '江西省', '南昌市', '红谷滩区', '红角洲管理处', '红角洲管理处红谷**道华润悦府**-*-****', NULL, '陆**', '*******6326', NULL, NULL, NULL, '0', NULL, '2023122922001197591421170599', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2038664427774676567');
INSERT INTO `tao_order` VALUES (1763461704149590017, 0, 2038657407158676567, '曲美家具官方旗舰店', 'fixed', '4', 'false', NULL, NULL, NULL, 'AAEnHVMUAAJ_dKyzaDWvYiE6', NULL, '大**', NULL, NULL, NULL, 8746, 0, 0.00, 3500.00, 3647.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-12-29 19:33:17', '2024-03-01 09:17:39', '2023-12-29 19:33:58', '2024-03-01 09:17:40', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'SELLER_CONSIGNED_PART', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1xbzjVT5xlkNfZwIT6PoUCEth6iasE3KpXwcMOewd404XLn2ib6ricr27pLpDPJdp5htTVDfz', NULL, NULL, '江西省', '南昌市', '红谷滩区', '红角洲管理处', '红角洲管理处红谷**道华润悦府**-*-****', NULL, '陆**', '*******6326', NULL, NULL, NULL, '0', NULL, '2023122922001197591421983386', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2038657407158676567');
INSERT INTO `tao_order` VALUES (1763461704271224834, 0, 3751666813998101868, '曲美家具官方旗舰店', 'fixed', '0', 'false', '7225.00', NULL, NULL, 'AAHyHVMUAAJ_dKyzaDWYsYnl', NULL, 'g**', NULL, NULL, NULL, 17997, 0, 0.00, 1850.00, 7225.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 16:48:59', '2024-03-01 09:12:54', '2024-01-24 16:49:22', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:08', NULL, NULL, '1qNvkug1KJgGvRibMQddOkA6uA14GSDyVwwJpXdia4KmDqpFYv7s8WR3jp5DiaygTVRZmC8Hr', NULL, NULL, '四川省', '资阳市', '乐至县', '天池街道', '天*街道 **城**栋****室', NULL, '高**', '*******6380', NULL, NULL, NULL, '0', NULL, '2024012422001100551458424956', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3751666813998101868');
INSERT INTO `tao_order` VALUES (1763461704338333697, 0, 2070368042942011797, '曲美家具官方旗舰店', 'fixed', '0', 'false', '3898.00', NULL, NULL, 'AAE0HVMUAAJ_dKyzaDU0bjUi', NULL, 'f**', NULL, NULL, NULL, 10013, 0, 0.00, 3700.00, 3898.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 10:17:02', '2024-03-01 09:12:51', '2024-02-29 10:18:50', '2024-03-01 09:12:51', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '14gTMX8D4BeibEmgoZx9yKegdvvoN0LDt7p5UMs1zAgAE8icgTVfLtFkpqRdUOJE4GTdKugZ', NULL, NULL, '四川省', '成都市', '锦江区', '狮子山街道', ' 狮**街道   **路***号滨**城****单元****室', NULL, '冯**', '*******9688', '', NULL, NULL, '0', NULL, '2024022922001167001406381940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2070368042942011797');
INSERT INTO `tao_order` VALUES (1763461704392859650, 0, 2069997063419011797, '曲美家具官方旗舰店', 'fixed', '0', 'false', '3689.00', NULL, NULL, 'AAE0HVMUAAJ_dKyzaDU0bjUi', NULL, 'f**', NULL, NULL, NULL, 10999, 0, 0.00, 3300.00, 3689.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-29 10:16:32', '2024-03-01 09:12:50', '2024-02-29 10:18:50', '2024-03-01 09:12:51', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '14gTMX8D4BeibEmgoZx9yKegdvvoN0LDt7p5UMs1zAgAE8icgTVfLtFkpqRdUOJE4GTdKugZ', NULL, NULL, '四川省', '成都市', '锦江区', '狮子山街道', '狮**街道**路***号滨**城****单元****室', NULL, '冯**', '*******9688', NULL, NULL, NULL, '0', NULL, '2024022922001167001407668004', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2069997063419011797');
INSERT INTO `tao_order` VALUES (1763461704447385602, 0, 3751815926798101868, '曲美家具官方旗舰店', 'fixed', '0', 'false', '6188.54', NULL, NULL, 'AAHyHVMUAAJ_dKyzaDWYsYnl', NULL, 'g**', NULL, NULL, NULL, 9999, 0, 0.00, 1080.00, 6189.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 16:46:51', '2024-03-01 09:10:04', '2024-01-24 16:48:37', '2024-03-01 09:09:59', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1qNvkug1KJgGvRibMQddOkA6uA14GSDyVwwJpXdia4KmDqpFYv7s8WR3jp5DiaygTVRZmC8Hr', NULL, NULL, '四川省', '资阳市', '乐至县', '天池街道', '天*街道 **城**栋****室', NULL, '高**', '*******6380', NULL, NULL, NULL, '0', NULL, '2024012422001100551401371972', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3751815926798101868');
INSERT INTO `tao_order` VALUES (1763461704497717250, 0, 3751351488928101868, '曲美家具官方旗舰店', 'fixed', '0', 'false', '2599.00', NULL, NULL, 'AAHyHVMUAAJ_dKyzaDWYsYnl', NULL, 'g**', NULL, NULL, NULL, 6499, 0, 0.00, 810.00, 2599.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-01-24 16:51:06', '2024-03-01 09:10:04', '2024-01-24 16:51:25', '2024-03-01 09:09:59', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1qNvkug1KJgGvRibMQddOkA6uA14GSDyVwwJpXdia4KmDqpFYv7s8WR3jp5DiaygTVRZmC8Hr', NULL, NULL, '四川省', '资阳市', '乐至县', '天池街道', '天*街道 **城**栋****室', NULL, '高**', '*******6380', NULL, NULL, NULL, '0', NULL, '2024012422001100551401648544', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3751351488928101868');
INSERT INTO `tao_order` VALUES (1763461704548048897, 0, 3783658357934114317, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAEAHVMUAAJ_dKyzaDWbi8dY', NULL, 'h**', NULL, NULL, NULL, 12246, 0, 0.00, 1140.00, 3889.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-19 18:23:35', '2024-03-01 09:07:28', '2024-02-19 18:25:28', '2024-03-01 09:07:28', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1G2STa4KWTm5hwetGlAdUp5ib6t0ZzYntkTTVf8uTuEYSHG7902rLk4ccBuFtB1OstzSibXG', NULL, NULL, '河南省', '信阳市', '息县', '龙湖街道', '龙*街**县**街道芬**园二**号**单元', NULL, '黄**', '*******0702', NULL, NULL, NULL, '0', NULL, '2024021922001144031400514374', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3783658357934114317');
INSERT INTO `tao_order` VALUES (1763461704602574849, 0, 2060632237063982079, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAGiHVMUAAJ_dKyzaDVU8uq3', NULL, 'w**', NULL, NULL, NULL, 12599, 0, 0.00, 1220.00, 4389.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-18 14:07:59', '2024-03-01 08:26:36', '2024-02-18 14:16:21', '2024-02-28 14:58:50', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '14Ok7LhM4lDvMfZRRYQRPl0X8g883p5TYAwRicYJ3jjvcumXu5iazTVKMZoNoahnxYpaGT4j', NULL, NULL, '云南省', '昭通市', '昭阳区', '龙泉街道', '龙*街道金**小区**栋****号', NULL, '吴**', '*******6418', NULL, NULL, NULL, '0', NULL, '2024021822001129821415001681', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2060632237063982079');
INSERT INTO `tao_order` VALUES (1763461704648712193, 0, 3795882049191016603, '曲美家具官方旗舰店', 'fixed', '0', 'false', '650.00', NULL, NULL, 'AAEGHVMUAAJ_dKyzaDU165IZ', NULL, 'j**', NULL, NULL, NULL, 2900, 0, 0.00, 1000.00, 650.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-01 08:18:12', '2024-03-01 08:18:37', '2024-03-01 08:18:36', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1NYBYZAjH52zllJ4rkqicrJEfz6hp5Aw4XlibVnibTVFUb2vZU2hunbZTZMJKRSUlwwo7dNvj', NULL, NULL, '甘肃省', '兰州市', '安宁区', '西路街道', '西*街道安**路**号兰州**大学**院', NULL, '姜**', '*******3152', NULL, NULL, NULL, '0', NULL, '2024030122001155411445891962', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3795882049191016603');
INSERT INTO `tao_order` VALUES (1763461704694849537, 0, 3784435093981632713, '曲美家具官方旗舰店', 'fixed', '0', 'false', '969.15', NULL, NULL, 'AAEfHVMUAAJ_dKyzaDUOsyv4', NULL, 't**', NULL, NULL, NULL, 3999, 0, 0.00, 489.85, 969.15, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-20 09:58:58', '2024-03-01 08:08:30', '2024-02-20 09:59:11', '2024-02-28 14:03:25', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1ulPZy7MZxLDXstCqWIb0y71SibeJ4laMNkAzYV8vaFa1K043oO3p5wG69vP5F6TVLuQVUN', NULL, NULL, '北京', '北京市', '顺义区', '杨镇镇', '杨*镇西**村**街**号', NULL, '赵**', '*******8258', NULL, NULL, NULL, '0', NULL, '2024022022001107331407478056', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '3784435093981632713');
INSERT INTO `tao_order` VALUES (1763461704736792578, 0, 2069582342925177164, '曲美家具官方旗舰店', 'fixed', '0', 'false', NULL, NULL, NULL, 'AAHHHVMUAAJ_dKyzaDUrNH2w', NULL, 'h**', NULL, NULL, NULL, 1399, 0, 0.00, 500.00, 499.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-28 13:04:06', '2024-03-01 01:00:18', '2024-02-28 13:04:28', '2024-02-28 16:39:45', NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 'WAIT_BUYER_CONFIRM_GOODS', NULL, NULL, NULL, 0, '2024-03-01 15:10:09', NULL, NULL, '1axIvD4dl7FNF1LxTejicQ4ZX0Rzic9ViaicfeHcUp51x75KLtGMDBZgWRSKibJooqTVqU0zWj2', NULL, NULL, '天津', '天津市', '南开区', '兴南街道', '兴*街道**路邮电公**号楼***室', NULL, '黄**', '*******5265', NULL, NULL, NULL, '0', NULL, '2024022822001175161444594203', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'false', NULL, NULL, '2069582342925177164');

-- ----------------------------
-- Table structure for tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tao_order_item`;
CREATE TABLE `tao_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `tid` bigint(0) NOT NULL COMMENT '订单id',
  `oid` bigint(0) NOT NULL COMMENT '子订单编号',
  `total_fee` decimal(10, 2) DEFAULT NULL COMMENT '应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(10, 2) DEFAULT NULL COMMENT '子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` decimal(10, 2) DEFAULT NULL COMMENT '手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.',
  `divide_order_fee` float DEFAULT NULL COMMENT '分摊之后的实付金额',
  `part_mjz_discount` float DEFAULT NULL COMMENT '优惠分摊',
  `payment` float DEFAULT NULL COMMENT '子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品标题',
  `pic_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品主图',
  `price` decimal(10, 2) DEFAULT NULL COMMENT '商品价格',
  `num_iid` bigint(0) DEFAULT NULL COMMENT '商品数字ID',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID',
  `outer_iid` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。',
  `outer_sku_id` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
  `sku_properties_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'SKU的值。如：机身颜色:黑色;手机套餐:官方标配',
  `item_meal_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋',
  `num` int(0) DEFAULT NULL COMMENT '数量',
  `timeout_action_time` datetime(0) DEFAULT NULL COMMENT '订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss',
  `item_memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品备注',
  `buyer_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家类型，可选值为：B（商城商家），C（普通卖家）',
  `cid` bigint(0) DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `is_oversold` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	是否超卖',
  `end_time` datetime(0) DEFAULT NULL COMMENT '子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断',
  `order_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)',
  `is_service_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否是服务订单，是返回true，否返回false。',
  `consign_time` datetime(0) DEFAULT NULL COMMENT '子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）',
  `logistics_company` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子订单发货的快递公司名称',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子订单所在包裹的运单号',
  `bind_oid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货',
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:\r\nTRADE_NO_CREATE_PAY(没有创建支付宝交易)\r\nWAIT_BUYER_PAY(等待买家付款)\r\nWAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)\r\nWAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)\r\nTRADE_BUYER_SIGNED(买家已签收,货到付款专用)\r\nTRADE_FINISHED(交易成功)\r\nTRADE_CLOSED(付款以后用户退款成功，交易自动关闭)\r\nTRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)\r\nPAY_PENDING(国际信用卡支付付款确认中)',
  `refund_status` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'NO_REFUND' COMMENT '退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '最近退款ID',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1763461704749375490 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tao_order_item
-- ----------------------------
INSERT INTO `tao_order_item` VALUES (1763461702165684226, 3789698150943880841, 3789698150944880841, 5949.00, 5517.00, 0.00, 4657.91, 1291.09, 4398, '【新春价】曲美家居轻奢北欧风真皮床大象耳朵现代简约头层牛皮主卧室双人床', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN018Fl1oW1qQTEzQaFAn_!!351855490.jpg', 11466.00, 647894947395, '5179859263804', NULL, 'DS-F2-QM21-B6-18&QM23-M2-18', '家具结构:框架结构;颜色分类:优雅驼-框架单床+黑骑士双面可用床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-02-28 13:41:05', 'free', '鸿宇物流', '240200509', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'SUCCESS', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702199238658, 3789698150943880841, 3789698150945880841, 5749.00, 3250.00, 0.00, 4484.5, 1264.5, 4484.5, '【新春价】曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN01fEWUxx1qQTGyCrWME_!!351855490.jpg', 8999.00, 718529179488, '5084701932007', NULL, 'DS-F2-QM23-B1-18&M2', '家具结构:框架结构;颜色分类:架子款-奶油白 进口真皮软床+黑骑士M2黄麻乳胶床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-02-28 13:41:05', 'free', '鸿宇物流', '240200509', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702220210178, 3789698150943880841, 3789698150946880841, 1838.00, 1438.00, 0.00, 1393.59, 444.41, 1393.59, '【新春价】曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01ZER9l11qQTJkyevRI_!!351855490.jpg', 1638.00, 641634906618, '4902529397704', NULL, 'ZH-SF-04-DS-F9-QM20A-NT3', '颜色分类:奶油白;安装方式:组装', '', NULL, 2, NULL, NULL, 'false', 'false', 'B', 50001382, NULL, NULL, NULL, NULL, '2024-02-28 13:41:05', 'free', '鸿宇物流', '240200509', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702341844994, 3796332661220370339, 3796332661221370339, 1999.00, 2000.00, 0.00, 999, 1000, 999, '曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fpUhZz1qQTEwEVc7J_!!351855490.jpg', 3999.00, 35211712394, '5023489177233', NULL, 'ZH-PTCD-DS-QM23-M1-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702425731074, 3796593735415370339, 3796593735416370339, 1999.00, 2000.00, 0.00, 999, 1000, 999, '曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fpUhZz1qQTEwEVc7J_!!351855490.jpg', 3999.00, 35211712394, '5023489177233', NULL, 'ZH-PTCD-DS-QM23-M1-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702648029185, 3774942720698271104, 3774942720699271104, 1999.00, 600.00, 0.00, 999, 1000, 999, '曲美家居现代极简奶油风水云纱岩板餐桌椅圆形家用耐脏耐高温', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01Rmnnwv1qQTH65FIPc_!!351855490.jpg', 2599.00, 739470628236, '5100929608963', NULL, 'ZH-HZCY-DS-QM23-Y2*2', '颜色分类:麦冬色餐椅*2', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201846803, NULL, '2024-03-01 13:45:46', NULL, NULL, '2024-02-27 15:57:05', 'free', '顺心捷达', 'S20482781976', NULL, 'TRADE_FINISHED', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702757081089, 3791151361154695910, 3791151361155695910, 7389.00, 5210.00, 0.00, 4389, 3000, 4389, '曲美家居头层真皮床轻奢现代简约方糖皮床主卧室多功能储物大床', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN01FQW0Fy1qQTFSB2YNH_!!351855490.jpg', 12599.00, 628280725946, '4868386341322', NULL, 'DS-F1-19-B12A-15&M1&F3-NT3', '家具结构:框架结构;颜色分类:清新绿-头层牛皮软床+独袋弹簧乳胶床垫+床头柜;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 13:36:43', 'free', '旺达', '66770002842', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702908076033, 3796207345637527441, 3796207345638527441, 3299.00, 1664.00, 0.00, 2299, 1000, 2299, '曲美家居现代简约中式实木衣柜家用卧室衣帽柜小户型大容量储物柜', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN016X7OBv1qQT9EZzEnM_!!351855490.jpg', 4963.00, 35654302556, '4642975799269', NULL, 'ZQB/5-09ZC-WG1', '颜色分类:木本色+荷花白色;门数量:2门;是否组装:组装', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50015744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461702970990593, 3789530136787795741, 3789530136788795741, 5949.00, 6038.00, 0.00, 4689, 1260, 4689, '【新春价】曲美家居轻奢北欧风真皮床大象耳朵现代简约头层牛皮主卧室双人床', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN0188g15L1qQTF62z7lA_!!351855490.jpg', 11987.00, 647894947395, '4769643316413', NULL, 'DS-F1-QM21-B6-18&QM23-M2-18', '家具结构:框架结构;颜色分类:大地棕-框架单床+黑骑士双面可用床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-02-28 17:12:48', 'free', '众通物流', '240200406', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703138762753, 3669992569885634587, 3669992569885634587, 7509.00, 4938.00, 0.00, 5385.74, 2123.26, 5385.74, '【狂欢价】曲美家居现代简约轻奢布艺科技布懒人沙发客厅小户型意式羽绒沙发', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01hkTsqg1qQTFNkxYe1_!!351855490.jpg', 12447.00, 688444892888, '5081083851943', NULL, 'ZH-S-01-DS-F1-QM22-S11-4ZP(R)', '颜色分类:浅灰色-多人位右转角', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020632, NULL, '2024-03-01 13:03:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TRADE_CLOSED', 'SUCCESS', '146186942152638745', NULL);
INSERT INTO `tao_order_item` VALUES (1763461703205871618, 2071423130448007172, 2071423130449007172, 2999.00, 2500.00, 0.00, 1499, 1500, 1499, '曲美家居防螨抑菌透气床垫黄麻乳胶独袋弹簧双面可用黑骑士床垫', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01JNRMZ61qQTEqmklFr_!!351855490.jpg', 5499.00, 571110765951, '5182018783835', NULL, 'ZH-PTCD-DS-QM23-M2-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋乳胶黄麻双面床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703252008961, 3688817689575561971, 3688817689576561971, 99.00, 3000.00, 0.00, 99, 0, 99, '曲美lab墩墩沙发现代简约轻奢风模块布艺真皮沙发别墅客厅沙发', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01DI0lxe1qQTGLdXl8m_!!351855490.jpg', 3099.00, 720313574313, '5061095520701', NULL, NULL, '适用人数:组合;颜色分类:预约下单 享同尺寸沙发套！单拍不发货，详询客服~', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020633, NULL, NULL, NULL, NULL, '2024-03-01 11:16:55', 'free', '平安达腾飞快递新业务', '908862725416', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703319117826, 3783348831664536350, 3783348831665536350, 1459.00, 2540.00, 0.00, 999, 460, 999, '【新春价】曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fpUhZz1qQTEwEVc7J_!!351855490.jpg', 3999.00, 35211712394, '5023489177233', NULL, 'ZH-PTCD-DS-QM23-M1-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, '2024-02-27 18:28:06', 'free', '顺丰速运', 'SF1629373600345', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703428169730, 3787081023607147346, 3787081023608147346, 2039.00, 3460.00, 0.00, 1499, 540, 1499, '【新春价】曲美家居防螨抑菌透气床垫黄麻乳胶独袋弹簧双面可用黑骑士床垫', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01JNRMZ61qQTEqmklFr_!!351855490.jpg', 5499.00, 571110765951, '5182018783835', NULL, 'ZH-PTCD-DS-QM23-M2-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋乳胶黄麻双面床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, '2024-02-28 14:03:26', 'free', '顺丰速运', 'SF1657618848539', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703516250114, 2059690980059856688, 2059690980060856688, 1459.00, 2540.00, 0.00, 965.86, 493.14, 965.86, '【新春价】曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fpUhZz1qQTEwEVc7J_!!351855490.jpg', 3999.00, 35211712394, '5023489177233', NULL, 'ZH-PTCD-DS-QM23-M1-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, '2024-02-27 18:28:06', 'free', '顺丰速运', 'SF1380833196937', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703595941890, 2015148426521453386, 2015148426521453386, 4999.00, 4300.00, 0.00, 4167.47, 831.53, 4167.47, '曲美家居现代简约北欧风头层真皮床轻奢主卧室弯曲木工艺月半湾', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01l4yw231qQTIQ7QDgL_!!0-item_pic.jpg', 9299.00, 739038496267, '5098391736115', NULL, 'F2-HGHT-23E-WQM-B1-150', '家具结构:框架结构;颜色分类:烟雨灰【进口头层牛皮】;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703700799490, 3660375531496890667, 3660375531497890667, 1999.00, 2000.00, 0.00, 999, 1000, 999, '曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01S61ytB1qQTEmeWbQa_!!351855490.jpg', 3999.00, 35211712394, '5023489177232', NULL, 'ZH-PTCD-DS-QM23-M1-15', '尺寸:1500mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703780491265, 2069949036635682270, 2069949036636682270, 5099.00, 3959.00, 0.00, 4099, 1000, 4099, '曲美家居现代简约中式实木衣柜家用卧室衣帽柜小户型大容量储物柜', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN016X7OBv1qQT9EZzEnM_!!351855490.jpg', 9058.00, 35654302556, '4642975799268', NULL, 'ZQB/5-09ZC-WG2-G', '颜色分类:木本色+荷花白色;门数量:4门;是否组装:组装', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50015744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703830822914, 2061163777446449496, 2061163777447449496, 2519.00, 5480.00, 0.00, 1699, 820, 1699, '【新春价】曲美家居现代简约北欧风实木餐桌椅弯曲木工艺餐厅长方形流光餐桌', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01y20IO11qQTHtvzxc7_!!351855490.jpg', 7999.00, 742808696905, '5126544969424', NULL, 'HGHT-23E-WQM-DT1-1-M', '颜色分类:流光合观胡桃色餐桌1.4米（140*85*75）', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50001403, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703872765954, 2007439927555924591, 2007439927556924591, 5599.00, 1100.00, 0.00, 4174.56, 1424.44, 4174.56, '曲美家居现代极简奶油风水云纱岩板餐桌椅圆形家用耐脏耐高温', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01V7Ylrg1qQTH3pNKwd_!!351855490.jpg', 6699.00, 739470628236, '5100929608964', NULL, 'DS-QM23-T2&QM23-Y2*4', '颜色分类:奶油白-餐桌+麦冬色餐椅*4', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201846803, NULL, NULL, NULL, NULL, '2024-03-01 09:21:25', 'free', '途顺物流', 'ZS202402290006', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703918903297, 2006998315593924591, 2006998315594924591, 4399.00, 4093.00, 0.00, 3176.09, 1222.91, 3176.09, '曲美家居轻奢北欧风真皮床大象耳朵现代简约头层牛皮主卧室双人床', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01wZILk01qQTGJSFU8a_!!351855490.jpg', 8492.00, 647894947395, '4843935635738', NULL, 'ZH-PC-2-DS-F1-QM21-B6-15', '家具结构:框架结构;颜色分类:大地棕【摔纹头层牛皮+高寒松木实木框架】;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:21:24', 'express', '途顺物流', 'ZS202402290006', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703923097602, 2006998315593924591, 2006998315595924591, 3699.00, 3300.00, 0.00, 3091.13, 607.87, 3091.13, '曲美家居北欧轻奢头层真皮床简约现代靠包皮床主卧双人风琴皮床', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01S3RUej1qQTEtaid0X_!!351855490.jpg', 6999.00, 718137813711, '5012306653991', NULL, 'ZH-PC-2-DS-F1-QM23-B7-15', '家具结构:框架结构;颜色分类:贝壳白-风琴皮床;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461703969234945, 2007700098397924591, 2007700098398924591, 3799.00, 3200.00, 0.00, 2668.26, 1130.74, 2668.26, '【狂欢价】曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN01KzZHn11qQTFwqE3Rv_!!351855490.jpg', 6999.00, 718529179488, '5008041840338', NULL, 'ZH-PC-2-DS-F1-QM23-B1-18', '家具结构:框架结构;颜色分类:架子款-浅咖色【进口真皮+双层海绵+松木排骨架】;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:21:24', 'free', '途顺物流', 'ZS202402290006', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704015372290, 2064899246055440182, 2064899246056440182, 3679.00, 8320.00, 0.00, 2699, 980, 2699, '【新春价】曲美家居现代轻奢风真皮床悬浮床主卧室皮艺床钢琴键双人床新品', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01jyU0Ng1qQTGMHypZo_!!351855490.jpg', 11999.00, 713126886887, '4990180352770', NULL, 'ZH-PC-2-DS-F2-QM23-B6-18', '家具结构:框架结构;颜色分类:布朗橘-架子床【新西兰头层牛皮+加宽加厚钢木排骨架】;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:19:45', 'free', '天喜物流', 'ZS202402290005', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704069898242, 2038664427774676567, 2038664427775676567, 5899.00, 1100.00, 0.00, 2899, 3000, 2899, '曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01IYSTcR1qQTGJMsGee_!!351855490.jpg', 6999.00, 718529179488, '5059915352704', NULL, 'ZH-PC-2-DS-F2-QM23-B1-12', '家具结构:框架结构;颜色分类:架子款-奶油白【进口真皮+双层海绵+松木排骨架】;尺寸:1200mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:17:40', 'express', '乐达物流', '15710100741', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704069898243, 2038664427774676567, 2038664427776676567, 1199.00, 439.00, 0.00, 699, 500, 699, '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN011wto6a1qQTETBJZWf_!!351855490.jpg', 1638.00, 641634906618, '4902529397704', NULL, 'ZH-SF-04-DS-F9-QM20-NT3', '颜色分类:奶油白;安装方式:组装', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50001382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704166367234, 2038657407158676567, 2038657407159676567, 5899.00, 1100.00, 0.00, 2899, 3000, 2899, '曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01wAbM871qQTFyhkpZF_!!351855490.jpg', 6999.00, 718529179488, '5008041840337', NULL, 'ZH-PC-2-DS-F1-QM23-B1-15', '家具结构:框架结构;颜色分类:架子款-浅咖色【进口真皮+双层海绵+松木排骨架】;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704174755842, 2038657407158676567, 2038657407160676567, 1248.00, 499.00, 0.00, 748, 500, 748, '曲美家居现代简约风布艺床头柜储物抽屉置物柜主卧室大床配套家具', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01p64bTO1qQTI1j0r30_!!351855490.jpg', 1747.00, 659131151317, '5129480852960', NULL, 'ZH-SF-04-DS-F2-QM21A-NT10', '颜色分类:皓月床头柜-奶油黄;安装方式:组装', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50001382, NULL, NULL, NULL, NULL, '2024-03-01 09:17:39', 'express', '乐达物流', '15710100741', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704279613442, 3751666813998101868, 3751666813999101868, 2688.00, 3311.00, 0.00, 2140.03, 547.97, 2140.03, '【年货价】曲美家居北欧简约风岩板餐桌椅现代弯曲木工艺家用耐脏耐高温银河', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN01swqsTr1qQTHsVYgX3_!!351855490.jpg', 5999.00, 742646592404, '5297476963970', NULL, 'F2-HGHT-23E-WQM-D1*2', '颜色分类:银河合观胡桃+深灰色软包餐椅*2', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201846803, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704296390658, 3751666813998101868, 3751666814000101868, 3699.00, 2300.00, 0.00, 2944.94, 754.06, 2944.94, '【年货价】曲美家居北欧简约风岩板餐桌椅现代弯曲木工艺家用耐脏耐高温银河', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN01WP9iiG1qQTHrQZsID_!!351855490.jpg', 5999.00, 742646592404, '5125494417111', NULL, 'BSYB/HGHT-23E-WQM-DT1-1', '颜色分类:银河合观胡桃色岩板餐桌1.4米（140*85*75）', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201846803, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704296390659, 3751666813998101868, 3751826258001101868, 2688.00, 3311.00, 0.00, 2140.03, 547.97, 2140.03, '【年货价】曲美家居北欧简约风岩板餐桌椅现代弯曲木工艺家用耐脏耐高温银河', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN010rHwRQ1qQTHwuC4qU_!!351855490.jpg', 5999.00, 742646592404, '5297476963969', NULL, 'F1-HGHT-23E-WQM-D1*2', '颜色分类:银河合观胡桃+奶油白软包餐椅*2', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201846803, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704346722306, 2070368042942011797, 2070368042943011797, 7598.00, 2415.00, 0.00, 3898, 3700, 3898, '曲美家居轻奢北欧风真皮床大象耳朵现代简约头层牛皮主卧室双人床', 'https://img.alicdn.com/bao/uploaded/i3/351855490/O1CN01VxxKNw1qQTINTyuEp_!!351855490.jpg', 10013.00, 647894947395, '5154219589585', NULL, 'DS-F2-QM21-B6-18&DS-QM23-M1-18', '家具结构:框架结构;颜色分类:优雅驼-框架单床+舒星独袋弹簧乳胶床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:12:51', 'free', '鸿锦物流', 'ZS202402290002', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704401248258, 2069997063419011797, 2069997063420011797, 6989.00, 4010.00, 0.00, 3689, 3300, 3689, '曲美家居真皮床简约大气现代头层牛皮床主卧室床梦舟床新品', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01b23PSW1qQTKU052Bi-351855490.jpg', 10999.00, 746545542225, '5155221393264', NULL, 'DS-F1-QM23-B4-18&M1', '家具结构:框架结构;颜色分类:梦舟真皮床-烟灰色+M1舒星乳胶床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:12:51', 'free', '鸿锦物流', 'ZS202402290002', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704464162818, 3751815926798101868, 3751815926798101868, 7269.00, 2730.00, 0.00, 6189, 1080, 6189, '【年货价】曲美家居北欧简约真皮床轻奢高级温柔风主卧高脚左岸花园皮床新品', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01lkDQad1qQTHFhvbIH_!!351855490.jpg', 9999.00, 718529179488, '5094700576945', NULL, 'DS-F1-QM23-B1-15-PF&M2', '家具结构:框架结构;颜色分类:储物款-浅咖色 进口真皮软床+黑骑士M2黄麻乳胶床垫;尺寸:1500mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:09:59', 'express', '鸿锦物流', 'ZS202402280007', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704510300161, 3751351488928101868, 3751351488928101868, 3409.00, 3090.00, 0.00, 2599, 810, 2599, '【年货价】曲美家居防螨抑菌透气床垫独袋弹簧冰丝凝胶记忆棉晨风床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fabsPt1qQTGzdEp41_!!351855490.jpg', 6499.00, 736632074650, '5089940705378', NULL, 'ZH-PTCD-DS-QM23-M3-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧冰丝记忆棉床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122910003, NULL, NULL, NULL, NULL, '2024-03-01 09:09:59', 'express', '鸿锦物流', 'ZS202402280007', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704569020417, 3783658357934114317, 3783658357935114317, 5029.00, 7217.00, 0.00, 3889, 1140, 3889, '【新春价】曲美家居头层真皮床轻奢现代简约方糖皮床主卧室多功能储物大床', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN015pytH41qQTFYrOxep_!!351855490.jpg', 12246.00, 628280725946, '4804328073226', NULL, 'DS-F3-19-B12A-18&M1', '家具结构:框架结构;颜色分类:象牙米-头层牛皮软床+独袋弹簧乳胶床垫;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-03-01 09:07:28', 'free', '公正物流', 'ZS202402280008', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704619352065, 2060632237063982079, 2060632237064982079, 5609.00, 6990.00, 0.00, 4389, 1220, 4389, '【新春价】曲美家居头层真皮床轻奢现代简约方糖皮床主卧室多功能储物大床', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN0191oDG51qQTFb6gnpD_!!351855490.jpg', 12599.00, 628280725946, '5070181490185', NULL, 'DS-F2-19-B12A-18&M1&F9-NT3', '家具结构:框架结构;颜色分类:奶油白-头层牛皮软床+独袋弹簧乳胶床垫+床头柜;尺寸:1800mm*2000mm', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50020000, NULL, NULL, NULL, NULL, '2024-02-28 14:58:50', 'free', '鸿锦物流', '240200642', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704665489410, 3795882049191016603, 3795882049192016603, 1650.00, 1250.00, 0.00, 650, 1000, 650, '曲美家居现代简约北欧风实木餐桌椅弯曲木工艺餐厅家用长方形饭桌', 'https://img.alicdn.com/bao/uploaded/i2/351855490/O1CN01X92Eqa1qQTFk5IFJy_!!351855490.jpg', 2900.00, 559224240130, '5107358571813', NULL, '084-2017E-C1*2', '颜色分类:深橡色_餐椅*2', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 201855702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'WAIT_SELLER_SEND_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704707432449, 3784435093981632713, 3784435093982632713, 1459.00, 2540.00, 0.00, 969.15, 489.85, 969.15, '【新春价】曲美家居独袋弹簧天然乳胶床垫家用软硬厚床垫保护脊椎舒星床垫', 'https://img.alicdn.com/bao/uploaded/i1/351855490/O1CN01fpUhZz1qQTEwEVc7J_!!351855490.jpg', 3999.00, 35211712394, '5023489177233', NULL, 'ZH-PTCD-DS-QM23-M1-18', '尺寸:1800mm*2000mm;颜色分类:【升级款】独袋弹簧乳胶床垫', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 122920001, NULL, NULL, NULL, NULL, '2024-02-28 14:03:25', 'free', '顺丰速运', 'SF1692488490530', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);
INSERT INTO `tao_order_item` VALUES (1763461704749375490, 2069582342925177164, 2069582342926177164, 999.00, 400.00, 0.00, 499, 500, 499, '曲美家居现代轻奢简约床头柜床边高脚储物柜卧室置物储藏柜新品', 'https://img.alicdn.com/bao/uploaded/i4/351855490/O1CN013EULHJ1qQTGIVnYEx_!!351855490.jpg', 1399.00, 729110111184, '5222928542209', NULL, 'ZH-SF-04-DS-F2-QM23-NT2(R)', '颜色分类:象牙白-右;安装方式:组装', '', NULL, 1, NULL, NULL, 'false', 'false', 'B', 50001382, NULL, NULL, NULL, NULL, '2024-02-28 16:39:45', 'free', '顺心捷达', 'S20482782010', NULL, 'WAIT_BUYER_CONFIRM_GOODS', 'NO_REFUND', NULL, NULL);

-- ----------------------------
-- Table structure for tao_refund
-- ----------------------------
DROP TABLE IF EXISTS `tao_refund`;
CREATE TABLE `tao_refund`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退款id',
  `dispute_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)',
  `shop_id` int(0) NOT NULL COMMENT '店铺id',
  `tid` bigint(0) DEFAULT NULL COMMENT '淘宝交易单号（订单号）',
  `oid` bigint(0) DEFAULT NULL COMMENT '子订单号。如果是单笔交易oid会等于tid',
  `payment` float DEFAULT NULL COMMENT '支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `price` float DEFAULT NULL COMMENT '商品价格。',
  `total_fee` float DEFAULT NULL COMMENT '交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` float DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `split_seller_fee` float DEFAULT NULL COMMENT '	分账给卖家的钱',
  `split_taobao_fee` float DEFAULT NULL COMMENT '分账给淘宝的钱',
  `created` datetime(0) DEFAULT NULL COMMENT '退款申请时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime(0) DEFAULT NULL COMMENT '更新时间。格式:yyyy-MM-dd HH:mm:ss',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家昵称',
  `cs_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自\"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81\"',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '卖家收货地址',
  `advance_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;',
  `alipay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付宝交易号',
  `good_return_time` datetime(0) DEFAULT NULL COMMENT '退货时间。格式:yyyy-MM-dd HH:mm:ss',
  `good_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
  `has_good_return` int(0) DEFAULT NULL COMMENT '买家是否需要退货。可选值:true(是),false(否)',
  `num_iid` bigint(0) DEFAULT NULL COMMENT '申请退款的商品数字编号',
  `num` bigint(0) NOT NULL DEFAULT 0 COMMENT '退货数量',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品外部商家编码',
  `reason` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退款原因',
  `refund_phase` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退款阶段，可选值：onsale/aftersale',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).',
  `desc1` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退款说明',
  `company_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流公司',
  `sid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退货运单号',
  `send_time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '买家发货时间',
  `end_time` datetime(0) DEFAULT NULL COMMENT '	完结时间。格式:yyyy-MM-dd HH:mm:ss',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品标题',
  `sku` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品SKU信息',
  `buyer_open_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家openUid',
  `buyer_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家昵称',
  `combine_item_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组合品信息\r\nnum_iid	String	2342344	商品数字编号\r\nitem_name	String	测试商品	商品标题\r\nquantity	Number	123	数量\r\nsku_id	String	123	sku_id\r\nouter_iid	String	123	商家外部编码(可与商家外部系统对接)\r\nouter_sku_id	String	123	123',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1763489314208354305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tao_refund
-- ----------------------------
INSERT INTO `tao_refund` VALUES (1763489313897975810, '146260491851729431', 'REFUND', 1, 2040033794276723194, 2040033794277723194, 2599, NULL, 3299, 700, NULL, NULL, '2024-03-01 16:55:26', '2024-03-01 16:55:28', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, 647894947395, 1, NULL, '退运费', 'aftersale', NULL, '', NULL, NULL, NULL, NULL, '曲美家居轻奢北欧风真皮床大象耳朵现代简约头层牛皮主卧室双人床', '4769643316402|家具结构:框架结构;颜色分类:优雅驼【摔纹头层牛皮+高寒松木实木框架】;尺寸:1500mm*2000mm', 'AAFlHVMUAAJ_dKyzaDWkciTw', '虽然不变的', NULL, '2024-03-01 16:59:51', NULL, NULL, NULL);
INSERT INTO `tao_refund` VALUES (1763489314027999234, '146225568320729431', 'REFUND', 1, 2040035126089723194, 2040035126089723194, 0, NULL, 699, 699, NULL, NULL, '2024-03-01 16:40:02', '2024-03-01 16:40:03', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, 641634906618, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, NULL, '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4607887356857|颜色分类:轻奢黄;安装方式:组装', 'AAFlHVMUAAJ_dKyzaDWkciTw', '虽然不变的', NULL, '2024-03-01 16:59:51', NULL, NULL, NULL);
INSERT INTO `tao_refund` VALUES (1763489314166411265, '146258439944729431', 'REFUND', 1, 2040093409264723194, 2040093409264723194, 0, NULL, 699, 699, NULL, NULL, '2024-03-01 16:37:30', '2024-03-01 16:37:32', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, 641634906618, 1, NULL, '未按约定时间发货', 'onsale', NULL, '', NULL, NULL, NULL, NULL, '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4607887356857|颜色分类:轻奢黄;安装方式:组装', 'AAFlHVMUAAJ_dKyzaDWkciTw', '虽然不变的', NULL, '2024-03-01 16:59:51', NULL, NULL, NULL);
INSERT INTO `tao_refund` VALUES (1763489314208354305, '146186942152638745', 'REFUND', 1, 3669992569885634587, 3669992569885634587, 0, NULL, 5385.74, 5385.74, NULL, NULL, '2024-03-01 12:23:14', '2024-03-01 13:03:53', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, 688444892888, 1, NULL, '缺货', 'onsale', NULL, '', NULL, NULL, NULL, NULL, '【狂欢价】曲美家居现代简约轻奢布艺科技布懒人沙发客厅小户型意式羽绒沙发', '5081083851943|颜色分类:浅灰色-多人位右转角', 'AAE0HVMUAAJ_dKyzaDUX1w1-', 'mawenyan0876', NULL, '2024-03-01 16:59:51', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
