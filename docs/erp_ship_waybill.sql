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

 Date: 16/06/2024 18:29:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for erp_ship_waybill
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_waybill`;
CREATE TABLE `erp_ship_waybill`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `shop_type` int NOT NULL COMMENT '店铺类型',
  `waybill_code` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '快递单号',
  `logistics_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `print_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '打印数据',
  `status` int NULL DEFAULT NULL COMMENT '状态（1已取号2已打印3已发货）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发货电子面单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_waybill_account
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_waybill_account`;
CREATE TABLE `oms_tao_waybill_account`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `seller_id` bigint NULL DEFAULT NULL COMMENT '商家ID',
  `cp_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流服务商编码',
  `cp_type` int NULL DEFAULT NULL COMMENT '1是直营，2是加盟',
  `quantity` int NULL DEFAULT NULL COMMENT '可用单数',
  `allocated_quantity` int NULL DEFAULT NULL COMMENT '已用单数',
  `branch_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点ID',
  `branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网点名称',
  `print_quantity` int NULL DEFAULT NULL COMMENT '已经打印的面单总数',
  `cancel_quantity` int NULL DEFAULT NULL COMMENT '取消的面对总数',
  `waybill_address_id` bigint NULL DEFAULT NULL COMMENT 'waybill 地址记录ID(非地址库ID)',
  `province` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省名称（一级地址）',
  `city` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称（二级地址）',
  `area` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区名称（三级地址）',
  `address_detail` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `mobile` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货手机号',
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货固定电话',
  `is_show` int NULL DEFAULT NULL COMMENT '是否前台显示1显示0不显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝电子面单账户信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
