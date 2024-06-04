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

 Date: 04/06/2024 14:46:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for erp_goods
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods`;
CREATE TABLE `erp_goods`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '商品图片地址',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '商品编号',
  `unit_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '单位名称',
  `category_id` int(0) DEFAULT 0 COMMENT '商品分类ID',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '条码',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态1销售中2已下架',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长/裙长/裤长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度/袖长',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度/胸阔(围)',
  `width1` float NOT NULL DEFAULT 0 COMMENT '肩阔',
  `width2` float NOT NULL DEFAULT 0 COMMENT '腰阔',
  `width3` float NOT NULL DEFAULT 0 COMMENT '臀阔',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  `disable` tinyint(1) DEFAULT 0 COMMENT '0启用   1禁用',
  `period` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '保质期',
  `pur_price` decimal(8, 2) DEFAULT 0.00 COMMENT '预计采购价格',
  `whole_price` decimal(8, 2) DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) DEFAULT NULL COMMENT '单位成本',
  `supplier_id` int(0) DEFAULT 0 COMMENT '供应商id',
  `brand_id` int(0) DEFAULT 0 COMMENT '品牌id',
  `attr1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '属性1：季节',
  `attr2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '属性2：分类',
  `attr3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '属性3：风格',
  `attr4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '属性4：年份',
  `attr5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '属性5：面料',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '外链url',
  `low_qty` int(0) DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int(0) DEFAULT 0 COMMENT '最高库存（预警）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `number`(`number`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品库存管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods
-- ----------------------------
INSERT INTO `erp_goods` VALUES (9, 'HN8026牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN8026.jpg', 'HN8026', '', 27, '', '80-130斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (10, 'HN858牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN858.jpg', 'HN858', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 20.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (11, 'HN608牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN608.jpg', 'HN608', '', 27, '', '建议80-120斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (12, 'HN270牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN270.jpg', 'HN270', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (13, '681直筒拖地牛仔裤夏款', 'https://cbu01.alicdn.com/img/ibank/O1CN01qHvRwi2FOyGhhNR4M_!!2208857268871-0-cib.jpg', 'HN681', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 49.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (14, '708灰色牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN011fcYH72FOyGTbaYJO_!!2208857268871-0-cib.jpg', 'HN708', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 24.00, 0.00, 40.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (15, '661高腰复古牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rXl5A92FOyBlp8KB2_!!2208857268871-0-cib.jpg', 'HN661', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 49.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (16, '678高腰直筒开叉拖地牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01adpyGm2FOyBpyqNJ5_!!2208857268871-0-cib.jpg', 'HN678', '', 28, '', '建议80-125斤', 1, 97, 0, 0, 0, 66, 93.5, 0, 0, '', 29.00, 0.00, 59.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (17, '抽绳修身短袖T恤', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', '0320220801', '', 3, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 12.00, 0.00, 12.00, NULL, 28, 0, '夏季', '', '', '2022', '棉', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (18, 'HN0014前开叉微喇叭牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01kdGpaF2FOyFHMzMrK_!!2208857268871-0-cib.jpg', 'HN0014', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 32.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (19, 'HN025紧身毛边小脚铅笔裤', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 'HN025', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (20, 'HN029小脚九分铅笔裤弹力紧身', 'https://cbu01.alicdn.com/img/ibank/O1CN01ptoyH92FOyCPES9l4_!!2208857268871-0-cib.jpg', 'HN029', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (21, 'HN0015裤脚开叉牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01xcpzIU2FOyBl2dOl6_!!2208857268871-0-cib.jpg', 'HN015', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (22, 'HN0020九分铅笔小脚裤子', 'https://cbu01.alicdn.com/img/ibank/O1CN01hMirkD2FOyA8dH5gg_!!2208857268871-0-cib.jpg', 'HN020', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (23, 'HN0024小脚裤弹力九分铅笔牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01pMo6Nw2FOyH7h62R2_!!2208857268871-0-cib.jpg', 'HN024', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (24, 'HN0012竖条纹阔腿牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01fNcjNj2FOyFLNrkHL_!!2208857268871-0-cib.jpg', 'HN012', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 49.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (25, 'OXN691中腰薄款破洞七分小脚裤', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 'OXN0691', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 79.00, NULL, 29, 0, '春秋季', '裤子', '瑞丽', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (26, 'HN0630松紧腰九分老爹哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01emC4ZW2FOyCPWDBJP_!!2208857268871-0-cib.jpg', 'HN0630', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (27, 'HN023小直筒牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01oWnpE72FOyGvFmm8P_!!2208857268871-0-cib.jpg', 'HN023', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (28, 'HN670高腰哈伦牛仔裤', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 'HN670', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (29, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 'HNP182', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 21.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (30, 'HN672微喇牛仔裤女', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 'HN672', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (31, 'HN801九分哈伦萝卜老爹裤', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 'HN801', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 28.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (32, 'HN697双扣后松紧高腰宽松萝卜牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 'HN697', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (33, 'HN0801高腰弹力直筒哈伦老爹萝卜裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 'HN0801', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 25.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (34, 'HN621高腰直筒宽松破洞牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 'HN621', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (35, 'HN662高腰直筒牛仔裤女泫雅bf风小雏菊绣花', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 'HN662', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (36, 'HN692松紧高腰宽松直筒萝卜哈伦九分裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 'HN692', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (37, 'HN106高腰弹力紧身小脚九分铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 'HN106', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (38, 'HN663高腰阔腿裤宽松直筒爱心刺绣拖地长裤潮', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 'HN663', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (39, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 'HN022', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (40, 'HN668高腰哈伦松紧腰小个子束脚老爹九分裤子', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 'HN668', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (41, 'HN667可调节高腰直筒牛仔裤女', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 'HN667', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (42, 'HN222高腰宽松阔腿牛仔裤', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 'HN222', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (43, 'HN694半松紧高腰牛仔裤老爹裤', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 'HN694', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (44, 'HN660高腰直筒牛仔裤女腰围可调春秋季', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 'HN660', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (45, 'HN686牛仔裤女宽松vibe风', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 'HN686', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (46, 'HN021豹纹加绒牛仔裤女铅笔小脚裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 'HN021', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '冬季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (47, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 'JKL805', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 5.00, 69.00, NULL, 31, 0, '不分季节', '', '', '2022', '棉85% 聚酯纤维6.5% 再生纤维素纤维8.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (48, 'HN180高腰牛仔裤女秋季九分老爹裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 'HN180', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (49, 'JKL9098哈伦裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9098.jpg', 'JKL9098', '', 30, '', '有弹力', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 48.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '', '', '2022', '棉72% 聚酯纤维25.5% 氨纶2.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (53, 'JKL9907小直筒烟管裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9907.jpg', 'JKL9907', '', 32, '', '建议80-140斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '微弹', '高腰', '2022', '棉72% 聚酯纤维25.5% 氨纶2.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (54, 'JKL6010松紧腰哈伦裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6010.jpg', 'JKL6010', '', 30, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 43.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '70%棉     20%聚酯纤维     10%再生纤维素纤维', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (55, 'JKL906阔腿牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL906.jpg', 'JKL906', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85% 聚酯纤维6.5% 再生纤维素纤维8.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (56, 'JKL9977喇叭牛仔裤锁边', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/9977.jpg', 'JKL9977', '', 29, '', '建议70-145斤', 1, 99, 0, 0, 103, 58, 75, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (59, 'JKL9978喇叭牛仔裤毛边', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/9978.jpg', 'JKL9978', '', 29, '', '建议70-145斤', 1, 99, 0, 0, 103, 58, 75, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (60, 'JKL9950高腰阔腿直筒牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9950_11.jpg', 'JKL9950', '', 28, '', '建议70-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 46.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (61, 'JKL8990高腰阔腿牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL8990.jpg', 'JKL8990', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 43.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉93.6% 粘纤4.7% 聚酯纤维1.7%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (62, 'JKL9938牛仔微喇裤裤脚开叉', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 'JKL9938', '', 29, '', '建议70-150斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 44.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '高弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (63, 'JKL6001小脚牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 'JKL6001', '', 31, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '棉：98% 氨纶：2%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (64, 'JKL9909开叉微喇叭裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 'JKL9909', '', 29, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '高弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (65, 'GZYYZ7277复古显瘦灯芯绒a字半身裙', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg', 'GZYYZ7277', '', 8, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 54.00, 0.00, 79.00, NULL, 32, 0, '不分季节', '无弹', '高腰', '2022', '棉，涤纶（聚酯纤维）', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (66, 'JKL1973复古蓝哈伦牛仔裤长裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 'JKL1973', '', 30, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 44.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85%再生纤维素纤维8.5%聚酯纤维6.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (67, 'JKL1951阔腿长裤加长裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 'JKL1951', '', 28, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85%再生纤维素纤维8.5%聚酯纤维6.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (68, 'JKL3112松紧腰束脚哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 'JKL3112', '', 30, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 69.00, NULL, 31, 0, '春秋季', '无弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (69, 'KH9734微喇叭牛仔裤女开叉', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 'KH9734', '', 29, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 39.00, 0.00, 69.00, NULL, 33, 0, '春秋季', '高弹', '高腰', '2022', '69%棉  29.5%聚酯纤维 1.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (70, 'KH9826小脚牛仔裤女', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 'KH9826', '', 31, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 79.00, NULL, 33, 0, '春秋季', '中弹', '高腰', '2022', '69%棉  29.5%聚酯纤维 1.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (71, 'aaa', 'aaa', 'aaaaa', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12.00, 0.00, 0.00, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-01-14 21:52:30', NULL, NULL);
INSERT INTO `erp_goods` VALUES (74, '测试测试', 'http://localhost:8080/preview/images/47', 'A0012D', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12.00, 0.00, 0.00, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-01-16 10:34:33', NULL, NULL);

-- ----------------------------
-- Table structure for erp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_attribute`;
CREATE TABLE `erp_goods_attribute`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint(0) DEFAULT 0 COMMENT '商品id',
  `attribute_id` int(0) DEFAULT NULL COMMENT '属性id',
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性名',
  `value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_goods_attribute_config
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_attribute_config`;
CREATE TABLE `erp_goods_attribute_config`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int(0) DEFAULT NULL COMMENT '分类id（0为所有共用）',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性名',
  `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '商品属性表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_attribute_config
-- ----------------------------
INSERT INTO `erp_goods_attribute_config` VALUES (1, 1, '年份', '2022,2023');
INSERT INTO `erp_goods_attribute_config` VALUES (2, 1, '季节', '春季,夏季,秋季,冬季');

-- ----------------------------
-- Table structure for erp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_brand`;
CREATE TABLE `erp_goods_brand`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '品牌名',
  `status` int(0) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_brand
-- ----------------------------
INSERT INTO `erp_goods_brand` VALUES (1, '梦小妮', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');

-- ----------------------------
-- Table structure for erp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category`;
CREATE TABLE `erp_goods_category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `parent_id` int(0) DEFAULT NULL COMMENT '上架分类id',
  `path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `sort` int(0) DEFAULT 0 COMMENT '排序值',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片',
  `isDelete` tinyint(1) DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_category
-- ----------------------------
INSERT INTO `erp_goods_category` VALUES (1, 'NVZHUANG', '女装', NULL, 0, '0', 0, '', 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (2, 'MAOYI', '毛衣/针织衫', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (3, 'TXU', 'T恤', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (4, 'LIANYIQUN', '连衣裙', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (5, 'XIUXIANKU', '休闲裤', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (6, 'WAITAO', '外套', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (7, 'ZHENZHIPJ', '内衣/背心', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (8, 'SUOZHI', '半身裙', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (9, NULL, '衬衫', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (10, NULL, '箱包', NULL, 0, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (11, NULL, '双肩包', NULL, 10, '0|10', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (12, NULL, '单肩包', NULL, 10, '0|10', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (13, NULL, '套装', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (14, NULL, '短裙', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (15, NULL, '半身裙', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (16, NULL, '连衣裙', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (17, NULL, '针织裤', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (18, NULL, '针织短裙', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (19, NULL, '针织外套', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (20, NULL, '针织背心', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (21, NULL, 'T恤衫', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (22, NULL, '梭织衬衫', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (23, 'BAIHUO', '百货', NULL, 0, '0', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (24, NULL, '调味调料', NULL, 23, '0|23', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (25, NULL, '小百货', NULL, 23, '0|23', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (26, 'NIUZAI', '牛仔裤', NULL, 1, '0|1|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (27, NULL, '牛仔短裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (28, NULL, '阔腿裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (29, NULL, '喇叭裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (30, NULL, '哈伦裤', '哈伦萝卜老爹裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (31, NULL, '铅笔裤', '小脚裤、紧身裤、铅笔裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (32, NULL, '直筒裤', '小直筒烟管裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (33, NULL, '背带裤', '', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);

-- ----------------------------
-- Table structure for erp_goods_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute`;
CREATE TABLE `erp_goods_category_attribute`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int(0) NOT NULL,
  `type` int(0) NOT NULL DEFAULT 0 COMMENT '类型：0属性1规格',
  `title` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '\'属性名\'',
  `code` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '固定值color颜色size尺码style款式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_category_attribute
-- ----------------------------
INSERT INTO `erp_goods_category_attribute` VALUES (114, 1, 1, '颜色', 'color');
INSERT INTO `erp_goods_category_attribute` VALUES (115, 1, 1, '尺码', 'size');
INSERT INTO `erp_goods_category_attribute` VALUES (116, 1, 1, '款式', 'style');

-- ----------------------------
-- Table structure for erp_goods_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute_value`;
CREATE TABLE `erp_goods_category_attribute_value`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键，属性值id',
  `category_attribute_id` int(0) DEFAULT NULL COMMENT '属性id',
  `value` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '属性值文本',
  `sku_code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成SKU的编码',
  `orderNum` int(0) DEFAULT 0,
  `isDelete` int(0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 424 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_category_attribute_value
-- ----------------------------
INSERT INTO `erp_goods_category_attribute_value` VALUES (308, 114, '黑色', '01', 999, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (309, 114, '米杏', '02', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (310, 114, '芒果黄', '03', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (311, 114, '中花灰', '04', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (312, 114, '浅杏', '05', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (313, 114, '中粉', '06', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (314, 114, '烟灰色', '07', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (315, 114, '秋香绿', '08', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (316, 114, '花兰', '09', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (317, 114, '杏色', '10', 698, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (318, 114, '芥黄', '11', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (319, 114, '深蓝色', '12', 993, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (320, 114, '大红', '13', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (321, 114, '彩兰', '14', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (322, 114, '白色', '15', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (323, 114, '花米驼', '16', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (324, 114, '粉红', '17', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (325, 114, '黄杏', '18', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (326, 114, '橙红', '19', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (327, 114, '木绿', '20', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (328, 114, '草绿', '21', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (329, 114, '早红', '22', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (330, 114, '咖啡', '23', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (331, 114, '灰色', '24', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (332, 114, '浅绿', '25', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (333, 114, '大红色', '26', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (334, 114, '桔色', '27', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (335, 114, '卡其', '28', 992, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (336, 114, '蓝灰色', '29', 996, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (337, 114, '湖蓝', '30', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (338, 114, '咖啡色', '31', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (339, 114, '蓝绿', '32', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (340, 115, '均码', '00', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (341, 115, 'S', '01', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (342, 115, 'M', '02', 87, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (343, 115, 'L', '03', 86, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (344, 115, 'XL', '04', 85, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (345, 115, '2XL', '05', 84, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (346, 115, '3XL', '06', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (347, 115, '4XL', '07', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (348, 115, '5XL', '08', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (349, 114, '雾霾蓝', '33', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (350, 114, '浅粉红', '34', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (351, 114, '蓝色', '35', 998, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (352, 114, '花色', '36', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (353, 114, '香槟色', '37', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (354, 114, '紫色', '38', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (355, 114, '砖红色', '39', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (356, 114, '复古蓝', '40', 995, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (357, 114, '烟灰', '41', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (358, 114, '橙黄', '42', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (359, 114, '黄色', '43', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (360, 114, '梅子色', '56', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (361, 114, '浅蓝色', '50', 994, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (362, 114, '宝蓝色', '44', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (363, 114, '浅黄', '45', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (364, 114, '浅紫', '49', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (365, 114, '酒红', '57', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (366, 114, '米白', '47', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (367, 114, '复古蓝九分', '48', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (368, 114, '卡灰', '51', 992, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (369, 114, '玫红', '52', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (370, 114, '彩蓝', '53', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (371, 114, '青蓝淡黄', '54', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (372, 114, '紫白', '55', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (373, 114, '碳灰', '58', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (374, 114, '深蓝色加绒', '59', 794, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (375, 114, '深紫色', '60', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (376, 114, '橙色', '61', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (377, 114, '墨绿色', '62', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (378, 114, '桃粉色', '63', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (379, 114, '蓝灰色九分', '64', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (380, 114, '黑色九分', '65', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (381, 114, '新洋米', '67', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (382, 114, '藏蓝色', '68', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (383, 114, '深蓝九分', '69', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (384, 114, '深蓝长款', '70', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (385, 114, '米白色', '71', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (386, 114, '军绿色', '72', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (387, 114, '柠檬黄', '73', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (388, 114, '灰紫', '74', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (389, 114, '黑灰色', '75', 997, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (390, 114, '焦糖红', '76', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (391, 114, '酱紫', '78', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (392, 114, '红杏', '46', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (393, 114, '银灰', '79', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (394, 115, 'XS', '09', 89, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (395, 114, '无色', '00', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (396, 114, '条纹', '80', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (397, 114, '花色/彩色', '81', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (398, 114, '波点', '82', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (399, 114, '字母', '83', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (400, 114, '绿色', '84', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (401, 115, '25', '25', 69, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (402, 115, '26', '26', 68, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (403, 115, '27', '27', 67, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (404, 115, '28', '28', 66, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (405, 115, '29', '29', 65, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (406, 115, '30', '30', 64, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (407, 115, '31', '31', 63, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (408, 115, '32', '32', 62, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (409, 114, '黑色加绒', '101', 799, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (410, 114, '黑灰色加绒', '175', 798, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (411, 114, '蓝灰色加绒', '129', 797, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (412, 114, '复古蓝加绒', '140', 796, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (413, 114, '浅蓝色加绒', '150', 795, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (414, 116, '默认', NULL, 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (415, 116, '加长裤', 'JC', 66, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (416, 116, '长裤', 'CK', 68, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (417, 116, '九分', 'JF', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (418, 116, '八分', 'BF', 86, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (419, 116, '九分加绒', 'JFR', 87, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (420, 116, '单裤', 'D', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (421, 116, '加绒', 'R', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (422, 116, '长裤加绒', 'CR', 65, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (423, 116, '加长裤加绒', 'JCR', 67, 0);

-- ----------------------------
-- Table structure for erp_goods_img
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_img`;
CREATE TABLE `erp_goods_img`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(0) DEFAULT 0 COMMENT '商品Id',
  `type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '图片url',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '图片说明',
  `sort` int(0) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_goods_inventory
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_inventory`;
CREATE TABLE `erp_goods_inventory`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `goodsId` int(0) NOT NULL COMMENT '商品id',
  `goodsNumber` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品编码',
  `specId` int(0) NOT NULL COMMENT '商品规格id',
  `specNumber` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码（唯一）',
  `currentQty` bigint(0) NOT NULL DEFAULT 0 COMMENT '当前库存',
  `lockedQty` bigint(0) NOT NULL DEFAULT 0 COMMENT '锁定库存',
  `isDelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `updateTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `updateBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIdIndex`(`specId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_inventory
-- ----------------------------
INSERT INTO `erp_goods_inventory` VALUES (6, 9, 'HN8026', 32, '2720210080260105', 6, 0, 0, '2024-01-16 14:51:50', 'admin', '2024-05-03 10:56:38', 'admin');
INSERT INTO `erp_goods_inventory` VALUES (7, 68, 'JKL3112', 1327, 'JKL31120705', 11, 0, 0, '2024-05-25 10:20:55', 'admin', '2024-05-25 10:36:15', 'admin');

-- ----------------------------
-- Table structure for erp_goods_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_inventory_detail`;
CREATE TABLE `erp_goods_inventory_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `inventoryId` bigint(0) NOT NULL COMMENT '商品库存id',
  `inQty` int(0) NOT NULL DEFAULT 0 COMMENT '入库数量',
  `originQty` bigint(0) NOT NULL COMMENT '入库前数量',
  `currentQty` bigint(0) NOT NULL DEFAULT 0 COMMENT '当前库存数量',
  `purPrice` double DEFAULT 0 COMMENT '采购价',
  `entryId` bigint(0) NOT NULL COMMENT '入库单id',
  `entryItemId` bigint(0) NOT NULL COMMENT '入库单itemId',
  `remark` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `specId` int(0) NOT NULL COMMENT '规格id',
  `goodsId` int(0) NOT NULL COMMENT '商品id',
  `inLocation` int(0) NOT NULL COMMENT '入库仓位id',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `createBy` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_inventory_detail
-- ----------------------------
INSERT INTO `erp_goods_inventory_detail` VALUES (7, 6, 10, 0, 6, NULL, 8, 4, NULL, 32, 9, 20, '2024-01-16 14:51:50', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (8, 7, 1, 0, 1, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:20:55', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (9, 7, 1, 1, 2, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:22:35', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (10, 7, 2, 2, 4, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:25:47', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (11, 7, 2, 4, 6, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:28:36', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (12, 7, 2, 6, 8, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:33:18', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (13, 7, 2, 8, 10, NULL, 1794181606514589698, 1794181606552338400, NULL, 1327, 68, 20, '2024-05-25 10:35:52', 'admin');
INSERT INTO `erp_goods_inventory_detail` VALUES (14, 7, 1, 10, 11, NULL, 1794181606514589698, 1794181606552338433, NULL, 1327, 68, 20, '2024-05-25 10:36:15', 'admin');

-- ----------------------------
-- Table structure for erp_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec`;
CREATE TABLE `erp_goods_spec`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint(0) NOT NULL COMMENT '商品id',
  `spec_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '规格名',
  `spec_num` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规格编码',
  `color_id` int(0) DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '颜色图片',
  `size_id` int(0) DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '尺码值',
  `style_id` int(0) DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '款式值',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '库存条形码',
  `pur_price` decimal(8, 2) DEFAULT 0.00 COMMENT '预计采购价',
  `whole_price` decimal(8, 2) DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) DEFAULT 0.00 COMMENT '单位成本',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '' COMMENT '备注',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态',
  `low_qty` int(0) DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int(0) DEFAULT 0 COMMENT '最高库存（预警）',
  `disable` tinyint(1) DEFAULT 0 COMMENT '0启用   1禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `number`(`spec_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1372 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '商品规格库存管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_spec
-- ----------------------------
INSERT INTO `erp_goods_spec` VALUES (23, 9, '', '2720210080260001', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (24, 9, '', '2720210080260002', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (25, 9, '', '2720210080260003', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (26, 9, '', '2720210080260004', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (27, 9, '', '2720210080260005', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (28, 9, '', '2720210080260101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (29, 9, '', '2720210080260102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (30, 9, '', '2720210080260103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (31, 9, '', '2720210080260104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (32, 9, '', '2720210080260105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (33, 9, '', '2720210080260201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (34, 9, '', '2720210080260202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (35, 9, '', '2720210080260203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (36, 9, '', '2720210080260204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (37, 9, '', '2720210080260205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (38, 9, '', '2720210080260301', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (39, 9, '', '2720210080260302', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (40, 9, '', '2720210080260303', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (41, 9, '', '2720210080260304', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (42, 9, '', '2720210080260305', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (43, 10, '', '27202208580101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (44, 10, '', '27202208580102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (45, 10, '', '27202208580103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (46, 10, '', '27202208580104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (47, 10, '', '27202208580105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (48, 10, '', '27202208580201', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (49, 10, '', '27202208580202', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (50, 10, '', '27202208580203', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (51, 10, '', '27202208580204', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (52, 10, '', '27202208580205', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (53, 10, '', '27202208580301', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (54, 10, '', '27202208580302', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (55, 10, '', '27202208580303', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (56, 10, '', '27202208580304', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (57, 10, '', '27202208580305', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (58, 11, '', '27202206080101', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (59, 11, '', '27202206080102', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (60, 11, '', '27202206080103', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (61, 11, '', '27202206080104', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (62, 11, '', '27202206080105', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (63, 11, '', '27202206080201', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (64, 11, '', '27202206080202', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (65, 11, '', '27202206080203', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (66, 11, '', '27202206080204', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (67, 11, '', '27202206080205', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (68, 11, '', '27202206080301', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (69, 11, '', '27202206080302', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (70, 11, '', '27202206080303', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (71, 11, '', '27202206080304', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (72, 11, '', '27202206080305', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (73, 11, '', '27202206080401', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (74, 11, '', '27202206080402', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (75, 11, '', '27202206080403', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (76, 11, '', '27202206080404', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (77, 11, '', '27202206080405', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (78, 11, '', '27202206080501', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (79, 11, '', '27202206080502', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (80, 11, '', '27202206080503', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (81, 11, '', '27202206080504', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (82, 11, '', '27202206080505', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (83, 12, '', '27202202700101', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (84, 12, '', '27202202700102', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (85, 12, '', '27202202700103', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (86, 12, '', '27202202700104', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (87, 12, '', '27202202700105', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (88, 13, '', '28202206810101', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (89, 13, '', '28202206810102', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (90, 13, '', '28202206810103', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (91, 13, '', '28202206810104', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (92, 13, '', '28202206810105', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (93, 13, '', '28202206810201', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (94, 13, '', '28202206810202', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (95, 13, '', '28202206810203', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (96, 13, '', '28202206810204', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (97, 13, '', '28202206810205', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (98, 13, '', '28202206810301', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (99, 13, '', '28202206810302', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (100, 13, '', '28202206810303', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (101, 13, '', '28202206810304', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (102, 13, '', '28202206810305', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (103, 14, '', '27202207080101', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (104, 14, '', '27202207080102', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (105, 14, '', '27202207080103', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (106, 14, '', '27202207080104', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (107, 14, '', '27202207080105', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (108, 14, '', '27202207080201', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (109, 14, '', '27202207080202', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (110, 14, '', '27202207080203', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (111, 14, '', '27202207080204', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (112, 14, '', '27202207080205', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (113, 14, '', '27202207080301', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (114, 14, '', '27202207080302', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (115, 14, '', '27202207080303', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (116, 14, '', '27202207080304', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (117, 14, '', '27202207080305', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (118, 15, '', '28202106610101', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (119, 15, '', '28202106610102', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (120, 15, '', '28202106610103', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (121, 15, '', '28202106610104', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (122, 15, '', '28202106610105', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (123, 15, '', '28202106610201', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (124, 15, '', '28202106610202', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (125, 15, '', '28202106610203', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (126, 15, '', '28202106610204', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (127, 15, '', '28202106610205', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (128, 15, '', '28202106610301', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (129, 15, '', '28202106610302', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (130, 15, '', '28202106610303', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (131, 15, '', '28202106610304', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (132, 15, '', '28202106610305', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (133, 15, '', '28202106610401', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (134, 15, '', '28202106610402', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (135, 15, '', '28202106610403', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (136, 15, '', '28202106610404', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (137, 15, '', '28202106610405', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (138, 15, '', '28202106610501', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (139, 15, '', '28202106610502', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (140, 15, '', '28202106610503', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (141, 15, '', '28202106610504', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (142, 15, '', '28202106610505', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (143, 15, '', '28202106610601', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (144, 15, '', '28202106610602', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (145, 15, '', '28202106610603', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (146, 15, '', '28202106610604', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (147, 15, '', '28202106610605', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (148, 15, '', '28202106610701', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (149, 15, '', '28202106610702', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (150, 15, '', '28202106610703', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (151, 15, '', '28202106610704', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (152, 15, '', '28202106610705', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (153, 15, '', '28202106610801', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (154, 15, '', '28202106610802', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (155, 15, '', '28202106610803', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (156, 15, '', '28202106610804', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (157, 15, '', '28202106610805', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (158, 16, '', '28202106780001', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (159, 16, '', '28202106780002', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (160, 16, '', '28202106780003', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (161, 16, '', '28202106780004', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (162, 16, '', '28202106780005', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (163, 17, '', '03202208010101', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (164, 17, '', '03202208010102', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (165, 17, '', '03202208010103', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (166, 17, '', '03202208010104', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (167, 17, '', '03202208010201', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (168, 17, '', '03202208010202', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (169, 17, '', '03202208010203', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (170, 17, '', '03202208010204', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (171, 17, '', '03202208010301', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (172, 17, '', '03202208010302', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (173, 17, '', '03202208010303', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (174, 17, '', '03202208010304', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (175, 17, '', '03202208010401', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (176, 17, '', '03202208010402', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (177, 17, '', '03202208010403', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (178, 17, '', '03202208010404', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (179, 18, '', 'HN202200140101', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (180, 18, '', 'HN202200140102', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (181, 18, '', 'HN202200140103', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (182, 18, '', 'HN202200140104', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (183, 18, '', 'HN202200140105', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (184, 18, '', 'HN202200140201', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (185, 18, '', 'HN202200140202', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (186, 18, '', 'HN202200140203', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (187, 18, '', 'HN202200140204', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (188, 18, '', 'HN202200140205', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (189, 18, '', 'HN202200140301', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (190, 18, '', 'HN202200140302', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (191, 18, '', 'HN202200140303', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (192, 18, '', 'HN202200140304', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (193, 18, '', 'HN202200140305', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (194, 19, '', 'HN202200250125', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (195, 19, '', 'HN202200250126', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (196, 19, '', 'HN202200250107', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (197, 19, '', 'HN202200250128', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (198, 19, '', 'HN202200250129', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (199, 19, '', 'HN202200250130', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (200, 19, '', 'HN202200250131', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (201, 19, '', 'HN202200250132', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (202, 19, '', 'HN202200250225', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (203, 19, '', 'HN202200250226', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (204, 19, '', 'HN202200250227', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (205, 19, '', 'HN202200250228', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (206, 19, '', 'HN202200250229', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (207, 19, '', 'HN202200250230', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (208, 19, '', 'HN202200250231', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (209, 19, '', 'HN202200250232', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (210, 19, '', 'HN202200250325', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (211, 19, '', 'HN202200250326', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (212, 19, '', 'HN202200250327', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (213, 19, '', 'HN202200250328', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (214, 19, '', 'HN202200250329', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (215, 19, '', 'HN202200250330', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (216, 19, '', 'HN202200250331', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (217, 19, '', 'HN202200250332', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (218, 19, '', 'HN202200250425', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (219, 19, '', 'HN202200250426', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (220, 19, '', 'HN202200250427', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (221, 19, '', 'HN202200250428', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (222, 19, '', 'HN202200250429', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (223, 19, '', 'HN202200250430', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (224, 19, '', 'HN202200250431', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (225, 19, '', 'HN202200250432', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (226, 20, '', 'HN202200290125', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (227, 20, '', 'HN202200290126', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (228, 20, '', 'HN202200290127', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (229, 20, '', 'HN202200290128', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (230, 20, '', 'HN202200290129', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (231, 20, '', 'HN202200290130', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (232, 20, '', 'HN202200290131', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (233, 20, '', 'HN202200290132', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (234, 20, '', 'HN202200290225', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (235, 20, '', 'HN202200290226', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (236, 20, '', 'HN202200290227', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (237, 20, '', 'HN202200290228', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (238, 20, '', 'HN202200290229', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (239, 20, '', 'HN202200290230', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (240, 20, '', 'HN202200290231', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (241, 20, '', 'HN202200290232', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (242, 20, '', 'HN202200290325', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (243, 20, '', 'HN202200290326', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (244, 20, '', 'HN202200290327', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (245, 20, '', 'HN202200290328', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (246, 20, '', 'HN202200290329', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (247, 20, '', 'HN202200290330', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (248, 20, '', 'HN202200290331', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (249, 20, '', 'HN202200290332', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (250, 21, '', 'HN202200150125', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (251, 21, '', 'HN202200150126', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (252, 21, '', 'HN202200150127', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (253, 21, '', 'HN202200150128', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (254, 21, '', 'HN202200150129', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (255, 21, '', 'HN202200150130', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (256, 21, '', 'HN202200150225', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (257, 21, '', 'HN202200150226', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (258, 21, '', 'HN202200150227', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (259, 21, '', 'HN202200150228', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (260, 21, '', 'HN202200150229', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (261, 21, '', 'HN202200150230', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (262, 21, '', 'HN202200150325', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (263, 21, '', 'HN202200150326', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (264, 21, '', 'HN202200150327', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (265, 21, '', 'HN202200150328', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (266, 21, '', 'HN202200150329', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (267, 21, '', 'HN202200150330', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (268, 22, '', 'HN202200200125', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (269, 22, '', 'HN202200200126', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (270, 22, '', 'HN202200200127', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (271, 22, '', 'HN202200200128', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (272, 22, '', 'HN202200200129', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (273, 22, '', 'HN202200200130', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (274, 22, '', 'HN202200200131', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (275, 22, '', 'HN202200200132', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (276, 22, '', 'HN202200200225', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (277, 22, '', 'HN202200200226', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (278, 22, '', 'HN202200200227', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (279, 22, '', 'HN202200200228', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (280, 22, '', 'HN202200200229', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (281, 22, '', 'HN202200200230', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (282, 22, '', 'HN202200200231', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (283, 22, '', 'HN202200200232', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (284, 22, '', 'HN202200200325', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (285, 22, '', 'HN202200200326', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (286, 22, '', 'HN202200200327', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (287, 22, '', 'HN202200200328', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (288, 22, '', 'HN202200200329', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (289, 22, '', 'HN202200200330', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (290, 22, '', 'HN202200200331', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (291, 22, '', 'HN202200200332', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (292, 22, '', 'HN202200200425', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (293, 22, '', 'HN202200200426', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (294, 22, '', 'HN202200200427', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (295, 22, '', 'HN202200200428', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (296, 22, '', 'HN202200200429', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (297, 22, '', 'HN202200200430', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (298, 22, '', 'HN202200200431', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (299, 22, '', 'HN202200200435', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (300, 23, '', 'HN202200240125', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (301, 23, '', 'HN202200240126', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (302, 23, '', 'HN202200240127', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (303, 23, '', 'HN202200240128', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (304, 23, '', 'HN202200240129', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (305, 23, '', 'HN202200240130', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (306, 23, '', 'HN202200240131', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (307, 23, '', 'HN202200240132', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (308, 23, '', 'HN202200240225', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (309, 23, '', 'HN202200240226', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (310, 23, '', 'HN202200240227', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (311, 23, '', 'HN202200240228', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (312, 23, '', 'HN202200240229', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (313, 23, '', 'HN202200240230', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (314, 23, '', 'HN202200240231', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (315, 23, '', 'HN202200240232', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (316, 23, '', 'HN202200240325', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (317, 23, '', 'HN202200240326', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (318, 23, '', 'HN202200240327', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (319, 23, '', 'HN202200240328', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (320, 23, '', 'HN202200240329', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (321, 23, '', 'HN202200240330', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (322, 23, '', 'HN202200240331', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (323, 23, '', 'HN202200240332', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (324, 23, '', 'HN202200240425', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (325, 23, '', 'HN202200240426', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (326, 23, '', 'HN202200240427', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (327, 23, '', 'HN202200240428', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (328, 23, '', 'HN202200240429', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (329, 23, '', 'HN202200240430', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (330, 23, '', 'HN202200240431', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (331, 23, '', 'HN202200240432', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (332, 24, '', 'HN202200120101', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (333, 24, '', 'HN202200120102', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (334, 24, '', 'HN202200120103', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (335, 24, '', 'HN202200120104', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (336, 24, '', 'HN202200120105', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (337, 25, '', 'OXN06910125', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '25', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (338, 25, '', 'OXN06910126', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '26', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (339, 25, '', 'OXN06910127', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '27', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (340, 25, '', 'OXN06910128', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '28', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (341, 25, '', 'OXN06910129', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '29', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (342, 25, '', 'OXN06910130', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '30', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (343, 25, '', 'OXN06910131', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '31', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (344, 25, '', 'OXN06910132', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '32', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (345, 25, '', 'OXN06910225', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '25', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (346, 25, '', 'OXN06910226', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '26', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (347, 25, '', 'OXN06910227', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '27', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (348, 25, '', 'OXN06910228', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '28', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (349, 25, '', 'OXN06910229', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '29', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (350, 25, '', 'OXN06910230', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '30', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (351, 25, '', 'OXN06910231', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '31', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (352, 25, '', 'OXN06910232', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '32', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (353, 26, '', 'HN06300101', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (354, 26, '', 'HN06300102', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (355, 26, '', 'HN06300103', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (356, 26, '', 'HN06300104', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (357, 26, '', 'HN06300105', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (358, 26, '', 'HN06300201', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (359, 26, '', 'HN06300202', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (360, 26, '', 'HN06300203', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (361, 26, '', 'HN06300204', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (362, 26, '', 'HN06300205', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (363, 26, '', 'HN06300301', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (364, 26, '', 'HN06300302', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (365, 26, '', 'HN06300303', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (366, 26, '', 'HN06300304', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (367, 26, '', 'HN06300305', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (368, 27, '', 'HN0234025', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (369, 27, '', 'HN0234026', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (370, 27, '', 'HN0234027', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (371, 27, '', 'HN0234028', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (372, 27, '', 'HN0234029', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (373, 27, '', 'HN0234030', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (374, 27, '', 'HN0234031', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (375, 27, '', 'HN0234032', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (376, 27, '', 'HN0237525', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (377, 27, '', 'HN0237526', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (378, 27, '', 'HN0237527', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (379, 27, '', 'HN0237528', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (380, 27, '', 'HN0237529', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (381, 27, '', 'HN0237530', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (382, 27, '', 'HN0237531', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (383, 27, '', 'HN0237532', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (384, 27, '', 'HN0232925', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (385, 27, '', 'HN0232926', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (386, 27, '', 'HN0232927', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (387, 27, '', 'HN0232928', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (388, 27, '', 'HN0232929', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (389, 27, '', 'HN0232930', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (390, 27, '', 'HN0232931', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (391, 27, '', 'HN0232932', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (392, 27, '', 'HN0230125', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (393, 27, '', 'HN0230126', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (394, 27, '', 'HN0230127', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (395, 27, '', 'HN0230128', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (396, 27, '', 'HN0230129', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (397, 27, '', 'HN0230130', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (398, 27, '', 'HN0230131', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (399, 27, '', 'HN0230132', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (400, 9, '', 'HN80264001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (401, 9, '', 'HN80264002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (402, 9, '', 'HN80264003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (403, 9, '', 'HN80264004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (404, 9, '', 'HN80264005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (405, 9, '', 'HN80267501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (406, 9, '', 'HN80267502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (407, 9, '', 'HN80267503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (408, 9, '', 'HN80267504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (409, 9, '', 'HN80267505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (410, 28, '', 'HN6705001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (411, 28, '', 'HN6705002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (412, 28, '', 'HN6705003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (413, 28, '', 'HN6705004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (414, 28, '', 'HN6705005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (415, 28, '', 'HN6707501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (416, 28, '', 'HN6707502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (417, 28, '', 'HN6707503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (418, 28, '', 'HN6707504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (419, 28, '', 'HN6707505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (420, 28, '', 'HN6704001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (421, 28, '', 'HN6704002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (422, 28, '', 'HN6704003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (423, 28, '', 'HN6704004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (424, 28, '', 'HN6704005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (425, 29, '', 'HNP1820101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (426, 29, '', 'HNP1820102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (427, 29, '', 'HNP1820103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (428, 29, '', 'HNP1820104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (429, 29, '', 'HNP1820105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (430, 29, '', 'HNP1821501', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (431, 29, '', 'HNP1821502', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (432, 29, '', 'HNP1821503', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (433, 29, '', 'HNP1821504', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (434, 29, '', 'HNP1821505', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (435, 29, '', 'HNP1825001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (436, 29, '', 'HNP1825002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (437, 29, '', 'HNP1825003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (438, 29, '', 'HNP1825004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (439, 29, '', 'HNP1825005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (440, 30, '', 'HN6724001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (441, 30, '', 'HN6724002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (442, 30, '', 'HN6724003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (443, 30, '', 'HN6724004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (444, 30, '', 'HN6724005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (445, 31, '', 'HN8010101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (446, 31, '', 'HN8010102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (447, 31, '', 'HN8010103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (448, 31, '', 'HN8010104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (449, 31, '', 'HN8010105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (450, 31, '', 'HN8017501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (451, 31, '', 'HN8017502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (452, 31, '', 'HN8017503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (453, 31, '', 'HN8017504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (454, 31, '', 'HN8017505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (455, 31, '', 'HN8014001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (456, 31, '', 'HN8014002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (457, 31, '', 'HN8014003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (458, 31, '', 'HN8014004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (459, 31, '', 'HN8014005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (460, 31, '', 'HN8012901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (461, 31, '', 'HN8012902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (462, 31, '', 'HN8012903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (463, 31, '', 'HN8012904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (464, 31, '', 'HN8012905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (465, 31, '', 'HN8015001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (466, 31, '', 'HN8015002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (467, 31, '', 'HN8015003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (468, 31, '', 'HN8015004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (469, 31, '', 'HN8015005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (470, 31, '', 'HN8011001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (471, 31, '', 'HN8011002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (472, 31, '', 'HN8011003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (473, 31, '', 'HN8011004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (474, 31, '', 'HN8011005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (475, 32, '', 'HN6975001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (476, 32, '', 'HN6975002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (477, 32, '', 'HN6975003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (478, 32, '', 'HN6975004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (479, 32, '', 'HN6975005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (480, 32, '', 'HN6977501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (481, 32, '', 'HN6977502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (482, 32, '', 'HN6977503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (483, 32, '', 'HN6977504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (484, 32, '', 'HN6977505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (485, 32, '', 'HN6971001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (486, 32, '', 'HN6971002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (487, 32, '', 'HN6971003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (488, 32, '', 'HN6971004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (489, 32, '', 'HN6971005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (490, 33, '', 'HN08010101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (491, 33, '', 'HN08010102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (492, 33, '', 'HN08010103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (493, 33, '', 'HN08010104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (494, 33, '', 'HN08010105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (495, 33, '', 'HN08017501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (496, 33, '', 'HN08017502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (497, 33, '', 'HN08017503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (498, 33, '', 'HN08017504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (499, 33, '', 'HN08017505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (500, 33, '', 'HN08012901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (501, 33, '', 'HN08012902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (502, 33, '', 'HN08012903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (503, 33, '', 'HN08012904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (504, 33, '', 'HN08012905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (505, 33, '', 'HN08014001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (506, 33, '', 'HN08014002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (507, 33, '', 'HN08014003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (508, 33, '', 'HN08014004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (509, 33, '', 'HN08014005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (510, 34, '', 'HN6210101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (511, 34, '', 'HN6210102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (512, 34, '', 'HN6210103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (513, 34, '', 'HN6210104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (514, 34, '', 'HN6210105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (515, 34, '', 'HN6217501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (516, 34, '', 'HN6217502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (517, 34, '', 'HN6217503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (518, 34, '', 'HN6217504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (519, 34, '', 'HN6217505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (520, 34, '', 'HN6215001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (521, 34, '', 'HN6215002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (522, 34, '', 'HN6215003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (523, 34, '', 'HN6215004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (524, 34, '', 'HN6215005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (525, 34, '', 'HN6214001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (526, 34, '', 'HN6214002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (527, 34, '', 'HN6214003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (528, 34, '', 'HN6214004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (529, 34, '', 'HN6214005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (530, 35, '', 'HN6625001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (531, 35, '', 'HN6625002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (532, 35, '', 'HN6625003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (533, 35, '', 'HN6625004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (534, 35, '', 'HN6625005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (535, 36, '', 'HN6927501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (536, 36, '', 'HN6927502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (537, 36, '', 'HN6927503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (538, 36, '', 'HN6927504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (539, 36, '', 'HN6927505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (540, 36, '', 'HN6925001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (541, 36, '', 'HN6925002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (542, 36, '', 'HN6925003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (543, 36, '', 'HN6925004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (544, 36, '', 'HN6925005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (545, 37, '', 'HN1060101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (546, 37, '', 'HN1060102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (547, 37, '', 'HN1060103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (548, 37, '', 'HN1060104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (549, 37, '', 'HN1060105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (550, 37, '', 'HN1064001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (551, 37, '', 'HN1064002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (552, 37, '', 'HN1064003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (553, 37, '', 'HN1064004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (554, 37, '', 'HN1064005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (555, 37, '', 'HN1062901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (556, 37, '', 'HN1062902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (557, 37, '', 'HN1062903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (558, 37, '', 'HN1062904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (559, 37, '', 'HN1062905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (560, 38, '', 'HN6635001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (561, 38, '', 'HN6635002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (562, 38, '', 'HN6635003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (563, 38, '', 'HN6635004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (564, 38, '', 'HN6635005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (565, 38, '', 'HN6637501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (566, 38, '', 'HN6637502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (567, 38, '', 'HN6637503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (568, 38, '', 'HN6637504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (569, 38, '', 'HN6637505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (570, 39, '', 'HN0220126', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (571, 39, '', 'HN0220127', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (572, 39, '', 'HN0220128', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (573, 39, '', 'HN0220129', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (574, 39, '', 'HN0220130', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (575, 39, '', 'HN0220131', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (576, 39, '', 'HN0220132', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (577, 39, '', 'HN0222926', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (578, 39, '', 'HN0222927', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (579, 39, '', 'HN0222928', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (580, 39, '', 'HN0222929', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (581, 39, '', 'HN0222930', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (582, 39, '', 'HN0222931', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (583, 39, '', 'HN0222932', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (584, 40, '', 'HN6685001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (585, 40, '', 'HN6685002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (586, 40, '', 'HN6685003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (587, 40, '', 'HN6685004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (588, 40, '', 'HN6685005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (589, 40, '', 'HN6681201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (590, 40, '', 'HN6681202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (591, 40, '', 'HN6681203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (592, 40, '', 'HN6681204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (593, 40, '', 'HN6681205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (594, 40, '', 'HN6687501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (595, 40, '', 'HN6687502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (596, 40, '', 'HN6687503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (597, 40, '', 'HN6687504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (598, 40, '', 'HN6687505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (599, 41, '', 'HN6675001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (600, 41, '', 'HN6675002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (601, 41, '', 'HN6675003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (602, 41, '', 'HN6675004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (603, 41, '', 'HN6675005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (604, 41, '', 'HN6674001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (605, 41, '', 'HN6674002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (606, 41, '', 'HN6674003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (607, 41, '', 'HN6674004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (608, 41, '', 'HN6674005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (609, 42, '', 'HN2221226', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (610, 42, '', 'HN2221227', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (611, 42, '', 'HN2221228', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (612, 42, '', 'HN2221229', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (613, 42, '', 'HN2221230', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (614, 42, '', 'HN2221231', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (615, 42, '', 'HN2221232', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (616, 42, '', 'HN2225026', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (617, 42, '', 'HN2225027', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (618, 42, '', 'HN2225028', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (619, 42, '', 'HN2225029', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (620, 42, '', 'HN2225030', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (621, 42, '', 'HN2225031', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (622, 42, '', 'HN2225032', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (623, 43, '', 'HN6945001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (624, 43, '', 'HN6945002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (625, 43, '', 'HN6945003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (626, 43, '', 'HN6945004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (627, 43, '', 'HN6945005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (628, 43, '', 'HN6947501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (629, 43, '', 'HN6947502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (630, 43, '', 'HN6947503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (631, 43, '', 'HN6947504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (632, 43, '', 'HN6947505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (633, 44, '', 'HN6600101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (634, 44, '', 'HN6600102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (635, 44, '', 'HN6600103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (636, 44, '', 'HN6600104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (637, 44, '', 'HN6600105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (638, 44, '', 'HN6605001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (639, 44, '', 'HN6605002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (640, 44, '', 'HN6605003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (641, 44, '', 'HN6605004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (642, 44, '', 'HN6605005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (643, 44, '', 'HN6607501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (644, 44, '', 'HN6607502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (645, 44, '', 'HN6607503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (646, 44, '', 'HN6607504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (647, 44, '', 'HN6607505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (648, 44, '', 'HN6604001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (649, 44, '', 'HN6604002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (650, 44, '', 'HN6604003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (651, 44, '', 'HN6604004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (652, 44, '', 'HN6604005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (653, 45, '', 'HN6861501', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (654, 45, '', 'HN6861502', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (655, 45, '', 'HN6861503', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (656, 45, '', 'HN6861504', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (657, 45, '', 'HN6861505', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (658, 45, '', 'HN6860101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (659, 45, '', 'HN6860102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (660, 45, '', 'HN6860103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (661, 45, '', 'HN6860104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (662, 45, '', 'HN6860105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (663, 45, '', 'HN6865001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (664, 45, '', 'HN6865002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (665, 45, '', 'HN6865003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (666, 45, '', 'HN6865004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (667, 45, '', 'HN6865005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (668, 45, '', 'HN6867501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (669, 45, '', 'HN6867502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (670, 45, '', 'HN6867503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (671, 45, '', 'HN6867504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (672, 45, '', 'HN6867505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (673, 46, '', 'HN0210126', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (674, 46, '', 'HN0210127', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (675, 46, '', 'HN0210128', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (676, 46, '', 'HN0210129', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (677, 46, '', 'HN0210130', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (678, 46, '', 'HN0210131', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (679, 46, '', 'HN0210132', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (680, 46, '', 'HN0212826', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (681, 46, '', 'HN0212827', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (682, 46, '', 'HN0212828', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (683, 46, '', 'HN0212829', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (684, 46, '', 'HN0212830', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (685, 46, '', 'HN0212831', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (686, 46, '', 'HN0212832', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (687, 46, '', 'HN0215026', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (688, 46, '', 'HN0215027', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (689, 46, '', 'HN0215028', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (690, 46, '', 'HN0215029', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (691, 46, '', 'HN0215030', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (692, 46, '', 'HN0215031', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (693, 46, '', 'HN0215032', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (694, 46, '', 'HN0212926', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (695, 46, '', 'HN0212927', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (696, 46, '', 'HN0212928', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (697, 46, '', 'HN0212929', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (698, 46, '', 'HN0212930', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (699, 46, '', 'HN0212931', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (700, 46, '', 'HN0212932', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (701, 46, '', 'HN02110026', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (702, 46, '', 'HN02110027', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (703, 46, '', 'HN02110028', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (704, 46, '', 'HN02110029', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (705, 46, '', 'HN02110030', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (706, 46, '', 'HN02110031', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (707, 46, '', 'HN02110032', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (708, 46, '', 'HN02128026', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (709, 46, '', 'HN02128027', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (710, 46, '', 'HN02128028', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (711, 46, '', 'HN02128029', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (712, 46, '', 'HN02128030', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (713, 46, '', 'HN02128031', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (714, 46, '', 'HN02128032', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (715, 46, '', 'HN02129026', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (716, 46, '', 'HN02129027', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (717, 46, '', 'HN02129028', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (718, 46, '', 'HN02129029', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (719, 46, '', 'HN02129030', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (720, 46, '', 'HN02129031', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (721, 46, '', 'HN02129032', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (722, 46, '', 'HN02150026', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (723, 46, '', 'HN02150027', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (724, 46, '', 'HN02150028', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (725, 46, '', 'HN02150029', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (726, 46, '', 'HN02150030', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (727, 46, '', 'HN02150031', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (728, 46, '', 'HN02150032', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (729, 47, '', 'JKL8051209', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 394, 'XS', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (730, 47, '', 'JKL8051201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 341, 'S', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (731, 47, '', 'JKL8051202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 342, 'M', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (732, 47, '', 'JKL8051203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 343, 'L', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (733, 47, '', 'JKL8051204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 344, 'XL', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (734, 47, '', 'JKL8051205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 345, '2XL', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (735, 47, '', 'JKL80512009', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 394, 'XS', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (736, 47, '', 'JKL80512001', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (737, 47, '', 'JKL80512002', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (738, 47, '', 'JKL80512003', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (739, 47, '', 'JKL80512004', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (740, 47, '', 'JKL80512005', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (741, 33, '', 'HN08015001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (742, 33, '', 'HN08015002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (743, 33, '', 'HN08015003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (744, 33, '', 'HN08015004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (745, 33, '', 'HN08015005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (746, 33, '', 'HN08011001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (747, 33, '', 'HN08011002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (748, 33, '', 'HN08011003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (749, 33, '', 'HN08011004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (750, 33, '', 'HN08011005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (751, 33, '', 'HN080110101', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (752, 33, '', 'HN080110102', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (753, 33, '', 'HN080110103', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (754, 33, '', 'HN080110104', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (755, 33, '', 'HN080110105', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (756, 33, '', 'HN080117501', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (757, 33, '', 'HN080117502', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (758, 33, '', 'HN080117503', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (759, 33, '', 'HN080117504', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (760, 33, '', 'HN080117505', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (761, 33, '', 'HN080112901', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (762, 33, '', 'HN080112902', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (763, 33, '', 'HN080112903', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (764, 33, '', 'HN080112904', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (765, 33, '', 'HN080112905', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (766, 33, '', 'HN080114001', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (767, 33, '', 'HN080114002', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (768, 33, '', 'HN080114003', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (769, 33, '', 'HN080114004', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (770, 33, '', 'HN080114005', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (771, 33, '', 'HN080115001', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (772, 33, '', 'HN080115002', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (773, 33, '', 'HN080115003', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (774, 33, '', 'HN080115004', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (775, 33, '', 'HN080115005', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (776, 22, '', 'HN2022002010125', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (777, 22, '', 'HN2022002010126', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (778, 22, '', 'HN2022002010127', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (779, 22, '', 'HN2022002010128', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (780, 22, '', 'HN2022002010129', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (781, 22, '', 'HN2022002010130', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (782, 22, '', 'HN2022002010131', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (783, 22, '', 'HN2022002010132', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (784, 22, '', 'HN2022002017525', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (785, 22, '', 'HN2022002017526', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (786, 22, '', 'HN2022002017527', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (787, 22, '', 'HN2022002017528', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (788, 22, '', 'HN2022002017529', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (789, 22, '', 'HN2022002017530', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (790, 22, '', 'HN2022002017531', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (791, 22, '', 'HN2022002017532', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (792, 22, '', 'HN2022002012925', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (793, 22, '', 'HN2022002012926', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (794, 22, '', 'HN2022002012927', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (795, 22, '', 'HN2022002012928', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (796, 22, '', 'HN2022002012929', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (797, 22, '', 'HN2022002012930', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (798, 22, '', 'HN2022002012931', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (799, 22, '', 'HN2022002012932', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (800, 22, '', 'HN2022002015025', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (801, 22, '', 'HN2022002015026', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (802, 22, '', 'HN2022002015027', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (803, 22, '', 'HN2022002015028', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (804, 22, '', 'HN2022002015029', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (805, 22, '', 'HN2022002015030', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (806, 22, '', 'HN2022002015031', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (807, 22, '', 'HN2022002015032', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (808, 48, '', 'HN1805001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (809, 48, '', 'HN1805002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (810, 48, '', 'HN1805003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (811, 48, '', 'HN1805004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (812, 48, '', 'HN1805005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (813, 49, '', 'JKL90984026', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (814, 49, '', 'JKL90984027', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (815, 49, '', 'JKL90984028', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (816, 49, '', 'JKL90984029', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (817, 49, '', 'JKL90984030', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (818, 49, '', 'JKL90984031', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (819, 49, '', 'JKL90984032', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (820, 49, '', 'JKL90982926', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (821, 49, '', 'JKL90982927', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (822, 49, '', 'JKL90982928', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (823, 49, '', 'JKL90982929', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (824, 49, '', 'JKL90982930', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (825, 49, '', 'JKL90982931', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (826, 49, '', 'JKL90982932', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (827, 49, '', 'JKL90980126', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (828, 49, '', 'JKL90980127', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (829, 49, '', 'JKL90980128', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (830, 49, '', 'JKL90980129', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (831, 49, '', 'JKL90980130', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (832, 49, '', 'JKL90980131', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (833, 49, '', 'JKL90980132', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (834, 49, '', 'JKL909814026', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (835, 49, '', 'JKL909814027', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (836, 49, '', 'JKL909814028', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (837, 49, '', 'JKL909814029', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (838, 49, '', 'JKL909814030', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (839, 49, '', 'JKL909814031', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (840, 49, '', 'JKL909814032', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (841, 49, '', 'JKL909812926', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (842, 49, '', 'JKL909812927', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (843, 49, '', 'JKL909812928', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (844, 49, '', 'JKL909812929', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (845, 49, '', 'JKL909812930', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (846, 49, '', 'JKL909812931', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (847, 49, '', 'JKL909812932', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (848, 49, '', 'JKL909810126', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (849, 49, '', 'JKL909810127', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (850, 49, '', 'JKL909810128', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (851, 49, '', 'JKL909810129', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (852, 49, '', 'JKL909810130', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (853, 49, '', 'JKL909810131', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (854, 49, '', 'JKL909810132', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (855, 49, '', 'JKL90984826', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (856, 49, '', 'JKL90984827', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (857, 49, '', 'JKL90984828', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (858, 49, '', 'JKL90984829', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (859, 49, '', 'JKL90984830', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (860, 49, '', 'JKL90984831', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (861, 49, '', 'JKL90984832', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (862, 49, '', 'JKL90986426', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (863, 49, '', 'JKL90986427', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (864, 49, '', 'JKL90986428', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (865, 49, '', 'JKL90986429', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (866, 49, '', 'JKL90986430', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (867, 49, '', 'JKL90986431', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (868, 49, '', 'JKL90986432', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (869, 49, '', 'JKL90986526', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (870, 49, '', 'JKL90986527', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (871, 49, '', 'JKL90986528', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (872, 49, '', 'JKL90986529', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (873, 49, '', 'JKL90986530', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (874, 49, '', 'JKL90986531', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (875, 49, '', 'JKL90986532', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (879, 53, '', 'JKL99070125JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (880, 53, '', 'JKL99070125BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (881, 53, '', 'JKL99070125JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (882, 53, '', 'JKL99070126JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (883, 53, '', 'JKL99070126BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (884, 53, '', 'JKL99070126JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (885, 53, '', 'JKL99070127JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (886, 53, '', 'JKL99070127BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (887, 53, '', 'JKL99070127JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (888, 53, '', 'JKL99070128JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (889, 53, '', 'JKL99070128BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (890, 53, '', 'JKL99070128JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (891, 53, '', 'JKL99070129JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (892, 53, '', 'JKL99070129BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (893, 53, '', 'JKL99070129JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (894, 53, '', 'JKL99070130JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (895, 53, '', 'JKL99070130BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (896, 53, '', 'JKL99070130JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (897, 53, '', 'JKL99070131JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (898, 53, '', 'JKL99070131BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (899, 53, '', 'JKL99070131JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (900, 53, '', 'JKL99070132JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (901, 53, '', 'JKL99070132BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (902, 53, '', 'JKL99070132JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (903, 53, '', 'JKL99072825JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (904, 53, '', 'JKL99072825BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (905, 53, '', 'JKL99072825JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (906, 53, '', 'JKL99072826JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (907, 53, '', 'JKL99072826BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (908, 53, '', 'JKL99072826JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (909, 53, '', 'JKL99072827JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (910, 53, '', 'JKL99072827BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (911, 53, '', 'JKL99072827JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (912, 53, '', 'JKL99072828JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (913, 53, '', 'JKL99072828BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (914, 53, '', 'JKL99072828JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (915, 53, '', 'JKL99072829JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (916, 53, '', 'JKL99072829BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (917, 53, '', 'JKL99072829JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (918, 53, '', 'JKL99072830JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (919, 53, '', 'JKL99072830BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (920, 53, '', 'JKL99072830JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (921, 53, '', 'JKL99072831JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (922, 53, '', 'JKL99072831BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (923, 53, '', 'JKL99072831JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (924, 53, '', 'JKL99072832JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (925, 53, '', 'JKL99072832BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (926, 53, '', 'JKL99072832JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (927, 53, '', 'JKL99074725JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (928, 53, '', 'JKL99074725BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (929, 53, '', 'JKL99074725JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (930, 53, '', 'JKL99074726JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (931, 53, '', 'JKL99074726BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (932, 53, '', 'JKL99074726JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (933, 53, '', 'JKL99074727JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (934, 53, '', 'JKL99074727BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (935, 53, '', 'JKL99074727JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (936, 53, '', 'JKL99074728JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (937, 53, '', 'JKL99074728BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (938, 53, '', 'JKL99074728JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (939, 53, '', 'JKL99074729JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (940, 53, '', 'JKL99074729BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (941, 53, '', 'JKL99074729JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (942, 53, '', 'JKL99074730JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (943, 53, '', 'JKL99074730BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (944, 53, '', 'JKL99074730JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (945, 53, '', 'JKL99074731JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (946, 53, '', 'JKL99074731BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (947, 53, '', 'JKL99074731JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (948, 53, '', 'JKL99074732JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (949, 53, '', 'JKL99074732BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (950, 53, '', 'JKL99074732JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (951, 53, '', 'JKL99075125JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (952, 53, '', 'JKL99075125BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (953, 53, '', 'JKL99075125JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (954, 53, '', 'JKL99075126JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (955, 53, '', 'JKL99075126BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (956, 53, '', 'JKL99075126JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (957, 53, '', 'JKL99075127JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (958, 53, '', 'JKL99075127BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (959, 53, '', 'JKL99075127JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (960, 53, '', 'JKL99075128JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (961, 53, '', 'JKL99075128BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (962, 53, '', 'JKL99075128JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (963, 53, '', 'JKL99075129JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (964, 53, '', 'JKL99075129BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (965, 53, '', 'JKL99075129JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (966, 53, '', 'JKL99075130JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (967, 53, '', 'JKL99075130BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (968, 53, '', 'JKL99075130JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (969, 53, '', 'JKL99075131JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (970, 53, '', 'JKL99075131BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (971, 53, '', 'JKL99075131JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (972, 53, '', 'JKL99075132JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (973, 53, '', 'JKL99075132BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (974, 53, '', 'JKL99075132JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (975, 54, '', 'JKL60103526', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 402, '26', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (976, 54, '', 'JKL60103527', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 403, '27', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (977, 54, '', 'JKL60103528', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 404, '28', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (978, 54, '', 'JKL60103529', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 405, '29', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (979, 54, '', 'JKL60103530', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 406, '30', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (980, 54, '', 'JKL60103531', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 407, '31', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (981, 54, '', 'JKL60107526', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 402, '26', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (982, 54, '', 'JKL60107527', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 403, '27', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (983, 54, '', 'JKL60107528', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 404, '28', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (984, 54, '', 'JKL60107529', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 405, '29', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (985, 54, '', 'JKL60107530', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 406, '30', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (986, 54, '', 'JKL60107531', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 407, '31', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (987, 55, '', 'JKL9064009', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 394, 'XS', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (988, 55, '', 'JKL9064001', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 341, 'S', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (989, 55, '', 'JKL9064002', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 342, 'M', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (990, 55, '', 'JKL9064003', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 343, 'L', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (991, 55, '', 'JKL9064004', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 344, 'XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (992, 55, '', 'JKL9064005', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 345, '2XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (993, 55, '', 'JKL9065009', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 394, 'XS', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (994, 55, '', 'JKL9065001', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 341, 'S', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (995, 55, '', 'JKL9065002', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 342, 'M', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (996, 55, '', 'JKL9065003', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 343, 'L', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (997, 55, '', 'JKL9065004', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 344, 'XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (998, 55, '', 'JKL9065005', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 345, '2XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (999, 56, '', 'JKL99774009CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 394, 'XS', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1000, 56, '', 'JKL99774009JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 394, 'XS', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1001, 56, '', 'JKL99774001CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 341, 'S', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1002, 56, '', 'JKL99774001JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 341, 'S', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1003, 56, '', 'JKL99774002CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 342, 'M', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1004, 56, '', 'JKL99774002JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 342, 'M', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1005, 56, '', 'JKL99774003CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 343, 'L', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1006, 56, '', 'JKL99774003JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 343, 'L', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1007, 56, '', 'JKL99774004CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 344, 'XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1008, 56, '', 'JKL99774004JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 344, 'XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1009, 56, '', 'JKL99774005CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 345, '2XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1010, 56, '', 'JKL99774005JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 345, '2XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1031, 59, '', 'JKL99784009CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 394, 'XS', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1032, 59, '', 'JKL99784009JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 394, 'XS', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1033, 59, '', 'JKL99784001CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 341, 'S', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1034, 59, '', 'JKL99784001JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 341, 'S', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1035, 59, '', 'JKL99784002CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 342, 'M', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1036, 59, '', 'JKL99784002JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 342, 'M', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1037, 59, '', 'JKL99784003CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 343, 'L', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1038, 59, '', 'JKL99784003JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 343, 'L', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1039, 59, '', 'JKL99784004CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 344, 'XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1040, 59, '', 'JKL99784004JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 344, 'XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1041, 59, '', 'JKL99784005CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 345, '2XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1042, 59, '', 'JKL99784005JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 345, '2XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1043, 60, '', 'JKL99505025', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1044, 60, '', 'JKL99505026', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1045, 60, '', 'JKL99505027', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1046, 60, '', 'JKL99505028', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1047, 60, '', 'JKL99505029', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1048, 60, '', 'JKL99505030', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1049, 60, '', 'JKL99505031', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1050, 60, '', 'JKL99505032', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1051, 60, '', 'JKL99501225', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1052, 60, '', 'JKL99501226', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1053, 60, '', 'JKL99501227', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1054, 60, '', 'JKL99501228', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1055, 60, '', 'JKL99501229', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1056, 60, '', 'JKL99501230', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1057, 60, '', 'JKL99501231', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1058, 60, '', 'JKL99501232', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1059, 60, '', 'JKL99505925', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1060, 60, '', 'JKL99505926', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1061, 60, '', 'JKL99505927', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1062, 60, '', 'JKL99505928', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1063, 60, '', 'JKL99505929', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1064, 60, '', 'JKL99505930', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1065, 60, '', 'JKL99505931', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1066, 60, '', 'JKL99505932', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1067, 61, '', 'JKL89903509', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 394, 'XS', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1068, 61, '', 'JKL89903501', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 341, 'S', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1069, 61, '', 'JKL89903502', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 342, 'M', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1070, 61, '', 'JKL89903503', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 343, 'L', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1071, 61, '', 'JKL89903504', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 344, 'XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1072, 61, '', 'JKL89903505', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 345, '2XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1073, 61, '', 'JKL89907509', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 394, 'XS', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1074, 61, '', 'JKL89907501', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 341, 'S', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1075, 61, '', 'JKL89907502', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 342, 'M', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1076, 61, '', 'JKL89907503', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 343, 'L', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1077, 61, '', 'JKL89907504', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 344, 'XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1078, 61, '', 'JKL89907505', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 345, '2XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1079, 62, '', 'JKL99380109JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1080, 62, '', 'JKL99380109CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1081, 62, '', 'JKL99380101JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1082, 62, '', 'JKL99380101CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1083, 62, '', 'JKL99380102JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1084, 62, '', 'JKL99380102CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1085, 62, '', 'JKL99380103JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1086, 62, '', 'JKL99380103CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1087, 62, '', 'JKL99380104JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1088, 62, '', 'JKL99380104CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1089, 62, '', 'JKL99380105JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1090, 62, '', 'JKL99380105CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1091, 62, '', 'JKL99384009JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1092, 62, '', 'JKL99384009CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1093, 62, '', 'JKL99384001JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1094, 62, '', 'JKL99384001CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1095, 62, '', 'JKL99384002JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1096, 62, '', 'JKL99384002CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1097, 62, '', 'JKL99384003JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1098, 62, '', 'JKL99384003CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1099, 62, '', 'JKL99384004JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1100, 62, '', 'JKL99384004CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1101, 62, '', 'JKL99384005JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1102, 62, '', 'JKL99384005CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1103, 62, '', 'JKL99385009JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1104, 62, '', 'JKL99385009CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1105, 62, '', 'JKL99385001JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1106, 62, '', 'JKL99385001CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1107, 62, '', 'JKL99385002JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1108, 62, '', 'JKL99385002CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1109, 62, '', 'JKL99385003JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1110, 62, '', 'JKL99385003CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1111, 62, '', 'JKL99385004JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1112, 62, '', 'JKL99385004CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1113, 62, '', 'JKL99385005JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1114, 62, '', 'JKL99385005CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1115, 63, '', 'JKL600101258', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1116, 63, '', 'JKL600101259', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1117, 63, '', 'JKL600101268', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1118, 63, '', 'JKL600101269', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1119, 63, '', 'JKL600101278', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1120, 63, '', 'JKL600101279', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1121, 63, '', 'JKL600101288', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1122, 63, '', 'JKL600101289', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1123, 63, '', 'JKL600101298', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1124, 63, '', 'JKL600101299', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1125, 63, '', 'JKL600101308', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1126, 63, '', 'JKL600101309', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1127, 63, '', 'JKL600101318', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1128, 63, '', 'JKL600101319', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1129, 63, '', 'JKL600101328', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1130, 63, '', 'JKL600101329', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1131, 63, '', 'JKL600128258', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1132, 63, '', 'JKL600128259', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1133, 63, '', 'JKL600128268', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1134, 63, '', 'JKL600128269', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1135, 63, '', 'JKL600128278', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1136, 63, '', 'JKL600128279', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1137, 63, '', 'JKL600128288', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1138, 63, '', 'JKL600128289', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1139, 63, '', 'JKL600128298', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1140, 63, '', 'JKL600128299', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1141, 63, '', 'JKL600128308', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1142, 63, '', 'JKL600128309', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1143, 63, '', 'JKL600128318', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1144, 63, '', 'JKL600128319', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1145, 63, '', 'JKL600128328', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1146, 63, '', 'JKL600128329', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1147, 63, '', 'JKL600151258', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1148, 63, '', 'JKL600151259', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1149, 63, '', 'JKL600151268', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1150, 63, '', 'JKL600151269', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1151, 63, '', 'JKL600151278', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1152, 63, '', 'JKL600151279', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1153, 63, '', 'JKL600151288', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1154, 63, '', 'JKL600151289', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1155, 63, '', 'JKL600151298', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1156, 63, '', 'JKL600151299', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1157, 63, '', 'JKL600151308', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1158, 63, '', 'JKL600151309', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1159, 63, '', 'JKL600151318', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1160, 63, '', 'JKL600151319', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1161, 63, '', 'JKL600151328', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1162, 63, '', 'JKL600151329', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1163, 63, '', 'JKL600147258', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1164, 63, '', 'JKL600147259', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1165, 63, '', 'JKL600147268', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1166, 63, '', 'JKL600147269', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1167, 63, '', 'JKL600147278', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1168, 63, '', 'JKL600147279', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1169, 63, '', 'JKL600147288', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1170, 63, '', 'JKL600147289', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1171, 63, '', 'JKL600147298', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1172, 63, '', 'JKL600147299', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1173, 63, '', 'JKL600147308', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1174, 63, '', 'JKL600147309', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1175, 63, '', 'JKL600147318', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1176, 63, '', 'JKL600147319', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1177, 63, '', 'JKL600147328', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1178, 63, '', 'JKL600147329', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1179, 64, '', 'JKL99090125JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1180, 64, '', 'JKL99090125CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1181, 64, '', 'JKL99090126JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1182, 64, '', 'JKL99090126CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1183, 64, '', 'JKL99090127JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1184, 64, '', 'JKL99090127CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1185, 64, '', 'JKL99090128JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1186, 64, '', 'JKL99090128CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1187, 64, '', 'JKL99090129JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1188, 64, '', 'JKL99090129CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1189, 64, '', 'JKL99090130JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1190, 64, '', 'JKL99090130CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1191, 64, '', 'JKL99090131JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1192, 64, '', 'JKL99090131CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1193, 64, '', 'JKL99090132JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1194, 64, '', 'JKL99090132CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1195, 64, '', 'JKL99091225JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1196, 64, '', 'JKL99091225CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1197, 64, '', 'JKL99091226JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1198, 64, '', 'JKL99091226CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1199, 64, '', 'JKL99091227JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1200, 64, '', 'JKL99091227CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1201, 64, '', 'JKL99091228JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1202, 64, '', 'JKL99091228CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1203, 64, '', 'JKL99091229JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1204, 64, '', 'JKL99091229CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1205, 64, '', 'JKL99091230JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1206, 64, '', 'JKL99091230CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1207, 64, '', 'JKL99091231JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1208, 64, '', 'JKL99091231CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1209, 64, '', 'JKL99091232JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1210, 64, '', 'JKL99091232CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1211, 64, '', 'JKL99095025JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1212, 64, '', 'JKL99095025CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1213, 64, '', 'JKL99095026JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1214, 64, '', 'JKL99095026CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1215, 64, '', 'JKL99095027JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1216, 64, '', 'JKL99095027CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1217, 64, '', 'JKL99095028JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1218, 64, '', 'JKL99095028CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1219, 64, '', 'JKL99095029JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1220, 64, '', 'JKL99095029CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1221, 64, '', 'JKL99095030JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1222, 64, '', 'JKL99095030CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1223, 64, '', 'JKL99095031JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1224, 64, '', 'JKL99095031CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1225, 64, '', 'JKL99095032JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1226, 64, '', 'JKL99095032CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1227, 65, '', 'GZYYZ72770100', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1228, 65, '', 'GZYYZ72773100', 338, '咖啡色', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1229, 65, '', 'GZYYZ72776200', 377, '墨绿色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1230, 66, '', 'JKL197340098', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 394, 'XS', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1231, 66, '', 'JKL197340099', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 394, 'XS', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1232, 66, '', 'JKL197340018', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 341, 'S', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1233, 66, '', 'JKL197340019', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 341, 'S', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1234, 66, '', 'JKL197340028', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 342, 'M', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1235, 66, '', 'JKL197340029', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 342, 'M', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1236, 66, '', 'JKL197340038', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 343, 'L', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1237, 66, '', 'JKL197340039', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 343, 'L', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1238, 66, '', 'JKL197340048', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 344, 'XL', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1239, 66, '', 'JKL197340049', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 344, 'XL', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1240, 66, '', 'JKL197340058', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 345, '2XL', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1241, 66, '', 'JKL197340059', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 345, '2XL', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1242, 67, '', 'JKL19511225CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1243, 67, '', 'JKL19511225CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1244, 67, '', 'JKL19511225JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1245, 67, '', 'JKL19511225JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1246, 67, '', 'JKL19511226CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1247, 67, '', 'JKL19511226CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1248, 67, '', 'JKL19511226JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1249, 67, '', 'JKL19511226JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1250, 67, '', 'JKL19511227CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1251, 67, '', 'JKL19511227CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1252, 67, '', 'JKL19511227JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1253, 67, '', 'JKL19511227JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1254, 67, '', 'JKL19511228CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1255, 67, '', 'JKL19511228CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1256, 67, '', 'JKL19511228JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1257, 67, '', 'JKL19511228JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1258, 67, '', 'JKL19511229CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1259, 67, '', 'JKL19511229CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1260, 67, '', 'JKL19511229JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1261, 67, '', 'JKL19511229JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1262, 67, '', 'JKL19511230CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1263, 67, '', 'JKL19511230CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1264, 67, '', 'JKL19511230JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1265, 67, '', 'JKL19511230JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1266, 67, '', 'JKL19511231CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1267, 67, '', 'JKL19511231CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1268, 67, '', 'JKL19511231JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1269, 67, '', 'JKL19511231JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1270, 67, '', 'JKL19511232CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1271, 67, '', 'JKL19511232CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1272, 67, '', 'JKL19511232JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1273, 67, '', 'JKL19511232JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1274, 67, '', 'JKL19514025CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1275, 67, '', 'JKL19514025CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1276, 67, '', 'JKL19514025JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1277, 67, '', 'JKL19514025JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1278, 67, '', 'JKL19514026CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1279, 67, '', 'JKL19514026CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1280, 67, '', 'JKL19514026JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1281, 67, '', 'JKL19514026JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1282, 67, '', 'JKL19514027CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1283, 67, '', 'JKL19514027CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1284, 67, '', 'JKL19514027JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1285, 67, '', 'JKL19514027JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1286, 67, '', 'JKL19514028CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1287, 67, '', 'JKL19514028CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1288, 67, '', 'JKL19514028JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1289, 67, '', 'JKL19514028JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1290, 67, '', 'JKL19514029CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1291, 67, '', 'JKL19514029CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1292, 67, '', 'JKL19514029JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1293, 67, '', 'JKL19514029JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1294, 67, '', 'JKL19514030CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1295, 67, '', 'JKL19514030CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1296, 67, '', 'JKL19514030JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1297, 67, '', 'JKL19514030JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1298, 67, '', 'JKL19514031CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1299, 67, '', 'JKL19514031CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1300, 67, '', 'JKL19514031JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1301, 67, '', 'JKL19514031JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1302, 67, '', 'JKL19514032CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1303, 67, '', 'JKL19514032CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1304, 67, '', 'JKL19514032JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1305, 67, '', 'JKL19514032JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1306, 62, '', 'JKL99387009', 384, '深蓝长款', '', 394, 'XS', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1307, 62, '', 'JKL99387001', 384, '深蓝长款', '', 341, 'S', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1308, 62, '', 'JKL99387002', 384, '深蓝长款', '', 342, 'M', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1309, 62, '', 'JKL99387003', 384, '深蓝长款', '', 343, 'L', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1310, 62, '', 'JKL99387004', 384, '深蓝长款', '', 344, 'XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1311, 62, '', 'JKL99387005', 384, '深蓝长款', '', 345, '2XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1312, 62, '', 'JKL99386909', 383, '深蓝九分', '', 394, 'XS', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1313, 62, '', 'JKL99386901', 383, '深蓝九分', '', 341, 'S', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1314, 62, '', 'JKL99386902', 383, '深蓝九分', '', 342, 'M', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1315, 62, '', 'JKL99386903', 383, '深蓝九分', '', 343, 'L', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1316, 62, '', 'JKL99386904', 383, '深蓝九分', '', 344, 'XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1317, 62, '', 'JKL99386905', 383, '深蓝九分', '', 345, '2XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1318, 68, '', 'JKL31121201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1319, 68, '', 'JKL31121202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1320, 68, '', 'JKL31121203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1321, 68, '', 'JKL31121204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1322, 68, '', 'JKL31121205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1323, 68, '', 'JKL31120701', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1324, 68, '', 'JKL31120702', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1325, 68, '', 'JKL31120703', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1326, 68, '', 'JKL31120704', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1327, 68, '', 'JKL31120705', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1328, 69, '', 'KH97347526', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1329, 69, '', 'KH97347527', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1330, 69, '', 'KH97347528', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1331, 69, '', 'KH97347529', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1332, 69, '', 'KH97347530', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1333, 69, '', 'KH97347531', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1334, 69, '', 'KH97347532', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1335, 69, '', 'KH97345026', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1336, 69, '', 'KH97345027', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1337, 69, '', 'KH97345028', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1338, 69, '', 'KH97345029', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1339, 69, '', 'KH97345030', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1340, 69, '', 'KH97345031', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1341, 69, '', 'KH97345032', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1342, 70, '', 'KH98265026', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1343, 70, '', 'KH98265027', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1344, 70, '', 'KH98265028', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1345, 70, '', 'KH98265029', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1346, 70, '', 'KH98265030', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1347, 70, '', 'KH98265031', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1348, 70, '', 'KH98265032', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1349, 70, '', 'KH98260126', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1350, 70, '', 'KH98260127', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1351, 70, '', 'KH98260128', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1352, 70, '', 'KH98260129', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1353, 70, '', 'KH98260130', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1354, 70, '', 'KH98260131', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1355, 70, '', 'KH98260132', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1356, 71, '', 'aaaaa15030', 413, '浅蓝色加绒', 'aaa', 406, '30', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1357, 71, '', 'aaaaa15029', 413, '浅蓝色加绒', 'aaa', 405, '29', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1358, 71, '', 'aaaaa14030', 412, '复古蓝加绒', 'aaa', 406, '30', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1359, 71, '', 'aaaaa14029', 412, '复古蓝加绒', 'aaa', 405, '29', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1368, 74, '', 'A0012D15032', 413, '浅蓝色加绒', 'http://localhost:8080/preview/images/48', 408, '32', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1369, 74, '', 'A0012D15031', 413, '浅蓝色加绒', 'http://localhost:8080/preview/images/48', 407, '31', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1370, 74, '', 'A0012D14032', 412, '复古蓝加绒', 'http://localhost:8080/preview/images/49', 408, '32', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1371, 74, '', 'A0012D14031', 412, '复古蓝加绒', 'http://localhost:8080/preview/images/49', 407, '31', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for erp_goods_spec_attr
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec_attr`;
CREATE TABLE `erp_goods_spec_attr`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `goods_id` int(0) NOT NULL,
  `type` char(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `k` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `kid` int(0) DEFAULT NULL,
  `vid` int(0) DEFAULT NULL,
  `v` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 603 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_goods_spec_attr
-- ----------------------------
INSERT INTO `erp_goods_spec_attr` VALUES (1, 1, 'color', '颜色', 1, 0, '250ml', 'http://img.huayikeji.com/wveyzkbvilkzaj3eu9084pmqb9405hag');
INSERT INTO `erp_goods_spec_attr` VALUES (2, 4, 'color', '颜色', 1, 0, '香辣味1瓶+麻辣味1瓶', 'http://img.huayikeji.com/kw5i7anb3tydpu8kz0f7o8jrszuczlw1');
INSERT INTO `erp_goods_spec_attr` VALUES (3, 4, 'color', '颜色', 1, 0, '麻辣味420g*2瓶中辣', 'http://img.huayikeji.com/8ltvsrs9huscohzi2qd20qj0daynz012');
INSERT INTO `erp_goods_spec_attr` VALUES (4, 4, 'color', '颜色', 1, 0, '香辣味420g*2瓶微辣', 'http://img.huayikeji.com/z01l0tjah6vwpwdp4yhppthum9l44our');
INSERT INTO `erp_goods_spec_attr` VALUES (5, 5, 'color', '颜色', 1, 0, '5A精品', 'http://img.huayikeji.com/kx3ikkjuand5huibpsh3s4o7jsuzilfa');
INSERT INTO `erp_goods_spec_attr` VALUES (6, 6, 'color', '颜色', 1, 0, '甜味型20袋', 'http://img.huayikeji.com/u4ga7xp1swww4t7y40eh3gvgs3kikf83');
INSERT INTO `erp_goods_spec_attr` VALUES (7, 7, 'color', '颜色', 1, 0, '深蓝色', 'http://img.huayikeji.com/0lzoyn7adrkv8iv7xjy8kcejl9yelkcg');
INSERT INTO `erp_goods_spec_attr` VALUES (8, 7, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ahc832bn59qoxq7vlrnvue9lrsiqxsbd');
INSERT INTO `erp_goods_spec_attr` VALUES (9, 7, 'color', '颜色', 1, 0, '欧美白', 'http://img.huayikeji.com/df8eqd6e9t46vfjx3j7tk84z72yhc3uy');
INSERT INTO `erp_goods_spec_attr` VALUES (10, 7, 'size', '尺码', 2, 0, '5寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (11, 7, 'size', '尺码', 2, 0, '6寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (12, 7, 'size', '尺码', 2, 0, '8寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (13, 8, 'color', '颜色', 1, 0, '30g * 5包', 'http://img.huayikeji.com/0n40n4ctz61o2rtdlt9wldmxucsio789');
INSERT INTO `erp_goods_spec_attr` VALUES (14, 9, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (15, 9, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (16, 9, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01F1W2O12FOyB2UfQnX_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (17, 9, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (18, 9, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (19, 9, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (20, 9, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (21, 9, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (22, 9, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (23, 10, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (24, 10, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (25, 10, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (26, 10, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (27, 10, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (28, 10, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (29, 10, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (30, 10, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (31, 11, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN013LdA8s2FOyBfwOjXh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (32, 11, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01giGdo92FOyBjYLUBx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (33, 11, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN017OhDC42FOyBpOE5Xh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (34, 11, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN018SPmsV1Bs2ghEUUei_!!0-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (35, 11, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BMEINy2FOyBhvpaPZ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (36, 11, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (37, 11, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (38, 11, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (39, 11, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (40, 11, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (41, 12, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01UR16Tw2FOyJNPJHCZ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (42, 12, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (43, 12, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (44, 12, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (45, 12, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (46, 12, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (47, 13, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gJpwlK2FOyGoJJ3sH_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (48, 13, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01wZ3ye12FOyGhhUDOe_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (49, 13, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01453F082FOyGp5H3Gv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (50, 13, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (51, 13, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (52, 13, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (53, 13, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (54, 13, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (55, 14, 'color', '颜色', 1, 331, '灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J0a5Ij2FOyGVsqune_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (56, 14, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01i45X3r2FOyGVsraSQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (57, 14, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yx4kr52FOyGOtErWx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (58, 14, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (59, 14, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (60, 14, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (61, 14, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (62, 14, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (63, 15, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01rXl5A92FOyBlp8KB2_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (64, 15, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lW8xsq2FOyBboDwmS_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (65, 15, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eRnnro2FOyBl7HmaB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (66, 15, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN010pmtuT2FOyGqBp6dx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (67, 15, 'color', '颜色', 1, 324, '粉色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jE2Cq12FOyGlWgGFO_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (68, 15, 'color', '颜色', 1, 359, '黄色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Fc0SiP2FOyGwQA0CS_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (69, 15, 'color', '颜色', 1, 0, '薄荷绿', 'https://cbu01.alicdn.com/img/ibank/O1CN010KmHBz2FOyGrTpnqo_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (70, 15, 'color', '颜色', 1, 335, '卡其色', 'https://cbu01.alicdn.com/img/ibank/O1CN01VRmnz72FOyGuOVemn_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (71, 15, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (72, 15, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (73, 15, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (74, 15, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (75, 15, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (76, 16, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21');
INSERT INTO `erp_goods_spec_attr` VALUES (77, 16, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (78, 16, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (79, 16, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (80, 16, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (81, 16, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (82, 17, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv');
INSERT INTO `erp_goods_spec_attr` VALUES (83, 17, 'color', '颜色', 1, 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m');
INSERT INTO `erp_goods_spec_attr` VALUES (84, 17, 'color', '颜色', 1, 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4');
INSERT INTO `erp_goods_spec_attr` VALUES (85, 17, 'color', '颜色', 1, 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484');
INSERT INTO `erp_goods_spec_attr` VALUES (86, 17, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (87, 17, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (88, 17, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (89, 17, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (90, 18, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic');
INSERT INTO `erp_goods_spec_attr` VALUES (91, 18, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5');
INSERT INTO `erp_goods_spec_attr` VALUES (92, 18, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug');
INSERT INTO `erp_goods_spec_attr` VALUES (93, 18, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (94, 18, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (95, 18, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (96, 18, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (97, 18, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (98, 19, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs');
INSERT INTO `erp_goods_spec_attr` VALUES (99, 19, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf');
INSERT INTO `erp_goods_spec_attr` VALUES (100, 19, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr');
INSERT INTO `erp_goods_spec_attr` VALUES (101, 19, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2');
INSERT INTO `erp_goods_spec_attr` VALUES (102, 19, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (103, 19, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (104, 19, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (105, 19, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (106, 19, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (107, 19, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (108, 19, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (109, 19, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (110, 20, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38');
INSERT INTO `erp_goods_spec_attr` VALUES (111, 20, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4');
INSERT INTO `erp_goods_spec_attr` VALUES (112, 20, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4');
INSERT INTO `erp_goods_spec_attr` VALUES (113, 20, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (114, 20, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (115, 20, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (116, 20, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (117, 20, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (118, 20, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (119, 20, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (120, 20, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (121, 21, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol');
INSERT INTO `erp_goods_spec_attr` VALUES (122, 21, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh');
INSERT INTO `erp_goods_spec_attr` VALUES (123, 21, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym');
INSERT INTO `erp_goods_spec_attr` VALUES (124, 21, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (125, 21, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (126, 21, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (127, 21, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (128, 21, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (129, 21, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (130, 22, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f');
INSERT INTO `erp_goods_spec_attr` VALUES (131, 22, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z');
INSERT INTO `erp_goods_spec_attr` VALUES (132, 22, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8');
INSERT INTO `erp_goods_spec_attr` VALUES (133, 22, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g');
INSERT INTO `erp_goods_spec_attr` VALUES (134, 22, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (135, 22, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (136, 22, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (137, 22, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (138, 22, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (139, 22, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (140, 22, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (141, 22, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (142, 23, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig');
INSERT INTO `erp_goods_spec_attr` VALUES (143, 23, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik');
INSERT INTO `erp_goods_spec_attr` VALUES (144, 23, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj');
INSERT INTO `erp_goods_spec_attr` VALUES (145, 23, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr');
INSERT INTO `erp_goods_spec_attr` VALUES (146, 23, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (147, 23, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (148, 23, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (149, 23, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (150, 23, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (151, 23, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (152, 23, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (153, 23, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (154, 24, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9');
INSERT INTO `erp_goods_spec_attr` VALUES (155, 24, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (156, 24, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (157, 24, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (158, 24, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (159, 24, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (160, 25, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0');
INSERT INTO `erp_goods_spec_attr` VALUES (161, 25, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql');
INSERT INTO `erp_goods_spec_attr` VALUES (162, 25, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (163, 25, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (164, 25, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (165, 25, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (166, 25, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (167, 25, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (168, 25, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (169, 25, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (170, 26, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd');
INSERT INTO `erp_goods_spec_attr` VALUES (171, 26, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p');
INSERT INTO `erp_goods_spec_attr` VALUES (172, 26, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo');
INSERT INTO `erp_goods_spec_attr` VALUES (173, 26, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (174, 26, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (175, 26, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (176, 26, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (177, 26, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (178, 27, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1');
INSERT INTO `erp_goods_spec_attr` VALUES (179, 27, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw');
INSERT INTO `erp_goods_spec_attr` VALUES (180, 27, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo');
INSERT INTO `erp_goods_spec_attr` VALUES (181, 27, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7');
INSERT INTO `erp_goods_spec_attr` VALUES (182, 27, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (183, 27, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (184, 27, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (185, 27, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (186, 27, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (187, 27, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (188, 27, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (189, 27, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (190, 9, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (191, 9, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (197, 28, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (198, 28, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (199, 28, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (200, 28, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (201, 28, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (202, 28, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (203, 28, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (204, 28, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (205, 29, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (206, 29, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (207, 29, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (208, 29, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (209, 29, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (210, 29, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (211, 29, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (212, 29, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (213, 30, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (214, 30, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (215, 30, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (216, 30, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (217, 30, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (218, 30, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (219, 31, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (220, 31, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (221, 31, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (222, 31, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (223, 31, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (224, 31, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (225, 31, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (226, 31, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (227, 31, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (228, 31, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (229, 31, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (230, 32, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (231, 32, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (232, 32, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (233, 32, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (234, 32, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (235, 32, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (236, 32, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (237, 32, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (238, 33, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (239, 33, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (240, 33, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (241, 33, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (242, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (243, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (244, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (245, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (246, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (247, 34, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (248, 34, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (249, 34, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (250, 34, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (251, 34, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (252, 34, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (253, 34, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (254, 34, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (255, 34, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (256, 35, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (257, 35, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (258, 35, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (259, 35, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (260, 35, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (261, 35, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (262, 36, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (263, 36, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (264, 36, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (265, 36, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (266, 36, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (267, 36, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (268, 36, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (269, 37, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (270, 37, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (271, 37, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (272, 37, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (273, 37, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (274, 37, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (275, 37, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (276, 37, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (277, 38, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (278, 38, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (279, 38, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (280, 38, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (281, 38, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (282, 38, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (283, 38, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (284, 39, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (285, 39, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (286, 39, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (287, 39, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (288, 39, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (289, 39, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (290, 39, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (291, 39, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (292, 39, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (293, 40, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (294, 40, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (295, 40, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (296, 40, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (297, 40, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (298, 40, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (299, 40, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (300, 40, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (301, 41, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (302, 41, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (303, 41, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (304, 41, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (305, 41, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (306, 41, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (307, 41, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (308, 42, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (309, 42, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (310, 42, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (311, 42, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (312, 42, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (313, 42, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (314, 42, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (315, 42, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (316, 42, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (317, 43, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (318, 43, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (319, 43, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (320, 43, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (321, 43, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (322, 43, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (323, 43, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (324, 44, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (325, 44, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (326, 44, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (327, 44, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (328, 44, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (329, 44, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (330, 44, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (331, 44, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (332, 44, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (333, 45, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (334, 45, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (335, 45, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (336, 45, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (337, 45, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (338, 45, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (339, 45, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (340, 45, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (341, 45, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (342, 46, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (343, 46, 'color', '颜色', 1, 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (344, 46, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (345, 46, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (346, 46, 'color', '颜色', 1, 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (347, 46, 'color', '颜色', 1, 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (348, 46, 'color', '颜色', 1, 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (349, 46, 'color', '颜色', 1, 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (350, 46, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (351, 46, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (352, 46, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (353, 46, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (354, 46, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (355, 46, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (356, 46, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (357, 47, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (358, 47, 'color', '颜色', 1, 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (359, 47, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (360, 47, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (361, 47, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (362, 47, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (363, 47, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (364, 47, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (365, 33, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (366, 33, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (367, 33, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (368, 33, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (369, 33, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (370, 33, 'color', '颜色', 1, 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (371, 33, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (372, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (373, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (374, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (375, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (376, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (377, 22, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (378, 22, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (379, 22, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (380, 22, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (381, 22, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (382, 22, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (383, 22, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (384, 22, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (385, 22, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (386, 22, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (387, 22, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (388, 22, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (389, 48, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (390, 48, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (391, 48, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (392, 48, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (393, 48, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (394, 48, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (395, 49, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (396, 49, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (397, 49, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (398, 49, 'color', '颜色', 1, 412, '复古蓝加绒', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (399, 49, 'color', '颜色', 1, 411, '蓝灰色加绒', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (400, 49, 'color', '颜色', 1, 409, '黑色加绒', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (401, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (402, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (403, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (404, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (405, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (406, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (407, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (408, 49, 'color', '颜色', 1, 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (409, 49, 'color', '颜色', 1, 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (410, 49, 'color', '颜色', 1, 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (411, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (412, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (413, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (414, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (415, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (416, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (417, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (418, 53, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/2ekpro9obesysm6vf1h0ihhfx1z9bgqz');
INSERT INTO `erp_goods_spec_attr` VALUES (419, 53, 'color', '颜色', 1, 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80');
INSERT INTO `erp_goods_spec_attr` VALUES (420, 53, 'color', '颜色', 1, 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9');
INSERT INTO `erp_goods_spec_attr` VALUES (421, 53, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6');
INSERT INTO `erp_goods_spec_attr` VALUES (422, 53, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (423, 53, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (424, 53, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (425, 53, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (426, 53, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (427, 53, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (428, 53, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (429, 53, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (430, 53, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (431, 53, 'style', '款式', 3, 418, '八分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (432, 53, 'style', '款式', 3, 419, '九分加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (433, 54, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi');
INSERT INTO `erp_goods_spec_attr` VALUES (434, 54, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4');
INSERT INTO `erp_goods_spec_attr` VALUES (435, 54, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (436, 54, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (437, 54, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (438, 54, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (439, 54, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (440, 54, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (441, 55, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5');
INSERT INTO `erp_goods_spec_attr` VALUES (442, 55, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h');
INSERT INTO `erp_goods_spec_attr` VALUES (443, 55, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (444, 55, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (445, 55, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (446, 55, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (447, 55, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (448, 55, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (449, 56, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk');
INSERT INTO `erp_goods_spec_attr` VALUES (450, 56, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (451, 56, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (452, 56, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (453, 56, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (454, 56, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (455, 56, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (456, 56, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (457, 56, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (458, 59, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k');
INSERT INTO `erp_goods_spec_attr` VALUES (459, 59, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (460, 59, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (461, 59, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (462, 59, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (463, 59, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (464, 59, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (465, 59, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (466, 59, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (467, 60, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr');
INSERT INTO `erp_goods_spec_attr` VALUES (468, 60, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q');
INSERT INTO `erp_goods_spec_attr` VALUES (469, 60, 'color', '颜色', 1, 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi');
INSERT INTO `erp_goods_spec_attr` VALUES (470, 60, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (471, 60, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (472, 60, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (473, 60, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (474, 60, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (475, 60, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (476, 60, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (477, 60, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (478, 61, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayiyungou.com/q3t7loa0mz6lokizz93fp52cltgxhuq2');
INSERT INTO `erp_goods_spec_attr` VALUES (479, 61, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayiyungou.com/qx67wj65nlvrs514g02bs7ocptl5b6ec');
INSERT INTO `erp_goods_spec_attr` VALUES (480, 61, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (481, 61, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (482, 61, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (483, 61, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (484, 61, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (485, 61, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (486, 62, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (487, 62, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (488, 62, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (489, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (490, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (491, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (492, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (493, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (494, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (495, 62, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (496, 62, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (497, 63, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (498, 63, 'color', '颜色', 1, 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (499, 63, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (500, 63, 'color', '颜色', 1, 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (501, 63, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (502, 63, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (503, 63, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (504, 63, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (505, 63, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (506, 63, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (507, 63, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (508, 63, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (509, 63, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (510, 63, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (511, 64, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (512, 64, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (513, 64, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG');
INSERT INTO `erp_goods_spec_attr` VALUES (514, 64, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (515, 64, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (516, 64, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (517, 64, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (518, 64, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (519, 64, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (520, 64, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (521, 64, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (522, 64, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (523, 64, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (524, 65, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (525, 65, 'color', '颜色', 1, 338, '咖啡色', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (526, 65, 'color', '颜色', 1, 377, '墨绿色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (527, 65, 'size', '尺码', 2, 340, '均码', '');
INSERT INTO `erp_goods_spec_attr` VALUES (528, 66, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (529, 66, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (530, 66, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (531, 66, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (532, 66, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (533, 66, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (534, 66, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (535, 66, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (536, 66, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (537, 67, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (538, 67, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png');
INSERT INTO `erp_goods_spec_attr` VALUES (539, 67, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (540, 67, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (541, 67, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (542, 67, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (543, 67, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (544, 67, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (545, 67, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (546, 67, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (547, 67, 'style', '款式', 3, 416, '长裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (548, 67, 'style', '款式', 3, 422, '长裤加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (549, 67, 'style', '款式', 3, 415, '加长裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (550, 67, 'style', '款式', 3, 423, '加长裤加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (551, 62, 'color', '颜色', 1, 384, '深蓝长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (552, 62, 'color', '颜色', 1, 383, '深蓝九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (553, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (554, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (555, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (556, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (557, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (558, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (559, 68, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (560, 68, 'color', '颜色', 1, 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (561, 68, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (562, 68, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (563, 68, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (564, 68, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (565, 68, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (566, 69, 'color', '颜色', 1, 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (567, 69, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (568, 69, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (569, 69, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (570, 69, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (571, 69, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (572, 69, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (573, 69, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (574, 69, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (575, 70, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (576, 70, 'color', '颜色', 1, 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (577, 70, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (578, 70, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (579, 70, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (580, 70, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (581, 70, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (582, 70, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (583, 70, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (584, 71, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (585, 71, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (586, 71, 'size', '尺码', 115, 406, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (587, 71, 'size', '尺码', 115, 405, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (588, 71, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (589, 71, 'style', '款式', 116, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (597, 74, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (598, 74, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (599, 74, 'size', '尺码', 115, 408, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (600, 74, 'size', '尺码', 115, 407, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (601, 74, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (602, 74, 'style', '款式', 116, 412, NULL, NULL);

-- ----------------------------
-- Table structure for erp_sale_after_info
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_after_info`;
CREATE TABLE `erp_sale_after_info`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `type` int(0) DEFAULT NULL COMMENT '类型（10退货；20换货；80补发；99订单拦截；）',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `shop_type` int(0) DEFAULT NULL COMMENT '店铺类型',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后单号',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  `sub_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子订单号',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品skuid',
  `count` int(0) DEFAULT NULL COMMENT '数量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题',
  `img` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  `sku_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku描述',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku编码',
  `erp_goods_id` int(0) DEFAULT NULL COMMENT 'ERP商品id',
  `erp_sku_id` int(0) DEFAULT NULL COMMENT 'ERP商品skuId',
  `return_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退回人信息json',
  `return_waybill_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退回快递单号',
  `return_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退回物流公司名称',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人姓名',
  `receiver_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人联系电话',
  `receiver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人详细地址',
  `ship_waybill_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货快递单号（补发、换货发货、拦截订单发货）',
  `ship_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货快递公司',
  `status` int(0) DEFAULT NULL COMMENT '状态:1已发出；2已完成(已收货);3已入库',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后处理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for erp_sale_after_refund
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_after_refund`;
CREATE TABLE `erp_sale_after_refund`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `refund_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '退货单号',
  `refund_type` int(0) DEFAULT NULL COMMENT '类型(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `shop_type` int(0) DEFAULT NULL COMMENT '店铺类型',
  `refund_fee` float NOT NULL COMMENT '退款金额',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款原因',
  `original_order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '原始订单号（来自于第三方平台）',
  `original_order_item_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始子订单号（来自于第三方平台）',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '原始子订单skuId',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp商品id',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT 'erp sku id',
  `spec_num` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'sku编码',
  `has_good_return` int(0) DEFAULT NULL COMMENT '买家是否需要退货。可选值:1(是),0(否)',
  `goods_name` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_sku` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品sku',
  `goods_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品图片',
  `quantity` bigint(0) DEFAULT NULL COMMENT '退货数量',
  `return_logistics_company` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退货物流公司',
  `return_logistics_code` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '退货物流单号',
  `receive_time` datetime(0) DEFAULT NULL COMMENT '收货时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '备注',
  `contact_person` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '发货人',
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '发货人手机号',
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '发货地址',
  `status` int(0) NOT NULL COMMENT '状态（10001待审核10002等待买家退货10005等待卖家收货14000拒绝退款10011退款关闭10010退款完成）',
  `create_time` datetime(0) NOT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1788119148154740739 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后退款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_sale_after_refund
-- ----------------------------
INSERT INTO `erp_sale_after_refund` VALUES (1786735505566502913, '154486920027549058', 11, 6, 4, 20, '与商家协商一致退款', '2088964452215545890', '2088964452216545890', '', 0, 0, 'ZH-SF-04-DS-F9-QM20A-NT3', 0, '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4902529397704|颜色分类:奶油白;安装方式:组装', NULL, 2, NULL, NULL, NULL, '', '', '', '', 10010, '2024-05-04 20:31:55', 'REFUND_MESSAGE', NULL, NULL);
INSERT INTO `erp_sale_after_refund` VALUES (1788119148154740738, '2000000476685963', 10, 2, 2, 99.9, '质量问题', '3719496358260248576', '0', '2231619925', 0, 0, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, '', '', '', '', 10001, '2024-05-08 16:10:01', 'REFUND_MESSAGE', NULL, NULL);

-- ----------------------------
-- Table structure for erp_sale_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order`;
CREATE TABLE `erp_sale_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单id，自增',
  `order_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号（来源订单）',
  `shop_type` int(0) DEFAULT NULL COMMENT '店铺类型',
  `shop_id` int(0) NOT NULL COMMENT '店铺ID',
  `remark` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单备注',
  `buyer_memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '买家留言信息',
  `seller_memo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '卖家留言',
  `tag` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '标签',
  `refund_status` int(0) NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部',
  `order_status` int(0) NOT NULL COMMENT '订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款',
  `goods_amount` double DEFAULT NULL COMMENT '商品金额',
  `discount_amount` double NOT NULL COMMENT '折扣金额',
  `postage` double DEFAULT NULL COMMENT '运费',
  `amount` double NOT NULL COMMENT '支付金额，单位：元，支付金额=商品金额-折扣金额+邮费',
  `receiver_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '区',
  `order_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '支付时间',
  `confirm_time` datetime(0) DEFAULT NULL COMMENT '订单确认时间',
  `ship_type` int(0) DEFAULT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int(0) NOT NULL COMMENT '发货状态（0待备货1备货中2已出库3已发货）',
  `shipping_time` datetime(0) DEFAULT NULL COMMENT '发货时间',
  `shipping_number` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递单号',
  `shipping_company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流公司',
  `shipping_man` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发货人',
  `shipping_cost` decimal(10, 2) DEFAULT NULL COMMENT '发货费用',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `length` float DEFAULT 0 COMMENT '长',
  `width` float DEFAULT 0 COMMENT '宽',
  `height` float DEFAULT 0 COMMENT '高',
  `weight` float DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn_index`(`order_num`) USING BTREE,
  INDEX `shopid_index`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_sale_order
-- ----------------------------
INSERT INTO `erp_sale_order` VALUES (42, '1787451058756751361', 2, 2, NULL, NULL, NULL, NULL, 1, 2, 99.9, 0, 0, 99.9, '胡**', '188****9606', '****', '中国', '湖北省', '武汉市', '青山区', NULL, NULL, '2024-05-08 15:22:43', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-05-08 15:22:43', '手动确认订单', NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `erp_sale_order` VALUES (47, 'AD580023566000', 99, 1, NULL, NULL, NULL, NULL, 1, 1, 21, 0, 0, 21, '启航', '1382023320', '实际广场23309', NULL, '广东省', '深圳市', '南山区', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-05-09 09:47:54', 'admin', NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `erp_sale_order` VALUES (48, 'A135822662000012', 99, 1, NULL, NULL, NULL, NULL, 1, 1, 21, 0, 0, 21, '启航', '136982222', '阿迪达斯打发打发', NULL, '上海市', '市辖区', '黄浦区', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:04:50', 'admin', NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `erp_sale_order` VALUES (49, 'AD3702565220', 99, 1, NULL, NULL, NULL, NULL, 1, 1, 54, 0, 0, 54, 'Q', '13822033320', 'SAFADSFASDAFASDF', NULL, '天津市', '市辖区', '和平区', NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:10:48', 'admin', '2024-05-25 11:14:51', '生成拣货单', 0, 0, 0, NULL);
INSERT INTO `erp_sale_order` VALUES (50, 'SF137003620200', 99, 1, NULL, NULL, NULL, NULL, 1, 1, 21, 0, 0, 21, 'A', '136000000', 'aaddfd', NULL, '山西省', '大同市', '平城区', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:12:21', 'admin', NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `erp_sale_order` VALUES (51, 'A13885020023320', 99, 1, NULL, NULL, NULL, NULL, 1, 1, 66, 0, 0, 66, 'Q', '13582202330', 'AAAA', NULL, '河北省', '邯郸市', '复兴区', '2024-05-09 10:19:20', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2024-05-09 10:19:29', 'admin', '2024-05-09 10:20:04', '生成拣货单', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for erp_sale_order_item
-- ----------------------------
DROP TABLE IF EXISTS `erp_sale_order_item`;
CREATE TABLE `erp_sale_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `order_id` bigint(0) NOT NULL COMMENT '订单ID',
  `shop_id` int(0) NOT NULL COMMENT '店铺id',
  `supplier_id` int(0) DEFAULT NULL COMMENT '供应商ID',
  `goods_id` bigint(0) DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint(0) DEFAULT 0 COMMENT 'erp系统商品规格id',
  `goods_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品图片',
  `goods_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_spec` varchar(2550) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品规格',
  `spec_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品规格编码',
  `goods_price` double DEFAULT NULL COMMENT '商品单价',
  `item_amount` double DEFAULT NULL COMMENT '子订单金额',
  `quantity` int(0) NOT NULL COMMENT '商品数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `original_order_item_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '子订单编号(来源订单)',
  `original_order_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单编号（来源订单）',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '原始订单skuid',
  `is_gift` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否赠品0否1是',
  `refund_count` int(0) DEFAULT 0 COMMENT '已退货数量',
  `refund_status` int(0) DEFAULT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ',
  `order_status` int(0) DEFAULT NULL COMMENT '订单状态',
  `ship_type` int(0) DEFAULT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int(0) NOT NULL COMMENT '发货状态（0待备货1备货中2已出库3已发货）',
  `ship_time` datetime(0) DEFAULT NULL COMMENT '发货时间',
  `logistics_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递单号',
  `logistics_company` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流公司',
  `ship_man` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '发货人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodId_index`(`goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785584827112509453 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_sale_order_item
-- ----------------------------
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509447, 42, 2, NULL, 0, 0, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', '10000113792713', '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', '', 99.9, 99.9, 1, NULL, '1787451058773528578', '3719517651511152896', NULL, 0, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, '2024-05-08 15:22:43', '手动确认订单', NULL, NULL);
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509448, 47, 1, NULL, 439, 439, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 'HNP182', '浅蓝色 2XL ', 'HNP1825005', 21, 21, 1, '', 'AD580023566000', 'AD580023566000', NULL, 0, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, '2024-05-09 09:47:54', 'admin', NULL, NULL);
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509449, 48, 1, NULL, 439, 439, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 'HNP182', '浅蓝色 2XL ', 'HNP1825005', 21, 21, 1, '', 'A135822662000012', 'A135822662000012', NULL, 0, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, '2024-05-09 10:04:50', 'admin', NULL, NULL);
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509450, 49, 1, NULL, 1229, 1229, 'GZYYZ7277复古显瘦灯芯绒a字半身裙', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg', 'GZYYZ7277', '墨绿色 均码 ', 'GZYYZ72776200', 54, 54, 1, '', 'AD3702565220', 'AD3702565220', NULL, 0, 0, 1, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-05-09 10:10:48', 'admin', '2024-05-25 11:14:51', '生成拣货单');
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509451, 50, 1, 26, 439, 439, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 'HNP182', '浅蓝色 2XL ', 'HNP1825005', 21, 21, 1, '', 'SF137003620200', 'SF137003620200', NULL, 0, 0, 1, 1, NULL, 0, NULL, NULL, NULL, NULL, '2024-05-09 10:12:21', 'admin', NULL, NULL);
INSERT INTO `erp_sale_order_item` VALUES (1785584827112509452, 51, 1, 32, 1228, 1228, 'GZYYZ7277复古显瘦灯芯绒a字半身裙', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg', 'GZYYZ7277', '咖啡色 均码 ', 'GZYYZ72773100', 54, 54, 1, '', 'A13885020023320', 'A13885020023320', NULL, 0, 0, 1, 1, 0, 1, NULL, NULL, NULL, NULL, '2024-05-09 10:19:29', 'admin', '2024-05-09 10:20:04', '生成拣货单');

-- ----------------------------
-- Table structure for erp_ship_logistics
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_logistics`;
CREATE TABLE `erp_ship_logistics`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递公司',
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递公司编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(0) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_ship_logistics
-- ----------------------------
INSERT INTO `erp_ship_logistics` VALUES (1, '中通快递', 'ZTO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (2, '申通快递', 'STO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (3, '圆通速递', 'YTO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (4, '韵达速递', 'YD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (5, '邮政快递包裹', 'YZPY', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (6, '顺丰速运', 'SF', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (7, '京东快递', 'JD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (8, '德邦快递', 'DBL', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (9, '极兔速递', 'JTSD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (10, '菜鸟速递', 'CNSD', '0', 1);

-- ----------------------------
-- Table structure for erp_ship_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order`;
CREATE TABLE `erp_ship_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` int(0) NOT NULL COMMENT '店铺ID',
  `shop_type` int(0) NOT NULL COMMENT '店铺平台',
  `supplier_id` int(0) NOT NULL COMMENT 'erp系统商品id',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `erp_order_id` bigint(0) DEFAULT NULL COMMENT 'erp订单ID',
  `erp_order_item_id` bigint(0) NOT NULL COMMENT 'erp子订单ID',
  `order_time` datetime(0) NOT NULL COMMENT '订单日期',
  `goods_id` bigint(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `spec_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品规格编码',
  `quantity` int(0) NOT NULL COMMENT '商品数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '说明',
  `logistics_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流单号',
  `logistics_fee` decimal(6, 2) DEFAULT NULL COMMENT '运费',
  `ship_time` datetime(0) DEFAULT NULL COMMENT '发货时间',
  `ship_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货人',
  `out_operator` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出库人',
  `out_position` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '出库仓位',
  `out_time` datetime(0) DEFAULT NULL COMMENT '出库时间',
  `ship_type` int(0) NOT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int(0) NOT NULL COMMENT '状态（1出库中2已出库3已发货）',
  `package_weight` float DEFAULT NULL COMMENT '包裹重量',
  `package_length` float DEFAULT NULL COMMENT '包裹长度',
  `package_width` float DEFAULT NULL COMMENT '包裹宽度',
  `package_height` float DEFAULT NULL COMMENT '包裹高度',
  `packsge_operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '打包操作人',
  `packsge_time` datetime(0) DEFAULT NULL COMMENT '打包时间',
  `packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '包裹内容JSON',
  `receiver_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '区',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460750368771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_ship_order
-- ----------------------------
INSERT INTO `erp_ship_order` VALUES (1785676692335767553, 6, 4, 0, '2055782964491095876', 38, 442, '2024-02-01 11:39:21', 9, 23, '2720210080260001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '胥**', '*******8279', '高*街道江苏省高邮市北**村**幢***室', '中国', '江苏省', '扬州市', '高邮市', '2024-05-01 22:24:34', '生成拣货单', NULL, NULL);
INSERT INTO `erp_ship_order` VALUES (1785852155209383937, 6, 4, 26, '3763030608986745044', 39, 443, '2024-01-31 10:42:58', 9, 23, '2720210080260001', 1, NULL, '菜鸟速递', '11111', 11.00, '2024-05-02 15:12:17', NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张**', '*******4678', '大*镇*城**路下段泰舂小吃', '中国', '云南省', '大理白族自治州', '大理市', '2024-05-02 10:01:48', '分配给供应商发货', '2024-05-02 15:12:36', '发货');
INSERT INTO `erp_ship_order` VALUES (1786204816567873538, 6, 4, 26, '2137984935735126281', 41, 1785584827112509446, '2024-05-02 12:47:02', 9, 32, '2720210080260105', 1, NULL, '京东快递', 'JD903989932', 5.00, '2024-05-03 11:32:15', NULL, 'admin', '20', '2024-05-03 10:56:43', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '刘**', '*******6949', '东**街道湖南省社会**院**栋***', '中国', '湖南省', '长沙市', '开福区', '2024-05-03 09:23:09', '生成拣货单', '2024-05-03 11:38:48', '发货');
INSERT INTO `erp_ship_order` VALUES (1788393466931580930, 1, 99, 32, 'A13885020023320', 51, 1785584827112509452, '2024-05-09 10:19:20', 1228, 1228, 'GZYYZ72773100', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Q', '13582202330', 'AAAA', NULL, '河北省', '邯郸市', '复兴区', '2024-05-09 10:20:04', '生成拣货单', NULL, NULL);
INSERT INTO `erp_ship_order` VALUES (1794205460750368770, 1, 99, 0, 'AD3702565220', 49, 1785584827112509450, '2024-05-09 10:10:48', 1229, 1229, 'GZYYZ72776200', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Q', '13822033320', 'SAFADSFASDAFASDF', NULL, '天津市', '市辖区', '和平区', '2024-05-25 11:14:51', '生成拣货单', NULL, NULL);

-- ----------------------------
-- Table structure for erp_ship_order_agent_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_agent_fee`;
CREATE TABLE `erp_ship_order_agent_fee`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `shop_id` int(0) NOT NULL COMMENT '店铺id',
  `supplier_id` bigint(0) NOT NULL COMMENT '供应商id',
  `supplier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `date` date NOT NULL COMMENT '日期',
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '应付总金额',
  `ship_amount` decimal(5, 2) NOT NULL COMMENT '物流费用',
  `goods_amount` decimal(10, 2) NOT NULL COMMENT '商品金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(0) NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785930405289799682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商代发账单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_ship_order_agent_fee
-- ----------------------------
INSERT INTO `erp_ship_order_agent_fee` VALUES (1785930405289799681, '3763030608986745044', 6, 26, NULL, '2024-05-02', '菜鸟速递', '11111', 30.00, 11.00, 19.00, NULL, 0, '2024-05-02 15:12:44', '发货生成账单', NULL, NULL);

-- ----------------------------
-- Table structure for erp_ship_order_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_fee`;
CREATE TABLE `erp_ship_order_fee`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_company_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司id',
  `logistics_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `amount` decimal(10, 2) NOT NULL COMMENT '应付金额',
  `date` date NOT NULL COMMENT '应付日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(0) NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `length` float DEFAULT 0 COMMENT '长',
  `width` float DEFAULT 0 COMMENT '宽',
  `height` float DEFAULT 0 COMMENT '高',
  `weight` float DEFAULT NULL COMMENT '重量',
  `receiver_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人手机号',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786238985318604802 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货物流费用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of erp_ship_order_fee
-- ----------------------------
INSERT INTO `erp_ship_order_fee` VALUES (1786238985318604801, '京东快递', NULL, 'JD903989932', '2137984935735126281', 6, 5.00, '2024-05-03', NULL, 0, '2024-05-03 11:38:54', '发货', NULL, NULL, 0, 0, 0, NULL, '刘**', '*******6949', '湖南省', '长沙市', '开福区');

-- ----------------------------
-- Table structure for oms_dou_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_goods`;
CREATE TABLE `oms_dou_goods`  (
  `id` bigint(0) NOT NULL,
  `shop_id` bigint(0) DEFAULT NULL COMMENT '店铺id',
  `product_id` bigint(0) DEFAULT NULL COMMENT '商品ID，抖店系统生成，店铺下唯一',
  `product_type` int(0) DEFAULT NULL COMMENT '商品类型；0-普通；1-新客商品；3-虚拟；6-玉石闪购；7-云闪购 ；127-其他类型；',
  `name` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题。',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品主图的第一张图',
  `check_status` int(0) DEFAULT NULL COMMENT '商品审核状态: 1-未提交；2-待审核；3-审核通过；4-审核未通过；5-封禁；7-审核通过待上架；',
  `status` int(0) DEFAULT NULL COMMENT '商品在店铺中状态: 0-在线；1-下线；2-删除；',
  `spec_id` bigint(0) DEFAULT NULL COMMENT '商品规格，全局唯一',
  `create_time` int(0) DEFAULT NULL COMMENT '商品创建时间，unix时间戳，单位：秒；',
  `update_time` int(0) DEFAULT NULL COMMENT '商品更新时间，unix时间戳，单位：秒；',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '商品详情，最大支持50张图片，单张详情图宽高比不超2000*2000px，大小5M内，仅支持jpg/jpeg/png格式；',
  `category_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '类目详情；商品类目id可使用【/shop/getShopCategory】查询',
  `outer_product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外部商家编码，商家自定义字段，支持最多 255个字符',
  `is_package_product` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否是组合商品，true-是，false-不是；',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp商品id',
  `pull_time` datetime(0) DEFAULT NULL COMMENT '拉取时间',
  `modify_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_dou_goods
-- ----------------------------
INSERT INTO `oms_dou_goods` VALUES (1796089979466719234, 6, 3684346422758604867, 0, '曲美轻奢复古全真皮沙发客厅直排三人头层牛皮油蜡皮美拉德沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_35668dca73e76abf18e3b5c104969a72_sx_343071_www800-800', 3, 0, 1798997687517227, 1715657894, 1716288354, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_66f3944ed64bf8ffa14ea9ea7a672fd2_sx_112993_www790-506\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f8d884940d89fa6976faec964c89a242_sx_365527_www790-823\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_95f67ab6ba02265f638852363ab6f22f_sx_84319_www790-623\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d79c168a0bd784ef95ed1884d5b0cbc7_sx_84003_www790-790\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0a083dbb9dd0b7d5e9b552b130be6f68_sx_132942_www790-626\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8ba3ee80d1aa0c47debff124c364d5c4_sx_443429_www790-926\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_98f5716a1b05fc1f301e9e62bda0cae2_sx_98868_www790-467\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3f97f5a0990f4ad8442dac6e77364c58_sx_446641_www790-923\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_40e9a021b71e26be956854294178b5a2_sx_107906_www790-471\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7253578a3d8d12f09cf723d5db571462_sx_440322_www790-931\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_23d5e550fa873c0950f7db3cb8a2ff75_sx_114738_www790-468\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_46bf1a0f0575da87329b03d9aca90a12_sx_469267_www790-1060\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3fc9ff3a24f8f2477d00b3e0bb4f554c_sx_495073_www790-590\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6e743a24936ea52b7e033b8dbe63fc1b_sx_378456_www790-728\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b4b88127f5ad1603925ea015bfd2e28a_sx_133841_www790-502\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_75bae93bdcb7d1495b668a25848c4679_sx_253465_www790-595\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d3281d23aa21189adbbd39b7efa3c2fa_sx_205949_www790-609\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_17730434acb4fbd835e1d3876df19223_sx_131624_www790-499\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_08fb5885ce4e93b4590fa8bb5fb12c6e_sx_305726_www790-1088\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d2b87ba005baf7cd49c8f0b7d22b0817_sx_120562_www790-445\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_11548cc261f48328a2179def5bff0e3d_sx_495291_www790-1066\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_db9708d80f967b1d75987bd67991986a_sx_97832_www790-464\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_414aa261a3a5a5a6532da74ea45f24e2_sx_428332_www790-1060\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_da615eed2c67b91047b9f5e2e92ab8ab_sx_90182_www790-462\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2ac8731fabf0b177a4e493c7f060d6d7_sx_482404_www790-1068\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_cab4b9dc8a9669ec7fe9bbaae1c385cd_sx_85514_www790-538\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0a89aa3edb0c25185969057dbcf38f37_sx_129660_www790-400\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fc78e00ddfaee7a1a5e689d14534fc0a_sx_137192_www790-533\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8539a1ec69f50a719541d6335a76382c_sx_274967_www790-823\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4dead6f019069fed4226356b9aa2a23e_sx_185391_www790-977\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4e6f86c128ae6eff7057eb28f444d8b8_sx_198833_www790-819\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f23026f575881583f005d35dc9a92550_sx_307746_www790-871\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_cdd4c1dd1376556a09cdef4ee7bad928_sx_52189_www790-562\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e798646f688077126d3a8277397608f1_sx_34773_www790-421\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089979894538241, 6, 3684344827195031719, 0, '曲美美式简约全真皮沙发客厅家用头层牛皮复古油蜡皮直排华夫格', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_851f3028a392630ea5cd9791ae2fa31c_sx_366008_www800-800', 3, 0, 1798997510104112, 1715657725, 1716282908, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1530ea5b49e5ca62fda75badcbb570fe_sx_114843_www790-502\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_03e092c54f2005da8006ad5e18efdf53_sx_383632_www790-830\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d6dd76e8061935c4042bd9ff9afa39a3_sx_36633_www790-312\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b4a146cdb29e5f1e5dadc0a9f9d2b7fd_sx_73623_www790-607\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3dcf4d483bd02f045c20e851c9794178_sx_47382_www790-524\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a1176d564c6887e541290306ff24e656_sx_117237_www790-532\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_99e6366e35ebd1a4fc0bb23dcfc70ecc_sx_475617_www790-987\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_40294ac01c3a185145cbb12e158a2713_sx_57535_www790-461\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5976d04415a2bfdceaa70d5e67a481f4_sx_531719_www790-923\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_830a0e2ad3851395e2059ab3d06ae884_sx_63786_www790-470\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4fa0453f75544f716ba7c5de48f3f9f0_sx_502530_www790-926\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_78bbd0ec3ab21295b856ed9ed6305d91_sx_68287_www790-454\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_afb0a0d666a543234e95971c9a59344c_sx_104036_www790-362\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6e310c6eabb3eb62867c8ef119ca768c_sx_348673_www790-726\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f5085edd78f903b9a2b81eaca6169714_sx_258655_www790-584\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d4322bafe9030ea005c56828b6070679_sx_478870_www790-730\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a145d3e1d31f3edbb125d26ff9c46321_sx_84186_www790-464\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_91182700921b7af7e841609d27507d32_sx_300768_www790-635\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6133d74d0032a0850d33225bba61af20_sx_425186_www790-687\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c0eb46c94b2e017be4847e0689cd5dce_sx_85430_www790-513\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_af702e636ab256eb1151eaffa4fc1d32_sx_137095_www790-544\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_750f277b1dce41d98e1741e33e273adf_sx_162964_www790-523\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b2c447046296e6ce04e5e351fcff73be_sx_53091_www790-454\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2cd0a6e439100a062e71b56f16d08a94_sx_546393_www790-1050\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c035636c619a2b29abd38417edeaf331_sx_60805_www790-470\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8534ddc4dc9da97af18b9a178712a4f1_sx_524569_www790-1079\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4721466cfd96ae51951fa5325d6db966_sx_62266_www790-482\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a317f191917b40cbe401e23641dbdbfa_sx_97181_www790-325\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_324ead29b0727375d599e22233a37c0f_sx_102798_www790-436\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7a01b6e83ee50b0e60762a8a30bdb3ba_sx_246478_www790-808\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1494a20716e9f086f14df1bf3c1e3ec2_sx_131289_www790-777\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_95a92289c67c1347afb6d55ee6a94da6_sx_26479_www790-185\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f392168edda209a02802b71239a299f2_sx_176809_www790-804\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_aad1a6ba2a0ba18c05269b0286c85d2c_sx_309926_www790-898\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4fd4e94a67eda2348462b0b2e3b5dd1f_sx_85078_www790-994\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089979970035713, 6, 3684344451511222769, 0, '曲美意式极简全真皮沙发客厅三人头层牛皮轻奢复古油蜡皮曙光沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2e9c9aefec60b719ea3b318f7be1b91e_sx_409445_www800-800', 3, 0, 1798997201054720, 1715657428, 1716283904, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8a112df6463cb2f61f3fbb36452bf30f_sx_109743_www790-499\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7061bf179045e41605fc40d4e0fa6404_sx_355914_www790-836\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_cb005bbfa8198b934b1eaede078ec685_sx_45451_www790-308\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ffde047a5ecd880a9c2e63888be5c7c4_sx_113794_www790-941\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a6c1ef0b8c098ce5e7f6dc4560cd4e94_sx_9306_www790-184\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_266303a7929e933b41d25e75f1bbdb39_sx_97039_www790-524\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7f26ede91aad3061c8ad6f861cfa7427_sx_496348_www790-1011\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_11d5a716d0293b575c203c1332dbdcc5_sx_83330_www790-464\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b54d966e6dbcea9ae763203d3f7a2d2e_sx_463565_www790-868\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_414169129d9cab3513141e19cb39ba31_sx_177458_www790-579\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2196f13e03994c1a2b75b5061edd2a69_sx_95632_www790-459\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b657df7ba1a675cc63484660f893c6f3_sx_508754_www790-925\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e112cef269d28527e5357923c968fd95_sx_104818_www790-474\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e48ecf2200b928b926278c768319cce0_sx_506725_www790-1060\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fd2ec098c554bca44cefad41af716b2a_sx_470020_www790-585\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_401073a754517bcb5c8889ac08c857f2_sx_370778_www790-731\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5c0630ad99146737d865dca76b291226_sx_114403_www790-512\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f555db87e5d2cfc5ac327e558112c967_sx_465428_www790-1060\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5c208b000ae499ea9e13b97efabe6c03_sx_117897_www790-507\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ff6f395f8d8a0cbf2bc83811f540996d_sx_302279_www790-1077\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c3fd160bad6c803b61d8289e697e1e27_sx_102077_www790-449\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2eb69451253d5ea3c01d49fb0df2cad6_sx_549252_www790-1070\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_18230d06dfa5efd548890b1d4d02658c_sx_87090_www790-453\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_061848d1d0c902f36496b9dee5380a69_sx_503352_www790-1068\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_785763b7cd206224a5101150f83e94e3_sx_87779_www790-459\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_9baa580ded6e348d91858fe3d8545df8_sx_615015_www790-1066\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_29b656aa35d4e37e33357a7f0a569c8a_sx_78982_www790-537\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d5ae59830269d7ade256b9f6ed85958d_sx_111046_www790-409\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_35e73540a62f2d04840ee966635dcc9c_sx_114619_www790-497\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_55ecffdb8bea8e7808a8d6903cedab65_sx_288797_www790-845\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7a859e2a815c17c57c80acbb14953f33_sx_178197_www790-975\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b06c3f0e624da73255e6d6c3c1ccf667_sx_205698_www790-838\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ff34b1b8f34e2e4533025f1d804e0f0c_sx_307656_www790-856\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_aa9e2bfcd29268b9204ce645af486277_sx_82621_www790-988\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980091670530, 6, 3684344359093928074, 0, '曲美意式全真皮头层牛皮客厅直排三人位轻奢复古油蜡皮帆船沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_09bd1b8473addab9a851f2735aa842f6_sx_517865_www800-800', 3, 0, 1798996889481244, 1715657130, 1716283203, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4702c3b2de26aca93521e48e93c08cce_sx_165457_www790-597\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4e2fb741715528d86b72af8fa581be65_sx_363902_www790-733\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2b30f4a1064ab7312a5789d2f2d0a686_sx_115216_www790-927\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_766f0bc14e9cc3300b1ee07f2ae97167_sx_43389_www790-498\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ca9241200142f0242173fb5154af886c_sx_106729_www790-499\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_562f18840ecbf22c8921711d36668079_sx_462993_www790-1046\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d48a244af80807fe467b6b8fc464ed38_sx_72251_www790-453\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b679d030a8e67fa97970746672109b9f_sx_373142_www790-940\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3d6e6c9136faa7dce52c28e671c94136_sx_67659_www790-463\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d63d02236737cc92d0752e04cd7f9c16_sx_487383_www790-909\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0a8a478b40934de0e9b6625b33154406_sx_69608_www790-464\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b510463e18fc65cf737b0fe4696bb1fd_sx_395685_www790-1095\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_92eff9bfd64e5a618dfe5ba95df03a2b_sx_172283_www790-600\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3101e0ca4b82bccfd18028c169706eb1_sx_217316_www790-703\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_01d4634b2935cbe1e9f52a662dd8e0ad_sx_84309_www790-465\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_56ddcd962950e0f5261a210fd3d4c830_sx_517613_www790-1064\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8ef9c99d2a892cb4e4421c94d95df460_sx_64796_www790-443\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c68b68b1646186609a5e4204b8960375_sx_522910_www790-1051\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a1ecda9dbd3b7677a6a4a094126544ec_sx_87417_www790-500\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_efb3d49fdbcc50b9412cb56023428b97_sx_299059_www790-1071\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3efac9f437482160c3c0bc521d9330ed_sx_62653_www790-449\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5be77457fc58887c4b226b0496b2029d_sx_447430_www790-1063\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5e8306be4e1eea7662b61823d1c81ff0_sx_59859_www790-464\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d0c401692c0da775a8700615c0cc5037_sx_521005_www790-1120\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_13be482c24fca08ed0f59d852d76209b_sx_257450_www790-858\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_35c33347c2c44c32b4f5022174d8e049_sx_12797_www790-237\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a19fef0dccad72a666d20d5f1527a46d_sx_144080_www790-732\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_57d4cedeb1bdd41d0bab76470d79566f_sx_17853_www790-243\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ee99a9e28a1c15060dabc9ae3a917619_sx_143586_www790-581\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_28870920e1398495e93416e80245dea1_sx_21042_www790-208\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2291e51725cf41ab1282b3d9dd679e36_sx_284313_www790-661\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4cf299fd8a1f601ec425c7fe23af544e_sx_76427_www790-992\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980192333825, 6, 3684341644464881915, 0, '曲美家居头等舱电动单人沙发客厅简约多功能懒人观影休闲单椅泡芙', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_32f7ade379f94575c7f7e20621c6fb33_sx_442959_www800-800', 3, 0, 1798996188451891, 1715656465, 1715656475, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802781a55569c38776d3f9dae7ce1e36_sx_159589_www790-351\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1f0fc30eab936dea489ecb0d9d9ade02_sx_377503_www790-769\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7b0dd957e5e9e53c340b935d3b5fff6e_sx_134000_www790-785\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_17926966bfd450fc484396e2be6a7fac_sx_64884_www790-501\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b025d120b0d96f7e49670ba7b42a1406_sx_74137_www790-426\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_156f37954de33c14ec72a47152cabd65_sx_444412_www790-1091\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_82ac7277146775c7d3f309a53752b55e_sx_86346_www790-512\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_836318e1449e51ced5e6ac66b95c2ec7_sx_174487_www790-753\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2ed47a4c4afd6d6bf00d306b61198a0b_sx_58455_www790-427\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_dfc31d0d3ea782afa5e5ed4093d50a29_sx_97885_www790-396\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5a099923b790eb3a22930d1031fc6e47_sx_432781_www790-867\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_96597a18537b2564812d4e55e58cf53b_sx_94973_www790-468\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ee52f7a64ec6cb34dd314a04c9bc496d_sx_314069_www790-900\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_dabac4cd915c18f9e62d8eccfede1e52_sx_109949_www790-416\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5dc051e8c25890e57dcf1272bd108fb3_sx_387503_www790-1036\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8ff59caf53e445ac738b011a7c6007f5_sx_113000_www790-423\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d62b666da5bc832215a05d8749b2267a_sx_328331_www790-914\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_525310488229b69ada919f4c6305669a_sx_129990_www790-450\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_141a36d91c3969727f09c6b996895c82_sx_451009_www790-966\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4262ba9dae4fc5f56c216a1370ff0056_sx_108770_www790-408\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1f61b3f640ce999d2e61eb28c23c348c_sx_262326_www790-873\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_34bac606021a750cbe4cba4da25fa628_sx_100442_www790-426\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2ee3791e9c64c2d443ac7ffdf1b2699f_sx_239328_www790-664\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3f8d5d2388febaeacceb259eda6dcc22_sx_300490_www790-870\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0c69767ed3164c17ae79ae44d53afb22_sx_162212_www790-1052\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_dbb1009cda5e7bd8454624f51332d0b4_sx_147811_www790-944\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_726749b8c58bad60d0c45b9b831b6895_sx_315865_www790-941\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b3d1bc5502d1d2abdd8fde36642d0cae_sx_83124_www790-924\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980276219906, 6, 3683273032996094266, 0, '曲美家居北欧简约风岩板餐桌家用小户型轻奢方桌弯曲木工艺大溪地', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c055fefe5407452e7502fc96d23b6c4f_sx_452454_www800-800', 3, 0, 1798474158409764, 1715158616, 1716283576, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d99bea14f422d960587f51412ea6768b_sx_295868_www790-569\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_add39936b80196829d468e66e65effb4_sx_319222_www790-622\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_73612b8ed90939e55c0eb4443c6518fc_sx_145320_www790-796\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5baee3eb039f87aabcb8d99095c6b4ae_sx_106357_www790-744\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c5fc170fac8e83d3c48e307e533b1036_sx_243947_www790-555\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8018b92690961163c49e53bf3de4b70f_sx_170624_www790-510\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f7dcb5f8e4bdfbad88e93280d5476adf_sx_755186_www790-1223\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_cf4512f76201c6fe0b012f2b757e0bc8_sx_461221_www790-1238\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_372c4be3967953a1e118620a215fd5d0_sx_210831_www790-473\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b65b65a81b618ffed211cab17081de2c_sx_311024_www790-620\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c376c675fd209e2d06751c5781780176_sx_213123_www790-653\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0c950609aa0fe4cceda2f5c981c2cffe_sx_79299_www790-388\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4e16148b1c8961b317c7dcca607ed0d2_sx_433222_www790-1014\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fdfcef880599da4bdbbcd154083d58eb_sx_179934_www790-423\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_098686760d773c25a6294470855481eb_sx_462509_www790-1123\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_59508d7f989c7adc4c2aea7d08f80346_sx_92393_www790-430\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_804499cbddc6077de57a352681928a7d_sx_294790_www790-615\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d3e654d800d34aa168dc06740a8a0e02_sx_183515_www790-568\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d316a308a735063b0086ca140ebe0ac3_sx_417985_www790-887\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1808dd27117a191ba307e945a89cafad_sx_104485_www790-353\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_cf0161a50e82ee1e2b3611ed0672ba46_sx_76704_www790-404\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3a698931a2bea3a78664bbde0db0892c_sx_314517_www790-615\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e73ba4f5cac9a48809e9c0ac7174a0ea_sx_156896_www790-743\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ef78af688f297f4739a636987cb908a4_sx_127029_www790-804\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e8486bfcc97cb4c2f7ecdb21cc606b17_sx_275697_www790-840\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_afed61de17e5762818374fd8520e84eb_sx_119908_www790-974\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_777dea29b08eb1cf063414ef9a7d29ab_sx_112704_www790-873\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_60c400df43b28273da68704857484d4d_sx_61357_www790-669\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980460769281, 6, 3683272592829055342, 0, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800', 3, 0, 1798473696324659, 1715158180, 1716287898, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f5f048c13df0f9103916d48fa36ac163_sx_144638_www790-444\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7ccf5acb84b301f78975fcc1f02557de_sx_397665_www790-889\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2e138cdfd5868bc26eb368c67ac95bb6_sx_79794_www790-652\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e4832826696e1455a246f687ed042588_sx_106782_www790-755\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3a6af60f5488744c09a63ba5b0ede4ff_sx_207142_www790-557\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_dbeed45dd1bfe007ce392eef58a82068_sx_157597_www790-489\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_96efcdbf68e418b094de6c31aca5b496_sx_574290_www790-1221\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3dac9345d8776abf5645ead789197024_sx_471119_www790-1265\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a585783d6207d320e2f1d017a7be0548_sx_144324_www790-463\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b81c8fbb21793761e10797a1b70ab874_sx_481207_www790-1095\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_13dfa0ab72c1bf49803e788e7304149e_sx_79574_www790-356\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_eedbe4f620160269a9f2578e185cf516_sx_367270_www790-981\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_7972d8342d699a98920792dbfb08e4a2_sx_189241_www790-503\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_1f4a2c3515c061374c631c42f1c43b5a_sx_373353_www790-1061\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0884bff5ce3a33edbebe788add01905d_sx_75685_www790-413\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_275914952cbcd3b4027e144d669081c5_sx_225512_www790-635\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b70222c36c9f9628047e52a9ebff5b7f_sx_175255_www790-586\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8fd85cd1845dac3525c47736f70e6dd9_sx_355323_www790-866\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_567db9e10a69916baa790a1e47a453c2_sx_113993_www790-373\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_51ec7da6926812b74484dabba4ba4c6f_sx_158115_www790-756\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_14645e4b72a2261797c0f08d7531663e_sx_125707_www790-822\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6a56732ff1db0f1320c53f227c4c238b_sx_255118_www790-838\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_60041b4ad26658349d66b039ee6bf248_sx_133342_www790-971\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b4677d19d0c4b737c9915e785eefcc8d_sx_140284_www790-858\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a75a32bf2334d8a5aa1c6974bc760439_sx_64903_www790-671\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980662095873, 6, 3675810982778765316, 0, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800', 3, 0, 1794830540959979, 1711683793, 1716282033, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_df934d7e55c142d91a4f8e896d0bc3c7_sx_178844_www790-516\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_20ccfd590d9b029e694da44334b4e47e_sx_366224_www790-610\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e37bc77c98c336fc79ea9b8154321841_sx_170964_www790-918\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_60d0ebdd5eac166444c908c63a80493a_sx_41670_www790-443\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4243b371edc4e870533df685fd2932ee_sx_557015_www790-970\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2b7c62e21c4ecb330e2267080edb6139_sx_265423_www790-638\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_512baf514662cc7db2aa7f64b0cc476f_sx_240515_www790-622\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d9ae2b9d88713a8d39533b46615d5da8_sx_43168_www790-356\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8ad3b8f596c412bbe995052f855537cc_sx_453661_www790-968\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_95cf6473f00827e8538935015707474a_sx_159985_www790-479\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_bfde18cc875592ff2a5e76c1333acb77_sx_421007_www790-733\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c7890f8364abec4aef382c1138f68cf4_sx_47178_www790-365\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_10ac1b5d2159e51da6e5a528e110efb7_sx_272807_www790-885\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0fd0e64ae5a147c9689a45a5dca9306f_sx_59444_www790-556\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_31b795e61f5a74deeeba2ea70b72868a_sx_196704_www790-779\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_aab9fad0805074c1c52788c4caeee50f_sx_32559_www790-220\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3de3d5df1588d247c31f7be892f31461_sx_548817_www790-960\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2fb4f5001dfd9578b57bb3fa8d0cd71c_sx_289471_www790-780\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_85484eba9f8ffc2bcd9cd7eb6a665d66_sx_15066_www790-192\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ed707f3902f2d3a5371f9b1d15028cd9_sx_90700_www790-581\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e6604ac6bd1240503c85290080b0b4c1_sx_91843_www790-587\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fb507778657cf283afd4016cc1db3e30_sx_25167_www790-161\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2b3ddfa1d18f8cecb0a96ba7948a983b_sx_128618_www790-742\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0f34a15e6b9b4565cbdb3a026ebbf0e5_sx_375836_www790-888\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_adf6c2346bfabcbe3993bd833dac6d32_sx_82635_www790-860\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980817285121, 6, 3675809299109642249, 0, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800', 1, 0, 1794829436074089, 1711682737, 1716277653, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_df934d7e55c142d91a4f8e896d0bc3c7_sx_178844_www790-516\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_20ccfd590d9b029e694da44334b4e47e_sx_366224_www790-610\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e37bc77c98c336fc79ea9b8154321841_sx_170964_www790-918\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_60d0ebdd5eac166444c908c63a80493a_sx_41670_www790-443\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4243b371edc4e870533df685fd2932ee_sx_557015_www790-970\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2b7c62e21c4ecb330e2267080edb6139_sx_265423_www790-638\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_512baf514662cc7db2aa7f64b0cc476f_sx_240515_www790-622\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d9ae2b9d88713a8d39533b46615d5da8_sx_43168_www790-356\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8ad3b8f596c412bbe995052f855537cc_sx_453661_www790-968\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_95cf6473f00827e8538935015707474a_sx_159985_www790-479\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_bfde18cc875592ff2a5e76c1333acb77_sx_421007_www790-733\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c7890f8364abec4aef382c1138f68cf4_sx_47178_www790-365\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_10ac1b5d2159e51da6e5a528e110efb7_sx_272807_www790-885\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0fd0e64ae5a147c9689a45a5dca9306f_sx_59444_www790-556\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_31b795e61f5a74deeeba2ea70b72868a_sx_196704_www790-779\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_aab9fad0805074c1c52788c4caeee50f_sx_32559_www790-220\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3de3d5df1588d247c31f7be892f31461_sx_548817_www790-960\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2fb4f5001dfd9578b57bb3fa8d0cd71c_sx_289471_www790-780\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_85484eba9f8ffc2bcd9cd7eb6a665d66_sx_15066_www790-192\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ed707f3902f2d3a5371f9b1d15028cd9_sx_90700_www790-581\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e6604ac6bd1240503c85290080b0b4c1_sx_91843_www790-587\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fb507778657cf283afd4016cc1db3e30_sx_25167_www790-161\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2b3ddfa1d18f8cecb0a96ba7948a983b_sx_128618_www790-742\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_0f34a15e6b9b4565cbdb3a026ebbf0e5_sx_375836_www790-888\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_adf6c2346bfabcbe3993bd833dac6d32_sx_82635_www790-860\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');
INSERT INTO `oms_dou_goods` VALUES (1796089980964085761, 6, 3675473784854413419, 0, 'QM/曲美家居现代轻奢奶油简约大床卧室牛皮真皮软包床1.8x2米女孩', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3e68a575858dbc50b5bc61e400a4b96d_sx_409253_www800-800', 3, 0, 1794665612080155, 1711526505, 1716277340, '<p><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_bf7576fdf2502a7a8d4a7082161b21f8_sx_513605_www790-1134\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4d54e2dddcde733dadfb6a0e94bd350e_sx_93345_www790-925\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5978384e5957ae0308bfc06ad05deca7_sx_136268_www790-526\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e0fc4e4effe483a155e0c7222cf52cd9_sx_354782_www790-728\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f214624aa771795da816ce0cc143af3b_sx_422037_www790-1063\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d12e50471f454955bbab1d44e7ac738d_sx_277157_www790-687\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5e583cabb724361dafed06e87f653c10_sx_258791_www790-641\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fdef562da5d6b9de7aacf7c4fa2e59e0_sx_63041_www790-311\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_73eb33fb2737a5057948a8b8df7f6ab2_sx_348691_www790-859\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_52e3fd5509452f3caead6d938be3ff9d_sx_423098_www790-1070\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c75c1100cbb58579a3995215c55434b3_sx_71097_www790-424\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_4bc410d659cb7871ae56f285c4f88ada_sx_215206_www790-755\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_bf01ac6e0f38a63bf9fc46f4e7821c91_sx_479406_www790-1103\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6e210c7665493f5a088cb11c7d9937f7_sx_189996_www790-974\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_98316523bd305f9a1a6cb43a4d0b4b37_sx_284577_www790-790\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5fdd4d820c39e93287de0b4f408849a8_sx_146686_www790-936\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_a4e9b34011fe0d32da09fe434df8c55d_sx_142085_www790-800\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ea5341068b79ec27fb575194a8e2351b_sx_382490_www790-867\" style=\"max-width:100%;\"/><img src=\"https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_fbb337a5485d779fb1ac1dd93d5ad529_sx_88424_www790-981\" style=\"max-width:100%;\"/></p>', NULL, '', NULL, NULL, '2024-05-30 16:26:27', '2024-05-30 16:26:27');

-- ----------------------------
-- Table structure for oms_dou_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_goods_sku`;
CREATE TABLE `oms_dou_goods_sku`  (
  `id` bigint(0) NOT NULL COMMENT '商品sku_id;抖店系统生成。',
  `product_id` bigint(0) DEFAULT NULL COMMENT '商品ID；抖店系统生成。',
  `spec_id` bigint(0) DEFAULT NULL COMMENT '规格ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku外部编码',
  `sku_type` int(0) DEFAULT NULL COMMENT '库存类型；0-普通；1-区域库存；10-阶梯库存；',
  `sku_status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku状态 true上架 false下架',
  `out_sku_id` bigint(0) DEFAULT NULL COMMENT '外部的skuId；商家自定义；未设置返回为0。',
  `spec_detail_id1` bigint(0) DEFAULT NULL COMMENT '第一级子规格',
  `spec_detail_id2` bigint(0) DEFAULT NULL COMMENT '第二级子规格',
  `spec_detail_id3` bigint(0) DEFAULT NULL COMMENT '\r\n第三级子规格',
  `spec_detail_name1` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第一级子规格名',
  `spec_detail_name2` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第二级子规格名',
  `spec_detail_name3` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '\r\n第三级子规格名',
  `price` int(0) DEFAULT NULL COMMENT '商品价格，单位：分',
  `create_time` int(0) DEFAULT NULL COMMENT '创建时间，时间戳：单位秒；',
  `stock_num` int(0) DEFAULT NULL COMMENT 'ku_type=0时，表示普通库存数量 ;sku_type=1时，使用stock_map，表示区域库存数量',
  `prehold_stock_num` int(0) DEFAULT NULL COMMENT 'sku_type=0时，表示预占库存数量； sku_type=1时，表示区域库存数量，使用prehold_stock_map',
  `prom_stock_num` int(0) DEFAULT NULL COMMENT '活动库存',
  `step_stock_num` int(0) DEFAULT NULL COMMENT '\r\n阶梯库存',
  `prehold_step_stock_num` int(0) DEFAULT NULL COMMENT '预占阶梯库存',
  `prom_step_stock_num` int(0) DEFAULT NULL COMMENT '活动阶梯库存',
  `normal_stock_num` int(0) DEFAULT NULL COMMENT '库存模型V2新增 普通库存 非活动可售',
  `channel_stock_num` int(0) DEFAULT NULL COMMENT '库存模型V2新增 渠道库存',
  `sell_properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '销售属性，代替spec_detail_id123、spec_detail_name123',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `name` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题。',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品主图的第一张图',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店商品Sku表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_dou_goods_sku
-- ----------------------------
INSERT INTO `oms_dou_goods_sku` VALUES (1796095815526207489, 3684346422758604867, 1798997687517227, 'ZH-SPSF-F1-QM24-S5-XZP', 0, '1', 0, 1798997688209419, NULL, NULL, '默认', '', '', 1399900, 1715657894, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美轻奢复古全真皮沙发客厅直排三人头层牛皮油蜡皮美拉德沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_35668dca73e76abf18e3b5c104969a72_sx_343071_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095815677202433, 3684344827195031719, 1798997510104112, 'ZH-SPSF-F1-QM24-S4-DZP', 0, '1', 0, 1798997511057436, NULL, NULL, '默认', '', '', 1599900, 1715657725, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美美式简约全真皮沙发客厅家用头层牛皮复古油蜡皮直排华夫格', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_851f3028a392630ea5cd9791ae2fa31c_sx_366008_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095815836585986, 3684344451511222769, 1798997201054720, 'ZH-SPSF-F1-QM24-S3-XZP', 0, '1', 0, 1798997201054752, NULL, NULL, '默认', '', '', 859900, 1715657428, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美意式极简全真皮沙发客厅三人头层牛皮轻奢复古油蜡皮曙光沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2e9c9aefec60b719ea3b318f7be1b91e_sx_409445_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095815987580930, 3684344359093928074, 1798996889481244, 'ZH-SPSF-F1-QM24-S2-XZP', 0, '1', 0, 1798996889481276, NULL, NULL, '默认', '', '', 829900, 1715657130, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美意式全真皮头层牛皮客厅直排三人位轻奢复古油蜡皮帆船沙发', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_09bd1b8473addab9a851f2735aa842f6_sx_517865_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816100827137, 3684341644464881915, 1798996188451891, '', 0, '1', 0, 1798996188452883, NULL, NULL, '默认', '', '', 403900, 1715656465, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居头等舱电动单人沙发客厅简约多功能懒人观影休闲单椅泡芙', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_32f7ade379f94575c7f7e20621c6fb33_sx_442959_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816256016386, 3683273032996094266, 1798474158409764, '', 0, '1', 0, 1798474159130675, NULL, NULL, '典雅黑+合观胡桃', '', '', 399900, 1715158616, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居北欧简约风岩板餐桌家用小户型轻奢方桌弯曲木工艺大溪地', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c055fefe5407452e7502fc96d23b6c4f_sx_452454_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816281182209, 3683273032996094266, 1798474158409764, '', 0, '1', 0, 1798474159130659, NULL, NULL, '典雅黑+戈尔浅胡桃', '', '', 399900, 1715158616, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居北欧简约风岩板餐桌家用小户型轻奢方桌弯曲木工艺大溪地', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c055fefe5407452e7502fc96d23b6c4f_sx_452454_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816302153730, 3683273032996094266, 1798474158409764, '', 0, '1', 0, 1798474159130643, NULL, NULL, '雪山白+合观胡桃', '', '', 399900, 1715158616, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居北欧简约风岩板餐桌家用小户型轻奢方桌弯曲木工艺大溪地', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c055fefe5407452e7502fc96d23b6c4f_sx_452454_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816327319553, 3683273032996094266, 1798474158409764, '', 0, '1', 0, 1798474159130627, NULL, NULL, '雪山白+戈尔浅胡桃', '', '', 399900, 1715158616, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居北欧简约风岩板餐桌家用小户型轻奢方桌弯曲木工艺大溪地', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c055fefe5407452e7502fc96d23b6c4f_sx_452454_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816448954369, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696664612, NULL, NULL, '本色银架-餐椅 C35*2把', '', '', 129900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816469925890, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696664596, NULL, NULL, '本色黑架-餐椅 C35*2把', '', '', 129900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816503480322, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696664580, NULL, NULL, '典雅黑+合观胡桃', '', '', 379900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816520257537, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696663604, NULL, NULL, '典雅黑+戈尔浅胡桃', '', '', 379900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816549617665, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696663588, NULL, NULL, '雪山白+合观胡桃', '', '', 379900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816574783489, 3683272592829055342, 1798473696324659, '', 0, '1', 0, 1798473696663572, NULL, NULL, '雪山白+戈尔浅胡桃', '', '', 379900, 1715158180, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, '曲美家居现代简约风岩板餐桌家用餐厅饭桌弯曲木工艺圆桌半月桌子', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8bef572f357b8422f19a0bd104516a84_sx_357055_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816755138561, 3675810982778765316, 1794830540959979, 'ZH-PC-2-DS-F1-QM24-B2-18*1&M1-18*1', 0, '1', 0, 1794830540961019, NULL, NULL, '1.8米真皮软床【卷包排骨条】+乳胶独袋床垫', '', '', 418330, 1711683793, 70, 0, 0, 0, 0, 0, 70, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816780304385, 3675810982778765316, 1794830540959979, 'ZH-PC-2-DS-F1-QM24-B2-15*1&M1-15*1', 0, '1', 0, 1794830540961003, NULL, NULL, '1.5米真皮软床【卷包排骨条】+乳胶独袋床垫', '', '', 408330, 1711683793, 70, 0, 0, 0, 0, 0, 70, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816818053121, 3675810982778765316, 1794830540959979, 'ZH-PC-2-DS-F1-QM24-B2-18', 0, '1', 0, 1794830540960987, NULL, NULL, '1.8米真皮软床【卷包排骨条】', '', '', 289900, 1711683793, 70, 0, 0, 0, 0, 0, 70, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816839024642, 3675810982778765316, 1794830540959979, 'ZH-PC-2-DS-F1-QM24-B2-15', 0, '1', 0, 1794830540960971, NULL, NULL, '1.5米真皮软床【卷包排骨条】', '', '', 279900, 1711683793, 70, 0, 0, 0, 0, 0, 70, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816952270849, 3675809299109642249, 1794829436074089, '', 0, '1', 0, 1794829436076089, NULL, NULL, '1.8米真皮软床【卷包排骨条】+乳胶独袋床垫', '', '', 418330, 1711682737, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095816977436673, 3675809299109642249, 1794829436074089, '', 0, '1', 0, 1794829436076073, NULL, NULL, '1.5米真皮软床【卷包排骨条】+乳胶独袋床垫', '', '', 408330, 1711682737, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095817002602497, 3675809299109642249, 1794829436074089, '', 0, '1', 0, 1794829436076057, NULL, NULL, '1.8米真皮软床【卷包排骨条】', '', '', 289900, 1711682737, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095817031962626, 3675809299109642249, 1794829436074089, '', 0, '1', 0, 1794829436076041, NULL, NULL, '1.5米真皮软床【卷包排骨条】', '', '', 279900, 1711682737, 50, 0, 0, 0, 0, 0, 50, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_802261a225a1a9cf19f9efbf3e095dd9_sx_454567_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095817145208833, 3675473784854413419, 1794665612080155, 'ZH-PC-2-DS-F1-QM24-B1-18', 0, '1', 0, 1794665612081163, NULL, NULL, '1.8米泡芙真皮软床【卷包排骨条】', '', '', 289900, 1711526505, 60, 0, 0, 0, 0, 0, 60, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢奶油简约大床卧室牛皮真皮软包床1.8x2米女孩', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3e68a575858dbc50b5bc61e400a4b96d_sx_409253_www800-800');
INSERT INTO `oms_dou_goods_sku` VALUES (1796095817178763266, 3675473784854413419, 1794665612080155, 'ZH-PC-2-DS-F1-QM24-B1-15', 0, '1', 0, 1794665612080187, NULL, NULL, '1.5米泡芙真皮软床【卷包排骨条】', '', '', 279900, 1711526505, 60, 0, 0, 0, 0, 0, 60, 0, NULL, 0, 0, 6, 'QM/曲美家居现代轻奢奶油简约大床卧室牛皮真皮软包床1.8x2米女孩', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3e68a575858dbc50b5bc61e400a4b96d_sx_409253_www800-800');

-- ----------------------------
-- Table structure for oms_dou_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_order`;
CREATE TABLE `oms_dou_order`  (
  `id` bigint(0) NOT NULL,
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '店铺父订单号，抖店平台生成，平台下唯一；',
  `order_level` int(0) DEFAULT NULL COMMENT '订单层级，主订单是2级',
  `order_phase_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '定金预售阶段单json',
  `order_status` int(0) DEFAULT NULL COMMENT '订单状态1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消5 已完成（已收货）',
  `order_status_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单状态描述',
  `order_tag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '\r\n订单的一些c端标签json',
  `order_type` int(0) DEFAULT NULL COMMENT '【订单类型】 0、普通订单 2、虚拟商品订单 4、电子券（poi核销） 5、三方核销',
  `order_type_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单类型描述',
  `app_id` int(0) DEFAULT NULL COMMENT '具体某个小程序的ID',
  `open_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '抖音小程序ID',
  `accept_order_status` int(0) DEFAULT NULL COMMENT '小时达订单的接单状态 0-未接单；1-已接单；2-超时取消，或商家取消',
  `appointment_ship_time` int(0) DEFAULT NULL COMMENT '预约发货时间',
  `author_cost_amount` int(0) DEFAULT NULL COMMENT '作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额',
  `aweme_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '达人抖音号，样品订单场景下才会返回的申样达人信息；',
  `b_type` int(0) DEFAULT NULL COMMENT '【下单端】 0、站外 1、火山 2、抖音 3、头条 4、西瓜 5、微信 6、值点app 7、头条lite 8、懂车帝 9、皮皮虾 11、抖音极速版 12、TikTok 13、musically 14、穿山甲 15、火山极速版 16、服务市场 26、番茄小说 27、UG教育营销电商平台 28、Jumanji 29、电商SDK',
  `b_type_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单端描述',
  `sub_b_type` int(0) DEFAULT NULL COMMENT '【下单场景】 0、未知 1、app内-原生 2、app内-小程序 3、H5 13、电商SDK-头条 35、电商SDK-头条lite',
  `sub_b_type_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单场景描述',
  `biz` int(0) DEFAULT NULL COMMENT '【业务来源】 1 -鲁班 2 -小店 3 -好好学习 4 -ev 5 -虚拟 6 -建站 7 -核销 8 -玉石 9 -ez 10 -ep 11 -虚拟卡券 12 -服务市场 13 - EP 视频课 14 - EP 直播课 21 -跨境BBC 22 -跨境BC 23 -跨境CC|UPU 24 -手机充值 25 -拍卖保证金 26 -懂车帝抵扣券 27 -懂车帝返现券 28 -离岛免税 29 -海南会员购 30 -抽奖 31 -清北-企业代付 32 -抖+券 33 -联盟寄样 49 -刀剑 53 -通信卡 66 -加油包 76 -大闸蟹 99 -保险 102-小店海外 108-上门取件收款',
  `biz_desc` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '业务来源描述',
  `buyer_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家留言',
  `seller_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家备注',
  `seller_remark_stars` int(0) DEFAULT NULL COMMENT '插旗信息：0-灰 1-紫 2-青 3-绿 4-橙 5-红',
  `cancel_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '取消原因',
  `channel_payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付渠道的流水号',
  `create_time` int(0) DEFAULT NULL COMMENT '下单时间，时间戳，秒',
  `pay_time` int(0) DEFAULT NULL COMMENT '支付时间，时间戳，秒',
  `update_time` int(0) DEFAULT NULL COMMENT '订单更新时间，时间戳，秒',
  `finish_time` int(0) DEFAULT NULL COMMENT '订单完成时间，时间戳，秒',
  `order_expire_time` int(0) DEFAULT NULL COMMENT '订单过期时间，时间戳，秒',
  `doudian_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户唯一id',
  `encrypt_post_receiver` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人姓名',
  `encrypt_post_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人电话',
  `exp_ship_time` int(0) DEFAULT NULL COMMENT '预计发货时间，时间戳，秒',
  `logistics_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '物流信息JSON',
  `main_status` int(0) DEFAULT NULL COMMENT '主流程状态，1 待确认/待支付（订单创建完毕）103 部分支付105 已支付2 备货中101 部分发货3 已发货（全部发货）4 已取消5 已完成（已收货）21 发货前退款完结22 发货后退款完结39 收货后退款完结',
  `main_status_desc` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主流程状态描述',
  `mask_post_receiver` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人姓名（脱敏后）',
  `mask_post_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人电话（脱敏后）',
  `mask_post_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收件人地址（脱敏后）',
  `province_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `province_id` int(0) DEFAULT NULL,
  `city_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city_id` int(0) DEFAULT NULL,
  `town_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `town_id` int(0) DEFAULT NULL,
  `street_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `street_id` int(0) DEFAULT NULL,
  `open_address_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标识收件人地址的id，可用于合单',
  `modify_amount` int(0) DEFAULT NULL COMMENT '改价金额变化量（单位：分）',
  `modify_post_amount` int(0) DEFAULT NULL COMMENT '改价运费金额变化量（单位：分）',
  `only_platform_cost_amount` int(0) DEFAULT NULL COMMENT '仅平台承担金额（单位：分），订单参与活动和优惠中平台承担部分的总金额',
  `order_amount` int(0) DEFAULT NULL COMMENT '订单金额（单位：分）',
  `pay_amount` int(0) DEFAULT NULL COMMENT '支付金额（单位：分）',
  `pay_type` int(0) DEFAULT NULL COMMENT '7=无需支付（0元单）；8=DOU分期（信用支付）；9=新卡支付；12=先用后付；16=收银台支付',
  `post_amount` int(0) DEFAULT NULL COMMENT '快递费（单位：分）',
  `post_insurance_amount` int(0) DEFAULT NULL COMMENT '运费险金额（单位：分）',
  `post_origin_amount` int(0) DEFAULT NULL COMMENT '运费原价（单位：分），post_origin_amount = post_amount + post_promotion_amount',
  `post_promotion_amount` int(0) DEFAULT NULL COMMENT '运费优惠金额（单位：分）',
  `promotion_amount` int(0) DEFAULT NULL COMMENT '订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额',
  `promotion_pay_amount` int(0) DEFAULT NULL COMMENT '支付优惠金额（单位：分），支付渠道上的优惠金额',
  `promotion_platform_amount` int(0) DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `promotion_redpack_amount` int(0) DEFAULT NULL COMMENT '红包优惠金额（单位：分）',
  `promotion_redpack_platform_amount` int(0) DEFAULT NULL COMMENT '平台红包优惠金额（单位：分），属于平台的红包的优惠金额',
  `promotion_redpack_talent_amount` int(0) DEFAULT NULL COMMENT '达人红包优惠金额（单位：分），属于达人的红包的优惠金额',
  `promotion_shop_amount` int(0) DEFAULT NULL COMMENT '店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额',
  `promotion_talent_amount` int(0) DEFAULT NULL COMMENT '达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额',
  `ship_time` int(0) DEFAULT NULL COMMENT '发货时间，时间戳，秒',
  `shop_cost_amount` int(0) DEFAULT NULL COMMENT '商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额',
  `platform_cost_amount` int(0) DEFAULT NULL COMMENT '平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount',
  `shop_id` bigint(0) DEFAULT NULL COMMENT '店铺id，抖店平台生成，平台下唯一；',
  `shop_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商户名称',
  `total_promotion_amount` int(0) DEFAULT NULL COMMENT '总优惠金额（单位：分），total_promotion_amount = promotion_amount + post_promotion_amount',
  `user_tag_ui` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '用户特征标签；JSON',
  `s_shop_id` int(0) DEFAULT NULL COMMENT '系统店铺id',
  `pull_time` datetime(0) DEFAULT NULL COMMENT '第一次拉取时间',
  `last_pull_time` datetime(0) DEFAULT NULL COMMENT '最后一次拉取时间',
  `audit_status` int(0) NOT NULL DEFAULT 0 COMMENT '0待确认，1已确认2已拦截-9未拉取',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_dou_order
-- ----------------------------
INSERT INTO `oms_dou_order` VALUES (1796511560463990786, '6929464285723432480', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024050516404012297830414807', 1714898401, 1714898447, 1715576855, 1715576078, 1800, '1@#jkd8o1PT8nR3ObIwUT+f+kWDCFD6LAWyJYyHveiirW5vsZDvVi8xa4YfPFTMYqiLno8=', '##pF/OgRSYhtc/oevzxc2UJ9Z0ttsOuw6if3isYR2SB7fAZhvjHCj6Y86OSpQ3cGg5lFYRXWoJFmy7GmnUaptsW0yfjrxS9TJIDuxE8u0=*CgYIASAHKAESPgo8QrW6nBoK3d6L2ZAwl4zF0ADQTTN2+Xmgq/B5hbZZUHeCQyA4WzbnhJqtCRuD2B1mY2CygmkMDqUxW4AHGgA=#1##', '$$lmtgSwUrt32aYGWOe/FdwuLuLZpp1EWuPUZ2nvew+JfoxMH0tqWb5+AUq+86kyfAlxvNjSzbUc10ygErh7+u79bV79l0Y4eJVNrV1nKxoWnjqw==*CgYIASAHKAESPgo8b3AZwqmhHJ+u5S7j+es+/ttNsXo0iiU5EX3ICSXQga9cqE5iFpSDVxrijqcK58QmABGZlY85F5jI/EjhGgA=$1$$', 1717490447, NULL, 5, '正向已收货', '田*', '1********63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#1Nb2XgB/QplZW1y1RloFNXTvacFPzO1HkqY3sv/CbyK8rC9UdkDFa5A4x6B6W1Pt+HjpO4iPqFu6Uh8iM2+nTN9bSoaDAzpZvNGgOIlaPhxKKnELagSNjnPQ7YPXqQR8o/cmW3YFdA==', 0, 0, 0, 119900, 119900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1714958345, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560614985730, '6929425161757070596', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '沙发价格 3599  退差600', 0, '', '2024050322001486971430761076', 1714724014, 1714724021, 1715408345, 1715408345, 1800, '1@#wPPZuBPwpmnQN9Uxlm2kMLq0sZ5asl0LeAanq2fkT7AsoakcEOmzqspjkRl8Haz1hl8=', '##u7/5nwYJu+jvDsQypAF0vcjU5Ugqfgl1U0HRjhPdEv3EWJW1F4XW7T7/utCZwI+Hdq6NyycGehwMSxtVZCXrPvbwXr24BaNLqezKpk+lwqQ=*CgYIASAHKAESPgo82asSjkrZAO0+lbIa40TpUpsRECQQxfq6mDaiycySkgcX3ML1cbp9mQl8qZtCTU8sPNJCnrukyWjQEqzeGgA=#1##', '$$kWPqENC5OwmLDBwHAL5qy0komtfhPiA5FGVDf0fHcfAXFvsXKD9vq1VXHDDi0L+1um6s6qpxYP86ZoIH7KpVWRZzNjWWbxLiMBF/Ci7wS8zVvA==*CgYIASAHKAESPgo8bY89T1E+1JOXRUDAHKtV//8DfAUMegzfmzE2mHPdFoMgjGivUfjYzebfT6a62rm9sjqoKl0+BefdxUbjGgA=$1$$', 1717316022, NULL, 5, '正向已收货', '李**', '1********26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#p9DeX6OUx1VJahFtnlcFF3ABjVtWBHnzWszuWfuH21/b+9B81fjNFDN4YeO7Zogj6G0xHveLKn0a8tMeby9oA2QwA5bovFtAc0+C2KsubrPTuwhcrbc23aoWPcZ2r0hEytljjTBeuA==', 0, 0, 0, 419900, 419900, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1714803545, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560677900290, '6928401560052962812', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '4.30号发货，收货返246.3元【晨晨 04-01 11:12】', 2, '', 'TP2024040110192425135022147068', 1711937792, 1711937982, 1715390856, 1715390856, 1800, '1@#S+RJGbFOTxIHLyZkCip8Rkl0FMp2fR9+flaqfjUVYD4UCm4xPf8v48YFYR7uHlkPQKr74b6N', '##X5r5B+2DQk/bv49EGdCY8OmsOcxP1RXRSG9oUyEpXSOb9hhdsTuP7nVdKPoIKVopRoKJuSnxFDA0mVZg1GMSP0iutAIxUwZRoqbWlTuW+FQ=*CgYIASAHKAESPgo8KB1dY4oAUAHOnKfpRV8Og15hiZu1/n4WMmnYrwQWthu6Zc3GY/Tgo/8v3ZlgtwVuB1cUqGz7EhDhWW7SGgA=#1##', '$$mZS4UFkGZg003kW6NujTrUR7lm1nD8zvL7iRXlQYIJvndq40haXZOfRhcFWCY63YI1idJ9lej0Su7u2sUazueFJLsGB8ZPC/tSDWkUr7surVbg==*CgYIASAHKAESPgo8eqvbdtj2zq8zo3QIxtJkJkuSvP/NDKVolN3XepyCloXBXXdjvfITtXxLE8eaOMFZOqw3w4IA7jTWADelGgA=$1$$', 1715825982, NULL, 5, '正向已收货', '谢**', '1********63', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#zbDn+tEbES6wR1U9c4s+cVRhJysXYAbsDYEaeilDmcIlWiRSQLMejNnsUVDxfKg0G0pTRjERUN5IzYEBmGuplTyZ2yk+E8Iwxb9m7ReuwB/lDvAh3UUS+mWjcvNpDirLUpOEIJamvA==', 0, 0, 0, 339830, 339830, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1714354055, 139870, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560745009153, '6929484595989779565', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1714914449, 0, 1714916250, 0, 1800, '1@#G6+d7PgJRQLulHRRqlObJ7ip3082ezPjIibV/PDvX2K3bhJidUWezrWecbKyHMe/SwEtgVImZg==', '##jgETMZnb8neXdm9PSeKSheMTn8FFRTkjXp7xqU6cWgeGxwcaFmqy3O59OfZ2w+IG8mIFMwoQWuPxIhzP16wlcP+JqSovivio6vM=*CgYIASAHKAESPgo8IjCo9kSsihDm410SVuHUyprLCR6iEJP34F42Fw1t4wqXM1VTJDzMXulpgdMYrLBBffcJc/uHzcZ87XTZGgA=#1##', '$$jMmwA6cmykMmXFSIr4pFshEkYo3TH/q2KEK7mxyUhbjp+ks3DZuIc8/aQAJneFCOZ94w4xV8UXUFMt7HQvKVKK6gMhIZ4/mXrm6J/+YaAz70Gg==*CgYIASAHKAESPgo8twdRjOOciLutKykqqMoKrWYQM4zbRdohn9vdwWx7mWHaQVfxhE39mFMWFlthCfP82ClGEfXVr15wn1SwGgA=$1$$', 1718802449, NULL, 4, '未支付取消', '杨', '1********66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#IB07pND9CekH+U9ADiv4BCk5fw/uSsfvljuKtP0X/IhRr4u/iZgpz0EJCXSAx+UUccQZitjk9GiCdlbRpEJRSSJ1bg8cIyxBo5bayMhVJWZntVqYW8EsWsqsaA2SRl5pyr2Z4yWkfw==', 0, 0, 0, 571400, 571400, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 788600, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560799535105, '6928961036932683216', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024041913570035619635369996', 1713506174, 1713506231, 1714113665, 1714113665, 1800, '1@#+H5MwS16PxsftJFgTLVicS+uQsZpf1P8sEOvxfdwVQfZmn6LUhFitZ+j/QxbsjPqM+Kv/O9x', '##wtJLcjmJkI5/c2+m0BXFB19/FbxXqPBF970tS/xwGTCpmxGCcYOJBL4/msUfMvgy6ubMJiDl37+CdvFtGuEzTseBFe7dw5SXTybLl/M=*CgYIASAHKAESPgo8HQQLiL+m3GADt16z0g6DKpurlShztS3sr2obnhF7kqR7QAI6I+CcocFBZsbjmVYRnpCjxgiNEVRleKU6GgA=#1##', '$$iD6Fm3SqHgbzAWR0ylX32MQBbvBgg4BG0FCsc4NVqy2Kb5g0QmQ2S/YcsiATYR1EnQ9I2I9voGZd9tgbT38wAOa9BUR+C0yFEiFfXm6+QhsXKg==*CgYIASAHKAESPgo8gjpsQ7qi0DRTLHN+uQFc9LlIXJ3O2HnuJU6eenMDJ6fTLO4qCWlhKHN5LDC8DfwgzKpwCmcOmr61Gpw1GgA=$1$$', 1717394231, NULL, 5, '正向已收货', '韩*', '1********32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#aIju27m2FUbDeRzqwShw5vjturrYNvKPcK3+OM7pT2GskwRmQCf55mv47BLZ1GQOZE05VfTWao6W6CtF5vNykeDhxDa+gW/UzDBVr9oV5DH05WjxZASLqWBYoPADAMT7WY6W3V2Piw==', 0, 0, 0, 170910, 170910, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1713508865, 58890, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560908587010, '6928311223206876300', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 2329, '', 1, 0, 0, '', 11, '抖音极速版', 3, 'H5', 2, '小店', '', '发货单号：JDLD11474455244 京东【小暖 04-04 11:53】【小暖 04-04 11:53】', 1, '', 'TP2024032821240302318172287652', 1711632229, 1711632266, 1714103562, 1714103562, 1800, '1@#kuYR0EXB8xJ/2QhtNCTY/2QH1BQl2lgJbi0HoiVcPSDX6jeDS9SKDvtL8K+IPCVjO44R', '##4qyc71YOrMIN91miMppe0AP7bHcplxESFewl0jHZoS37iz2dFo9D+e4ZxmLLBMeW222ze/0W/BOe+eAX2A4eeVEvSzQuMlUJhaECUqzkGko=*CgYIASAHKAESPgo8nk5GDJiyaIjCg9pBRmK3ndU8dXoJ1u/BpTmnLude+Sk5BUUsi7mf8Qwg/t78LZLLjPFMz3Y4Chq5Fo16GgA=#1##', '$$aT2ZeJnwcmsmM3X3ZSBIwIkN+M8f+K8BjCH3KuBWUVBX6xMLiU4Yy0O4NtBKUUwQQamgXPC7V14xcYV6amhHdF1UFpln8wTQtAVQxvjlYof05g==*CgYIASAHKAESPgo8cN9fjENWuqMsdnkve90AjwMKzdG2zqTKBXuBH7XwJq4HQ3sg9XTnZcf9gYg/wzAmx3LLv2aXNzcpO6ZeGgA=$1$$', 1714224267, NULL, 5, '正向已收货', '崔**', '1********44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#IYmG+yl0+otzoYS5M62hKgRQW6LPhuFYHce0DJLDxhUkRXgH2qJi7o0JVZEp3Wwj1o2lc8e6Q2ML5/iA64u+mZ2Hjz0SznyW79lh/+Carwv+kmQNNLIcT4xCGtm11AtQC1hL7vPfaw==', 0, 0, 0, 84915, 84915, 4, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 1712202762, 34985, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511560958918658, '6929198300723483760', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1714071986, 0, 1714073786, 0, 1800, '1@#ArcOgEz0BULpJ+l1GJMr5FSLbKoFMkKRLHDAGA7QMFz504V59lJqNkMkt3rTwP6bSXcGy6sc8w==', '##Vclvh173sdc0xk/+83JMRmxBYDzJVh3MzKihHThuxrLJ+fM0FcEovNnxAz4IJwyCmhONydJzvqztddEST6lybtWFGGkU3nePeAe1qZ0=*CgYIASAHKAESPgo8BpjCX/bRJdx2xvuMXGrOXEyf/fQC9N/78THN2hLaRx4iY7HoU7Cm0um2M08u9UCQGJ6fvkVzG1+I8PffGgA=#1##', '$$kDO9vdnVG6zTCFBKtgMOF7BMlBrpESXVdzha/kB3xq/m7y6ocmt1hrssWypcpTDiqyfbKWIdBp8MJGTj94L+uv5Q+q7wuOCmtJQJAXYoH0UZ7w==*CgYIASAHKAESPgo8t9gcWZ8ptfgO6CLbg2SpSxdH4ssrdvZrlzyy3ssfOkj+NlDomvSNhZanQCvLiwrR5ggliGTvIPuu0tRIGgA=$1$$', 1717959986, NULL, 4, '未支付取消', '熊*', '1********60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#9o6gKn4yLPxo95jjbKh6QBUN2yxU43iQKn+izqKl5+g4P9AgIA83PGoartSJL1DWSDPA8gFaftAjLLf1olwSCmw5RmRfzmmxoA8G9TGCccLQfu9wP/duEgEaHRW0Xy8XXHDqluYZgQ==', 0, 0, 0, 458820, 458820, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 65280, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561017638914, '6929200517769729136', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1714071848, 0, 1714073648, 0, 1800, '1@#ArcOgEz0BULpJ+l1GJMr5FSLbKoFMkKRLHDAGA7QMFz504V59lJqNkMkt3rTwP6bSXcGy6sc8w==', '##cU4tM1516gQzP3rjoHwaZbIrn1ZECTPkGOBYLCA2JqFmth+yr34XyDZR+UrEwoqSU5IM8+gmQM9ExImUen3QbaGuoGk8Gu9+h+qjdAU=*CgYIASAHKAESPgo87x8hmkPX8Fw5fS0rwavXlTF+nLf42F4LJHJGyYBJ5joRNRIPX12v7Vdoo21kGYVjj5TLeAt9h3cYlmf6GgA=#1##', '$$A6DvIFr//eRAwOv2RYb1BY5ig2ozyL3k5r0U/I76ibgfb3+9RwSbV40u53ygcfcsd9g4yT66OP7jM6RCDEpNeRqOI8SE0e06Y7qwlSfIRFYLPw==*CgYIASAHKAESPgo81vSftSLrUlWBgj0u0vyG6DU7WI/8kk1kN+ftlwCIc4cA0EpOKd2oeNXuLRnsg+ZK0bhslP2AFqrYp3SCGgA=$1$$', 1717959848, NULL, 4, '未支付取消', '熊*', '1********60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#9o6gKn4yLPxo95jjbKh6QBUN2yxU43iQKn+izqKl5+g4P9AgIA83PGoartSJL1DWSDPA8gFaftAjLLf1olwSCmw5RmRfzmmxoA8G9TGCccLQfu9wP/duEgEaHRW0Xy8XXHDqluYZgQ==', 0, 0, 0, 349800, 349800, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450100, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561063776257, '6929162851184219248', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1713974962, 0, 1713976762, 0, 1800, '1@#ArcOgEz0BULpJ+l1GJMr5FSLbKoFMkKRLHDAGA7QMFz504V59lJqNkMkt3rTwP6bSXcGy6sc8w==', '##wuJxTnsAghZGkYyhVgvNBuS2dP3ZX3gpoS5d3RDa91E7Ndyz6xWx9sOt0dGDY+9kHijE2GjUROThKou+QpvvQOKoff1b1NaWJFujsxI=*CgYIASAHKAESPgo8OuO//vCqF5uieTK+yXo3sGMFr/YaHqxIdGk0BrETdSxyllPglTJomweuCdAtCcUCCuk47yin+PFUx/j8GgA=#1##', '$$OVLZmwjo7Zcy0qIF8IiFlswxWdQGii2GNlPQfH7uj+v01EKVNa/qEgYfOVa48lmDPN5WPE2OM4nt/lgJt52BlwJJKf8B2jH+XBAWK68PQfRGMQ==*CgYIASAHKAESPgo8ADZIHlj2d0ybg6MgmQTVcWl1NudsK2pk3NXJIgjM4hkO/CuVPF5S7MX2Ncdu7NlGA/qHwvoFe5cJpj0kGgA=$1$$', 1717862962, NULL, 4, '未支付取消', '熊*', '1********60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#9o6gKn4yLPxo95jjbKh6QBUN2yxU43iQKn+izqKl5+g4P9AgIA83PGoartSJL1DWSDPA8gFaftAjLLf1olwSCmw5RmRfzmmxoA8G9TGCccLQfu9wP/duEgEaHRW0Xy8XXHDqluYZgQ==', 0, 0, 0, 349800, 349800, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 450100, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561114107905, '6929142630865966816', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042419572303915448433227', 1713959857, 1713959863, 1713963362, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##G9vN4KAV3TrSbVEEH+wGeYx/YObffNBomD5lv7k+nvaY2Zu8A5lkVY45bZVJ/Nr428gcmnF/gVCCFq4flUfyera7UqMT2f1Dl7U=*CgYIASAHKAESPgo84a4g4uhNaV8vnCjWbN8z1F6TQ5/aD9tGKfOR+gwNGPmiEKNgi1lyEr8gunEGaRIxe5E2+mZ+YJr7zzbEGgA=#1##', '$$078b8DdU4C+P4ntr+cAp5NkOXsj+3PeEG8m9CZlRle25KgUpHKW+HA3+3yToZwe86SsHg3frMH5vImj3kYZRD6nrzslAr0vixr1ZBQIcTNmopw==*CgYIASAHKAESPgo88Qjfyv+GZt47Nc9BPh2Z2WDfHPXwCFSxZqLx1yS5WMc6146zo8ylA87RZW56WthcNusIujsxtr03n8AEGgA=$1$$', 1716551863, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 349900, 349900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 550000, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561164439553, '6929146908584646368', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042420015931039160455808', 1713960128, 1713960133, 1713963346, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##bX5TBTAnUubTisWRVcTxUPKT2DaNaKsGT+6f/hkizf899BsXNmLmqqxun0+MFMlyhbjdnEKzGTZT9RdAluA7eu+LHlmRMYFQHrA=*CgYIASAHKAESPgo8tiiwIkuoOPLEgt1n3SCFkmcDJhKzHZxyAclqdv2noeg7dYQdhrmDEnewS90ZUayPGkP5UoogvCA5qX2pGgA=#1##', '$$Pj+pt/VM+e+sXO+Rcp6TzLPifBXP1ilGA4J5ita45kc3NWNNsPUnpOo2PV2aFNX/WSjMUM0a2Wsl5vdhbjdwUVHGnZ1VAU7b1qwu6dJeUoC4+g==*CgYIASAHKAESPgo89ule0gcVjJ9OB72uYj5fi0xj1B/DoL0g/L0IX2L4mr7ivHLid4P4iqrxpr8tZOJQ1CRAsp+CJHyomapOGgA=$1$$', 1717848133, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 125640, 125640, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54160, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561214771201, '6929124938794604256', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042420061904866539615523', 1713960388, 1713960393, 1713963331, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##+eMFsYFLU6hCUfUd/GuLHuX4OG7j4TG8Kw3La1+fvDD2fizjpUsB/9ukJuYAcyM/sejKLRgpcpWC/A0EIxY6b+DH6FGqJ72AXnA=*CgYIASAHKAESPgo8xkA4uQLmhDHWTqa5twQQ1OwWXeP0gCyz7rBPY2Hxz0JqB0DQHoNHc4bRWzmqGHWewmtJsYuR0z8MnqnmGgA=#1##', '$$FmD8/Y0JLwkRVDIg60Z/lqSwQJ6jfktalZFcX+B2L4bRMNHccY6NfHM+pZnV30lNoerafjRIOmyQdC2UjZcbZtBHRtu1rOPgPeAqHHv+aaYUvw==*CgYIASAHKAESPgo8+vva+fx+BfphMAQA6ifqsX2dJ0aJ59UJMcxgI9ETHQFr82Prv7c7m2dT6k13Z6KcoaeUczQmWhUxGWUtGgA=$1$$', 1716552394, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 359910, 359910, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 59990, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561265102850, '6929124944363853536', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042420143200438927518764', 1713960885, 1713960890, 1713963321, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##4wY/7UiZVZGgMEF1YM5smjZiali1cfN/7hWgTNfraFKwNdPbq1wWkqLzot12yCv0fsfXS6wyEkT+MukH5/jnN08tMPxrs35+MJQ=*CgYIASAHKAESPgo89a96QDhyNEBqq+Coq/GpMFmr+b+Z8c2cbSdyReCwBtj1KzkWP2ewkLjo5Scf0j90TA09w4RV35loC+mvGgA=#1##', '$$kjI/rQrq95oEigCdHyUYwHgUZ2o5SL6bHxQ65zoLz1bci1oZYxkqYWJPpMs5eW/xPyJgbOkXSzD3TWC5hhQwoqJ38HHgm3uJ1cNtDdnLENrFNA==*CgYIASAHKAESPgo8FFw1AxT2LkCsPH8H/oMfIZjqvkqjQOAUXSC7xgOddvCXHIja3QIvHXSRQl4xyTR/rub4RzwdRtEvkot/GgA=$1$$', 1717848890, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 169900, 169900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 40000, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561315434497, '6929147060367857376', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042420251901100021847060', 1713961532, 1713961537, 1713963299, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##7acqFU4Q/WZK3GcYgmpJEUN58HQ5Y2/g1Mn4/ZgDz2aj7DmUb/ozpOLL4Oj+Ir/BoNIjqDnXLm61V1VR9vsqf38DrXveHps33EQ=*CgYIASAHKAESPgo8MQaiDguZaVVrvhHre+/WFiKDisaTxZOkjPSY2Fwbi5ceXfnsfOme1hkM3M37Ows4Szi/zdDc1kgGhoaSGgA=#1##', '$$m4tkHj2lntLdeq/BM40IZ7BvYpd+Tb61FAaRzWoLfCel8vKJ6AXCKlBbn3BZ/DYiCcGVuNtBdXLBxdpvAOjKCZROA1KjaKufpSI4cd2XNM7dlw==*CgYIASAHKAESPgo8uxleiT/jE/5WWLPZMot8/0gBbTQmy4+Sj345P0C4iYujvQ0kuY8mSPvKhXGBjzhwNETfXdJFl37hO1JJGgA=$1$$', 1717849538, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 179900, 179900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50000, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561462235138, '6929135806104803040', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', '', 1713961281, 0, 1713961852, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##3k0g6A3zrGcFCxEjHdIGEz/kcdtlCzrEalCf7fb/jvpg6PhvIkSC/Rvagw1+dBB3PCYprKRppikO8+tPz73fufPiq0azhJYOQII=*CgYIASAHKAESPgo8hVHCzAEFj1MPUMSQDInX3fJV9v6JPvWj8dFxSFkspa3kaMLAD3CalCJpcRK3sQ1dw3CTA4Z9Zh4FgYGrGgA=#1##', '$$ToRpY8tDb4WCEBzKs+GxX+ysjCpvaR0Ll7rRS7RvnVl/ue+C4V4Rs4LO/yyF7X1vSedQuzGgXcR8/oA9f0URFf28toHZg0WwH4ZBdh6mtslEwQ==*CgYIASAHKAESPgo8W6PmD9xYKUKXa0M86AsSJnxumDMTvXif/1J4B+TPVTUFPyQjw3/OAJPPyffBIFV8StHkQYUSqylfKzeZGgA=$1$$', 1717849281, NULL, 4, '未支付取消', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 649900, 629900, 4, 0, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 20000, 0, 0, 159800, 0, 6, '曲美家居官方旗舰店', 20000, NULL, NULL, '2024-05-31 19:58:28', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561600647170, '6929124886987871968', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024042420121707678689335960', 1713960748, 1713960760, 1713960818, 0, 1800, '1@#xlkhaiPDtTJmQsEF/M6+uwOLlkzXeRb0/OomgPmALb9Iyzmm0hkWkgGNuvQhHYXbf5qT', '##NASCx76MqffnpY+1CF4uu8MSVaNVdfwwzlWhfNxQ9tpvNUr9r8Py3o94EZAVhs4I9+nm4jLLz70hQtu96Re3NJftX0pTDf1nCxM=*CgYIASAHKAESPgo8kz7thwkfTQyWfEYV7WShnxCN8VXXx4bTS8c3UspJaqemjMiL8GTda4vydX1qGyMvPhAMOXTwcdMCabM4GgA=#1##', '$$erJU91aswBlPIDzu7vM7uxmfFKSyt9oyjZ3jU4b9gD6u5a7w+PpipRVv4yKawQLB6rCaeLzPrqFL13mX9LfRt5wN+62UdF9bpxTyAILA6L18Ag==*CgYIASAHKAESPgo8XwaPAmwN49L+qM9AMJ3IMimbwT8zGPqJ4WTF4ov1HMnmPuPsXE5qWuZPyDYvsAXuYhGmGkeL7c4lmdyrGgA=$1$$', 1717848760, NULL, 21, '发货前退款完成', '方', '1********39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#gPWDBBbmkC4XDORKlSFdJMvAzVBiHUMNRjnS0jKt/22/n5TBZy/9S24kQgJv9RozD70YCEQsymTkTXYujJAehaOI6QSwVm97LNe6Aj3C6Z8Cc1H7oEignQPF2WYG3VMhTFXhv7Oq5g==', 0, 0, 0, 229900, 229900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46000, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561650978817, '6929111179681076333', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1713864028, 0, 1713865829, 0, 1800, '1@#G6+d7PgJRQLulHRRqlObJ7ip3082ezPjIibV/PDvX2K3bhJidUWezrWecbKyHMe/SwEtgVImZg==', '##MngGCUOowX5/MFGm3A75tVXAm6ZdT5C9Ny9fbikyocNTbRzLfOSbi71Ur037Mzpqi5NqbH7if2zklTCFxgrloL4T4MNXOzfMOhA=*CgYIASAHKAESPgo8Fd39++MpD7KQcIAMMJxoo7E+bkLl3qahRv1Ndazsq0iBWE8p0Cbmh9HFtztfHrSJoGVwRIyEobezIL2AGgA=#1##', '$$ZDTCAP7JCEUIsOLDTBVVqHgZzJQ1AZJTqsrojmbu1agRrxPkBqeyWsXyeRrx7OK+kF7YzfWm72tKSTtHsoM8m5xHnFmr8vAocOx8kJuhg0T/Jg==*CgYIASAHKAESPgo8uib8Vl4Ryss/U2/16GFmVzzQlGIdIAhfaImmIf38gh5770Fyc6U/YFcu2y4jM8nvMKKi/ZWyKWXAFFXmGgA=$1$$', 1716456028, NULL, 4, '未支付取消', '杨', '1********66', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#9PLR8UCvvgGKmDwIChqg/pw4tn1H38CJCnmLpNy7fAMsdMhB1Vxmp8EATLRzcXL+KCYTeq/9Y7RZleAO6eHY4Uwu1+QIp4PlvyPoxGXIv3lLwYxtRwvnaVg8wDaoL1F0RPkoIhxVdQ==', 0, 0, 0, 418330, 418330, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561705504770, '6927974076124566842', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', '2024031722001412741430488634', 1710682621, 1710682632, 1713515838, 1713515838, 1800, '1@#pzIxvHiw2NNpkAGMdHvVU7FNB9hnqHf5u99gswnrG3UcxrmVR+J+oJAwrqi+LopGyH4=', '##CDTTru1HKPlcbUgIjm6KVmTWWpdyfXl+Guuz9kqK/ppguYQdpGJlrXkSZCaD01waV1CId1e5zduJ0oBP9Ciw33/elsEmzj/yodpsV66Gtqo=*CgYIASAHKAESPgo8XRfXcPtSrR6S5GyHlM9tOOr6GB3EOGqqekhWtP8PxvNjgnYNAOf7wveIjj0gDXb731FJLM5Q69A9NtxzGgA=#1##', '$$CJyWkzdJrcPIh6O2JsyGxZ1C+r33ye4HGDK3NnB/1s55coYy07EJOn6isqtB4qiBZPIymp1182wT4ZzphhSoJptxR9HmuGOBjMgI14vvetNFYg==*CgYIASAHKAESPgo8v6FvEtyvbdpK/F37MZ1UvxP51KzX/6fxJlLiPy5lonT9+tkG5NkXsxN0pCAa8V5TPt2dtmHd+HOoLI1WGgA=$1$$', 1714570633, NULL, 5, '正向已收货', '华**', '1********79', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#vvd0x83k+urCRgx3S+cVakB0FeBAnQuO5tEwZnts1RscxxsDtAy1SILqwM3MXTStfGZA2z2wfDGNyN/EZvjDVdyhKRIJaBYvEGnr55V5p7OBQZCAcCgPJCsJtKuMh4/ycFi2vG7qSg==', 0, 0, 0, 209900, 209900, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1711615038, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561747447810, '6928358788859499599', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 2329, '', 2, 0, 0, '', 11, '抖音极速版', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024033019440800506757253826', 1711799061, 1711799066, 1712818215, 0, 1800, '1@#dVQfIGSJNvJL201UnoHe3ow2Ex5jX4wmES0wDILRWwkt7maMwCUeU18vV3I2ay9xZKwJBue9GQ==', '##JptsfKoZdnxLX6PlQhmR69lEdF3bWT44cecTFAsTqYu6+H3T4Dol/eJgPQSel9nn7FOaj6tdUtwRrlm1oDdF/qcjC8isBz902bPmpp3czzQ=*CgYIASAHKAESPgo8U8uJcNHbPnuvYNtiTUy3JWXna6Jr+wxABupykd0YqhrEhm1Vvu9xXagcupW9i8WEGs4bTu9DEDnPd4JGGgA=#1##', '$$H/eXttnOOYmZu/RiC/Fpd/LHEFdHDRHkxDI1QtC7qa7KpZDbzX6HftSSnWZMbtTjF+u3LMMToHnQlgH6HqI8UDVVDCtYv4C0h31OT78y1vf9ww==*CgYIASAHKAESPgo8z8LCdF5+Xrwe35tqvmv1aMiE/OsyWT51fqFC7o1n49jwZRLPfvzVC3SleNIMKdz5iaLS4tV2KwIZ7iqrGgA=$1$$', 1715687067, NULL, 21, '发货前退款完成', '杜**', '1********99', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#opJO38vdnSFSTfQ6EO/QxpRXmPnClFkU7JEVrujYBQIokBqvvDy0PODNlqW64TJV6Nt8RrBgKwPaFF+6BGX0SSLWLq61hbf3jTLOyVyOiSH26wYZh0E7sqim82xyzt1yAm5+o7J5dw==', 0, 0, 0, 249900, 249900, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 350000, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561797779458, '6928490893075748436', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 2329, '', 2, 0, 0, '', 11, '抖音极速版', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1712195601, 0, 1712197401, 0, 1800, '1@#jIx86l6IlX28GtbNcPlE4xBuKETFUR0cJeoALZfY1rxmaREaCyW/XMG2+LicYHdfb3BOFf2Lkg==', '##9vVBkcL1CVmbtk3/AsQCWi/+buZBHdTZ4yhMf06BU5w42SgrPtqon8VGhm3a+h0XqXWBkUCwZZQPgniLNDuuIvkV9RplyZWrXj2UaUmRMJ0=*CgYIASAHKAESPgo8IiUqmyJsFbx5xWeDwiNWZHx2g/uiwCZvTQNVp8qSYzZaGqwSHRIOJpBDgotiol1YKlUGx1YqYjoqcFcwGgA=#1##', '$$sie2AmntVnD5yidEmigwOqbOjOA7/4XFGppCSeI7nlIJ9qRW0dEXhx7Mymt64PEXDgFSLrLUDa7c1dMPnB2Zi+9z0/TL59mVwdKugutqwOwmkQ==*CgYIASAHKAESPgo8qQuuNpHyrE6Lafgigqsp2YYfCQDi7yyBDPzSoxxdaHQX55LaJdYOlo+hM9xAQ9WczFJXkngyyqUY3cpLGgA=$1$$', 1716083601, NULL, 4, '未支付取消', '刘**', '1********07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#kYYiEuq61pZ7JsXv08qOjTXSuR2sVZJiMguiJIHttnA41qbEA0z+ch5wJRfYE9Hr4wtJiCoyBCcudtVdPVb2wm9ddtQi211spxtar4ybCHx8Q0W3kP9dzKIvQXAAwwJKGWgVKO7xBA==', 0, 0, 0, 382330, 382330, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107570, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561839722497, '6928469829278045764', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1712122389, 0, 1712124189, 0, 1800, '1@#FHeiccMNLMwOQPwopGljf2I9pgOTfLQlcFKFYUfq9L2PxwbFrFdIgjZFrez4qHNwaWP8md8O', '##URm8dqq0n0+No/zM6c0Nr5fYM5CVGN5f5aFrfrGgdBHUWp/g5Z38VmL3Ei9ntLaIvSaH27bldVGVZdSQiA/cWIVSvd3ksYc/DIrvO8N5saU=*CgYIASAHKAESPgo8MNCAEt+TOskNhGHc4RZIeB/mgb0jjq9AmNPKhbdF9d1X43SctJi71GN68cGtxnTP+XxMOSTQ61i1+quQGgA=#1##', '$$lkxQ5qXbt7uxzOF8nOdfkBq1USuwGg2OXWNGtQMxIJ96OvyOl+ECYYeuLuQOsufn7LOoj5qu2lk+YpAH78ou3b1bjRi+qV5x+WgMxicG/RcaXA==*CgYIASAHKAESPgo8sQLyZfc+dLByeZidnFBkx7TOhrRto8GtW/OQAHYPasQWeXUamchJ7s93xFan2N027PGpldCRXY/33KueGgA=$1$$', 1716010389, NULL, 4, '未支付取消', '刘**', '1********69', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#XTUfQ23JqYpkpVjd3geKwfyqZcO6NxZB21L2Eo8jJCgUf4np43d3NyP+1rWrwrP2fHGdUzH7xQ7jiZLa3U3GOOAahyw4/ZMEi9stOlIQz+af70VNm5JEa1SS4R3Q+7Yt3maOxMzKpA==', 0, 0, 0, 299900, 299900, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64700, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561894248450, '6928278934683981125', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1711592252, 0, 1711932714, 0, 1800, '1@#mn7/VoMdYmWXA8M59GUj8zwp+KnL8rVdd716EORmHh7AcbNa+ndCqalMbZ51tONclKE=', '##VwqFUVt2ahrOCKtcWnaVGz2ivpu3GRNzYNmnOql6vQGuXVgT5QYsJtGqAnfGhlIdKu7ZJVmnZI69pyDkYajuEV9i40rFZ2iixdE=*CgYIASAHKAESPgo8IoF5KAsNeObyMngm6qfv34HvWTI8QhrDGWu7aMwJVsoRUomOMs8j29uX3AbmVqtE7Gmjb68xcBX33i4uGgA=#1##', '$$JQpaZTjAliA1I8A4BWn2mkK3zgfhdVdWLnoAml6Dzd4EzuVdJB7VDtexJ0N/f1LIGIi18j+UTDY8m91t70zCU0nMNATGtOJ50U3b5paeMygsTA==*CgYIASAHKAESPgo8+HVjVDCzoNz8uRJ6e5LryIQo44Rmg+iy1jJzVVZgxGrXLc2dkdrIvHUBDrcwTi/irhyu1QSeoKZZFPnxGgA=$1$$', 1714184252, NULL, 4, '未支付取消', '崔', '1********44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#hGUsOlBU1BSOeuGu39FkcrJchkTzUgvXsjM8NsKmXIKJNxZk5LIRLHZo1d9ad5P9bqp5zX6AAZEsi6pOouiwV/D87X1/LlTk6dWQ34lNcAHnU+s94amDqOr58uQfEdlvorTY+iF0GA==', 0, 0, 0, 84915, 84915, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34985, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511561957163009, '6928311234249692300', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 2329, '', 2, 0, 0, '', 11, '抖音极速版', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1711632074, 0, 1711633875, 0, 1800, '1@#kuYR0EXB8xJ/2QhtNCTY/2QH1BQl2lgJbi0HoiVcPSDX6jeDS9SKDvtL8K+IPCVjO44R', '##3SEqK9m7g+v8RRt6+FlY0PjbT5KRtnQ9SuWg8/zPc7hkyhz7WfU94gtw+ozs8WiJfn2KWbmulnqJpcXb8hcAeyTj3AfEyr6jeOb+vl7PAvw=*CgYIASAHKAESPgo8ZdN/C6EU3e3DIDpy7ZfgG8QFtaPgkB+ggzhN8Yy4FDRgKjR7RgSI10WHU6vr0K0iLftuJotJl0lmTY96GgA=#1##', '$$EG3w025MzSI8yAhoIHvPfS7Ku0rFYgT6FvAme7bUelXxh5k5h6SavK/im2q5OPEeuVytgulVJeD7TW30efK4Ck1XiKhfhjdeGyJYIPYTckGw/w==*CgYIASAHKAESPgo8UYpKtQBpK9lXt9rSTpMJ5jZv9pYausvsT1UKHDcwn/H3oY98hbZc9MTEJHvdulZNX6Sj1UocdGrd7DUsGgA=$1$$', 1714224074, NULL, 4, '未支付取消', '崔**', '1********44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#IYmG+yl0+otzoYS5M62hKgRQW6LPhuFYHce0DJLDxhUkRXgH2qJi7o0JVZEp3Wwj1o2lc8e6Q2ML5/iA64u+mZ2Hjz0SznyW79lh/+Carwv+kmQNNLIcT4xCGtm11AtQC1hL7vPfaw==', 0, 0, 300, 84915, 84615, 4, 0, 0, 0, 0, 300, 0, 300, 0, 0, 0, 0, 0, 0, 34985, 300, 6, '曲美家居官方旗舰店', 300, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562003300353, '6927599989212125053', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024030522135430691491995794', 1709648047, 1709648053, 1711526825, 1711526825, 1800, '1@#sX79ATFau1zbGfBL+8I6y8Dcx7srD+kMMNGGlIO2cVr99d8VHsSe0Pj1h2UdM3CoUw27', '##nNMXwRhWw6njY937JgpmvoiMaK/SKAj2HVPyGEj5qRFMasixUbOEgfZul4wiBspanlJNZ41hPqRF+0x0w4onKocDRDQFR6bQmUyr84iSkhE=*CgYIASAHKAESPgo8l3RY8jVq940SE+FfZ5PJouypPZlckZP7kjl52C4zhN2t7etkc9F7Pzvi4EGLagZKE3EsmkAZVc/UkTQmGgA=#1##', '$$jGGJ/1mvwC/YTCqAireoKuDZjoAodTDJB4hpD2gcQnFtIyTlCG5k0nEG5WW1wXvI5gwybw49pGGYhcP2i4PXChnaMsiVv9CcyUsWINYjHZOALw==*CgYIASAHKAESPgo8nJ5YQZkqVh6apmZDoy245vicLQWCVPYilN/jM++oBQ8V1He9aQlb6sYQtgRaoJYKzSqhwh6sPeL53Gw7GgA=$1$$', 1713536054, NULL, 5, '正向已收货', '孙**', '1********89', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#5XUkeqfQ5c3mlUAtOeyXxMggg6O2WPm91DpXgyAhrPhqkVENSfEW+5fkUx0+ttWEtQbB3twMd6lM6hL+992T1TZQxWXVgsyidlb2K440UGv6JHyrvBuwLjJiAMdcGTom8DHFz5N7Xg==', 0, 0, 0, 185000, 185000, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1710922025, 64900, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562045243393, '6928049112916498308', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', 'TP2024032114540625167626390858', 1711004049, 1711004052, 1711008285, 0, 1800, '1@#VILqS+OEzSa/RbyT+HZCNw46flbmb4ICvpJqXusANlEUUJ8Ng013O2F2Y1DLshS/h5U=', '##Lkyi0tM1IIHQZmQa1CeO8sIJUuBzqGtmxb85vyvqI0BYIyS++BQXaXhTjOI3c4tnvO/F+caoORMNOPjaRr1+dieBFcZPXQLNKBKJ1KI=*CgYIASAHKAESPgo8h8GeEJrIZwmji3m+/TCT0V9D8HsG9P15eLa66wWNC0TlHG+hywOGEcTslPDObqw8Mspoqqjf6mKU/W07GgA=#1##', '$$R9i6t3ooHtQ/JFurNA93qmfpUjefRVcIxCcJNoQkMI+hWU3wQKOzyk43irNG3LDIPENhxlW5te8IDhiHVnOHrfuEsFOICJgBAbYe0uzClLRM5g==*CgYIASAHKAESPgo8dAKHoZC6e2QbfgD960OJ8wfWozoalEm3bU3p48M+pmIvaXS0Dq6AjLn81R6CMoLnTB1XxR6goz/KLu/WGgA=$1$$', 1713596053, NULL, 21, '发货前退款完成', '侯*', '1********65', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#1gMnBuBrelyGcWpsxgzPttL6zgvgj2zwwt8vcKqckggbObKCLWs1fCdk4L7+2wkt6PHQXavYkNtMA/E0NVTy9R/3WWqeem02k7nSHJqWTmgIjrxcsUsnJYVfBGKDKcIVaPC5rJr9Yg==', 0, 0, 0, 119910, 119910, 8, 30000, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 29990, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562087186434, '6928011404452042052', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1710770329, 0, 1710989832, 0, 1800, '1@#Y0/B4yoZ7MO4rP1aF6vp0XK1GXr8JmVOum7pNNxssXZ7dXuU4mwhN4EfrtV6mQMe3jcE', '##r8In7OnlmfPEDxMhrxa+NRzsVhAF8LnDrAEqePl5mpuGZsJ9o82kdSJbZgyeTwbMRQ9nsOrg0/Ljsb5DxmxexlnbskJWbtnFTO5RRGw=*CgYIASAHKAESPgo8cv+yucKXrcw5pgoIKZ2goqsVv003SK+oa2s6it3fitRd3U+sGJYSnitTJwAuWbTHo4FD0xzKSmAMkErYGgA=#1##', '$$BfwSSkwoivbEX6Uo3L58vexf1HqJlt1JGBeXeeH4FCLhGbgNsT342djh8zMrRgJRyDzvGmDKlx2y3ycmwFWLkCsRMCt1zIKckyy8QYTz2V6H+A==*CgYIASAHKAESPgo80LtyNtzzj61p3656wDi6CNd0o1t+CKebz8M+F68ci0x/+/y4noZntqH1AXSXnf1pQRB0zMRmOppc8hbqGgA=$1$$', 1714658329, NULL, 4, '未支付取消', '王*', '1********88', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#GNtoOQCrV3S96mD3le9VKDZzko2c7eYI20r88wcH0+E+SvAVIrI2jUSKU5c/emAHKgwxomSn2ZQdOWcFjUdRSDbdBjw6IQU6aPHK8ba3r/itX8A7wvor6f8M0QR2j9R8kpv7/pHOBA==', 0, 0, 0, 314910, 314910, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 54990, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562129129474, '6927528230209394304', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '到手价748元【晨晨 03-03 17:30】', 2, '', 'TP2024030315065412843909173052', 1709449617, 1709449621, 1710853223, 1710852446, 1800, '1@#ybL1n69+TDtj3TsXyIy4Y+8HSEEGcgiIhlHCwDTb3irZlIO76ciD0h3QDueTsL1/zJw=', '##/xfoF0biDHneVNayLBFOxhUpj2vuGSGmWsusYet5ZUAwUQj5qbxfW/g18EJu0z8ym0IZcmd6w0JvktxuMwWBYb4rc65HvYtFvLCaWYzwrRU=*CgYIASAHKAESPgo8qpF6PlzI5a7smLp5LUCPUEPxMWS7TKdSiNvX5OrSfXd8uc5Ci25V57L/AdpV1YzngU+bMbuwcIeDraiSGgA=#1##', '$$wWwOukSblPqbTRXaAmQZDVwqmM1JWY7+Qosyxar9lOrnvo4c8XdilLwpNGtrichAKysMpznxeLGK55OFFr2nP5ftKBc4agiZdwwdUVLax+7YCA==*CgYIASAHKAESPgo8WYTp5D7XctXx3KJrmCXt/Va5v2BwQ0iSp1m3uSWpbhuSyDfQR+O6bFLlTI4c591xnlrtQ4kbHl1jiycZGgA=$1$$', 1713337621, NULL, 5, '正向已收货', '杨**', '1********27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#2OKbdc2kRt3OLuEtRayTm2dNLYj9R08xGA48cZBcPkyZMiv6aKJadQzmd7F3H94z4zteENQwDx/OCEu50pgAYokfDl4ESnWhmEBQbFoiHeIxxj0c1lU0JUi11smzdmzEYqZl5Cw7Ow==', 0, 0, 0, 99900, 99900, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1710490285, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562179461122, '6927837764910060881', 2, NULL, 5, '已完成', NULL, 0, '普通订单', 1128, '', 1, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '', '2024031222001492951452013232', 1710251895, 1710251900, 1710745240, 1710745240, 1800, '1@#5c/8nmY+kXVtFPDnZjH2VtQbNjcgXVJ/NzRYKa5FF1OmQEgqxUPT3UaamS8ATUK7GgkBUM2ePw==', '##vUWJAFmvzzto9EjfVx6SsGB8uP1hdmAc8ja+XYkJx/aNqUdtJYOR36shCo8XaJPy9l8t/pOTQeeKys/Yk7MTlPzl213naickakHUrvo=*CgYIASAHKAESPgo8+wpiuJTJcsjBj9jr1B81rPCZU6OoFnBm4A/CPph9u9nfYX7jldr42o5iIoJhZsVBji2UV5HbpWVC0IhoGgA=#1##', '$$uq1x66sAa2RzDeCndSswqBQcEQIvkUzaDpiVe9GeiG50QEUciNQ/ukkLtT5XxDBWnCH6wrxHwucR/2hkdPPy8X4frtmBrD6J+8rXLvZdKh1RBg==*CgYIASAHKAESPgo8bIi84Q9NhxuIIw494U7g4wV1i69L1VLSMDXsNVdGVgl0AAV8oK0LiM25UWNELMEtwZ4EOFFeElJ4IMyuGgA=$1$$', 1714139901, NULL, 5, '正向已收货', '刘*', '1********54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#cOo5SDAoB1If7CA3XFC368ocZpgCefQfxbah+DcswjwtpmdJLba0GAp1Yuttdlb/vDKDi5z/as8gCmzfGkxoitJpnsYIFeKBqekymerBlzIDzSEr0PuIRxqvvtKN+pHGdGbpPSCGmg==', 0, 0, 0, 229800, 229800, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1710403675, 0, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);
INSERT INTO `oms_dou_order` VALUES (1796511562229792770, '6927662775716222867', 2, NULL, 4, '已关闭', NULL, 0, '普通订单', 1128, '', 2, 0, 0, '', 2, '抖音', 3, 'H5', 2, '小店', '', '', 0, '用户超时未支付自动取消', '', 1709798522, 0, 1709800322, 0, 1800, '1@#a8ZbPG6cUrIaSvTUFKPF9kTr/1DaJcUU8oboJe1kO3UOaZQbOSWvuAvkyJi460MdImWOIrqbQQ==', '##ugeepMdeLBNg63eIGsrERzFpf3+V7V7OM2k2fmiSVOODjsprN8UuTjSXeiMqKaWSBAJW6hGidj0EK9yzv9GE12ZnFApWr6Q3WwkduKqoX+w=*CgYIASAHKAESPgo8O/CnHlIEbHsxpIJ9Z6Zr7JE3chGS6CECKCiX781KWttSkJE+I8hqWNXMP/TXFWxHmu9NaWGTwD/dMvMWGgA=#1##', '$$Uvpo5UxKvCNF912U29Z4/DjcBeLV0wTTsxz6RFCIoMLSNi+ShQyWrub6keS3rMusrzEsblpO0YMC9QXAkNJXi2FPmFoRMgLeViNojqWrvXoJJQ==*CgYIASAHKAESPgo8PvZ0RGGQd+qSr9AUZkundOM6vtICGTfSLbAUmVT2Dj70EzKJ6JePsR1FUlVn3KRO0gRzPaFbBVTt8vm2GgA=$1$$', 1713686522, NULL, 4, '未支付取消', '丁**', '1********16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '#l9PjM3mvBdLh4gufmW1yMB4HnFP9ftuvtcVNLPreMf0wCsXsAF/Ax4DWATxx4jESLuW4PZWSPpM3vK+NMtimY7Z74+0mkvSdpvHPBeQeUOO2LVN8LQOUkxSmRg6iMe3S8VWwfkCQmA==', 0, 0, 0, 49900, 49900, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8900, 0, 6, '曲美家居官方旗舰店', 0, NULL, NULL, '2024-05-31 19:58:29', NULL, 0, NULL);

-- ----------------------------
-- Table structure for oms_dou_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_dou_order_item`;
CREATE TABLE `oms_dou_order_item`  (
  `id` bigint(0) NOT NULL,
  `order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '店铺子订单号，抖店平台生成，平台下唯一；注意：一笔订单下有一个子订单和父订单单号相同。',
  `parent_order_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '店铺父订单号，抖店平台生成，平台下唯一；',
  `order_level` int(0) DEFAULT NULL COMMENT '订单层级',
  `ad_env_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '广告来源，video-短视频 live-直播',
  `after_sale_status` int(0) DEFAULT NULL COMMENT '售后状态；6-售后申请；27-拒绝售后申请；12-售后成功；7-售后退货中；11-售后已发货；29-售后退货拒绝；13-【换货返回：换货售后换货商家发货】，【补寄返回：补寄待用户收货】； 14-【换货返回：（换货）售后换货用户收货】，【补寄返回：（补寄）用户已收货】 ；28-售后失败；51-订单取消成功；53-逆向交易已完成；',
  `after_sale_type` int(0) DEFAULT NULL COMMENT '售后类型 ；0-退货退款;1-已发货仅退款;2-未发货仅退款;3-换货;4-系统取消;5-用户取消;6-价保;7-补寄;',
  `refund_status` int(0) DEFAULT NULL COMMENT '退款状态:1-待退款；3-退款成功； 4-退款失败；当买家发起售后后又主动取消售后，此时after_sale_status=28并且refund_status=1的状态不变，不会流转至4状态；',
  `author_cost_amount` int(0) DEFAULT NULL COMMENT '作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额',
  `author_id` int(0) DEFAULT NULL COMMENT '直播主播id（达人）;仅直播间和橱窗产生的订单会有值返回;',
  `author_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '直播主播名称;仅直播间和橱窗产生的订单会有值返回',
  `c_biz` int(0) DEFAULT NULL COMMENT '【C端流量来源】 0-unknown 2-精选联盟 8-小店自卖',
  `c_biz_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'C端流量来源业务类型描述',
  `cancel_reason` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '\r\n取消原因',
  `channel_payment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付渠道的流水号',
  `code` varchar(88) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家后台商品编码',
  `confirm_receipt_time` int(0) DEFAULT NULL COMMENT '用户确认收货时间',
  `finish_time` int(0) DEFAULT NULL COMMENT '订单完成时间，时间戳，秒',
  `goods_price` int(0) DEFAULT NULL COMMENT '\r\n商品原价（单位：分）',
  `goods_type` int(0) DEFAULT NULL COMMENT '【商品类型】 0-实体 1-虚拟',
  `is_comment` int(0) DEFAULT NULL COMMENT '\r\n是否评价 :1-已评价，0-未评价，2 -追评',
  `item_num` int(0) DEFAULT NULL COMMENT '订单商品数量',
  `logistics_receipt_time` int(0) DEFAULT NULL COMMENT '物流收货时间 ',
  `modify_amount` int(0) DEFAULT NULL COMMENT '\r\n改价金额变化量（单位：分）',
  `modify_post_amount` int(0) DEFAULT NULL COMMENT '改价运费金额变化量（单位：分）',
  `only_platform_cost_amount` int(0) DEFAULT NULL COMMENT '仅平台承担金额（单位：分），订单参与活动和优惠中平台承担部分的总金额',
  `order_amount` int(0) DEFAULT NULL COMMENT '订单金额（单位：分）',
  `pay_amount` int(0) DEFAULT NULL COMMENT '支付金额（单位：分）',
  `post_insurance_amount` int(0) DEFAULT NULL COMMENT '运费险金额（单位：分）',
  `promotion_amount` int(0) DEFAULT NULL COMMENT '订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额',
  `promotion_shop_amount` int(0) DEFAULT NULL COMMENT '店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额',
  `promotion_platform_amount` int(0) DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `shop_cost_amount` int(0) DEFAULT NULL COMMENT '商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额',
  `platform_cost_amount` int(0) DEFAULT NULL COMMENT '平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount',
  `promotion_talent_amount` int(0) DEFAULT NULL COMMENT '达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额',
  `promotion_pay_amount` int(0) DEFAULT NULL COMMENT '支付优惠金额（单位：分），支付渠道上的优惠金额',
  `origin_amount` int(0) DEFAULT NULL COMMENT '商品现价（单位：分）',
  `out_product_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品外部编码',
  `out_sku_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '外部Skuid',
  `product_id` bigint(0) DEFAULT NULL COMMENT '商品ID',
  `sku_id` bigint(0) DEFAULT NULL COMMENT '商品skuId',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `product_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  `promotion_redpack_amount` int(0) DEFAULT NULL COMMENT '平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额',
  `promotion_redpack_platform_amount` int(0) DEFAULT NULL COMMENT '平台红包优惠金额（单位：分），属于平台的红包的优惠金额',
  `promotion_redpack_talent_amount` int(0) DEFAULT NULL COMMENT '达人红包优惠金额（单位：分），属于达人的红包的优惠金额',
  `room_id` int(0) DEFAULT NULL COMMENT '直播间id，有值则代表订单来自直播间',
  `ship_time` int(0) DEFAULT NULL COMMENT '\r\n发货时间',
  `spec` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '规格信息JSON',
  `theme_type_desc` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单来源描述（废弃）',
  `update_time` int(0) DEFAULT NULL COMMENT '订单更新时间，时间戳，秒',
  `create_time` int(0) DEFAULT NULL COMMENT '下单时间，时间戳，秒',
  `video_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '视频id，有值则代表订单来自短视频video_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖店订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_dou_order_item
-- ----------------------------
INSERT INTO `oms_dou_order_item` VALUES (1796511560543682562, '6929464285723432480', '6929464285723432480', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024050516404012297830414807', 'ZH-PTCD-DS-QM23-M1-12', 1715576078, 1715576078, 119900, 0, 0, 1, 1715394990, 0, 0, 0, 119900, 119900, 0, 0, 0, 0, 0, 0, 0, 0, 119900, '0', '', 3615720958662453286, 3399384703935490, 'QM曲美家居天然乳胶独立袋弹簧床垫软硬家用抑制螨虫厚垫卧室', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_3cba4284448be1121f1b4d0b524a3a1e_sx_215051_www800-800', 0, 0, 0, 0, 1714958345, NULL, '直播间', 1715576855, 1714898401, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560640151554, '6929425161757070596', '6929425161757070596', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', '2024050322001486971430761076', 'ZH-SPSF-DS-F1-QM23-S6-3ZP', 1715408345, 1715408345, 419900, 0, 0, 1, 1715132371, 0, 0, 0, 419900, 419900, 0, 0, 0, 0, 0, 0, 0, 0, 419900, '0', '', 3625185186108577672, 3381264458588418, 'QM曲美家居现代简约豆腐块直排沙发真皮实木小户型客厅QM23-S6', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_438f53bc0d738e6ee700825c3ae71d16_sx_149157_www800-800', 0, 0, 0, 0, 1714803545, NULL, '-', 1715408345, 1714724014, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560694677505, '6928401560052962812', '6928401560052962812', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024040110192425135022147068', 'LZF-084-09ZC-LB1-G', 0, 0, 249900, 0, 0, 1, 0, 0, 0, 0, 186915, 186915, 0, 0, 0, 0, 62985, 0, 0, 0, 186915, '0', '', 3625188845286460057, 1770111740642336, 'QM曲美家居现代卧室抽屉柜五斗柜客厅餐厅储物柜收纳柜子09zc-lb', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_d82decb06aa1ba6ee2fb1b590f341e7c_sx_74353_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1714120051, 1711937792, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560707260417, '6928401560053028348', '6928401560052962812', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024040110192425135022147068', 'ZH-PTCD-DS-QM23-M2-15', 1715390856, 1715390856, 229800, 0, 0, 1, 1715322336, 0, 0, 0, 152915, 152915, 0, 0, 0, 0, 76885, 0, 0, 0, 152915, '0', '', 3625226905206308498, 1770130321303611, 'QM曲美家居天然乳胶黄麻防螨抑菌软硬独立袋弹簧卧室床垫QM23-M2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_9490b58b44fb48b808f6f891f9e8d88f_sx_206598_www800-800', 0, 0, 0, 0, 1714354055, NULL, '-', 1715390856, 1711937792, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560761786369, '6929484595989779565', '6929484595989779565', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'F2-23E-LAB-ZD1*1&F2-23E-LAB-FS1*3', 0, 0, 1360000, 0, 0, 1, 0, 0, 0, 0, 571400, 571400, 0, 0, 0, 0, 788600, 0, 0, 0, 571400, '0', '', 3665424001490092107, 3397292888904962, 'QM曲美家居lab墩墩84规格沙发现代简约灯芯绒布艺客厅别墅组合', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f3e18ff5028d08246dade28584bea914_sx_431489_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1714916250, 1714914449, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560845672449, '6928961036932683216', '6928961036932683216', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024041913570035619635369996', 'ZH-PTCD-DS-QM23-M2-18', 1714113665, 1714113665, 229800, 0, 0, 1, 1713956829, 0, 0, 0, 170910, 170910, 0, 0, 0, 0, 58890, 0, 0, 0, 170910, '0', '', 3625226905206308498, 1770130321303595, 'QM曲美家居天然乳胶黄麻防螨抑菌软硬独立袋弹簧卧室床垫QM23-M2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_abf6170290e5a7fba938214c65afb9bd_sx_206600_www800-800', 0, 0, 0, 0, 1713508865, NULL, '-', 1714113665, 1713506174, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560921169922, '6928311223206876300', '6928311223206876300', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024032821240302318172287652', 'ZH-PTCD-DS-QM23-M1-18', 1714103562, 1714103562, 119900, 0, 0, 1, 0, 0, 0, 0, 84915, 84915, 0, 0, 0, 0, 34985, 0, 0, 10, 84915, '0', '', 3615720958662453286, 1765488747952163, 'QM曲美家居天然乳胶独立袋弹簧床垫软硬家用抑制螨虫厚垫卧室', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2342c1b92875c1554e5095af516c42bb_sx_211997_www800-800', 0, 0, 0, 0, 1712202762, NULL, '-', 1714103562, 1711632229, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511560971501569, '6929198300723483760', '6929198300723483760', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'DS-F1-QM21-B6-18&DS-QM23-M1-18', 0, 0, 524100, 0, 0, 1, 0, 0, 0, 0, 458820, 458820, 0, 0, 0, 0, 65280, 0, 0, 0, 458820, '0', '', 3625186536842233486, 1773730254176316, 'QM曲美家居欧式头层真皮大象耳朵实木床双人大床卧室1.8薄荷曼波', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_b3ee8507eedc9048369e46f1eff20ffb_sx_170115_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1714073786, 1714071986, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561030221825, '6929200517769729136', '6929200517769729136', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'DS-F2-QM23-B9-18&QM23-M1-18', 0, 0, 799900, 0, 0, 1, 0, 0, 0, 0, 349800, 349800, 0, 0, 0, 0, 450100, 0, 0, 0, 349800, '0', '', 3642069789444305809, 3379302566589954, 'QM曲美家居现代欧包实木真皮卧室大床1.5 1.8x2主卧双人QM23-B9', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e2fff7afb38f356c07c44f36883f93b5_sx_146685_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1714073648, 1714071848, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561076359170, '6929162851184219248', '6929162851184219248', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'DS-F1-QM23-B9-18&QM23-M1-18', 0, 0, 799900, 0, 0, 1, 0, 0, 0, 0, 349800, 349800, 0, 0, 0, 0, 450100, 0, 0, 0, 349800, '0', '', 3642069789444305809, 3379302566588930, 'QM曲美家居现代欧包实木真皮卧室大床1.5 1.8x2主卧双人QM23-B9', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e7438e50d560df90119ad27bb481d43a_sx_133174_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713976762, 1713974962, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561130885121, '6929142630865966816', '6929142630865966816', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042419572303915448433227', 'DS-F2-QM23-B10-18X&QM23-M1-18', 0, 0, 899900, 0, 0, 1, 0, 0, 0, 0, 349900, 349900, 0, 0, 0, 0, 550000, 0, 0, 0, 349900, '0', '', 3672502964506984585, 3399534430204674, 'QM曲美家居现代悬浮大床卧室头层牛皮真皮1.51.8x2米双人齐边床', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_8464dda159bd49942077149cf922c84e_sx_162428_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713963362, 1713959857, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561181216770, '6929146908584646368', '6929146908584646368', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042420015931039160455808', 'ZH-SF-04-DS-F9-QM20A-NT3', 0, 0, 89900, 0, 0, 2, 0, 0, 0, 0, 125640, 125640, 0, 0, 0, 0, 54160, 0, 0, 0, 62820, '0', '', 3625188639128039433, 1770111627088956, 'QM曲美家居轻奢现代简约卧室双抽屉床头柜床边储物环保皮QM20-NT3', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_c910b586aa58d1b266aa85c0f73bb528_sx_121829_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713963346, 1713960128, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561227354114, '6929124938794604256', '6929124938794604256', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042420061904866539615523', 'ZH-SPSF-DS-F1-QM23-S6-3ZP', 0, 0, 419900, 0, 0, 1, 0, 0, 0, 0, 359910, 359910, 0, 0, 0, 0, 59990, 0, 0, 0, 359910, '0', '', 3625185186108577672, 3381264458588418, 'QM曲美家居现代简约豆腐块直排沙发真皮实木小户型客厅QM23-S6', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_438f53bc0d738e6ee700825c3ae71d16_sx_149157_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713963331, 1713960388, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561281880065, '6929124944363853536', '6929124944363853536', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042420143200438927518764', 'HGHT/CBL-23E-WQM-TT2', 0, 0, 209900, 0, 0, 1, 0, 0, 0, 0, 169900, 169900, 0, 0, 0, 0, 40000, 0, 0, 0, 169900, '0', '', 3647304585846113596, 3382682613499394, 'QM曲美家居现代轻奢北欧简约山海系列家用客厅弯曲木工艺摩尔茶几', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6c94e5580d35612a23df50e9c19e0f2a_sx_133233_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713963321, 1713960885, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561332211714, '6929147060367857376', '6929147060367857376', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042420251901100021847060', 'ZH-GL-DS-QM23-GF1', 0, 0, 229900, 0, 0, 1, 0, 0, 0, 0, 179900, 179900, 0, 0, 0, 0, 50000, 0, 0, 0, 179900, '0', '', 3625179877495428081, 1770107359558688, 'QM曲美家居意式现代简约轻奢茶几电视柜客厅家用大小户型QM23-TD1', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_00a03f6a7206b6dfc1c11b5a2ad74346_sx_354807_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713963299, 1713961532, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561495789569, '6929135806104803040', '6929135806104803040', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', '', 'F3-HGHT-23E-WQM-S1-3', 0, 0, 789700, 0, 0, 1, 0, 0, 0, 0, 649900, 629900, 0, 20000, 20000, 0, 159800, 0, 0, 0, 649900, '0', '', 3643578576961426970, 3380067076301314, 'QM曲美家居现代北欧风弯曲木山海系列真皮绅士沙发客厅23E-WQM-S1', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_85203d5db7de4dc82c9f861b5c0acbae_sx_175180_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713961852, 1713961281, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561613230081, '6929124886987871968', '6929124886987871968', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024042420121707678689335960', 'HGHT-23E-WQM-TT4', 0, 0, 275900, 0, 0, 1, 0, 0, 0, 0, 229900, 229900, 0, 0, 0, 0, 46000, 0, 0, 0, 229900, '0', '', 3646358507613255475, 3381962040239106, 'QM曲美家居现代北欧轻奢家用弯曲木茶几边几储物客厅大小户型TT4', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_88d93b6ed457897cab3a69f199356b39_sx_203013_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713960818, 1713960748, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561663561730, '6929111179681076333', '6929111179681076333', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', '', 0, 0, 418330, 0, 0, 1, 0, 0, 0, 0, 418330, 418330, 0, 0, 0, 0, 0, 0, 0, 0, 418330, '0', '', 3675810982778765316, 3400737552740610, 'QM/曲美家居现代轻奢大床主卧室牛皮真皮软包床卷包排骨1.8x2米', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_86affe15a92f70b92ed8bd7d28d2fc78_sx_146896_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1713865829, 1713864028, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561713893377, '6927974076124566842', '6927974076124566842', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', '2024031722001412741430488634', 'HGHT/CBL-23E-WQM-TT2', 1713515838, 1713515838, 209900, 0, 0, 1, 0, 0, 0, 0, 209900, 209900, 0, 0, 0, 0, 0, 0, 0, 0, 209900, '0', '', 3647304585846113596, 3382682613499394, 'QM曲美家居现代轻奢北欧简约山海系列家用客厅弯曲木工艺摩尔茶几', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_6c94e5580d35612a23df50e9c19e0f2a_sx_133233_www800-800', 0, 0, 0, 0, 1711615038, NULL, '-', 1713515838, 1710682621, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561764225026, '6928358788859499599', '6928358788859499599', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024033019440800506757253826', 'ZH-PC-2-DS-F2-QM23-B9-18', 0, 0, 599900, 0, 0, 1, 0, 0, 0, 0, 249900, 249900, 0, 0, 0, 0, 350000, 0, 0, 0, 249900, '0', '', 3642069789444305809, 3379302566589698, 'QM曲美家居现代欧包实木真皮卧室大床1.5 1.8x2主卧双人QM23-B9', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_e2fff7afb38f356c07c44f36883f93b5_sx_146685_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1712818215, 1711799061, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561810362370, '6928490893075748436', '6928490893075748436', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', '084-2017E-B2-180&DS-QM23-M1-18', 0, 0, 489900, 0, 0, 1, 0, 0, 0, 0, 382330, 382330, 0, 0, 0, 0, 107570, 0, 0, 0, 382330, '0', '', 3606272728509902234, 1763768373792768, 'QM曲美家居欧式现代简约储物板式床卧室实木1.8x2米双人2017E-B2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_ff33c248bf88b827933f1a0060aca45a_sx_157623_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1712197401, 1712195601, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561848111106, '6928469829278045764', '6928469829278045764', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'BSYB/HGHT-23E-WQM-DT1-2', 0, 0, 364600, 0, 0, 1, 0, 0, 0, 0, 299900, 299900, 0, 0, 0, 0, 64700, 0, 0, 0, 299900, '0', '', 3644853263326651982, 3381108465089026, 'QM曲美家居弯曲木系列北欧简约客厅家用岩板银河餐桌椅长方形饭桌', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5862da43e12c3994d0c1c399b0f3a30f_sx_165288_www800-800', 0, 0, 0, 0, 0, NULL, '直播间', 1712124189, 1712122389, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561915219970, '6928278934683981125', '6928278934683981125', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'ZH-PTCD-DS-QM23-M1-18', 0, 0, 119900, 0, 0, 1, 0, 0, 0, 0, 84915, 84915, 0, 0, 0, 0, 34985, 0, 0, 0, 84915, '0', '', 3615720958662453286, 1765488747952163, 'QM曲美家居天然乳胶独立袋弹簧床垫软硬家用抑制螨虫厚垫卧室', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2342c1b92875c1554e5095af516c42bb_sx_211997_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1711932714, 1711592252, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511561965551617, '6928311234249692300', '6928311234249692300', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'ZH-PTCD-DS-QM23-M1-18', 0, 0, 119900, 0, 0, 1, 0, 0, 0, 300, 84915, 84615, 0, 300, 0, 300, 34985, 300, 0, 0, 84915, '0', '', 3615720958662453286, 1765488747952163, 'QM曲美家居天然乳胶独立袋弹簧床垫软硬家用抑制螨虫厚垫卧室', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2342c1b92875c1554e5095af516c42bb_sx_211997_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1711633875, 1711632074, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562011688962, '6927599989212125053', '6927599989212125053', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024030522135430691491995794', 'YW1-09ZC-LB1-G', 1711526825, 1711526825, 249900, 0, 0, 1, 1711361011, 0, 0, 0, 185000, 185000, 0, 0, 0, 0, 64900, 0, 0, 0, 185000, '0', '', 3625188845286460057, 1770111740642352, 'QM曲美家居现代卧室抽屉柜五斗柜客厅餐厅储物柜收纳柜子09zc-lb', 'https://p9-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_16b523964e1b4de6fb535818543b05a6_sx_72863_www800-800', 0, 0, 0, 0, 1710922025, NULL, '-', 1711526825, 1709648047, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562057826306, '6928049112916498308', '6928049112916498308', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024032114540625167626390858', 'ZH-PTCD-DS-QM23-M1-18', 0, 0, 119900, 0, 0, 1, 0, 0, 0, 0, 119910, 119910, 0, 0, 0, 0, 29990, 0, 0, 0, 89910, '0', '', 3615720958662453286, 1765488747952163, 'QM曲美家居天然乳胶独立袋弹簧床垫软硬家用抑制螨虫厚垫卧室', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_2342c1b92875c1554e5095af516c42bb_sx_211997_www800-800', 0, 0, 0, 0, 0, NULL, '-', 1711008285, 1711004049, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562099769345, '6928011404452042052', '6928011404452042052', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'YW1-2017E-B2-180', 0, 0, 369900, 0, 0, 1, 0, 0, 0, 0, 314910, 314910, 0, 0, 0, 0, 54990, 0, 0, 0, 314910, '0', '', 3606272728509902234, 1763768373801996, 'QM曲美家居欧式现代简约储物板式床卧室实木1.8x2米双人2017E-B2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_61a556a8d484c9cc2039dcc54c96f497_sx_152651_www800-800', 0, 0, 0, 0, 0, NULL, '直播间', 1710989832, 1710770329, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562150100993, '6927528230209394304', '6927528230209394304', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', 'TP2024030315065412843909173052', 'ZH-SF-04-DS-F1-QM21A-NT10', 1710852446, 1710852446, 99900, 0, 1, 1, 1710745743, 0, 0, 0, 99900, 99900, 0, 0, 0, 0, 0, 0, 0, 0, 99900, '0', '', 3625188551181891717, 3381612645491202, 'QM曲美家居欧式现代简约卧室家具悬浮床头柜储物环保皮QM21A-NT10', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_5a265b56103bb43b1dbe10f0688f937c_sx_148971_www800-800', 0, 0, 0, 0, 1710490285, NULL, '-', 1710853223, 1709449617, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562192044033, '6927837764910060881', '6927837764910060881', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '', '2024031222001492951452013232', 'ZH-PTCD-DS-QM23-M2-18', 1710745240, 1710745240, 229800, 0, 0, 1, 1710659563, 0, 0, 0, 229800, 229800, 0, 0, 0, 0, 0, 0, 0, 0, 229800, '0', '', 3625226905206308498, 1770130321303595, 'QM曲美家居天然乳胶黄麻防螨抑菌软硬独立袋弹簧卧室床垫QM23-M2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_abf6170290e5a7fba938214c65afb9bd_sx_206600_www800-800', 0, 0, 0, 0, 1710403675, NULL, '-', 1710745240, 1710251895, '');
INSERT INTO `oms_dou_order_item` VALUES (1796511562238181377, '6927662775716222867', '6927662775716222867', 3, '', NULL, NULL, NULL, 0, 0, '', 8, '小店自卖', '用户超时未支付自动取消', '', 'ZH-SF-04-DS-F2-QM23-NT2(R)', 0, 0, 58800, 0, 0, 1, 0, 0, 0, 0, 49900, 49900, 0, 0, 0, 0, 8900, 0, 0, 0, 49900, '0', '', 3627788486096104426, 1771381093336312, 'QM曲美家居床头柜轻奢主卧室简易储物双抽床边柜置物柜QM23-NT2', 'https://p3-aio.ecombdimg.com/obj/ecom-shop-material/WPnATfLV_m_f8930c83778d93f631e0478ea52211ac_sx_105735_www800-800', 0, 0, 0, 0, 0, NULL, '直播间', 1709800322, 1709798522, '');

-- ----------------------------
-- Table structure for oms_jd_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_after_sale`;
CREATE TABLE `oms_jd_after_sale`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint(0) DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint(0) DEFAULT NULL COMMENT '服务单号',
  `refund_id` bigint(0) DEFAULT NULL COMMENT '退款单id',
  `order_id` bigint(0) DEFAULT NULL COMMENT '订单号',
  `apply_time` datetime(0) DEFAULT NULL COMMENT '申请时间',
  `apply_refund_sum` double DEFAULT NULL COMMENT '退款金额(单位分)',
  `customer_expect` int(0) DEFAULT NULL COMMENT '客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int(0) DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int(0) DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_type` int(0) DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint(0) DEFAULT NULL COMMENT '商品编号',
  `ware_type` int(0) DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `sku_type` int(0) DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime(0) DEFAULT NULL COMMENT '审核时间',
  `approve_result` int(0) DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime(0) DEFAULT NULL COMMENT '处理时间',
  `process_result` int(0) DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int(0) DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int(0) DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话',
  `buyer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户帐号',
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `refund_check_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核日期',
  `refund_status` int(0) DEFAULT NULL COMMENT '退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过',
  `refund_check_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人',
  `refund_check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核备注',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款原因',
  `refund_system_id` int(0) DEFAULT NULL COMMENT ' 退款来源(10:客服; 11:网站; 12:配送拒收; 28:APP; 87:分拣中心,逆向物流; 98:微信手Q;)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东退款与售后表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_goods`;
CREATE TABLE `oms_jd_goods`  (
  `id` bigint(0) NOT NULL,
  `ware_id` bigint(0) DEFAULT NULL COMMENT '商品id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `ware_status` int(0) DEFAULT NULL COMMENT '商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败',
  `outer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	商品外部ID,商家自行设置的ID（便于关联京东商品）',
  `item_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品货号',
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品的条形码.UPC码,SN码,PLU码统称为条形码',
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品最后一次修改时间',
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品创建时间，只读属性',
  `offline_time` datetime(0) DEFAULT NULL COMMENT '最后下架时间',
  `online_time` datetime(0) DEFAULT NULL COMMENT '最后上架时间',
  `delivery` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发货地',
  `pack_listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包装清单',
  `wrap` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '包装规格',
  `weight` float DEFAULT NULL,
  `width` int(0) DEFAULT NULL,
  `height` int(0) DEFAULT NULL,
  `length` int(0) DEFAULT NULL,
  `mobile_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `after_sales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `market_price` decimal(10, 2) DEFAULT NULL,
  `cost_price` decimal(10, 2) DEFAULT NULL,
  `jd_price` decimal(10, 2) DEFAULT NULL,
  `brand_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock_num` int(0) DEFAULT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id（sys_shop表id）',
  `sell_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `after_sale_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `spu_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_goods_sku`;
CREATE TABLE `oms_jd_goods_sku`  (
  `id` bigint(0) NOT NULL,
  `shop_id` bigint(0) DEFAULT NULL COMMENT '店铺id',
  `ware_id` bigint(0) DEFAULT NULL COMMENT '商品id',
  `sku_id` bigint(0) DEFAULT NULL COMMENT 'skuid',
  `status` int(0) DEFAULT NULL COMMENT '状态',
  `jd_price` decimal(10, 2) DEFAULT NULL,
  `outer_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sale_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attrs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku属性名称',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stock_num` int(0) DEFAULT NULL,
  `modified` datetime(0) DEFAULT NULL,
  `created` datetime(0) DEFAULT NULL,
  `currency_spu_id` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp商品id',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT 'erp商品sku id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东商品SKU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order`;
CREATE TABLE `oms_jd_order`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单id（京东平台）',
  `vender_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家id',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）',
  `order_total_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）',
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
  `order_start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '下单时间',
  `order_end_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `province_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `county_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `town_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vender_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回',
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
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息 ',
  `open_id_buyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段',
  `create_time` datetime(0) DEFAULT NULL,
  `audit_status` int(0) DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_order_after
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_after`;
CREATE TABLE `oms_jd_order_after`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint(0) DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint(0) DEFAULT NULL COMMENT '服务单号',
  `apply_time` datetime(0) DEFAULT NULL COMMENT '申请时间',
  `customer_expect` int(0) DEFAULT NULL COMMENT '客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int(0) DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int(0) DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_id` bigint(0) DEFAULT NULL COMMENT '订单号',
  `order_type` int(0) DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint(0) DEFAULT NULL COMMENT '商品编号',
  `ware_type` int(0) DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `sku_type` int(0) DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime(0) DEFAULT NULL COMMENT '审核时间',
  `approve_result` int(0) DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime(0) DEFAULT NULL COMMENT '处理时间',
  `process_result` int(0) DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int(0) DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int(0) DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户电话'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单售后表（废弃）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_coupon`;
CREATE TABLE `oms_jd_order_coupon`  (
  `id` bigint(0) NOT NULL,
  `order_id` bigint(0) DEFAULT NULL COMMENT '订单编号',
  `skuId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '京东sku编号。(只有30-单品促销优惠 此skuId才非空)',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠类型: 20-套装优惠, 28-闪团优惠, 29-团购优惠, 30-单品促销优惠, 34-手机红包, 35-满返满送(返现), 39-京豆优惠,41-京东券优惠, 52-礼品卡优惠,100-店铺优惠',
  `coupon_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠金额。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单优惠明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_jd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_item`;
CREATE TABLE `oms_jd_order_item`  (
  `id` bigint(0) NOT NULL,
  `order_id` bigint(0) NOT NULL COMMENT '订单id（京东平台）',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_pdd_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_goods`;
CREATE TABLE `oms_pdd_goods`  (
  `id` bigint(0) NOT NULL,
  `goods_id` bigint(0) DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_quantity` bigint(0) DEFAULT NULL COMMENT '商品总数量',
  `is_more_sku` int(0) DEFAULT NULL COMMENT '是否多sku，0-单sku，1-多sku',
  `is_onsale` int(0) DEFAULT NULL COMMENT '是否在架上，0-下架中，1-架上',
  `thumb_url` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品缩略图',
  `created_at` bigint(0) DEFAULT NULL COMMENT '商品创建时间的时间戳',
  `shop_id` int(0) NOT NULL COMMENT '店铺id',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp商品id',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'pdd商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_pdd_goods
-- ----------------------------
INSERT INTO `oms_pdd_goods` VALUES (1795287632412389378, 20819358560, '曲美家居 轻北欧风彩色大小边几角几 客厅家具', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-07-01/145519de1b046b60cab5c6dc4df74073.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287632630493185, 26455258664, '曲美家居 实木餐椅 北欧软包书桌椅现代休闲椅环保餐厅书房家具', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-07-22/a28499b0e42d1c4fb0f686f8ebe5f352.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287632726962177, 26460371549, '曲美家具 现代简约茶几边几 茶桌角几 2011WS-TT2-1', NULL, 0, 0, 'http://t00img.yangkeduo.com/goods/images/2019-07-22/a6c19f93f1afafafa3185a12769b1724.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287632777293826, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', NULL, 1, 0, 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287632928288770, 27221628973, '曲美家居 现代简约双人静音弹簧席梦思床垫 环保舒适卢梭床垫', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-07-25/cf1332c3ec1f1d78e417ec8b574065a9.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287633830064129, 27231456828, '曲美家居 现代简约木质床头柜 卧室储物板式床边柜', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2020-12-30/668f5613005bc322e5395fd2f3756c69.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287633934921730, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', NULL, 5, NULL, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634287243265, 36447870017, '曲美家居 门店同款实木休闲餐椅 咖啡厅椅子电脑椅北欧餐厅餐椅', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/ccac73b2929b27a2c1d28dac3c03f048.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634375323649, 36448941545, '曲美家具 门店同款北欧餐桌 热销餐厅折叠餐桌 环保餐台饭桌桌子', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/b86e84bdba038aa82a0ca6b8155e9a22.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634446626818, 36450154757, '曲美家居 现代简约木质梳妆柜化妆台 卧室化妆桌梳妆台家具', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/6503cf2ecc1f5c7ac4efc5df00d8f694.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634526318594, 36452159415, '曲美家具家居 现代简约小方凳 轻北欧百搭穿鞋凳 便捷梳妆凳', NULL, 0, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/059e3783460187e25a38d2740481f8c0.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634576650241, 36453686670, '曲美家居 现代简约卧室配套家具双色储物床头桌 木质床头柜', NULL, 0, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-20/b74b18e000b4e943bb039c2026c67a66.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634652147713, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634916388865, 39059542323, '曲美家居 儿童沙发 布艺小沙发', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2020-09-15/e094cd590a0d1f6d486df1d6e6de279f.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287634991886337, 39330566803, '曲美家居 椰棕软硬两用床垫 1.5/1.8米棕垫', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0c9303868de271e506ffedf32846454c.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287635117715458, 39333984807, '曲美家居 椰棕乳胶独立袋装簧床垫 1.8米软硬两用折叠分体床垫', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-28/e7984e02aab466b178b429106dfbac3e.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287635285487618, 39336415226, '曲美家居 10公分椰棕床垫 护脊硬床垫', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0fec1c426de548f2a3ca22b7a5b4f44d.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287635419705346, 39339597026, '曲美家居 七区独立袋装簧床垫 环保护脊床床垫', NULL, 1, 0, 'http://t00img.yangkeduo.com/goods/images/2019-08-28/59455ed8399af6dcdaaf1dac8a004fe9.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287635524562946, 70816158851, '曲美家居 现代北欧大容量鞋柜客厅玄关柜 门厅柜 客厅家具', NULL, 0, 0, 'http://t00img.yangkeduo.com/goods/images/2019-12-10/ca068949880cca70e30f1bcd03bbe491.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods` VALUES (1795287635570700289, 70828069380, '曲美家居 简约现代床头柜 床边柜 卧室置物柜 卧室家具', NULL, 0, 0, 'http://t00img.yangkeduo.com/goods/images/2019-12-10/0021e26d2b4c303436fd649900f258ac.jpeg', NULL, 5, NULL, '2024-05-28 10:55:02', NULL);

-- ----------------------------
-- Table structure for oms_pdd_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_goods_sku`;
CREATE TABLE `oms_pdd_goods_sku`  (
  `id` bigint(0) NOT NULL,
  `sku_id` bigint(0) DEFAULT NULL COMMENT 'sku编码',
  `goods_id` bigint(0) DEFAULT NULL COMMENT 'pdd商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `thumb_url` varchar(355) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品缩略图',
  `outer_id` varchar(85) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家外部编码（sku）',
  `sku_quantity` bigint(0) DEFAULT NULL COMMENT 'sku库存',
  `spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格名称',
  `is_sku_onsale` int(0) DEFAULT NULL COMMENT 'sku是否在架上，0-下架中，1-架上',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'pdd商品SKU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_pdd_goods_sku
-- ----------------------------
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632504664065, 293675949104, 20819358560, '曲美家居 轻北欧风彩色大小边几角几 客厅家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-01/145519de1b046b60cab5c6dc4df74073.jpeg', '', NULL, '木本色腿+黄亮光面 小边几（L450*H580mm）', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632529829890, 293675949105, 20819358560, '曲美家居 轻北欧风彩色大小边几角几 客厅家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-01/145519de1b046b60cab5c6dc4df74073.jpeg', '', NULL, '木本色腿+黄亮光面 大边几（ L400*H480mm）', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632559190018, 293675949107, 20819358560, '曲美家居 轻北欧风彩色大小边几角几 客厅家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-01/145519de1b046b60cab5c6dc4df74073.jpeg', '', NULL, '木本色腿+豆绿亮光面 大边几（ L400*H480mm）', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632592744449, 293675949106, 20819358560, '曲美家居 轻北欧风彩色大小边几角几 客厅家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-01/145519de1b046b60cab5c6dc4df74073.jpeg', '', NULL, '木本色腿+豆绿亮光面 小边几（L450*H580mm）', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632655659010, 309726529967, 26455258664, '曲美家居 实木餐椅 北欧软包书桌椅现代休闲椅环保餐厅书房家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-22/a28499b0e42d1c4fb0f686f8ebe5f352.jpeg', '', NULL, '木本色', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632693407745, 309726529968, 26455258664, '曲美家居 实木餐椅 北欧软包书桌椅现代休闲椅环保餐厅书房家具', 'http://t00img.yangkeduo.com/goods/images/2019-07-22/a28499b0e42d1c4fb0f686f8ebe5f352.jpeg', '', NULL, '胡桃色', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632743739393, 309739274446, 26460371549, '曲美家具 现代简约茶几边几 茶桌角几 2011WS-TT2-1', 'http://t00img.yangkeduo.com/goods/images/2019-07-22/a6c19f93f1afafafa3185a12769b1724.jpeg', '', NULL, '白橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632802459649, 311805655412, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', '', NULL, '1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632827625474, 311805655410, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', '', NULL, '1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632852791298, 311805655404, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', '', NULL, '1000mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632873762817, 311805655408, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', '', NULL, '1350mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287632890540034, 311805655406, 27215681148, '曲美家居 亲肤静音1.8米双人椰棕弹簧硬软两用席梦思床垫', 'https://img.pddpic.com/gaudit-image/2022-09-26/080364a3d63b2abb9f4ea45cdfcd474c.jpeg', '', NULL, '1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633733595138, 311833574408, 27221628973, '曲美家居 现代简约双人静音弹簧席梦思床垫 环保舒适卢梭床垫', 'http://t00img.yangkeduo.com/goods/images/2019-07-25/cf1332c3ec1f1d78e417ec8b574065a9.jpeg', 'QM5020-150', NULL, '1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633767149570, 311836017314, 27221628973, '曲美家居 现代简约双人静音弹簧席梦思床垫 环保舒适卢梭床垫', 'http://t00img.yangkeduo.com/goods/images/2019-07-25/cf1332c3ec1f1d78e417ec8b574065a9.jpeg', 'QM5020-180', NULL, '1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633796509697, 311833574407, 27221628973, '曲美家居 现代简约双人静音弹簧席梦思床垫 环保舒适卢梭床垫', 'http://t00img.yangkeduo.com/goods/images/2019-07-25/cf1332c3ec1f1d78e417ec8b574065a9.jpeg', 'QM5020-120', NULL, '1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633855229953, 781716215655, 27231456828, '曲美家居 现代简约木质床头柜 卧室储物板式床边柜', 'http://t00img.yangkeduo.com/goods/images/2020-12-30/668f5613005bc322e5395fd2f3756c69.jpeg', '', NULL, '胡桃色+荷花白 500*400*460mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633876201474, 311841433015, 27231456828, '曲美家居 现代简约木质床头柜 卧室储物板式床边柜', 'http://t00img.yangkeduo.com/goods/images/2020-12-30/668f5613005bc322e5395fd2f3756c69.jpeg', '', NULL, '木本色+荷花白 500*400*460mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633901367297, 311841433017, 27231456828, '曲美家居 现代简约木质床头柜 卧室储物板式床边柜', 'http://t00img.yangkeduo.com/goods/images/2020-12-30/668f5613005bc322e5395fd2f3756c69.jpeg', '', NULL, '深橡色+荷花白 500*400*460mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633960087554, 335154448688, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '致趣本色 1300*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287633989447681, 335154448687, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '致趣本色 1200*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634010419201, 335154448691, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '胡桃色 1200*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634035585026, 335153385057, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '白橡色 1000*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634056556545, 335154448693, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '深橡色 1200*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634073333762, 335153385059, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '深橡色 1000*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634098499585, 335154448692, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '胡桃色 1300*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634115276802, 335153385056, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '致趣本色 1000*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634144636930, 335153385058, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '胡桃色 1000*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634169802753, 335154448689, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '白橡色 1200*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634190774274, 335154448694, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '深橡色 1300*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634253688833, 335154448690, 36445331882, '曲美家居 现代北欧创意茶几边几环保工艺 轻北欧客厅茶桌', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/242ed738c16cf15bc7c2b83258b24b54.jpeg', '', NULL, '白橡色 1300*600*400mm', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634312409090, 335158782541, 36447870017, '曲美家居 门店同款实木休闲餐椅 咖啡厅椅子电脑椅北欧餐厅餐椅', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/ccac73b2929b27a2c1d28dac3c03f048.jpeg', '', NULL, '全深橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634337574914, 335158782540, 36447870017, '曲美家居 门店同款实木休闲餐椅 咖啡厅椅子电脑椅北欧餐厅餐椅', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/ccac73b2929b27a2c1d28dac3c03f048.jpeg', '', NULL, '全白橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:01', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634392100865, 335162063031, 36448941545, '曲美家具 门店同款北欧餐桌 热销餐厅折叠餐桌 环保餐台饭桌桌子', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/b86e84bdba038aa82a0ca6b8155e9a22.jpeg', '', NULL, '全深橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634413072385, 335162063030, 36448941545, '曲美家具 门店同款北欧餐桌 热销餐厅折叠餐桌 环保餐台饭桌桌子', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/b86e84bdba038aa82a0ca6b8155e9a22.jpeg', '', NULL, '全胡桃色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634467598337, 335167866845, 36450154757, '曲美家居 现代简约木质梳妆柜化妆台 卧室化妆桌梳妆台家具', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/6503cf2ecc1f5c7ac4efc5df00d8f694.jpeg', '', NULL, '全木本色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634484375554, 335167866846, 36450154757, '曲美家居 现代简约木质梳妆柜化妆台 卧室化妆桌梳妆台家具', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/6503cf2ecc1f5c7ac4efc5df00d8f694.jpeg', '', NULL, '全胡桃色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634501152769, 335166891063, 36450154757, '曲美家居 现代简约木质梳妆柜化妆台 卧室化妆桌梳妆台家具', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/6503cf2ecc1f5c7ac4efc5df00d8f694.jpeg', '', NULL, '全深橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634547290113, 335170792314, 36452159415, '曲美家具家居 现代简约小方凳 轻北欧百搭穿鞋凳 便捷梳妆凳', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/059e3783460187e25a38d2740481f8c0.jpeg', '', NULL, '全深橡色（坐垫面料B级可选）', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634622787585, 335198989700, 36453686670, '曲美家居 现代简约卧室配套家具双色储物床头桌 木质床头柜', 'http://t00img.yangkeduo.com/goods/images/2019-08-20/b74b18e000b4e943bb039c2026c67a66.jpeg', '', NULL, '全深橡色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634673119234, 341989490558, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '雅致灰 三人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634689896450, 341989490556, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '蒂芙尼绿 单+三组合', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634698285058, 341989490562, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '祖母绿 单+三组合', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634723450882, 341989490551, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '清新粉 单人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634744422402, 341989490560, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '祖母绿 单人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634769588226, 341989490561, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '祖母绿 三人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634790559746, 341989490552, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '清新粉 三人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634815725569, 341989490559, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '雅致灰 单+三组合', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634832502785, 341989490553, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '清新粉 单+三组合', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634853474306, 341989490554, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '蒂芙尼绿 单人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634870251521, 341989490555, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '蒂芙尼绿 三人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634887028738, 341989490557, 39051251574, '曲美家居 布艺沙发 小户型客厅沙发 马卡龙色系布沙发小沙发', 'http://t00img.yangkeduo.com/goods/images/2019-08-27/bc744716a3f3c414549f681537f68964.jpeg', '', NULL, '雅致灰 单人位', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634937360385, 341996380763, 39059542323, '曲美家居 儿童沙发 布艺小沙发', 'http://t00img.yangkeduo.com/goods/images/2020-09-15/e094cd590a0d1f6d486df1d6e6de279f.jpeg', '', NULL, '苹果绿', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287634949943297, 341996380762, 39059542323, '曲美家居 儿童沙发 布艺小沙发', 'http://t00img.yangkeduo.com/goods/images/2020-09-15/e094cd590a0d1f6d486df1d6e6de279f.jpeg', '', NULL, '樱花粉', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635021246466, 342526139816, 39330566803, '曲美家居 椰棕软硬两用床垫 1.5/1.8米棕垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0c9303868de271e506ffedf32846454c.jpeg', 'WXML-15', NULL, '1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635046412290, 342526139817, 39330566803, '曲美家居 椰棕软硬两用床垫 1.5/1.8米棕垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0c9303868de271e506ffedf32846454c.jpeg', 'WXML-18', NULL, '1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635063189506, 342526139815, 39330566803, '曲美家居 椰棕软硬两用床垫 1.5/1.8米棕垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0c9303868de271e506ffedf32846454c.jpeg', 'WXML-12', NULL, '1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635084161025, 342526139814, 39330566803, '曲美家居 椰棕软硬两用床垫 1.5/1.8米棕垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0c9303868de271e506ffedf32846454c.jpeg', 'WXML-10', NULL, '1000mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635189018626, 342535618736, 39333984807, '曲美家居 椰棕乳胶独立袋装簧床垫 1.8米软硬两用折叠分体床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/e7984e02aab466b178b429106dfbac3e.jpeg', '8825-18', NULL, '白色 1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635209990145, 342535618734, 39333984807, '曲美家居 椰棕乳胶独立袋装簧床垫 1.8米软硬两用折叠分体床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/e7984e02aab466b178b429106dfbac3e.jpeg', '8825-12', NULL, '白色 1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635230961666, 342535618733, 39333984807, '曲美家居 椰棕乳胶独立袋装簧床垫 1.8米软硬两用折叠分体床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/e7984e02aab466b178b429106dfbac3e.jpeg', '8825-10', NULL, '白色 1000mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635256127489, 342535618735, 39333984807, '曲美家居 椰棕乳胶独立袋装簧床垫 1.8米软硬两用折叠分体床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/e7984e02aab466b178b429106dfbac3e.jpeg', '8825-15', NULL, '白色 1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635302264833, 342544113539, 39336415226, '曲美家居 10公分椰棕床垫 护脊硬床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0fec1c426de548f2a3ca22b7a5b4f44d.jpeg', 'QM3410-15', NULL, '白色 1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635352596482, 342544113538, 39336415226, '曲美家居 10公分椰棕床垫 护脊硬床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0fec1c426de548f2a3ca22b7a5b4f44d.jpeg', 'QM3410-12', NULL, '白色 1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635373568001, 342544113540, 39336415226, '曲美家居 10公分椰棕床垫 护脊硬床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0fec1c426de548f2a3ca22b7a5b4f44d.jpeg', 'QM3410-18', NULL, '白色 1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635390345217, 342544113537, 39336415226, '曲美家居 10公分椰棕床垫 护脊硬床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/0fec1c426de548f2a3ca22b7a5b4f44d.jpeg', 'QM3410-10', NULL, '白色 1000mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635444871170, 342549698556, 39339597026, '曲美家居 七区独立袋装簧床垫 环保护脊床床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/59455ed8399af6dcdaaf1dac8a004fe9.jpeg', 'WXDLD-10', NULL, '白色 1000mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635470036994, 342549698558, 39339597026, '曲美家居 七区独立袋装簧床垫 环保护脊床床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/59455ed8399af6dcdaaf1dac8a004fe9.jpeg', 'WXDLD-15', NULL, '白色 1500mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635486814210, 342549698559, 39339597026, '曲美家居 七区独立袋装簧床垫 环保护脊床床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/59455ed8399af6dcdaaf1dac8a004fe9.jpeg', 'WXDLD-18', NULL, '白色 1800mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635499397122, 342549698557, 39339597026, '曲美家居 七区独立袋装簧床垫 环保护脊床床垫', 'http://t00img.yangkeduo.com/goods/images/2019-08-28/59455ed8399af6dcdaaf1dac8a004fe9.jpeg', 'WXDLD-12', NULL, '白色 1200mm*2000mm', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635549728770, 426846327608, 70816158851, '曲美家居 现代北欧大容量鞋柜客厅玄关柜 门厅柜 客厅家具', 'http://t00img.yangkeduo.com/goods/images/2019-12-10/ca068949880cca70e30f1bcd03bbe491.jpeg', '2019E-SF-1', NULL, '灰色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);
INSERT INTO `oms_pdd_goods_sku` VALUES (1795287635595866113, 426867588612, 70828069380, '曲美家居 简约现代床头柜 床边柜 卧室置物柜 卧室家具', 'http://t00img.yangkeduo.com/goods/images/2019-12-10/0021e26d2b4c303436fd649900f258ac.jpeg', '2019E-NT1', NULL, '灰色', 1, NULL, NULL, 5, '2024-05-28 10:55:02', NULL);

-- ----------------------------
-- Table structure for oms_pdd_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_order`;
CREATE TABLE `oms_pdd_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '订单id，自增',
  `shop_id` int(0) NOT NULL COMMENT '内部店铺ID',
  `order_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单编号',
  `trade_type` int(0) NOT NULL COMMENT '订单类型 0-普通订单 ，1- 定金订单',
  `free_sf` int(0) NOT NULL COMMENT '是否顺丰包邮，1-是 0-否',
  `is_lucky_flag` int(0) NOT NULL COMMENT '是否是抽奖订单，1-非抽奖订单，2-抽奖订单',
  `group_status` int(0) NOT NULL COMMENT '成团状态：0：拼团中、1：已成团、2：团失败',
  `confirm_status` int(0) NOT NULL COMMENT '成交状态：0：未成交、1：已成交、2：已取消、',
  `order_status` int(0) NOT NULL COMMENT '订单状态1：待发货，2：已发货待签收，3：已签收',
  `refund_status` int(0) NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部',
  `capital_free_discount` double NOT NULL COMMENT '团长免单金额，单位：元',
  `seller_discount` double NOT NULL COMMENT '商家优惠金额，单位：元',
  `platform_discount` double NOT NULL COMMENT '平台优惠金额，单位：元',
  `goods_amount` double NOT NULL COMMENT '商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额（接口暂无该字段）',
  `discount_amount` double NOT NULL COMMENT '折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额',
  `pay_amount` double NOT NULL COMMENT '支付金额，单位：元，支付金额=商品金额-折扣金额+邮费',
  `postage` double NOT NULL COMMENT '邮费，单位：元',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单备注',
  `remark_tag` int(0) DEFAULT NULL COMMENT '订单备注标记，1-红色，2-黄色，3-绿色，4-蓝色，5-紫色',
  `remark_tag_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单备注标记名称',
  `buyer_memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '买家留言信息',
  `updated_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单的更新时间',
  `shipping_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发货时间',
  `tracking_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '快递单号',
  `tracking_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '物流公司',
  `pay_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式，枚举值：QQ,WEIXIN,ALIPAY,LIANLIANPAY',
  `pay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付单号',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件人地址，不拼接省市区',
  `receiver_address_mask` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件人地址（打码）',
  `receiver_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收件人电话',
  `receiver_phone_mask` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receiver_name_mask` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_mask` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `town` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区县',
  `town_id` int(0) DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `city_id` int(0) DEFAULT NULL COMMENT '城市编码',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `province_id` int(0) DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '国家地区',
  `country_id` int(0) DEFAULT NULL,
  `created_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付时间',
  `confirm_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '成交时间',
  `receive_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '确认收货时间',
  `after_sales_status` int(0) NOT NULL COMMENT '售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成',
  `last_ship_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '订单承诺发货时间',
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标签',
  `delivery_one_day` int(0) DEFAULT NULL COMMENT '是否当日发货，1-是，0-否',
  `duoduo_wholesale` int(0) DEFAULT NULL COMMENT '是否多多批发，1-是，0-否',
  `home_delivery_type` int(0) DEFAULT NULL COMMENT '送货入户并安装服务 0-不支持送货，1-送货入户不安装，2-送货入户并安装',
  `invoice_status` int(0) DEFAULT NULL COMMENT '发票申请,1代表有 0代表无',
  `is_pre_sale` int(0) DEFAULT NULL COMMENT '是否为预售商品 1表示是 0表示否',
  `is_stock_out` int(0) DEFAULT NULL COMMENT '是否缺货 0-无缺货处理 1： 有缺货处理',
  `logistics_id` bigint(0) DEFAULT NULL COMMENT '快递公司在拼多多的代码',
  `mkt_biz_type` int(0) DEFAULT NULL COMMENT '市场业务类型，0-普通订单，1-拼内购订单',
  `only_support_replace` int(0) DEFAULT NULL COMMENT '只换不修，1:是，0:否',
  `order_change_amount` double DEFAULT NULL COMMENT '订单改价折扣金额，单位元',
  `pre_sale_time` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '预售时间',
  `return_freight_payer` int(0) DEFAULT NULL COMMENT '退货包运费，1:是，0:否',
  `risk_control_status` int(0) DEFAULT NULL COMMENT '订单审核状态（0-正常订单， 1-审核中订单）',
  `urge_shipping_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '催发货时间',
  `audit_status` int(0) NOT NULL DEFAULT 0 COMMENT '0待确认，1已确认2已拦截-9未拉取',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '发货时间（仓库真实发货时间）',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn_index`(`order_sn`) USING BTREE,
  INDEX `shopid_index`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1795400709858312194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '拼多多订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_pdd_order
-- ----------------------------
INSERT INTO `oms_pdd_order` VALUES (1795400709304664065, 5, '240520-023115907511858', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 2029.3, 0, 2029.3, 0, '', NULL, NULL, '', '2024-05-21 15:09:32', '', '', NULL, '', '', '~AgAAAALHBiwIwaqeDQGi3lc3WG2TWtVv1PTJscLw/GNVCBeiHfhZigPitmeyWCTOYboGbfQfT98Z63TyQsmhUV7RmHeQdatfG4R8ay9xDv4=~0~', '杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwFwaqeDQAkyUUZ+NmVGX+s21a+qmyD1eY=~0~', '$AgAAAALHBiwGwaqeDQA1RoppWm4qhSr5bttF21Dwhug=$0$', '1*********0', '高*', '北京市北京市顺义区杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwHwaqeDQGvE4gistfZLalkWacZmAaxj9hwz+zg1xVRMySs8QPJVQTiJ6CrMRNwO9G9y3pa5IURHWi+QgjnNSn32WTlG9Jb73s5Sw3vI7JntzPjIwq+LowhD9zD2qcUZlfHimQvaqfvRA==~0~', '顺义区', 511, '北京市', 52, '北京市', 2, '中国', 0, NULL, '2024-05-20 15:10:32', '2024-05-20 15:10:33', '', 0, '2024-06-19 15:10:33', NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, '', 0, NULL, '2024-05-31 20:01:40', NULL);
INSERT INTO `oms_pdd_order` VALUES (1795400709531156482, 5, '240520-645886165431858', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 4299, 0, 4299, 0, '', NULL, NULL, '', '2024-05-21 15:09:32', '', '', NULL, '', '', '~AgAAAALHBiwIFFV3+QGU0L5sNKYfK8lGg5VJMLc+8eIJs4JIBKiyF7FQ7faMBmqw7f9MnFCmfbVodhJtqndf2ZONCF7VwaqyNUN/YR6kCPs=~0~', '杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwFFFV3+QD0Xf4m9A2vB31Bacnu8lH4eDk=~0~', '$AgAAAALHBiwGFFV3+QAc7Xp68Iu8S/H5ogemEXGVlBw=$0$', '1*********0', '高*', '北京市北京市顺义区杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwHFFV3+QHMXu6aW8tfNFKlKA2g5zljxLb3hmC3ViBKrNrj9iomyj3B1aDIexJX7f5khOdD/weKdlV1MH5wcWHhGma2jFYPQC6uGlVT4aM07whWL9QHc8ECsXo6nUbp8j0IpMF2OSn4nw==~0~', '顺义区', 511, '北京市', 52, '北京市', 2, '中国', 0, NULL, '2024-05-20 15:10:32', '2024-05-20 15:10:33', '', 0, '2024-06-19 15:10:33', NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, '', 0, NULL, '2024-05-31 20:01:40', NULL);
INSERT INTO `oms_pdd_order` VALUES (1795400709619236866, 5, '240520-366713291191858', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 2899, 0, 2899, 0, '', NULL, NULL, '', '2024-05-21 15:09:32', '', '', NULL, '', '', '~AgAAAALHBiwI6TSXDAGbtXPaf1/1poiwCf+tH0Ckd6eHnjSgpTQsHgPPC7VcqM8UycX3neb9KXURx5BmRbjbcKJqXit/Daw+2+3rp7qJmI0=~0~', '杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwF6TSXDABxIK3nbjTUQVLlLTYZVdYGzwc=~0~', '$AgAAAALHBiwG6TSXDACeVZU0RMDbSGpA3ZMH8pVUHYw=$0$', '1*********0', '高*', '北京市北京市顺义区杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwH6TSXDAGwCtGhsq8DZQgg3KW0TNVNa2PDonpeI3VSHA57nsu4ERb+NQW/8pabKuRDmLlkWVesO1FN8F++Rc87mOMltPMaNubaAtY1dc7zhsQPJf+bkp4zRYm5Z9K7Z3NpvYvHjf3egA==~0~', '顺义区', 511, '北京市', 52, '北京市', 2, '中国', 0, NULL, '2024-05-20 15:10:32', '2024-05-20 15:10:33', '', 0, '2024-06-19 15:10:33', NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, '', 0, NULL, '2024-05-31 20:01:40', NULL);
INSERT INTO `oms_pdd_order` VALUES (1795400709732483074, 5, '240520-302288781751858', 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 3319, 0, 3319, 0, '', NULL, NULL, '', '2024-05-21 15:09:33', '', '', NULL, '', '', '~AgAAAALHBiwIBuwQcQGYSaq5vHh882CMpeC0Tl5N1ynI94Wc/uPh3JGSVlYV188efVR3bhHPId+X20W49hNG+oHtZDvOI66JkhUd4vWlXLA=~0~', '杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwFBuwQcQDmFVSjCFjLgj9EXKRi1T9wWHM=~0~', '$AgAAAALHBiwGBuwQcQAExMuMEChrp0IKI2XKmoEuf6c=$0$', '1*********0', '高*', '北京市北京市顺义区杨镇仙泽园*号楼*单元*层*', '~AgAAAALHBiwHBuwQcQHLRXfNwD4GsXaVHlt8y+KWYkV5jNWAQKHx9wembWoM4TEwgeDatIyWGURXkbdF0yT9bd+drWuR0SrPlsJVxO9wTL8kL7sjy15jSNihl8gp2ghNUI1o1xCmQVrM1qwehSASrQ==~0~', '顺义区', 511, '北京市', 52, '北京市', 2, '中国', 0, NULL, '2024-05-20 15:10:32', '2024-05-20 15:10:33', '', 0, '2024-06-19 15:10:33', NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, '', 0, NULL, '2024-05-31 20:01:40', NULL);
INSERT INTO `oms_pdd_order` VALUES (1795400709858312193, 5, '240520-047322284383318', 0, 0, 1, 1, 1, 2, 1, 0, 0, 0, 3699, 0, 3699, 0, '', NULL, NULL, '', '2024-05-24 16:28:09', '2024-05-24 16:28:08', '908869012726', NULL, '', '', '', '', '', '', '', '', '', '', '', 0, '', 0, '', 0, '中国', 0, NULL, '2024-05-20 15:47:33', '2024-05-20 15:47:34', '', 0, '2024-06-19 15:47:34', NULL, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 0, 0, '', 0, NULL, '2024-05-31 20:01:40', NULL);

-- ----------------------------
-- Table structure for oms_pdd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_order_item`;
CREATE TABLE `oms_pdd_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `order_id` bigint(0) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `erp_goods_id` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erp_spec_id` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `good_id` bigint(0) DEFAULT 0 COMMENT '拼多多商品id',
  `sku_id` bigint(0) DEFAULT 0 COMMENT '拼多多商品skuid',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  `goods_spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品规格',
  `goods_price` double NOT NULL COMMENT '商品单价',
  `outer_goods_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家外部编码（商品）',
  `outer_id` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家外部编码（sku）',
  `goods_count` int(0) NOT NULL COMMENT '商品数量',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `item_amount` double DEFAULT NULL COMMENT '子订单金额',
  `is_gift` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否礼品0否1是',
  `refund_count` int(0) DEFAULT 0 COMMENT '已退货数量',
  `refund_status` int(0) NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ',
  `shop_id` int(0) NOT NULL COMMENT '内部店铺ID',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '系统创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '系统更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodId_index`(`erp_goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1795400709887672323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_pdd_order_item
-- ----------------------------
INSERT INTO `oms_pdd_order_item` VALUES (1795400709401133057, 1795400709304664065, '240520-023115907511858', 0, 0, 0, 1579469646153, NULL, 'https://img.pddpic.com/mms-material-img/2024-03-27/4c52b61b-dc4a-4931-ad7d-9b6310740f34.jpeg', '真皮软床-卷包排骨,1800mm*2000mm,框架结构', 2029.3, '', 'ZH-PC-2-DS-F1-QM24-B2-18', 1, NULL, NULL, 0, 0, 1, 5, '2024-05-28 18:24:21', NULL);
INSERT INTO `oms_pdd_order_item` VALUES (1795400709577293826, 1795400709531156482, '240520-645886165431858', 0, 0, 0, 1593140137426, NULL, 'https://img.pddpic.com/mms-material-img/2024-04-24/865b79dc-dfdc-4fba-8b5f-7688b90a93de.jpeg.a.jpeg', '黑色,1500mm*2000mm,框架结构', 4299, '', 'ZH-PC-2-DS-F1-QM24-B4-15', 1, NULL, NULL, 0, 0, 1, 5, '2024-05-28 18:24:21', NULL);
INSERT INTO `oms_pdd_order_item` VALUES (1795400709652791298, 1795400709619236866, '240520-366713291191858', 0, 0, 0, 1547395102691, NULL, 'https://img.pddpic.com/mms-material-img/2024-01-09/288d6a97-c1e6-432b-8d02-c815f8b0c853.jpeg', '头层压纹牛皮-框架床,1500mm*2000mm,框架结构', 2899, '', 'ZH-PC-2-DS-F1-QM23-B4-15', 1, NULL, NULL, 0, 0, 1, 5, '2024-05-28 18:24:21', NULL);
INSERT INTO `oms_pdd_order_item` VALUES (1795400709766037506, 1795400709732483074, '240520-302288781751858', 0, 0, 0, 1596635762899, NULL, 'https://img.pddpic.com/gaudit-image/2024-05-07/84433fbb8437620d67e7dc169e330489.jpeg', '', 3319, '', 'ZH-GNSF-F1-QM24-S1-DY', 1, NULL, NULL, 0, 0, 1, 5, '2024-05-28 18:24:21', NULL);
INSERT INTO `oms_pdd_order_item` VALUES (1795400709887672322, 1795400709858312193, '240520-047322284383318', 0, 0, 0, 1547395102694, NULL, 'https://img.pddpic.com/mms-material-img/2024-01-09/22ce0fb0-8e07-43d2-a2a2-1415d904edae.jpeg', '头层压纹牛皮框架床+独袋乳胶弹簧床垫,1800mm*2000mm,框架结构', 3699, '', 'DS-F1-QM23-B4-18&M1', 1, NULL, NULL, 0, 0, 1, 5, '2024-05-28 18:24:21', NULL);

-- ----------------------------
-- Table structure for oms_pdd_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_pdd_refund`;
CREATE TABLE `oms_pdd_refund`  (
  `id` bigint(0) NOT NULL COMMENT '售后编号',
  `order_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `shopId` int(0) NOT NULL COMMENT '内部店铺ID',
  `after_sales_type` int(0) NOT NULL COMMENT '必填，售后类型2：仅退款 3：退货退款 4：换货 5：缺货补寄 9:拦截退货',
  `after_sales_status` int(0) NOT NULL COMMENT '必填，售后状态 1：全部 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成 31：商家同意拒收退款，待用户拒收;32: 待商家补寄发货',
  `after_sale_reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后原因',
  `confirm_time` bigint(0) NOT NULL COMMENT '订单成团时间',
  `created_time` bigint(0) NOT NULL COMMENT '创建时间',
  `discount_amount` double NOT NULL COMMENT '订单折扣金额（元）',
  `order_amount` double NOT NULL COMMENT '订单金额（元）',
  `refund_amount` double NOT NULL COMMENT '退款金额（元）',
  `goods_image` varchar(245) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品图片',
  `goods_id` bigint(0) DEFAULT NULL COMMENT '拼多多商品id',
  `sku_id` bigint(0) DEFAULT NULL COMMENT '拼多多商品skuid',
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品名称',
  `goods_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '商品编码',
  `spec_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '商品编码',
  `goods_spec` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '商品规格',
  `quantity` int(0) NOT NULL COMMENT '数量',
  `goods_price` double NOT NULL COMMENT '商品价格，单位：元',
  `updated_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新时间',
  `tracking_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递单号',
  `tracking_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递公司',
  `audit_status` int(0) NOT NULL DEFAULT 0 COMMENT '审核状态2已签收9供应商已退款',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '审核时间',
  `describe` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退货说明',
  `shipping_status` int(0) DEFAULT NULL COMMENT '订单发货状态 0:未发货， 1:已发货（包含：已发货，已揽收）',
  `user_shipping_status` int(0) DEFAULT NULL COMMENT '0-未勾选 1-消费者选择的收货状态为未收到货 2-消费者选择的收货状态为已收到货',
  `erp_order_return_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'erp退货单号',
  `erp_order_return_id` bigint(0) DEFAULT NULL COMMENT 'erp退货单id',
  `sign` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多订单退款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_goods`;
CREATE TABLE `oms_tao_goods`  (
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
  `postage_id` bigint(0) DEFAULT NULL COMMENT '宝贝所属的运费模板ID，如果没有返回则说明没有使用运费模板',
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
  `shop_id` bigint(0) NOT NULL COMMENT '店铺id',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp商品id',
  `erp_supplier_id` bigint(0) DEFAULT NULL COMMENT 'erp系统供应商ID',
  `create_time` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785146263782014979 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '淘宝商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_goods_sku`;
CREATE TABLE `oms_tao_goods_sku`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
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
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT '商品id(o_goods外键)',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT '商品skuid(o_goods_sku外键)',
  `shop_id` bigint(0) DEFAULT NULL COMMENT '店铺id',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785146265149358083 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '淘宝商品SKU表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order`;
CREATE TABLE `oms_tao_order`  (
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
  `tmall_coupon_fee` bigint(0) DEFAULT NULL COMMENT '天猫商家使用，订单使用的红包信息',
  `audit_status` int(0) DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785992384864010243 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_item`;
CREATE TABLE `oms_tao_order_item`  (
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
  `outer_sku_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1785992385006616578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_order_promotion
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_promotion`;
CREATE TABLE `oms_tao_order_promotion`  (
  `id` bigint(0) NOT NULL COMMENT '交易的主订单或子订单号',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠信息的名称',
  `discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠金额（免运费、限时打折时为空）,单位：元',
  `gift_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '满就送商品时，所送商品的名称',
  `gift_item_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '赠品的宝贝id',
  `gift_item_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '满就送礼物的礼物数量',
  `promotion_desc` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠活动的描述',
  `promotion_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '优惠id，(由营销工具id、优惠活动id和优惠详情id组成，结构为：营销工具id-优惠活动id_优惠详情id，如mjs-123024_211143）',
  `kd_discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分摊优惠金额（免运费、限时打折时为空）,单位：元',
  `kd_child_discount_fee` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '若优惠项在主订单上，返回子订单的分摊信息'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单优惠明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oms_tao_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_refund`;
CREATE TABLE `oms_tao_refund`  (
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
  `pull_status` int(0) DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786655103824936964 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_tao_refund
-- ----------------------------
INSERT INTO `oms_tao_refund` VALUES (1786655103661359105, '154686037032128162', 'REFUND', 6, 2137984935735126281, 2137984935736126281, 0, NULL, 3378, 3378, NULL, NULL, '2024-05-04 13:04:42', '2024-05-04 13:04:43', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 13:04:43', '曲美家居现代简约双人板式床舒适婚床卧室多功能储物床', '4988190157320|颜色分类:木本色架子床+独袋乳胶床垫;尺寸:1500mm*2000mm', 'AAH3HVMUAAJ_dKyzaDW__rrF', '阿绿碎碎念', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103690719234, '272863119053250876', 'REFUND', 6, 3873446498759257608, 3873446498760257608, 0, NULL, 9999, 9999, NULL, NULL, '2024-05-04 09:10:40', '2024-05-04 09:10:54', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 09:10:54', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656260|适用人数:组合;颜色分类:【适用4人】灯芯绒-燕麦白', 'AAEeHVMUAAJ_dKyzaDWtYDsb', 'yina_1217', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828097, '272811564981003461', 'REFUND', 6, 3867452064428006134, 3867452064429006134, 0, NULL, 12359, 12359, NULL, NULL, '2024-05-04 00:20:08', '2024-05-04 08:46:35', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '没用/少用优惠', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 08:46:36', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656265|适用人数:组合;颜色分类:【适用4人】灯芯绒-奶茶灰', 'AAFlHVMUAAJ_dKyzaDUeaMJi', '亲你妹夫亲', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828098, '272807678894920119', 'REFUND_AND_RETURN', 6, 3851109505623921901, 3851109505624921901, 0, NULL, 2104.03, 2104.03, NULL, NULL, '2024-05-03 19:17:13', '2024-05-03 19:42:33', '曲美家具官方旗舰店', NULL, 'WAIT_SELLER_AGREE', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 1, 1298098439, 1, 'ZQB-2011C-WG1', '商品无法安装使用', 'aftersale', NULL, '', NULL, NULL, NULL, NULL, '【新风潮价】曲美家居现代简约实木衣柜卧室衣帽柜平开门衣橱环保板材储物柜', '4600898994639|颜色分类:木本色衣柜;门数量:2门;是否组装:组装', 'AAGyHVMUAAJ_dKyzaDUwia6Q', '无忌上', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 16:16:34', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936962, '154544811395929773', 'REFUND', 6, 2121326583552927397, 2121326583553927397, 0, NULL, 2135, 2135, NULL, NULL, '2024-05-03 17:49:22', '2024-05-03 17:49:23', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:49:23', '【活动价】曲美lab墩墩沙发现代简约模块布艺真皮沙发别墅客厅沙发自由搭配', '5451881559814|适用人数:组合;颜色分类:灯芯绒坐包-燕麦白;尺寸:84x84x40cm', 'AAHCHVMUAAJ_dKyzaDUfiNYK', 'nono璐hly', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936963, '154486920027549058', 'REFUND', 6, 2088964452215545890, 2088964452216545890, 1236.4, NULL, 1256.4, 20, NULL, NULL, '2024-05-03 17:10:19', '2024-05-03 17:10:21', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, 1684779514, 2, 'ZH-SF-04-DS-F9-QM20A-NT3', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:10:21', '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4902529397704|颜色分类:奶油白;安装方式:组装', 'AAHRHVMUAAJ_dKyzaDVwM06l', 'cfzxl365', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 20:31:50', 1, '2024-05-04 20:31:55');

-- ----------------------------
-- Table structure for oms_wei_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_goods`;
CREATE TABLE `oms_wei_goods`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '平台商品id',
  `out_product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家编码id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题',
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `head_imgs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '主图集合',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '第一张主图',
  `desc_info` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品详情字符串',
  `attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '属性字符串',
  `status` int(0) DEFAULT NULL COMMENT '状态',
  `edit_status` int(0) DEFAULT NULL COMMENT '编辑状态',
  `min_price` int(0) DEFAULT NULL COMMENT '商品 SKU 最小价格（单位：分）',
  `spu_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品编码',
  `product_type` int(0) DEFAULT NULL COMMENT '商品类型。1: 小店普通自营商品；2: 福袋抽奖商品；3: 直播间闪电购商品。注意: 福袋抽奖、直播间闪电购类型的商品为只读数据，不支持编辑、上架操作，不支持用data_type=2的参数获取。',
  `edit_time` int(0) DEFAULT NULL COMMENT '商品草稿最近一次修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_wei_goods
-- ----------------------------
INSERT INTO `oms_wei_goods` VALUES (1795636754709454849, 2, '10000111645565', '', '2024春季农家燕麦麸皮高纤高蛋白营养 500g/罐', '', '[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HPG64VQI8TgYbozanWRE_EpUPK_3IBg1D0SyqyO2YA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HCwlWhJ8Rnf9E9mr0K8rNitszIKsvZYV9SMWeHdd8A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HK7U3nbCJBxlWg5vS9eomdWq4Ew-qIDh7CGVM4zGEw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HJdu7_pEwPIPchGaER5LGrjB43N2gEtJJRxVVjJd8A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HAsXf4yboP7cTb-wiME6A3hDDI_R4IrYzRd8nMNJtA\"]', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg', '{\"imgs\":[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HDY4CjYY82wM9sNVrii4n03NKTFKS5If-1-1pvisZg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HKRQPaKpvRI9mYRs4iRnOrHMmF2MXlpOSXj3-kbAFA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMnHX5wEVew97BUpgUrT5-uvSmB42J_4d-g2DIsOMw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBQ3O7M7mnE04x6Eyc7KfxE3lIBoOOFoMVJBBbgvmQ\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBhOuGd_LrdCLkoS0i4hhPSQS3ks7lpY3P8TVMFOiA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HH0VjlDP4IZEPdl5iDnN-D_6bE1xdIXghbGFMaknAg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMrzEqpgmQ5edyWMUWlLl649f8hYgDoJuSEcp-9eQg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HGt0zPl64XfxhN790pd8xXuSJ72RrjzdUswrooBBKg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HG6dKgcealo0SVHHusC5tPdEbjwFImfjJLffJEQ-ag\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HPRo1veYHfEEdEaVYiBjPJLY10mML_9UE_FBjaGFKA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HGA6NerR9cRmXxpL8MU0g1twXepwSXu4JVosXNmmuQ\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMVGHBLwzFR8qDwKkCJiFV4FTrg9LfmdMvjn-dBC_w\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"麦曲丰\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"山东维美食品有限公司\"},{\"attr_key\":\"配料表\",\"attr_value\":\"燕麦\"},{\"attr_key\":\"保质期\",\"attr_value\":\"240 天\"},{\"attr_key\":\"净含量\",\"attr_value\":\"500 g\"}]', 5, NULL, 9990, '', 1, 0);
INSERT INTO `oms_wei_goods` VALUES (1795636755195994114, 2, '10000114346861', '', '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', '', '[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HL_ErqQ-eBozdnUSc9F1S-yHJCW9vjyweeA5TeooDA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HETf8g8Ec8dDl5WP5P_DE-80b2kHRkmjBbjOHuCvHw\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HFtrXLWMPQ0cD50CZyWfjqsF2zyHsg3fA6ssEPTgaA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HMEiYPjqHTlDnMsalOjfXAoMNXaNq76pdt8ce_N1hA\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HIjWZ5fNYcdULHZuzdzlHR9YtjUQF98PMgCBwgsZ4A\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HBQ0LHKpiVL_8W7I4L6Ow8-J2jP93FQdCRyuT68-Yg\"]', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w', '{\"imgs\":[\"https://mmecimage.cn/p/wx62136b9e9b09930b/HOKY3NswtH3fFEMchWtsny45eCiSDW4H2vmsxjpU8g\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HEqtYcwsXkJpA2cRcCZIKZo0Fh18eiGL1c5NIVwclg\",\"https://mmecimage.cn/p/wx62136b9e9b09930b/HG5vuxZlj7lSSmQkbA8qrzCg6XMLYjkpjNxMiehmfg\"],\"desc\":\"\"}', '[{\"attr_key\":\"品牌\",\"attr_value\":\"无\"},{\"attr_key\":\"生产企业名称\",\"attr_value\":\"安徽意茗堂生物科技有限公司\"},{\"attr_key\":\"配料表\",\"attr_value\":\"苦荞麦\"},{\"attr_key\":\"保质期\",\"attr_value\":\"12 月\"},{\"attr_key\":\"净含量\",\"attr_value\":\"250 g\"}]', 5, NULL, 9990, '', 1, 0);

-- ----------------------------
-- Table structure for oms_wei_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_goods_sku`;
CREATE TABLE `oms_wei_goods_sku`  (
  `id` bigint(0) NOT NULL,
  `shop_id` bigint(0) DEFAULT NULL COMMENT '店铺id',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '产品id',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'skuID',
  `out_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商家自定义skuID。如果添加时没录入，回包可能不包含该字段',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题',
  `thumb_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku小图',
  `sale_price` int(0) DEFAULT NULL COMMENT '售卖价格，以分为单位',
  `stock_num` int(0) DEFAULT NULL COMMENT 'sku库存',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku编码',
  `status` int(0) DEFAULT NULL COMMENT 'sku状态',
  `sku_attr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku属性',
  `sku_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_attrs',
  `sku_deliver_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku_deliver_info',
  `erp_goods_id` bigint(0) DEFAULT NULL COMMENT 'erp系统商品id',
  `erp_goods_sku_id` bigint(0) DEFAULT NULL COMMENT 'erp系统商品skuid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_wei_goods_sku
-- ----------------------------
INSERT INTO `oms_wei_goods_sku` VALUES (1796070070747123714, 2, '10000111645565', '2198772498', '', '2024春季农家燕麦麸皮高纤高蛋白营养 500g/罐', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HLOZRDqDEXQ_EGmghk51hxJ_PR4KCrYoOPcfH9J5Xg', 9990, 10000, '', 5, '拍3罐送1罐到手4斤 ; 7天无理由试喝及运费险 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍3罐送1罐到手4斤\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天无理由试喝及运费险\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);
INSERT INTO `oms_wei_goods_sku` VALUES (1796070070893924354, 2, '10000114346861', '2239632777', '', '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 'https://mmecimage.cn/p/wx62136b9e9b09930b/HBA00xcXpgSCJfACpAwipmecGfNQ5B9F2jH0k9DX-w', 9990, 9989, '', 5, '拍1发4=到手4罐 ; 7天试喝及运费险 ; ', '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', '{\"stock_type\":0,\"full_payment_presale_delivery_type\":0,\"presale_begin_time\":0,\"presale_end_time\":0,\"full_payment_presale_delivery_time\":0}', NULL, NULL);

-- ----------------------------
-- Table structure for oms_wei_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order`;
CREATE TABLE `oms_wei_order`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号',
  `openid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家身份标识',
  `create_time` int(0) DEFAULT NULL COMMENT '秒级时间戳',
  `update_time` int(0) DEFAULT NULL COMMENT '秒级时间戳',
  `unionid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int(0) DEFAULT NULL COMMENT '状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；',
  `aftersale_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '售后信息json',
  `pay_info` varchar(5500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付信息json',
  `product_price` int(0) DEFAULT NULL COMMENT '商品总价，单位为分',
  `order_price` int(0) DEFAULT NULL COMMENT '订单金额，单位为分，order_price=original_order_price-discounted_price-deduction_price-change_down_price',
  `freight` int(0) DEFAULT NULL COMMENT '运费，单位为分',
  `discounted_price` int(0) DEFAULT NULL COMMENT '优惠券优惠金额，单位为分',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货人姓名',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮编',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省份',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '城市',
  `county_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区',
  `detail_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '详细地址',
  `tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系方式\r\n',
  `house_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '门牌号码',
  `virtual_order_tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '虚拟发货订单联系方式(deliver_method=1时返回)',
  `tel_number_ext_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '额外的联系方式信息（虚拟号码相关）',
  `use_tel_number` int(0) DEFAULT NULL COMMENT '0：不使用虚拟号码，1：使用虚拟号码',
  `hash_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '标识当前店铺下一个唯一的用户收货地址',
  `delivery_product_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '发货物流信息JSON',
  `ship_done_time` int(0) DEFAULT NULL COMMENT '发货完成时间，秒级时间戳',
  `ewaybill_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电子面单代发时的订单密文\r\n',
  `settle_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '结算信息json',
  `audit_status` int(0) DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_wei_order
-- ----------------------------
INSERT INTO `oms_wei_order` VALUES (1787451057007726594, 2, '3719632105698365440', 'oTci56wpEC3rpLzBLpqgca9RxPVE', 1714880617, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051143383371820d4bc111707233960000\",\"prepay_time\":1714880618,\"pay_time\":1714880636,\"transaction_id\":\"4339401087202405058204364146\"}', 9990, 9990, 0, NULL, '陈*', '401120', '重庆市', '重庆市', '渝北区', '****', '151****3175', '', '', 'null', 0, '76c5d95a69fa3e2f3df3fa130c544b1e', '[{\"waybill_id\":\"73611068324382\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofoTfAD_tpK6Oj6pD5EZn0X6VvDfkvcvnlmaRnrVRQQnd1z7vKd8wIYBV95WZKSMi0gJOH2iKHJw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057125167105, 2, '3719632099578611200', 'oTci56zcnCjfcfUfYwq73nCHsV8I', 1714880593, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114314861727bb07cc30ececbdcf0001\",\"prepay_time\":1714880595,\"pay_time\":1714880603,\"transaction_id\":\"4327500968202405056312947579\"}', 9990, 9990, 0, NULL, '丁', '510145', '广东省', '广州市', '荔湾区', '****', '153****3552', '', '', 'null', 0, '27a59189b23a462344802f09f13cc250', '[{\"waybill_id\":\"73611068324461\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of2RLT2XA-d89xt4GX9sSerSB6YeVylmdbAlfELihMWDfpqbrZrnyU6k8BPG7ONUWYwYHLM1U6tA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057183887362, 2, '3719632099131658496', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', 1714880592, 1714881184, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461410155\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114313221244597b4b5445a0690c0000\",\"prepay_time\":1714880593,\"pay_time\":1714880600,\"transaction_id\":\"4307600956202405052225014361\"}', 9990, 9990, 0, NULL, '陶**', '210018', '江苏省', '南京市', '玄武区', '****', '199****6061', '', '19951926061', 'null', 0, 'e389beb4326308c27465df67347443e5', '[]', 0, 'of-7gCCdnYPV5MNNCBnlEad93OJsbNYsg6L4eYE35G2DSF8P46vda8XX2XDGHSbuw3Ik819eujIQ', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057242607617, 2, '3719631864896819456', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', 1714879698, 1714881565, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461361268\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051128196745141d0919125a1299920001\",\"prepay_time\":1714879699,\"pay_time\":1714879708,\"transaction_id\":\"4347801086202405057172952617\"}', 9990, 9990, 0, NULL, '张**', '430014', '湖北省', '武汉市', '江岸区', '****', '153****4753', '', '', 'null', 0, '251b08a9fac95dcc13a90bf26dc7a59d', '[]', 0, 'ofBGPtEuAZdRoApr0etNKO0tALhHaesftNWei-US-LqA5688odSWs85m50sI5iP6q9esTAdXO0pQ', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057313910785, 2, '3719631857821552640', 'oTci565jaCWcbHcn8IEkbwGcgIq0', 1714879671, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05112752894216323c638abb5e0c420000\",\"prepay_time\":1714879673,\"pay_time\":1714879681,\"transaction_id\":\"4321700963202405055592435124\"}', 9990, 9990, 0, NULL, '邓**', '200333', '上海市', '上海市', '普陀区', '****', '150****8494', '', '', 'null', 0, '0ef19b8c4676fb859dfc114d1dd70f2f', '[{\"waybill_id\":\"73611068324740\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofS4hfM5rE6TSWpWfWG_09kFABSuH3tET-s_-VxstfmzqgacA-gcg4T0RkZ3f1_QONfNqYRDTuSw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057393602562, 2, '3719630802894587136', 'oTci56yTyGHiR1MkQ3rdDthSDxs8', 1714875647, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05102048444074f78da72845c942460001\",\"prepay_time\":1714875648,\"pay_time\":1714875655,\"transaction_id\":\"4301400970202405058762940615\"}', 9990, 9990, 0, NULL, '廖**', '528400', '广东省', '中山市', '石岐区街道', '****', '136****5688', '', '', 'null', 0, '9623b4b9306bd90c934a61657067921a', '[{\"waybill_id\":\"73611068324604\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofwJA3SzcMUKiC9X4g1QlJUH2iaWH6m-Fyye_df58Q1Cxz3oGV-QDiUzN83imYsydxVUY5lrEB9Q', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057527820289, 2, '3719630104256712960', 'oTci56xiDZigZxCYfTKSpSXT6Tvs', 1714872982, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx050936233660315bb0c63bd05634270000\",\"prepay_time\":1714872983,\"pay_time\":1714872991,\"transaction_id\":\"4315201103202405051609869638\"}', 9990, 9990, 0, NULL, '侯**', '311200', '浙江省', '杭州市', '萧山区', '****', '185****3029', '', '', 'null', 0, '6da48e88729025e89cb7cc0196230af5', '[{\"waybill_id\":\"73611068324525\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofHTmkRoMt5ffRGWY5GxQZORIgrdaJkzq8_m_q3WQ8DHh9e_8Oi6L3GMWb7D-cJQKdRsBYmW-VdA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057628483586, 2, '3719609573252662528', 'oTci567Uey7oSR1QR-bfoyb-oogM', 1714794662, 1714795563, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx041151038576758a3094d77dd75af70001\",\"prepay_time\":1714794664}', 9990, 9990, 0, NULL, '吕**', '200333', '上海市', '上海市', '普陀区', '****', '152****2015', '', '', 'null', 0, 'f30ce3965c796262f2653c3c7868953d', '[]', 0, 'ofxy9FxYC-Qj7cWe1Hdy7d_T64qAemLp5T7RZgw2okf7PWnlxU7n1MPzctDX-xZtNYf7SpRPffLg', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057733341185, 2, '3719609207888941056', 'oTci561cdcRmgu9LC7fuhTC2KZDo', 1714793268, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04112749896102e6c7c82c097077fb0000\",\"prepay_time\":1714793270,\"pay_time\":1714793275,\"transaction_id\":\"4344501088202405048410251099\"}', 9990, 9990, 0, NULL, '朱**', '322000', '浙江省', '金华市', '义乌市', '****', '130****7068', '', '', 'null', 0, '23399086d10638828a7cc6758e1f57f6', '[{\"waybill_id\":\"73611068322959\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofAJAg33082uvirnNPy6UvESlcwDTRt9-nP7k0h51hK_uy5vYs63UbDgriNvUn7pJU5Z8ZFSY7Sg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057792061442, 2, '3719608045550570496', 'oTci56_mnmDsnspHd_o1pdFxMyYs', 1714788834, 1714983118, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04101356264587a370a7b255ee58220000\",\"prepay_time\":1714788836,\"pay_time\":1714788846,\"transaction_id\":\"4333800973202405048639385067\"}', 9990, 9990, 0, NULL, '老*', '300400', '天津市', '天津市', '北辰区', '****', '136****5987', '', '', 'null', 0, 'fb3640edbd9496e1c29186ea6f59f1e2', '[{\"waybill_id\":\"73611068329514\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983117,\"deliver_type\":1}]', 1714983117, 'ofbMZeC-SsLYYEwkBYwldGkYj09Ugwuo5G0fEMPRcCvI9hDwglE34HJBHhV-T1TQHuAmIMOK-UsA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057859170306, 2, '3719607305622392832', 'oTci56yzAUABB6pTqNALQJfN0abk', 1714786012, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04092653618057576501ea2b67ddd50001\",\"prepay_time\":1714786013,\"pay_time\":1714786022,\"transaction_id\":\"4331000950202405041318661925\"}', 9990, 9990, 0, NULL, '许**', '200030', '上海市', '上海市', '徐汇区', '****', '186****9879', '', '', 'null', 0, 'b1d6bdbdf2981082076696cbf9e751fa', '[{\"waybill_id\":\"73611068323266\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of0IpgPtXnOq0TZI30xp0t6Hnpfr3O97l2XieeHYSLGX1qUWZnmadmqX0QSyA2wlT4Xc6ennDYhg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057926279169, 2, '3719541152804638976', 'oTci56xaqRXPCRPfRzDUtxuZJSZ8', 1714533659, 1714697637, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01112100729847fea6fdafc1704c820000\",\"prepay_time\":1714533660,\"pay_time\":1714533680,\"transaction_id\":\"4333901104202405015394319422\"}', 9990, 9990, 0, NULL, '王**', '130031', '吉林省', '长春市', '二道区', '****', '130****4298', '', '13069004298', 'null', 0, '0f62238c3bd1bad24ceabe674cc5cdbf', '[{\"waybill_id\":\"73611002395494\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'ofIRNqZCqBqEOCAA6Rh5sKt58nxz1OcChK14fjF7aiCQv3wF3Yjyk8oiBpsk0heVFdUu8qAm6Ifg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057989193729, 2, '3719539678347396352', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714528034, 1714745479, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0109471569243797b50c10594f5e8f0001\",\"prepay_time\":1714528035,\"pay_time\":1714528054,\"transaction_id\":\"4349701099202405014937039682\"}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[{\"waybill_id\":\"73611002395318\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of_c0fGfAQkqOZqu293F5yc7PbME_r8hjE80GgC-kMyQTEFj3D7uLzI54vdbuJBVo_A3NE3T1Agw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058043719681, 2, '3719539645519627776', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714527909, 1714528810, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx010945106537123355f2ead7cb142e0001\",\"prepay_time\":1714527910}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[]', 0, 'of1_iH2tIUsDV3KXhk1svg-cYzBFy480quEl_uTiPIHTEKbty0XsM3s8yS7zYPPhhrkKlYt2aSRg', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058127605762, 2, '3719539305125645313', 'oTci566M87SOPp9t4gt0FOAOkS9Y', 1714526611, 1714712410, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01092332254413e24d734dda95c4050001\",\"prepay_time\":1714526612,\"pay_time\":1714526623,\"transaction_id\":\"4337701108202405010523448017\"}', 9990, 9990, 0, NULL, '张*', '710004', '陕西省', '西安市', '新城区', '****', '133****8076', '', '', 'null', 0, '6f45a66533b814649894b1f164d70294', '[{\"waybill_id\":\"73611002395387\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of6LTdryuGRHX5q6lLFMvrsQzgBgiuC4WL5siLy2FM-P0NaVGGmK18e_reU3-yVytK-lEUd3CoXg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058186326018, 2, '3719539303409911296', 'oTci56yAxVf7oKTlnW7UbOMdPhuE', 1714526604, 1714737259, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx010923254698878ffcdc29160c99740001\",\"prepay_time\":1714526605,\"pay_time\":1714526614,\"transaction_id\":\"4326200966202405017664125441\"}', 9990, 9990, 0, NULL, '侯*', '110031', '辽宁省', '沈阳市', '皇姑区', '****', '135****3408', '', '', 'null', 0, '081b534b88aeebfef16cfebed7e9b45e', '[{\"waybill_id\":\"73611002395438\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of-GOTNJSemfmNl3doRG3ADLhd9rJumWqTVh0pVIaclreLy4kU-r_dLNuXgLMnZuXdm6RiA_jjCQ', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058228269058, 2, '3719520228905715200', 'oTci56zlEZt2Sw_gD78eJnTFpbdU', 1714453840, 1714454741, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx3013104207123594f733e51396d8d90000\",\"prepay_time\":1714453842}', 9990, 9990, 0, NULL, '安**', '264300', '山东省', '威海市', '荣成市', '****', '139****3719', '', '', 'null', 0, '59da071f50719e09f01a491b3c4315c6', '[]', 0, 'of76j3Y1qZfzJ7qnZcuXHBVsiEv_YGvumzBV0RRS9XGGtPy-mXi2XVWb9YP51amVHXxafUba-7Ig', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058282795010, 2, '3719520157597830144', 'oTci569yPmUpaaEDB0-gc_61_bQg', 1714453569, 1714705510, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301306104568162ebb785c7203a7c70001\",\"prepay_time\":1714453570,\"pay_time\":1714453580,\"transaction_id\":\"4336700950202404301822641011\"}', 9990, 9990, 0, NULL, '勾**', '110200', '辽宁省', '沈阳市', '辽中区', '****', '130****0299', '', '', 'null', 0, 'c48111b669f63885475971cd00d81aa0', '[{\"waybill_id\":\"73610991878978\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'of5tnacXLYJ7k_JRfJUq85GlpAGlEu7KyFgjDirvw5lQ-hQ3hjeO1ZWItxFZpOdC-2HN7cXvBf2A', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058337320961, 2, '3719519937814465536', 'oTci561Dyp_40Q_i3l36a2OLirWU', 1714452730, 1714647910, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30125211642150cbd118620b179cd80001\",\"prepay_time\":1714452731,\"pay_time\":1714452747,\"transaction_id\":\"4350800963202404301894276925\"}', 9990, 9990, 0, NULL, '饶**', '430061', '湖北省', '武汉市', '武昌区', '****', '153****8831', '', '', 'null', 0, 'df443b7b536055c5fe650f92b6228df3', '[{\"waybill_id\":\"73610991879137\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'ofXIDtyH-kbHU90oiz0HZKqigOJviDHbfy6rmwuAvLLkIMgS82dLPX4RE_un9w48adpnZmzVDnuw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058370875393, 2, '3719519606137030144', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714451465, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123106363630bc2040a0467b90a20001\",\"prepay_time\":1714451466,\"pay_time\":1714451480,\"transaction_id\":\"4309201107202404302139171466\"}', 9990, 9990, 0, NULL, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'ofLRybOEXAL4PRcsgIDOf8_UnYB8oHnhM_yTY0A1tFs_Kgs_cBxcdgfCvHW2aA5OjE0lVvPB97Dw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058421207041, 2, '3719519603625955328', 'oTci564sE_0MrrIeKuN6zmoTePOA', 1714451455, 1714813169, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123056815634f8d686831832aaf40000\",\"prepay_time\":1714451456,\"pay_time\":1714451464,\"transaction_id\":\"4313001088202404307373318969\"}', 9990, 9990, 0, NULL, '王**', '266100', '山东省', '青岛市', '崂山区', '****', '136****3948', '', '', 'null', 0, '7d6287d18fbf6a59f7c1375a7d5fb476', '[{\"waybill_id\":\"73610989601736\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of1JpdpO9xG2sxfhrvqIoZ7iVC9l_FauPBzV94Yoe8usahUFUyVl_fBHCk0OmuQk1h95No3QIDkQ', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058471538689, 2, '3719519600843559168', 'oTci5617Ek2kYfoh1ITAL6WOGgGU', 1714451445, 1714885171, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123046157394a51a01b6bc7aab010001\",\"prepay_time\":1714451446,\"pay_time\":1714451455,\"transaction_id\":\"4335701114202404300011618746\"}', 9990, 9990, 0, NULL, '陈**', '514400', '广东省', '梅州市', '五华县', '****', '158****9887', '', '', 'null', 0, 'ebac3b596b79b553110c40135e6b2698', '[{\"waybill_id\":\"73610989601891\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of8FvFaFQ7KCggonIA7JxIlYq_cNp1zYRZXifUoYcug1_vBtghTtWm5QP2ePaHfK2k3tc9z2fHLw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058538647554, 2, '3719519482018137600', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714450992, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx3012231342018305f098afaa80b4710001\",\"prepay_time\":1714450993,\"pay_time\":1714451006,\"transaction_id\":\"4320101110202404301218860173\"}', 3990, 890, 0, 3100, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000111746307\",\"sku_id\":\"2198803586\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453168,\"deliver_type\":1}]', 1714453168, 'ofNuRT7esXCFoI0V5mKKvPqZ7cQb85NfCDzG_U7g4vsz31Dr_BjXrihxSTZEcM9vnRZdOUA-Dt-w', '{\"predict_commission_fee\":8}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058584784898, 2, '3719518635971448832', 'oTci566RMss7nywmYedj2xhw1138', 1714447764, 1714622183, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30112925609856241bcbef965ef21a0001\",\"prepay_time\":1714447765,\"pay_time\":1714447801,\"transaction_id\":\"4328501115202404306928504907\"}', 9990, 9990, 0, NULL, '赵**', '710014', '陕西省', '西安市', '未央区', '****', '133****0691', '', '', 'null', 0, '8f32eb87a3e85178705ab54e350ba348', '[{\"waybill_id\":\"73610988706596\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'of4qbkRf3y3W9ilLM6NrYTRExiTYcRqcDLkFqdBTR_azBx8aalYn15ml3RbK7ou0Srrllek1fQ7w', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058635116546, 2, '3719518158959545344', 'oTci563sc2PSk0ZnDmh6rZlvryEE', 1714445944, 1714535782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301059059358676edac4b59314f3830001\",\"prepay_time\":1714445946,\"pay_time\":1714445960,\"transaction_id\":\"4314000957202404307168217552\"}', 9990, 9990, 0, NULL, '龚**', '475000', '河南省', '开封市', '龙亭区', '****', '158****2113', '', '', 'null', 0, '7d7e2964c99206f08f078bf51b5317da', '[{\"waybill_id\":\"73610988706506\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofR-obOLEyNvQwW-qEXr8WogeY8BhTAtd1HgiCS1PTSmNw9-nlgExJzN0kiGH9En7cBpGjee1Zvw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058677059585, 2, '3719517933804327168', 'oTci565UymC1Yinw1X1v2VLcE03E', 1714445085, 1714607782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30104447137134c2dd50d32b9e592d0001\",\"prepay_time\":1714445087,\"pay_time\":1714445094,\"transaction_id\":\"4310301091202404307004951062\"}', 9990, 9990, 0, NULL, '谭**', '510080', '广东省', '广州市', '白云区', '****', '199****3703', '', '', 'null', 0, 'e27ca827e7eb0ea8d1c69c62b479eafe', '[{\"waybill_id\":\"73610988706116\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofKTUD8p_EoEG8HIhKLu2-VAPQ2pN9f5s02haeV_Bja8hM6TwZy9AKdkgJujN-Nc731EYpKkYdFA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058756751361, 2, '3719517651511152896', 'oTci569gEFexljgK9lXxy-NMo_1c', 1714444009, 1715152963, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30102650200648ca736e2c92422beb0001\",\"prepay_time\":1714444010,\"pay_time\":1714444018,\"transaction_id\":\"4303801112202404305816754375\"}', 9990, 9990, 0, NULL, '胡**', '430080', '湖北省', '武汉市', '青山区', '****', '188****9606', '', '18871199606', 'null', 0, '03dc775d1a67f0366a8bc586f815ce90', '[{\"waybill_id\":\"73610988706391\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofs9B72VMq1tNhN0tTmE4sfKufM_tjMar_-u8_S_v8mGiyjnS6oLEZ0Z36BfhzEWHXid75BnBuOg', '{\"predict_commission_fee\":99}', 1, '2024-05-08 15:22:43');
INSERT INTO `oms_wei_order` VALUES (1797557230465679362, 2, '3720294016289213440', 'o9XkH4xuUXSPdAC3B2kRTYdcP9YM', 1717405606, 1717405624, 'o9a2459emkkI9wUWEV3nAWgRKxQQ', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx031706471502046454d598dd1494330000\",\"prepay_time\":1717405607,\"pay_time\":1717405613,\"transaction_id\":\"4307502261202406033741322292\"}', 500, 500, 0, NULL, '刘*', '264001', '山东省', '烟台市', '芝罘区', '****', '151****6166', '', '', 'null', 0, 'be2a765e3b5bb57d17a9ba6ca75e4ad6', '[]', 0, 'ofWKEpTDpC3rstQnucuNCNLXca-iApUURgELSMImutP9Qv5xZkiS-LA_KdYj_ROrY6XYVbhTjkCQ', '{\"predict_commission_fee\":10}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1797557231401009154, 2, '3720293614579748864', 'o9XkH46_AqxdfnRqs0CPr_I3Hcpg', 1717404073, 1717404099, 'o9a245znUkrtTeqBl3SoUkN85SWs', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316411519515292aac41f8ea2aebe0000\",\"prepay_time\":1717404075,\"pay_time\":1717404088,\"transaction_id\":\"4313302271202406039012768919\"}', 500, 500, 0, NULL, '张**', '050051', '河北省', '石家庄市', '新华区', '****', '155****6722', '', '', 'null', 0, 'f30f4ceef62addb1cf295b0516604ce5', '[]', 0, 'ofsImV3Lm0xhFeQwGa87XOpGlTgsGfydYn-YlJ_iaJWbLJe3S9KbfufHxi5zvbSUMv-OF5KUxNZw', '{\"predict_commission_fee\":15}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1797557232608968706, 2, '3720293547321459968', 'o9XkH43HJU24k6H8pXCmHr0ds0bg', 1717403817, 1717403835, 'o9a2452jTwJBAkNKnboqaruhHZoM', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316365815689937b1ad5e7848bac20000\",\"prepay_time\":1717403818,\"pay_time\":1717403824,\"transaction_id\":\"4341602275202406038662383894\"}', 1000, 1000, 0, NULL, '王**', '300300', '天津市', '天津市', '东丽区', '****', '189****1121', '', '', 'null', 0, '4fd0fd42dee36ac0da4c6b0e4a1e42dd', '[]', 0, 'ofaYK1cOaMGBx4sqNV4wAYR7oS8Z3Y_4YBGvGucoIKcnI78B6cKrtfy66OOEMtgC87-MTtrh86-g', '{\"predict_commission_fee\":30}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1797557233342971905, 2, '3720293483479699456', 'o9XkH49SgJrM-wVjWaAHU_xbMCrA', 1717403573, 1717403596, 'o9a2451tdKxcsm-RDC6ps9jRlO28', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx03163255074413488964d49f18e3710001\",\"prepay_time\":1717403575,\"pay_time\":1717403584,\"transaction_id\":\"4328102289202406030968217281\"}', 100, 100, 0, NULL, '张*', '271000', '山东省', '泰安市', '岱岳区', '****', '133****6752', '', '', 'null', 0, 'c5a8cf197b858169a187c52d557bcc0f', '[]', 0, 'ofiMjHhH0LlKLmTcuQvnTAl2OKQYObqd6mi7J3AMWwxXWIf4gQ7JWi-dY0k0GKyJQ8tFu7GzKb1A', '{\"predict_commission_fee\":2}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1797557233938563073, 2, '3720293415509954816', 'o9XkH4zuadxRCuw_GArPyzrNeE8k', 1717403314, 1717403332, 'o9a2451WSrYjcvuOY7L1-eZoLiYA', 20, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0316283529560425a5ef89cc0802d90001\",\"prepay_time\":1717403315,\"pay_time\":1717403322,\"transaction_id\":\"4322202271202406031768098083\"}', 100, 100, 0, NULL, '宣**', '200135', '上海市', '上海市', '浦东新区', '****', '137****3840', '', '', 'null', 0, '213ee87f2f991566a3961d6cf70195b7', '[]', 0, 'ofJszy4c69wfdWayBcaWutYd1Av_iTf8mEDf_PDSQl2NkruOmd40eeliAF5vvLCxkzZjsjIzslyg', '{\"predict_commission_fee\":3}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1797557234437685250, 2, '3720293313330939136', 'o9XkH4wvo4witHYz40GKXuX4SBGA', 1717402924, 1717403824, 'o9a2452HfxRPPJsK_0kukxICkpg8', 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx03162205728625595e7204442a2fbf0000\",\"prepay_time\":1717402925}', 1000, 1000, 0, NULL, '欧**', '510030', '广东省', '广州市', '越秀区', '****', '188****4438', '', '', 'null', 0, 'd4d45041d91bcc833dfa92ee04b35a39', '[]', 0, 'of7Gdkvf2kRj444XFf1R-s91R1py32uorOxoseqv-bSH8_pYTMAQzWm4V205amzyTZ_ezSw76pzQ', '{\"predict_commission_fee\":0}', NULL, NULL);

-- ----------------------------
-- Table structure for oms_wei_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order_item`;
CREATE TABLE `oms_wei_order_item`  (
  `id` bigint(0) NOT NULL,
  `shop_id` bigint(0) NOT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单id（平台订单id）',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品skuid\r\n',
  `thumb_img` varchar(550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku小图',
  `sku_cnt` int(0) DEFAULT NULL COMMENT 'sku数量',
  `sale_price` int(0) DEFAULT NULL COMMENT '售卖单价（单位：分）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品标题',
  `on_aftersale_sku_cnt` int(0) DEFAULT NULL COMMENT '正在售后/退款流程中的 sku 数量',
  `finish_aftersale_sku_cnt` int(0) DEFAULT NULL COMMENT '完成售后/退款的 sku 数量',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品编码',
  `market_price` int(0) DEFAULT NULL COMMENT '市场单价（单位：分）',
  `sku_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'sku属性JSON',
  `real_price` int(0) DEFAULT NULL COMMENT 'sku实付总价，取estimate_price和change_price中较小值',
  `out_product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品外部spuid',
  `out_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品外部skuid',
  `is_discounted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否有优惠金额，非必填，默认为false',
  `estimate_price` int(0) DEFAULT NULL COMMENT '优惠后sku总价，非必填，is_discounted为true时有值',
  `is_change_price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否修改过价格，非必填，默认为false',
  `change_price` int(0) DEFAULT NULL COMMENT '改价后sku总价，非必填，is_change_price为true时有值',
  `out_warehouse_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区域库存id',
  `sku_deliver_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品发货信息JSON',
  `extra_service` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品额外服务信息JSON',
  `use_deduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否使用了会员积分抵扣\r\n',
  `deduction_price` int(0) DEFAULT NULL COMMENT '会员积分抵扣金额，单位为分',
  `order_product_coupon_info_list` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品优惠券信息，逐步替换 order.order_detail.coupon_info',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_wei_order_item
-- ----------------------------
INSERT INTO `oms_wei_order_item` VALUES (1787451057062252545, 2, '3719632105698365440', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057141944322, 2, '3719632099578611200', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057196470274, 2, '3719632099131658496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057259384833, 2, '3719631864896819456', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057326493697, 2, '3719631857821552640', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057473294337, 2, '3719630802894587136', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057552986113, 2, '3719630104256712960', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057674620929, 2, '3719609573252662528', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057741729794, 2, '3719609207888941056', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057813032961, 2, '3719608045550570496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057867558913, 2, '3719607305622392832', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057943056386, 2, '3719541152804638976', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057997582337, 2, '3719539678347396352', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058064691201, 2, '3719539645519627776', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058144382978, 2, '3719539305125645313', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058194714626, 2, '3719539303409911296', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058245046274, 2, '3719520228905715200', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058299572225, 2, '3719520157597830144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058345709570, 2, '3719519937814465536', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058387652610, 2, '3719519606137030144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058437984258, 2, '3719519603625955328', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058509287426, 2, '3719519600843559168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058551230466, 2, '3719519482018137600', '10000111746307', '2198803586', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/65ec1433000821ae1f038c66db60b01e000000a000004f50', 1, 3990, '泷御堂冲饮谷物 赤小豆薏米芡实330g*罐', 0, 0, '', 3990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"1罐体验装【贵在运费】(5%人选择)\"}]', 890, NULL, NULL, 'true', 890, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":0,\"freight_insurance\":1}', 'null', NULL, '[{\"user_coupon_id\":\"5215692320178179\"}]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058597367810, 2, '3719518635971448832', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058643505153, 2, '3719518158959545344', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058693836801, 2, '3719517933804327168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058773528578, 2, '3719517651511152896', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557230960607234, 2, '3720294016289213440', '10000128752685', '2304653289', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f02d3000577bc183b254de97c0d15000000a000004f50', 5, 100, '乾佑 雪梨片', 0, 0, '', 100, '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', 500, NULL, NULL, 'false', 500, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557231921102850, 2, '3720293614579748864', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 5, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 500, NULL, NULL, 'false', 500, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557232864821250, 2, '3720293547321459968', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 10, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 1000, NULL, NULL, 'false', 1000, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557233531715585, 2, '3720293483479699456', '10000128752685', '2304653289', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f02d3000577bc183b254de97c0d15000000a000004f50', 1, 100, '乾佑 雪梨片', 0, 0, '', 100, '[{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"},{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"}]', 100, NULL, NULL, 'false', 100, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557234165055489, 2, '3720293415509954816', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 1, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 100, NULL, NULL, 'false', 100, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1797557234727092226, 2, '3720293313330939136', '10000128693777', '2304555042', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/664f051f000ac91c17542e128e89bc1e000000a000004f50', 10, 100, '无沙 桑葚  50克/袋', 0, 0, '', 100, '[{\"attr_key\":\"净含量\",\"attr_value\":\"50克一袋\"},{\"attr_key\":\"规格/净含量\",\"attr_value\":\"热销十万件好评\"}]', 1000, NULL, NULL, 'false', 1000, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');

-- ----------------------------
-- Table structure for oms_wei_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_refund`;
CREATE TABLE `oms_wei_refund`  (
  `id` bigint(0) NOT NULL,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后单号',
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后单当前状态，参考：\r\nUSER_CANCELD	用户取消申请\r\nMERCHANT_PROCESSING	商家受理中\r\nMERCHANT_REJECT_REFUND	商家拒绝退款\r\nMERCHANT_REJECT_RETURN	商家拒绝退货退款\r\nUSER_WAIT_RETURN	待买家退货\r\nRETURN_CLOSED	退货退款关闭\r\nMERCHANT_WAIT_RECEIPT	待商家收货\r\nMERCHANT_OVERDUE_REFUND	商家逾期未退款\r\nMERCHANT_REFUND_SUCCESS	退款完成\r\nMERCHANT_RETURN_SUCCESS	退货退款完成\r\nPLATFORM_REFUNDING	平台退款中\r\nPLATFORM_REFUND_FAIL	平台退款失败\r\nUSER_WAIT_CONFIRM	待用户确认\r\nMERCHANT_REFUND_RETRY_FAIL	商家打款失败，客服关闭售后\r\nMERCHANT_FAIL	售后关闭\r\nUSER_WAIT_CONFIRM_UPDATE	待用户处理商家协商\r\nUSER_WAIT_HANDLE_MERCHANT_AFTER_SALE	待用户处理商家代发起的售后申请',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家身份标识',
  `unionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '买家在开放平台的唯一标识符，若当前视频号小店已绑定到微信开放平台账号下会返回',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '商品skuid',
  `count` int(0) DEFAULT NULL COMMENT '售后数量',
  `fast_refund` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否极速退款RefundInfo',
  `refund_reason` int(0) DEFAULT NULL COMMENT '标明售后单退款直接原因, 枚举值参考 RefundReason',
  `refund_amount` int(0) DEFAULT NULL COMMENT '退款金额（分）',
  `return_waybill_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '快递单号',
  `return_delivery_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司id',
  `return_delivery_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司名称',
  `merchant_upload_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '售后相关商品信息JSON',
  `create_time` int(0) DEFAULT NULL COMMENT '售后单创建时间戳',
  `update_time` int(0) DEFAULT NULL COMMENT '售后单更新时间戳',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款原因',
  `reason_text` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '退款原因解释',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '售后类型。REFUND:退款；RETURN:退货退款。',
  `order_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单号，该字段可用于获取订单',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'detail json',
  `complaint_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '纠纷id，该字段可用于获取纠纷信息',
  `refund_resp` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '微信支付退款的响应',
  `pull_status` int(0) DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频号小店退款' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oms_wei_refund
-- ----------------------------
INSERT INTO `oms_wei_refund` VALUES (1787746259370975234, 2, '2000000461361268', 'MERCHANT_REFUND_SUCCESS', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881502, 1714881513, '10000000', '不想要了', 'REFUND', '3719631864896819456', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"15337124753\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1787746259496804354, 2, '2000000461410155', 'MERCHANT_REFUND_SUCCESS', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881120, 1714881142, '10000059', '拍错/少用优惠', 'REFUND', '3719632099131658496', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"19951926061\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1788119147705950209, 2, '2000000476685963', 'MERCHANT_PROCESSING', 'oTci56-icFjAKlQ-2KXeCxM38M7M', NULL, '10000113792713', '2231619925', 1, 'false', NULL, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1715080222, 1715080222, '10000021', '质量问题', 'RETURN', '3719496358260248576', '{\"desc\":\"收到了冲一遍就没有味儿了\",\"receive_product\":true,\"prove_imgs\":[],\"tel_number\":\"18341693403\",\"media_id_list\":[\"LGa74OroReJJ8cb6ouPvbv1da72vrvKNQMK48Ei7WXgaUMc2Y_qkjcavzCmZMD1lvSOM2oFk5uO6Xzw0-nswBw\"]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', 1, '2024-05-08 16:10:01');

-- ----------------------------
-- Table structure for s_kwai_order
-- ----------------------------
DROP TABLE IF EXISTS `s_kwai_order`;
CREATE TABLE `s_kwai_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'dc订单id',
  `oid` bigint(0) NOT NULL COMMENT '快手订单id',
  `createTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `discountFee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣价格',
  `expressFee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `num` int(0) NOT NULL COMMENT 'sku数量',
  `consignee` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `payTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `buyerRemark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '买家备注',
  `sellerRemark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '卖家备注',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `refund` int(0) NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1该订单申请过退款',
  `totalFee` decimal(10, 2) NOT NULL COMMENT '子订单商品总价',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '区',
  `address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '详细地址',
  `logisticsCompany` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递公司',
  `logisticsCompanyCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递公司编码',
  `logisticsCode` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递单号',
  `auditStatus` int(0) NOT NULL DEFAULT 0 COMMENT '订单审核状态（0待审核1已审核）',
  `createOn` bigint(0) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `sendStatus` int(0) DEFAULT 0 COMMENT '发货状态（0待出库1拣货中2已拣货3已出库4已发货）',
  `sendTime` bigint(0) DEFAULT NULL COMMENT '发货时间（仓库真实发货时间）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '快手订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_kwai_orders_item
-- ----------------------------
DROP TABLE IF EXISTS `s_kwai_orders_item`;
CREATE TABLE `s_kwai_orders_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `itemId` bigint(0) NOT NULL COMMENT '快手子订单id',
  `orderId` bigint(0) NOT NULL COMMENT '订单ID',
  `erpGoodsId` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erpGoodsSpecId` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `itemTitle` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品名称',
  `itemPicUrl` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品图片',
  `goodsNum` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品编码',
  `goodsSpec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品规格',
  `skuNick` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品规格编码',
  `price` double NOT NULL COMMENT '商品单价',
  `num` int(0) NOT NULL COMMENT '商品数量',
  `refundId` bigint(0) NOT NULL COMMENT '退货Id',
  `refundStatus` int(0) NOT NULL COMMENT '退货状态',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isGift` int(0) NOT NULL DEFAULT 0 COMMENT '是否赠品0:否1:是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_shop
-- ----------------------------
DROP TABLE IF EXISTS `s_shop`;
CREATE TABLE `s_shop`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `nick_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '店铺别名',
  `ename` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '标识',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '店铺主题',
  `platform` int(0) NOT NULL COMMENT '对应第三方平台Id',
  `shop_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '店铺url',
  `order_num` int(0) NOT NULL DEFAULT 9 COMMENT '排序',
  `is_delete` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除0否1是',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `seller_shop_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id',
  `app_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Appkey(微信视频号小店专用)',
  `app_sercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Appsercet(微信视频号小店专用)',
  `access_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `access_expires_in` bigint(0) DEFAULT NULL COMMENT 'accessToken到期（秒）',
  `access_token_begin` bigint(0) DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint(0) DEFAULT NULL COMMENT '刷新token过期时间',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电商平台店铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_shop
-- ----------------------------
INSERT INTO `s_shop` VALUES (1, '其他渠道', NULL, NULL, NULL, 99, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, 0, 0, NULL, 0, '2024-06-04 11:19:49', NULL);
INSERT INTO `s_shop` VALUES (2, '视频号店铺-测试', '视频号-梦小妮', 'wei', '煜梦服饰', 2, NULL, 0, 0, '', 100061591, '', '', '--', 0, 0, NULL, 0, '2024-06-04 11:19:54', '2024-06-04 12:33:00');
INSERT INTO `s_shop` VALUES (3, '测试京东POP', '拼多多-梦小妮', 'jd', '煜梦服饰', 3, NULL, 0, 0, '', 100061591, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:19:58', NULL);
INSERT INTO `s_shop` VALUES (4, '梦小妮牛仔裤-淘宝', '淘宝-梦小妮', 'taobao', '煜梦服饰', 4, NULL, 0, 0, '', 2200787809358, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:01', NULL);
INSERT INTO `s_shop` VALUES (5, '梦小妮-拼多多', '拼多多-梦小妮', 'pdd', '煜梦服饰', 5, NULL, 0, 0, '', 100061591, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:04', NULL);
INSERT INTO `s_shop` VALUES (6, '梦小妮牛仔裤', '抖音-梦小妮', 'douyin', '华衣云商', 6, NULL, 0, 0, NULL, 90158786, NULL, NULL, '', 0, 0, NULL, 0, '2024-06-04 11:20:07', NULL);
INSERT INTO `s_shop` VALUES (7, '珍姐姐de衣柜的店-小红书', '启航家常菜的店-小红书', 'xhs', '启航', 7, NULL, 0, 0, NULL, 21, NULL, NULL, '--', 0, 0, NULL, 0, '2024-06-04 11:20:10', NULL);
INSERT INTO `s_shop` VALUES (8, '梦小妮牛仔裤-快手', '快手小店', 'kuaishou', '华衣云商', 8, NULL, 0, 0, '1', 12, NULL, NULL, NULL, 0, 0, NULL, 0, '2024-06-04 11:20:13', '2024-06-04 12:07:55');

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
INSERT INTO `s_shop_platform` VALUES (1, '1688', '9380846', 'MJC3doohMxCG', '1688开放平台', '', '', NULL, '2024-06-04 11:10:58');
INSERT INTO `s_shop_platform` VALUES (2, '视频号', ' ', ' ', NULL, 'https://api.weixin.qq.com/', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (3, '京东POP', '', '', NULL, NULL, 'http://qihangerp.cn', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (4, '淘宝天猫', '', '', '淘宝开放平台', 'http://gw.api.taobao.com/router/rest', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (5, '拼多多', '', '', '拼多多开放平台', 'https://gw-api.pinduoduo.com/api/router', 'http://qihangerp.cn', NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (6, '抖音', '', '', NULL, 'https://openapi-fxg.jinritemai.com', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (7, '小红书', '', '', NULL, 'https://ark.xiaohongshu.com/ark/open_api/v3/common_controller', NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (8, '快手', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `s_shop_platform` VALUES (99, 'ERP系统', '', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for s_shop_pull_lasttime
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_pull_lasttime`;
CREATE TABLE `s_shop_pull_lasttime`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `pull_type` enum('ORDER','REFUND') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型（ORDER:订单，REFUND:退款）',
  `lasttime` datetime(0) DEFAULT NULL COMMENT '最后更新时间',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺更新最后时间记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_shop_pull_lasttime
-- ----------------------------
INSERT INTO `s_shop_pull_lasttime` VALUES (-1130930175, 6, 'ORDER', '2024-05-10 10:27:38', '2024-05-10 10:23:23', '2024-05-10 10:27:38');
INSERT INTO `s_shop_pull_lasttime` VALUES (1, 1, 'ORDER', '2024-04-09 16:23:00', '2024-03-23 15:56:13', '2024-04-09 16:23:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (2, 1, 'REFUND', '2024-04-09 17:43:00', '2024-03-24 13:03:54', '2024-04-09 17:43:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (3, 2, 'ORDER', '2024-04-09 19:44:00', '2024-03-10 13:00:07', '2024-04-09 19:44:00');
INSERT INTO `s_shop_pull_lasttime` VALUES (4, 2, 'REFUND', '2024-04-10 23:35:56', '2024-03-24 13:50:24', '2024-04-11 11:35:58');

-- ----------------------------
-- Table structure for s_shop_pull_logs
-- ----------------------------
DROP TABLE IF EXISTS `s_shop_pull_logs`;
CREATE TABLE `s_shop_pull_logs`  (
  `id` bigint(0) NOT NULL COMMENT '主键Id',
  `shop_id` int(0) DEFAULT NULL COMMENT '店铺id',
  `shop_type` int(0) NOT NULL COMMENT '平台id',
  `pull_type` enum('ORDER','REFUND','GOODS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型（ORDER订单，GOODS商品，REFUND退款）',
  `pull_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拉取方式（主动拉取、定时任务）',
  `pull_params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '拉取参数',
  `pull_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '拉取结果',
  `pull_time` datetime(0) DEFAULT NULL COMMENT '拉取时间',
  `duration` bigint(0) DEFAULT NULL COMMENT '耗时（毫秒）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '店铺更新日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for s_xhs_order
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order`;
CREATE TABLE `s_xhs_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键id（自增长）',
  `orderId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '订单号（第三方平台orderId）',
  `shopType` int(0) NOT NULL DEFAULT 0 COMMENT '订单来源（dc_sys_third_setting表id）',
  `shopId` int(0) NOT NULL DEFAULT 0 COMMENT '店铺ID（dc_shop表id）',
  `orderType` int(0) NOT NULL DEFAULT 0 COMMENT '订单类型：（小红书：订单类型，1普通 2定金预售 3全款预售 4延迟发货 5换货补发）',
  `orderStatus` int(0) NOT NULL DEFAULT 0 COMMENT '小红书订单状态，1已下单待付款 2已支付处理中 3清关中 4待发货 5部分发货 6待收货 7已完成 8已关闭 9已取消 10换货申请中',
  `afterSalesStatus` int(0) NOT NULL DEFAULT 0 COMMENT '小红书售后状态，1无售后 2售后处理中 3售后完成(含取消)',
  `cancelStatus` int(0) NOT NULL DEFAULT 0 COMMENT '申请取消状态，0未申请取消 1取消处理中',
  `orderCreatedTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单创建时间 单位ms',
  `orderPaidTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单支付时间 单位ms',
  `orderUpdateTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单更新时间 单位ms',
  `orderDeliveryTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单发货时间 单位ms',
  `orderCancelTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单取消时间 单位ms',
  `orderFinishTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '订单完成时间 单位ms',
  `promiseLastDeliveryTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '承诺最晚发货时间 单位ms',
  `customerRemark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '用户备注',
  `sellerRemark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '商家标记备注',
  `sellerRemarkFlag` int(0) NOT NULL DEFAULT 0 COMMENT '商家标记优先级，ark订单列表展示旗子颜色 1灰旗 2红旗 3黄旗 4绿旗 5蓝旗 6紫旗',
  `presaleDeliveryStartTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '预售最早发货时间 单位ms',
  `presaleDeliveryEndTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '预售最晚发货时间 单位ms',
  `originalPackageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '原始关联订单号(退换订单的原订单)',
  `totalPayAmount` int(0) NOT NULL DEFAULT 0 COMMENT '订单实付金额(包含运费) 单位分',
  `totalShippingFree` int(0) NOT NULL DEFAULT 0 COMMENT '订单运费 单位分',
  `expressTrackingNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '快递单号',
  `expressCompanyCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '快递公司编码',
  `openAddressId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '收件人姓名+手机+地址等计算得出，用来查询收件人详情',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `auditStatus` int(0) DEFAULT 0 COMMENT '订单审核状态（0待审核1已审核）',
  `auditTime` datetime(0) DEFAULT NULL COMMENT '订单审核时间',
  `settleStatus` smallint(0) NOT NULL DEFAULT 0 COMMENT '结算状态0未结算1已结算',
  `settleAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '结算金额',
  `sendStatus` int(0) NOT NULL DEFAULT 0 COMMENT 'ERP发货状态0待处理1出库中2已出库3已发货',
  `sendTime` datetime(0) DEFAULT NULL COMMENT '发货时间',
  `createTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间（系统）',
  `createBy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间（系统）',
  `updateBy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_xhs_order
-- ----------------------------
INSERT INTO `s_xhs_order` VALUES (1, 'P650205653267210151', 7, 21, 1, 7, 1, 0, 1650205653326, 1650205660000, 1650962588360, 1650769924771, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405490267', 'jtexpress', 'f8dcd97a570a0af01c335012be0b27e2', '浙江省', '杭州市', '富阳区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:57', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (2, 'P650204635265986711', 7, 21, 1, 7, 1, 0, 1650204635321, 1650204643000, 1651059206898, 1650769617344, 0, 1651059206862, 1651414567000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405963516', 'jtexpress', '08b7b137457406e72a09ea87c0f08ca8', '广东省', '广州市', '天河区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (3, 'P650204286108172701', 7, 21, 1, 7, 1, 0, 1650204286185, 1650204300000, 1651059912532, 1650769486417, 0, 0, 1651414250000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405628710', 'jtexpress', '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (4, 'P650201514407536671', 7, 21, 1, 7, 1, 0, 1650201514465, 1650201522000, 1650799261498, 1650769397865, 0, 0, 1651411441000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405675548', 'jtexpress', '34154c88caf6375904d658b7d3b85ee7', '湖南省', '衡阳市', '耒阳市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-22 19:21:01', NULL);
INSERT INTO `s_xhs_order` VALUES (5, 'P650198151453596501', 7, 21, 1, 7, 1, 0, 1650198151510, 1650198164000, 1651302485258, 1650690024313, 0, 0, 1651408081000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376195118', 'jtexpress', 'c6a961afcad1f245ad9f297c0af89a23', '山东省', '青岛市', '城阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (6, 'P650192591567693891', 7, 21, 1, 7, 1, 0, 1650192591625, 1650192601000, 1651213744870, 1650689917427, 0, 0, 1651402529000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195107', 'jtexpress', 'e79be334795c55cfd0eac0b6289c91c0', '安徽省', '合肥市', '庐阳区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (7, 'P650179651361905981', 7, 21, 1, 7, 1, 0, 1650179651420, 1650179659000, 1651325341123, 1650689875253, 0, 0, 1651389574000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195096', 'jtexpress', 'ecd089ef2236bdfae6883b46ecd0876e', '福建省', '厦门市', '思明区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (8, 'P650179468150156771', 7, 21, 1, 7, 1, 0, 1650179468203, 1650179475000, 1650712443521, 1650689720446, 0, 0, 1651389418000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001376195085', 'jtexpress', '8ce9d59be75139c80531e6d9c5cc4919', '广西壮族自治区', '贵港市', '港北区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (9, 'P650171958868691791', 7, 21, 1, 7, 1, 0, 1650171958927, 1650171968000, 1650790982529, 1650596513803, 0, 0, 1651381868000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515769736345', 'yunda', '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (10, 'P650171894797139901', 7, 21, 1, 9, 1, 0, 1650171894855, 0, 1650173700260, 0, 1650173700260, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, '5423ae97f11f817670be3803ebd06c1c', '湖北省', '十堰市', '茅箭区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-17 22:28:58', NULL, '2022-04-17 22:28:58', NULL);
INSERT INTO `s_xhs_order` VALUES (11, 'P650171459360675721', 7, 21, 1, 7, 1, 0, 1650171459417, 1650171467000, 1650886144398, 1650596329580, 0, 0, 1651381382000, NULL, NULL, 0, 0, 0, NULL, 1980, 0, '432515761274733', 'yunda', '56467f29809a9519b0f595adb156ba51', '福建省', '龙岩市', '新罗区', 0, NULL, 1, 18.67, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (12, 'P650171091036317141', 7, 21, 1, 9, 1, 0, 1650171091104, 0, 1650172900174, 0, 1650172900174, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, 'ae723519496681c63bd4ca05c5df7f81', '陕西省', '渭南市', '华阴市', 0, NULL, 0, 0.00, 0, NULL, '2022-04-17 22:28:59', NULL, '2022-04-17 22:28:59', NULL);
INSERT INTO `s_xhs_order` VALUES (13, 'P650167408349459561', 7, 21, 1, 7, 1, 0, 1650167408412, 1650167419000, 1650596170413, 1650596170395, 0, 0, 1651377377000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '43251575676208', 'yunda', '3570b8c9e35ad02d401575fcd51bde87', '广东省', '揭阳市', '揭西县', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (14, 'P650160674547164571', 7, 21, 1, 7, 1, 0, 1650160674605, 1650160683000, 1650765061345, 1650596107605, 0, 0, 1651370592000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515765103498', 'yunda', '63ab28bbabfbad5cc43d41631badd65a', '湖南省', '长沙市', '望城区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (15, 'P650158023327622691', 7, 21, 1, 7, 1, 0, 1650158023382, 1650158032000, 1650788642724, 1650595913822, 0, 0, 1651367966000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432515769726250', 'yunda', '0c42cff3e1792d0f9ea9ee8b2db54b57', '四川省', '广元市', '利州区', 0, NULL, 1, 9.33, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (16, 'P650152018833195301', 7, 21, 1, 7, 1, 0, 1650152018893, 1650152027000, 1650691622675, 1650373546172, 0, 0, 1651361939000, NULL, NULL, 0, 0, 0, NULL, 1980, 0, '432512177214777', 'yunda', '1b404ce4114b05aed7290439fe35b987', '广东省', '惠州市', '博罗县', 0, NULL, 1, 18.67, 1, NULL, '2022-04-17 22:28:59', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (17, 'P650239311288237481', 7, 21, 1, 7, 1, 0, 1650239311346, 1650239327000, 1650977821437, 1650770005891, 0, 0, 1651449279000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405915638', 'jtexpress', '1e8faca03c6abec3ecb161ed8f82dac5', '湖北省', '十堰市', '张湾区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 08:29:36', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (18, 'P650251473635210141', 7, 21, 1, 7, 1, 0, 1650251473689, 1650251481000, 1650890580933, 1650770239932, 0, 0, 1651461411000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405675704', 'jtexpress', '1f9697fd5dada759959714c6e5e913d8', '广东省', '广州市', '越秀区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (19, 'P650251254103670461', 7, 21, 1, 7, 1, 0, 1650251254164, 1650251262000, 1650798421958, 1650770165888, 0, 0, 1651461177000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719269', 'jtexpress', 'a8131e0d25bc781091886834f2babc9b', '浙江省', '台州市', '临海市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (20, 'P650250238123400311', 7, 21, 1, 7, 1, 0, 1650250238181, 1650250246000, 1650880624181, 1650770100194, 0, 0, 1651460153000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405398144', 'jtexpress', '95bc2242d0ccdec4a45c8579d1b0c088', '广东省', '广州市', '从化区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 11:36:46', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (21, 'P650247353773712021', 7, 21, 1, 9, 1, 0, 1650247353832, 0, 1650249160358, 0, 1650249160358, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'b2b1f9597c661266a05d4769045acb66', '湖北省', '武汉市', '东西湖区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-18 11:36:46', NULL, '2022-04-18 11:36:46', NULL);
INSERT INTO `s_xhs_order` VALUES (22, 'P650254826789409301', 7, 21, 1, 9, 3, 1, 1650254826848, 1650254835000, 1650449219155, 0, 1650449219155, 0, 1651464745000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '9a5446aa7683120cc170957153fe77e1', '福建省', '莆田市', '仙游县', 0, NULL, 0, 0.00, 0, NULL, '2022-04-18 12:51:09', NULL, '2022-05-01 20:02:19', NULL);
INSERT INTO `s_xhs_order` VALUES (23, 'P650254633938588711', 7, 21, 1, 7, 1, 0, 1650254633995, 1650254642000, 1650890580895, 1650770380145, 0, 0, 1651464550000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406012626', 'jtexpress', 'c6d94c2203ef560685a6f09b428438d2', '广东省', '阳江市', '江城区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 12:51:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (24, 'P650253875620338531', 7, 21, 1, 7, 1, 0, 1650253875672, 1650253886000, 1650964925452, 1650770314869, 0, 0, 1651463799000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405443251', 'jtexpress', '714b8caf66c560fb94bf2d7dba72052a', '浙江省', '宁波市', '宁海县', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 12:51:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (25, 'P650258991490298871', 7, 21, 1, 7, 1, 0, 1650258991545, 1650259003000, 1650881280901, 1650771016966, 0, 0, 1651468936000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719369', 'jtexpress', 'e8f2f2ec3a00118044947e0627ecc597', '广东省', '广州市', '天河区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 13:23:57', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (26, 'P650266326386558551', 7, 21, 1, 7, 1, 0, 1650266326460, 1650266333000, 1651050908798, 1650771932610, 0, 0, 1651476257000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405629160', 'jtexpress', 'ffc365e415365c5c43c7ffa5e3d3aa06', '福建省', '福州市', '晋安区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (27, 'P650263987743987401', 7, 21, 1, 7, 1, 0, 1650263987812, 1650263998000, 1650857340455, 1650771884748, 0, 0, 1651473955000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405398477', 'jtexpress', 'd7cc1df64995afa8fa54eae94611f7b0', '广东省', '清远市', '清城区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (28, 'P650262840072315461', 7, 21, 1, 9, 3, 1, 1650262840128, 1650262846000, 1650771623812, 0, 1650771623812, 0, 1651472760000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '49207720571e8bf08711d96bb21f4fc6', '湖北省', '十堰市', '竹山县', 0, NULL, 0, 0.00, 2, NULL, '2022-04-18 15:32:05', NULL, '2022-05-01 20:02:19', NULL);
INSERT INTO `s_xhs_order` VALUES (29, 'P650267146717991681', 7, 21, 1, 7, 1, 0, 1650267146777, 1650267160000, 1650771780643, 1650690152640, 0, 0, 1651477081000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376905229', 'jtexpress', 'a07a4e4403c6b3678a992e45beeea25a', '广东省', '东莞市', '', 0, NULL, 1, 24.33, 2, NULL, '2022-04-18 17:02:58', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (30, 'P650273202701600891', 7, 21, 1, 7, 1, 0, 1650273202761, 1650273212155, 1651048996842, 1650771965189, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405443439', 'jtexpress', 'd5fd9fc1e9f97a8ebeb6eeac78401011', '广西壮族自治区', '梧州市', '岑溪市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 17:59:27', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (31, 'P650278762052431911', 7, 21, 1, 7, 1, 0, 1650278762112, 1650278770000, 1650963427579, 1650771984307, 0, 0, 1651488703000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405865960', 'jtexpress', '99595319f4dd4220d1c99bfdf2efe2fe', '福建省', '泉州市', '晋江市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 19:26:00', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (32, 'P650293854639134681', 7, 21, 1, 7, 1, 0, 1650293854698, 1650293864000, 1650889740627, 1650772022486, 0, 0, 1651503821000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406156692', 'jtexpress', 'b1d9350b96044ecd458c8a57ef9003ca', '广东省', '肇庆市', '四会市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-18 23:24:09', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (33, 'P650335287016742621', 7, 21, 1, 7, 1, 0, 1650335287105, 1650335295000, 1651071000764, 1650772045423, 0, 0, 1651545207000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001405719903', 'jtexpress', '50056270c64b55f848a98091a9241dce', '辽宁省', '营口市', '站前区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-19 11:19:47', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (34, 'P650317045870614531', 7, 21, 1, 9, 1, 0, 1650317045929, 0, 1650318860147, 0, 1650318860147, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, '6fdf9a7815b5926d04dd7597fefe7187', '广东省', '惠州市', '惠东县', 0, NULL, 0, 0.00, 0, NULL, '2022-04-19 11:19:48', NULL, '2022-04-19 11:19:48', NULL);
INSERT INTO `s_xhs_order` VALUES (35, 'P650340391360421501', 7, 21, 1, 7, 1, 0, 1650340391420, 1650340401000, 1650974642017, 1650772073820, 0, 0, 1651550316000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406058624', 'jtexpress', '9b9a768e982a457c0e338d93f0a8ee61', '福建省', '厦门市', '集美区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-19 12:49:12', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (36, 'P650383653706249041', 7, 21, 1, 7, 1, 0, 1650383653765, 1650383659000, 1651041785584, 1650855849023, 0, 0, 1651593604000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001461317429', 'jtexpress', '8ccfad0a875bf2e3a7f92805e0ddbe7f', '浙江省', '杭州市', '西湖区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (37, 'P650383282927259341', 7, 21, 1, 7, 1, 0, 1650383282987, 1650383293000, 1650969786428, 1650772100973, 0, 0, 1651593250000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001406013332', 'jtexpress', 'c91b26e77df55bfcb41f64faf46dbe73', '广西壮族自治区', '玉林市', '玉州区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-22 19:21:00', NULL);
INSERT INTO `s_xhs_order` VALUES (38, 'P650354860921382131', 7, 21, 1, 7, 1, 0, 1650354860982, 1650354871000, 1650690314615, 1650690314593, 0, 0, 1651564822000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT300137690524', 'jtexpress', '604f453ef493e8454ab834f983854395', '湖北省', '武汉市', '洪山区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-21 21:18:21', NULL);
INSERT INTO `s_xhs_order` VALUES (39, 'P650350589611937961', 7, 21, 1, 7, 1, 0, 1650350589671, 1650350597000, 1650779400430, 1650690239718, 0, 0, 1651560548000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001376905230', 'jtexpress', '608401a29ab4b22b700f3816f751959d', '广东省', '佛山市', '南海区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-20 11:21:16', NULL, '2022-05-21 21:18:24', NULL);
INSERT INTO `s_xhs_order` VALUES (40, 'P650539319449109001', 7, 21, 1, 7, 1, 0, 1650539319507, 1650539330000, 1650539674273, 1650855735706, 0, 0, 0, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461172457', 'jtexpress', '9a7eb85923b015eee6dbe9dd7fb641e3', '湖南省', '长沙市', '浏阳市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-21 19:09:36', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (41, 'P650524724621383351', 7, 21, 1, 7, 1, 0, 1650524724680, 1650524736000, 1650525048985, 1650855786731, 0, 0, 1651734648000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461036836', 'jtexpress', 'b1980eccfcc56e6ab5956c766b2d7b7b', '重庆', '重庆市', '江津区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-21 19:09:36', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (42, 'P650607608703188391', 7, 21, 1, 7, 1, 0, 1650607608766, 1650607617000, 1650607932885, 1650855355436, 0, 0, 1651817532000, NULL, '淘宝已下单', 0, 0, 0, NULL, 2580, 0, 'JT3001461172402', 'jtexpress', '4c7ea18e13518249c8be6990c58c9d6e', '广东省', '惠州市', '惠阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-22 15:45:20', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (43, 'P650639118014134591', 7, 21, 1, 7, 1, 0, 1650639118078, 1650639132000, 1650639474606, 1650855681882, 0, 0, 1651849074000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001460796543', 'jtexpress', 'b6927ef7086dbdac8f6ad7d72cca8c36', '广东省', '茂名市', '茂南区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-23 11:10:46', NULL, '2022-05-16 18:24:33', NULL);
INSERT INTO `s_xhs_order` VALUES (44, 'P650689352935451771', 7, 21, 1, 7, 1, 0, 1650689352998, 1650689359000, 1650689671979, 1650855445026, 0, 0, 1651899271000, NULL, '淘宝已下单', 0, 0, 0, NULL, 2580, 0, 'JT3001461080981', 'jtexpress', '2140205662905463f8711bb07f73c8a4', '广东省', '深圳市', '南山区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-23 12:56:21', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (45, 'P650722151211113551', 7, 21, 1, 7, 1, 0, 1650722151275, 1650722169000, 1650722470160, 1650855546917, 0, 0, 1651932070000, NULL, '淘宝已下单', 0, 0, 0, NULL, 6450, 0, 'JT3001460843527', 'jtexpress', '8ee13a2449a0e2dcd9e4400e082ca072', '辽宁省', '鞍山市', '立山区', 0, NULL, 1, 60.82, 2, NULL, '2022-04-23 22:55:59', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (46, 'P650730626873861291', 7, 21, 1, 7, 1, 0, 1650730626941, 1650730636000, 1650730982899, 1650855626874, 0, 0, 1651940582000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3001461224014', 'jtexpress', 'dad5d743ccb5d479c85a7e35757505dd', '广东省', '东莞市', '', 0, NULL, 1, 12.16, 2, NULL, '2022-04-24 08:27:39', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (47, 'P650962492423135701', 7, 21, 1, 7, 1, 0, 1650962492492, 1650962518000, 1650962864306, 1651031506516, 0, 0, 1652172464000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, '9887351628811', 'youzhengguonei', '329f63916e6805a66e0690f20d3f8a21', '浙江省', '绍兴市', '诸暨市', 0, NULL, 1, 24.33, 2, NULL, '2022-04-26 20:56:23', NULL, '2022-05-16 18:24:32', NULL);
INSERT INTO `s_xhs_order` VALUES (48, 'P651028113417290361', 7, 21, 1, 7, 1, 0, 1651028113481, 1651028131000, 1651028464301, 1651115982886, 0, 0, 1652238064000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001632496233', 'jtexpress', '3b2a753b158d7785d65333bc79acac3e', '广西壮族自治区', '贵港市', '桂平市', 0, NULL, 1, 12.16, 2, NULL, '2022-04-27 11:49:31', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (49, 'P651060035066681871', 7, 21, 1, 7, 1, 0, 1651060035133, 1651060043000, 1651060400045, 1651115999510, 0, 0, 1652269999000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001632543339', 'jtexpress', 'b30c45b1090ebc0c45bc460402157f56', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-27 21:35:22', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (50, 'P651059947801802851', 7, 21, 1, 9, 1, 0, 1651059947865, 0, 1651061760378, 0, 1651061760378, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'fe552107e23704df601caa653c8a6604', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 0, NULL, '2022-04-27 21:35:22', NULL, '2022-04-27 21:35:22', NULL);
INSERT INTO `s_xhs_order` VALUES (51, 'P651244863186803631', 7, 21, 1, 7, 1, 0, 1651244863248, 1651244871000, 1651245180622, 1651370939239, 0, 0, 1652543999000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001802941464', 'jtexpress', '438de7cdb256bcc016926dda9d122792', '广西壮族自治区', '南宁市', '邕宁区', 0, NULL, 1, 12.16, 2, NULL, '2022-04-30 09:05:47', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (52, 'P651300639424889331', 7, 21, 1, 7, 1, 0, 1651300639513, 1651300649000, 1651370920852, 1651370920831, 0, 0, 1652543999000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001803182995', 'jtexpress', 'f4cb08ce935091e53314e828861922cb', '广东省', '惠州市', '惠阳区', 0, NULL, 1, 24.33, 2, NULL, '2022-04-30 15:15:02', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (53, 'P651365028037549841', 7, 21, 1, 7, 1, 0, 1651365028104, 1651365035000, 1651365375666, 1651459424666, 0, 0, 1652574975000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3001866992683', 'jtexpress', 'e6bb9ab6d82624472a4eedb0b11503e4', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-01 10:09:20', NULL, '2022-05-21 21:18:25', NULL);
INSERT INTO `s_xhs_order` VALUES (54, 'P651443046272776771', 7, 21, 1, 7, 1, 0, 1651443046339, 1651443061000, 1651443391202, 1651543539931, 0, 0, 1652652991000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001912727034', 'jtexpress', '8df1d309c32f5affccdcadf06d115689', '湖南省', '常德市', '武陵区', 0, NULL, 1, 24.33, 2, NULL, '2022-05-02 09:35:24', NULL, '2022-05-22 10:23:53', NULL);
INSERT INTO `s_xhs_order` VALUES (55, 'P651498332963710841', 7, 21, 1, 7, 1, 0, 1651498333022, 1651498342000, 1651498682299, 1651543592182, 0, 0, 1652708282000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3001912880221', 'jtexpress', 'f9b92a34e39bb7ec16a5d358ed780fec', '福建省', '厦门市', '湖里区', 0, NULL, 1, 24.33, 2, NULL, '2022-05-02 21:46:07', NULL, '2022-05-22 10:23:53', NULL);
INSERT INTO `s_xhs_order` VALUES (56, 'P651498307540816011', 7, 21, 1, 1, 1, 0, 1651498307611, 0, 1651498307611, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'f9b92a34e39bb7ec16a5d358ed780fec', '福建省', '厦门市', '湖里区', 0, NULL, 0, 0.00, 0, NULL, '2022-05-02 21:46:07', NULL, '2022-05-02 21:46:07', NULL);
INSERT INTO `s_xhs_order` VALUES (57, 'P651745605368708111', 7, 21, 1, 7, 1, 0, 1651745605436, 1651745613000, 1651745941135, 1651839256269, 0, 0, 1652955541000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002105950361', 'jtexpress', '707dbef63d281fd17c175e87b78b464b', '广东省', '深圳市', '宝安区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-05 19:56:29', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (58, 'P651877675430739391', 7, 21, 1, 7, 1, 0, 1651877675511, 1651877684000, 1651878010966, 1652001797082, 0, 0, 1653087610000, NULL, NULL, 0, 0, 0, NULL, 2691, 0, 'JT3002240056944', 'jtexpress', '27b0b0ae37f7937e2f8a1f1c9af5ba4b', '江苏省', '盐城市', '大丰区', 0, NULL, 1, 28.21, 2, NULL, '2022-05-07 21:04:31', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (59, 'P651941129187172881', 7, 21, 1, 7, 1, 0, 1651941129263, 1651941137000, 1651941480962, 1652075325387, 0, 0, 1653151080000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002296592389', 'jtexpress', 'f579fa4084d6e52b9682a153dc78342b', '广东省', '广州市', '荔湾区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-08 11:13:26', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (60, 'P652006673545485701', 7, 21, 1, 7, 1, 0, 1652006673604, 1652006685000, 1652007026959, 1652075558716, 0, 0, 1653216626000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002296648768', 'jtexpress', '9cafc84c3b2ec21c8de31f0a0bd64720', '江西省', '赣州市', '章贡区', 0, NULL, 1, 12.16, 2, NULL, '2022-05-08 19:00:56', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (61, 'P652108040599855541', 7, 21, 1, 7, 1, 0, 1652108040656, 1652108048000, 1652108390516, 1652238053197, 0, 0, 1653317990000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002437463477', 'jtexpress', '06850661b0fbc2093dc67e784d8e0c73', '浙江省', '金华市', '义乌市', 0, NULL, 1, 12.16, 2, NULL, '2022-05-10 14:12:23', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (62, 'P652107941351324701', 7, 21, 1, 7, 1, 0, 1652107941417, 1652107949000, 1652108281189, 1652238425807, 0, 0, 1653317881000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1990, 0, 'YT6479046468338', 'yuantong', '06850661b0fbc2093dc67e784d8e0c73', '浙江省', '金华市', '义乌市', 0, NULL, 1, 18.76, 2, NULL, '2022-05-10 14:12:24', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (63, 'P652340945430389721', 7, 21, 1, 6, 1, 0, 1652340945490, 1652340955000, 1652341270887, 1652410285883, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002568648261', 'jtexpress', '0a64d472fc8a926142f0b9980cdb6b6a', '广东省', '深圳市', '盐田区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:51:25', NULL);
INSERT INTO `s_xhs_order` VALUES (64, 'P652331849177761981', 7, 21, 1, 7, 1, 0, 1652331849248, 1652331866000, 1652332218898, 1652410264346, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 290, 0, 'JT3002568648205', 'jtexpress', '6e703554c7a18e4773bb5c3488ceae5f', '广东省', '湛江市', '霞山区', 0, NULL, 1, 12.23, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-31 21:35:07', NULL);
INSERT INTO `s_xhs_order` VALUES (65, 'P652323086561298701', 7, 21, 1, 6, 1, 0, 1652323086617, 1652323103000, 1652323442265, 1652410244011, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1161, 0, 'JT3002569201412', 'jtexpress', '70915451c748f7ecc7705d22c5872d80', '广东省', '深圳市', '龙华区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:50:44', NULL);
INSERT INTO `s_xhs_order` VALUES (66, 'P652320603621637491', 7, 21, 1, 6, 1, 0, 1652320603685, 1652320612000, 1652320954690, 1652410211732, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002568739198', 'jtexpress', '4150c58664273eb70672cdcd0d4533b7', '广东省', '惠州市', '惠阳区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-12 19:53:33', NULL, '2022-05-13 10:50:11', NULL);
INSERT INTO `s_xhs_order` VALUES (67, 'P652432706269218671', 7, 21, 1, 6, 1, 0, 1652432706333, 1652432724000, 1652433034942, 1652498293593, 0, 0, 1653753599000, NULL, '淘宝已下单', 0, 0, 0, NULL, 1290, 0, 'JT3002636428891', 'jtexpress', '1a7cd3871095bfaddb4fb33658f9380a', '广东省', '潮州市', '潮安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-13 20:40:27', NULL, '2022-05-14 11:18:13', NULL);
INSERT INTO `s_xhs_order` VALUES (68, 'P652611011026109501', 7, 21, 1, 6, 1, 0, 1652611011091, 1652611018000, 1652668736304, 1652668736280, 0, 0, 1653820930000, NULL, NULL, 0, 0, 0, NULL, 1136, 0, 'JT3002789458117', 'jtexpress', '1eebf619caf33dc02961939659f0de17', '福建省', '南平市', '顺昌县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-15 20:09:49', NULL, '2022-05-16 13:41:47', NULL);
INSERT INTO `s_xhs_order` VALUES (69, 'P652572596040656061', 7, 21, 1, 6, 1, 0, 1652572596098, 1652572606000, 1652572913122, 1652668713949, 0, 0, 1653782512000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002789048211', 'jtexpress', 'ed902994a5480eb9d514da7533d2db0d', '广东省', '肇庆市', '四会市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-15 20:09:49', NULL, '2022-05-16 10:38:34', NULL);
INSERT INTO `s_xhs_order` VALUES (70, 'P652630097148619501', 7, 21, 1, 6, 1, 0, 1652630097204, 1652630105000, 1652630460606, 1652759819699, 0, 0, 1653840060000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002846641634', 'jtexpress', '9ae14199faabdb48e52af6af00021453', '广东省', '中山市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-05-16 07:51:30', NULL, '2022-05-17 11:56:59', NULL);
INSERT INTO `s_xhs_order` VALUES (71, 'P652714294934637211', 7, 21, 1, 6, 1, 0, 1652714294998, 1652714304000, 1652714659991, 1652848120252, 0, 0, 1653924259000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3002943027867', 'jtexpress', 'd3c6e2c5093ebf53280793f5fd02f0a6', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-17 11:56:04', NULL, '2022-05-18 12:28:40', NULL);
INSERT INTO `s_xhs_order` VALUES (72, 'P652778175558617641', 7, 21, 1, 6, 1, 0, 1652778175624, 1652778184000, 1652778494336, 1652848180394, 0, 0, 1653988094000, NULL, NULL, 0, 0, 0, NULL, 2322, 0, 'JT3002942887420', 'jtexpress', '9148231a92329ecd3b0b99d59f34ae33', '广东省', '江门市', '蓬江区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-17 21:22:54', NULL, '2022-05-18 12:29:40', NULL);
INSERT INTO `s_xhs_order` VALUES (73, 'P652863889529663301', 7, 21, 1, 6, 1, 0, 1652863889614, 1652863899000, 1652938388527, 1652938388507, 0, 0, 1654073807000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003010221318', 'jtexpress', '96e99bf181119b963ae9d25cd44cb6ce', '广东省', '江门市', '台山市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-18 21:33:05', NULL, '2022-05-19 13:33:15', NULL);
INSERT INTO `s_xhs_order` VALUES (74, 'P653135539462453911', 7, 21, 1, 6, 1, 0, 1653135539523, 1653135547000, 1653185775843, 1653185775820, 0, 0, 1654345485000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003231543305', 'jtexpress', 'da318f84c20838c652755b80a66d466b', '广西壮族自治区', '钦州市', '浦北县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-21 21:00:49', NULL, '2022-05-22 10:16:19', NULL);
INSERT INTO `s_xhs_order` VALUES (75, 'P653144704533687431', 7, 21, 1, 6, 1, 0, 1653144704607, 1653144714000, 1653218393809, 1653218393789, 0, 0, 1654354664000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '773161531277980', 'shentong', '9e5628b022c75bd3b5c3aaffb32adf74', '湖北省', '武汉市', '硚口区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-22 10:16:19', NULL, '2022-05-22 19:20:03', NULL);
INSERT INTO `s_xhs_order` VALUES (76, 'P653208486268312851', 7, 21, 1, 6, 1, 0, 1653208486334, 1653208494000, 1653276564531, 1653276564512, 0, 0, 1654418418000, NULL, NULL, 0, 0, 0, NULL, 1161, 0, 'JT3003288049689', 'jtexpress', '4d29cc288e4fa731129cb493d715dc7e', '广东省', '汕头市', '澄海区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-22 19:20:03', NULL, '2022-05-23 11:29:27', NULL);
INSERT INTO `s_xhs_order` VALUES (77, 'P653220280689380791', 7, 21, 1, 9, 1, 0, 1653220280755, 0, 1653222100295, 0, 1653222100295, 0, 0, NULL, NULL, 0, 0, 0, NULL, 990, 0, NULL, NULL, '10d6c6000f953ed66bdc8a6695072080', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 0, NULL, '2022-05-23 11:29:27', NULL, '2022-05-23 11:29:27', NULL);
INSERT INTO `s_xhs_order` VALUES (78, 'P653317470153912441', 7, 21, 1, 6, 1, 0, 1653317470228, 1653317476000, 1653317802177, 1653484140631, 0, 0, 1654527401000, NULL, '1688已下单', 0, 0, 0, NULL, 290, 0, 'JT3003424457414', 'jtexpress', '7e9ca85dc737c5a5c20b152698cb0cb2', '山东省', '临沂市', '郯城县', 0, NULL, 0, 0.00, 2, NULL, '2022-05-24 10:19:28', NULL, '2022-05-25 21:09:00', NULL);
INSERT INTO `s_xhs_order` VALUES (79, 'P653567290802427841', 7, 21, 1, 6, 1, 0, 1653567290997, 1653567297000, 1653617427728, 1653617427703, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003602860095', 'jtexpress', 'cc95f27f751d08f0e89198e481245325', '陕西省', '西安市', '雁塔区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-26 20:27:42', NULL, '2022-05-27 10:10:30', NULL);
INSERT INTO `s_xhs_order` VALUES (80, 'P653544659683153591', 7, 21, 1, 6, 1, 0, 1653544659748, 1653544667000, 1653617408552, 1653617408531, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003602904594', 'jtexpress', '8be8a595a967affce86896f6e6c0ee48', '四川省', '成都市', '龙泉驿区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-26 20:27:42', NULL, '2022-05-27 10:10:30', NULL);
INSERT INTO `s_xhs_order` VALUES (81, 'P653646659063908311', 7, 21, 1, 6, 1, 0, 1653646659146, 1653646667000, 1653705950853, 1653705950825, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003679293080', 'jtexpress', 'a38612467d9d2cf240f91903103dec00', '广东省', '东莞市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (82, 'P653645962294360321', 7, 21, 1, 6, 1, 0, 1653645962372, 1653645973000, 1653705928660, 1653705928569, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 280, 0, 'YT6517452100608', 'yuantong', 'd99a4a5e6e051550472ad7dfe1bcf468', '湖南省', '湘潭市', '湘乡市', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (83, 'P653634893760982221', 7, 21, 1, 6, 1, 0, 1653634894789, 1653634905000, 1653705969289, 1653705969212, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3003679471288', 'jtexpress', 'ba7b62f00ea0e48f4c2a702d33e89fd3', '广西壮族自治区', '来宾市', '兴宾区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-27 18:22:46', NULL, '2022-05-28 10:46:12', NULL);
INSERT INTO `s_xhs_order` VALUES (84, 'P653723125891998301', 7, 21, 1, 6, 1, 0, 1653723125963, 1653723136000, 1653793425367, 1653793425347, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, 'JT3003751158081', 'jtexpress', '0ccbf55d9dadadac0f459cc8ddc46446', '湖南省', '常德市', '武陵区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:48', NULL);
INSERT INTO `s_xhs_order` VALUES (85, 'P653719930037699091', 7, 21, 1, 6, 1, 0, 1653719930100, 1653719942000, 1653793407148, 1653793407125, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 1161, 0, 'JT3003751063621', 'jtexpress', '2250abd9d8eff1470c293aafe0e7d0e8', '广东省', '深圳市', '光明区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:48', NULL);
INSERT INTO `s_xhs_order` VALUES (86, 'P653708051414315701', 7, 21, 1, 6, 1, 0, 1653708051481, 1653708065000, 1653793389320, 1653793389301, 0, 0, 1654963199000, NULL, NULL, 0, 0, 0, NULL, 2580, 0, 'JT3003750965927', 'jtexpress', '3a5123d2ecce034a0897b1a446f50527', '广西壮族自治区', '南宁市', '西乡塘区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-28 22:01:49', NULL, '2022-05-29 11:03:49', NULL);
INSERT INTO `s_xhs_order` VALUES (87, 'P653888030003741751', 7, 21, 1, 6, 1, 0, 1653888030082, 1653888038000, 1653965399726, 1653965399688, 0, 0, 1655097957000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432582021828458', 'yunda', '75603a5f0978bd792127613240e24183', '山东省', '青岛市', '市北区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-30 14:56:59', NULL, '2022-05-31 10:50:18', NULL);
INSERT INTO `s_xhs_order` VALUES (88, 'P653999706956258091', 7, 21, 1, 6, 1, 0, 1653999707028, 1653999714000, 1654050495195, 1654050495175, 0, 0, 1655209633000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432584518143069', 'yunda', '4c51728b8a4c4c572191546322c1d3e7', '辽宁省', '鞍山市', '铁西区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:35:27', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (89, 'P653987459525810271', 7, 21, 1, 6, 1, 0, 1653987459604, 1653987466000, 1654050470766, 1654050470745, 0, 0, 1655197396000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432584536121390', 'yunda', '067fa655af50db8a08211452aedb98c6', '广东省', '广州市', '天河区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:35:27', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (90, 'P654004804836532561', 7, 21, 1, 6, 1, 0, 1654004804906, 1654004855000, 1654050516457, 1654050516437, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '432584533223757', 'yunda', '0059f88fe329cea51c5dd452a1e05f42', '广东省', '深圳市', '宝安区', 0, NULL, 0, 0.00, 2, NULL, '2022-05-31 21:52:41', NULL, '2022-06-01 10:28:39', NULL);
INSERT INTO `s_xhs_order` VALUES (91, 'P654326589566228171', 7, 21, 1, 6, 1, 0, 1654326589634, 1654326599000, 1654601346502, 1654400179609, 0, 0, 1655536511000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '773163908746135', 'shentong', '8f690075129429b25ebf21c37cbea82c', '广东省', '广州市', '荔湾区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-04 18:02:12', NULL, '2022-06-07 20:54:50', NULL);
INSERT INTO `s_xhs_order` VALUES (92, 'P654308982054596471', 7, 21, 1, 6, 1, 0, 1654308982141, 1654308989000, 1654479600606, 1654400138595, 0, 0, 1655518919000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432593624343723', 'yunda', '4ef2ab404861d77517b9fbb89f20200f', '浙江省', '台州市', '临海市', 0, NULL, 0, 0.00, 2, NULL, '2022-06-04 18:02:12', NULL, '2022-06-07 20:54:50', NULL);
INSERT INTO `s_xhs_order` VALUES (93, 'P654527865303868421', 7, 21, 1, 6, 1, 0, 1654527865366, 1654527873000, 1654528229197, 1654677929834, 0, 0, 1655737829000, NULL, '淘宝已下单0607', 0, 0, 0, NULL, 1791, 0, 'YT6543639546587', 'yuantong', '5c59b4adff960fcbc76e663ed40d8b70', '广东省', '广州市', '增城区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-07 20:54:25', NULL, '2022-06-08 16:45:29', NULL);
INSERT INTO `s_xhs_order` VALUES (94, 'P654918013009797431', 7, 21, 1, 6, 1, 0, 1654918013174, 1654918022000, 1655182615611, 1655169894927, 0, 0, 1656127949000, NULL, NULL, 0, 0, 0, NULL, 280, 0, '75888276950532', 'zto', '722abae4f13b162a7b8d2884871e4e4a', '广东省', '中山市', '', 0, NULL, 0, 0.00, 2, NULL, '2022-06-13 15:28:02', NULL, '2022-06-14 17:13:52', NULL);
INSERT INTO `s_xhs_order` VALUES (95, 'P654902252061493981', 7, 21, 1, 9, 1, 0, 1654902252120, 0, 1654904060194, 0, 1654904060194, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1280, 0, NULL, NULL, 'd42803b3095ba8eb1b27e4c48ac607bc', '河北省', '保定市', '高碑店市', 0, NULL, 0, 0.00, 0, NULL, '2022-06-13 15:28:03', NULL, '2022-06-13 15:28:03', NULL);
INSERT INTO `s_xhs_order` VALUES (96, 'P655164209297185071', 7, 21, 1, 6, 1, 0, 1655164209363, 1655164230000, 1655471701849, 1655266974183, 0, 0, 1657019155000, NULL, NULL, 0, 0, 0, NULL, 3690, 0, 'JT3005149047370', 'jtexpress', '2388ccdeb36a811797014335e85f6b67', '江苏省', '苏州市', '相城区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-14 17:13:43', NULL, '2022-06-23 10:59:04', NULL);
INSERT INTO `s_xhs_order` VALUES (97, 'P655907217047288121', 7, 21, 1, 7, 1, 0, 1655907217117, 1655907227000, 1657027485014, 1655990684830, 0, 1657027484977, 1657117168000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, '432632780754891', 'yunda', 'f00c0c345eda1d0413d7b9c500def1dd', '辽宁省', '大连市', '沙河口区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:58:52', NULL, '2022-09-11 15:29:00', NULL);
INSERT INTO `s_xhs_order` VALUES (98, 'P655895456352234021', 7, 21, 1, 7, 1, 0, 1655895456422, 1655895464000, 1656993698071, 1655956581085, 0, 1656993381219, 1657105417000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432631017320265', 'yunda', '1a642f9d01e7dfd04b1b79957feb05e2', '湖北省', '襄阳市', '枣阳市', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:58:52', NULL, '2022-07-20 15:45:10', NULL);
INSERT INTO `s_xhs_order` VALUES (99, 'P655306083910895681', 7, 21, 1, 6, 1, 0, 1655306083981, 1655306092000, 1655602201013, 1655467319110, 0, 0, 1657019155000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, 'YT6564757376366', 'yuantong', '0090de1a01addc823ede8fb036ffd216', '福建省', '泉州市', '南安市', 0, NULL, 0, 0.00, 0, NULL, '2022-06-23 10:59:12', NULL, '2022-06-23 10:59:12', NULL);
INSERT INTO `s_xhs_order` VALUES (100, 'P655861236319479691', 7, 21, 1, 7, 1, 0, 1655861236401, 1655861242000, 1656993362259, 1655956562027, 0, 1656993362162, 1657071162000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432631019537001', 'yunda', '68f1bc1f82f2f7997a57d689c5aa66b4', '四川省', '成都市', '青羊区', 0, NULL, 0, 0.00, 2, NULL, '2022-06-23 10:59:53', NULL, '2022-07-20 15:45:10', NULL);
INSERT INTO `s_xhs_order` VALUES (101, 'P656077804604507781', 7, 21, 1, 9, 1, 0, 1656077804674, 0, 1656077889299, 0, 1656077889299, 0, 0, NULL, NULL, 0, 0, 0, NULL, 290, 0, NULL, NULL, 'ef4f1a4b5bbfe3866288bee28cba83b7', '福建省', '福州市', '福清市', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:30', NULL, '2022-07-20 15:45:30', NULL);
INSERT INTO `s_xhs_order` VALUES (102, 'P656138236641436701', 7, 21, 1, 9, 3, 1, 1656138236707, 1656138249000, 1656209706278, 0, 1656209706278, 0, 1657348168000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, NULL, NULL, 'e84cc723d75a4b833756b5c7879a12cb', '北京', '北京市', '顺义区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:40', NULL, '2022-07-20 15:45:40', NULL);
INSERT INTO `s_xhs_order` VALUES (103, 'P656131592886653951', 7, 21, 1, 7, 1, 0, 1656131592957, 1656131599000, 1657440877002, 1656404076523, 0, 1657440876899, 1657341536000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432640173985829', 'yunda', '9a81135efc9b29256d6d437c1174a6a0', '浙江省', '台州市', '椒江区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:45:40', NULL, '2022-07-20 15:45:40', NULL);
INSERT INTO `s_xhs_order` VALUES (104, 'P656428167541196101', 7, 21, 1, 7, 1, 0, 1656428167611, 1656428177000, 1657597117291, 1656560317055, 0, 1657597117257, 1657638086000, NULL, NULL, 0, 0, 0, NULL, 290, 0, '432643807350250', 'yunda', '6bdf54e7194210d2a31c89698f818f0b', '辽宁省', '大连市', '甘井子区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:17', NULL, '2022-07-20 15:46:17', NULL);
INSERT INTO `s_xhs_order` VALUES (105, 'P656412970413495211', 7, 21, 1, 7, 1, 0, 1656412970482, 1656413001000, 1657511749230, 1656474949056, 0, 1657511749191, 1657622918000, NULL, NULL, 0, 0, 0, NULL, 990, 0, '432642060066682', 'yunda', '0608259b1033dfb14ee4c58f3674ec6f', '浙江省', '宁波市', '海曙区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:18', NULL, '2022-07-20 15:46:18', NULL);
INSERT INTO `s_xhs_order` VALUES (106, 'P656575170906937241', 7, 21, 1, 9, 1, 0, 1656575170973, 0, 1656576980325, 0, 1656576980325, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1990, 0, NULL, NULL, '7100c0fffd4fd56b4ae1c63a56ca31dd', '重庆', '重庆市', '荣昌区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:33', NULL, '2022-07-20 15:46:33', NULL);
INSERT INTO `s_xhs_order` VALUES (107, 'P656748207113734701', 7, 21, 1, 9, 1, 0, 1656748207190, 0, 1656750020304, 0, 1656750020303, 0, 0, NULL, NULL, 0, 0, 0, NULL, 1280, 0, NULL, NULL, '197b752dffdca268b04ac405b1d7afeb', '北京', '北京市', '昌平区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:46', NULL, '2022-07-20 15:46:46', NULL);
INSERT INTO `s_xhs_order` VALUES (108, 'P656848564205726681', 7, 21, 1, 7, 1, 0, 1656848564271, 1656848571000, 1657940258751, 1656903458412, 0, 1657940258716, 1658058482000, NULL, NULL, 0, 0, 0, NULL, 1990, 0, '432650839190733', 'yunda', 'c3e2abb2de87b1069d129602b49eac47', '山东省', '淄博市', '张店区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:46:52', NULL, '2022-07-20 15:46:52', NULL);
INSERT INTO `s_xhs_order` VALUES (109, 'P657124492725901641', 7, 21, 1, 7, 1, 0, 1657124492800, 1657124509000, 1658286563492, 1657249763117, 0, 1658286563457, 1658334465000, NULL, NULL, 0, 0, 0, NULL, 1290, 0, '432658338105728', 'yunda', '7ea3369e4c236d53ba04add9ec50374a', '贵州省', '贵阳市', '云岩区', 0, NULL, 0, 0.00, 0, NULL, '2022-07-20 15:47:17', NULL, '2022-07-20 15:47:17', NULL);

-- ----------------------------
-- Table structure for s_xhs_order_item
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_item`;
CREATE TABLE `s_xhs_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(0) NOT NULL COMMENT '订单id',
  `itemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品id',
  `itemName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名称',
  `erpcode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商家编码(若为组合品，暂不支持组合品的商家编码，但skulist会返回子商品商家编码)',
  `itemSpecCode` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '规格编码',
  `itemSpec` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '规格',
  `itemImage` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品图片url',
  `price` double(10, 2) DEFAULT NULL COMMENT '单价',
  `quantity` int(0) NOT NULL COMMENT '数量',
  `totalPaidAmount` bigint(0) NOT NULL DEFAULT 0 COMMENT '总支付金额（考虑总件数）商品总实付',
  `totalMerchantDiscount` bigint(0) NOT NULL DEFAULT 0 COMMENT '商家承担总优惠',
  `totalRedDiscount` bigint(0) NOT NULL DEFAULT 0 COMMENT '平台承担总优惠',
  `itemTag` int(0) NOT NULL COMMENT '是否赠品，1 赠品 0 普通商品',
  `erpSendStatus` int(0) NOT NULL DEFAULT 0 COMMENT 'ERP发货状态0待处理1出库中2已出库3已发货',
  `erpGoodsId` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erpGoodsSpecId` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_xhs_order_item
-- ----------------------------
INSERT INTO `s_xhs_order_item` VALUES (1, 1, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (2, 2, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (3, 3, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (4, 4, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (5, 5, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (6, 6, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (7, 7, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 1, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (8, 8, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 1, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (9, 9, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (10, 10, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (11, 11, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 1980, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (12, 12, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (13, 13, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (14, 14, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (15, 15, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (16, 16, '625ad994634a5100013f3e63', '森庄农品白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 1980, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (17, 17, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (18, 18, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (19, 19, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (20, 20, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (21, 21, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (22, 22, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (23, 23, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (24, 24, '625ad994634a5100013f3e63', '白灼汁150ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', NULL, NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (25, 25, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (26, 26, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (27, 27, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (28, 28, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (29, 29, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (30, 30, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (31, 31, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (32, 32, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (33, 33, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (34, 34, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (35, 35, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (36, 36, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (37, 37, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (38, 38, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (39, 39, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (40, 40, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (41, 41, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (42, 42, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (43, 43, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (44, 44, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (45, 45, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 5, 6450, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (46, 46, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (47, 47, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (48, 48, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (49, 49, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (50, 50, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (51, 51, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (52, 52, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (53, 53, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (54, 54, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (55, 55, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (56, 56, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (57, 57, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (58, 58, '6260e4559882460001404817', '2瓶油泼辣子香辣麻辣红四川风味油辣椒油家庭辣椒酱凉拌菜调料 香辣味1瓶+麻辣味1瓶', NULL, NULL, '香辣味1瓶+麻辣味1瓶', '//qimg.xiaohongshu.com/arkgoods/01024l01kd5bhe81cua0l0robsz8e0su8h?itemId=6260e4559882460001404817&imageView2/1/w/320/h/320/q/90', NULL, 1, 2691, 0, 299, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (59, 59, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (60, 60, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (61, 61, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (62, 62, '6268ea4798b03b000118edb8', '干裙带菜干货韩国优质海带脂肪儿童宝宝孕妇无沙免洗 100g一袋', NULL, NULL, '100g一袋', '//qimg.xiaohongshu.com/arkgoods/01024r01kd5bhe81cua0l0w5v7kcd8t42c?itemId=6268ea4798b03b000118edb8&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (63, 63, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (64, 64, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (65, 65, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (66, 66, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (67, 67, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/01024g01kd5bhe81cua0l1d6owp8dm88ss?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (68, 68, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1136, 0, 154, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (69, 69, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (70, 70, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (71, 71, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (72, 72, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2322, 0, 258, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (73, 73, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (74, 74, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (75, 75, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (76, 76, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (77, 77, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (78, 78, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (79, 79, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (80, 80, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (81, 81, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (82, 82, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 280, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (83, 83, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (84, 84, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (85, 85, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1161, 0, 129, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (86, 86, '625ad994634a5100013f3e63', '白灼汁250ml白灼酱油清蒸鱼凉拌虾海鲜白灼蔬菜调味料汁', 'F2022041800010000', NULL, '', '//qimg.xiaohongshu.com/arkgoods/9ef722113d2897ccb550e9bbdca0a75d2c24efd2?itemId=625ad994634a5100013f3e63&imageView2/1/w/320/h/320/q/90.jpg', NULL, 2, 2580, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (87, 87, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (88, 88, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (89, 89, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (90, 90, '627796f8c618a40001fe1811', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 8寸', NULL, NULL, '深蓝色 8寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f8c618a40001fe1811&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1990, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (91, 91, '6268ea4798b03b000118edb8', '干裙带菜干货韩国优质海带脂肪儿童宝宝孕妇无沙免洗 100g一袋', NULL, NULL, '100g一袋', '//qimg.xiaohongshu.com/arkgoods/01024r01kd5bhe81cua0l0w5v7kcd8t42c?itemId=6268ea4798b03b000118edb8&imageView2/1/w/320/h/320/q/90', NULL, 1, 990, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (92, 92, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (93, 93, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1791, 0, 199, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (94, 94, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 280, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (95, 95, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 1280, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (96, 96, '6260e4559882460001404817', '2瓶油泼辣子香辣麻辣红四川风味油辣椒油家庭辣椒酱凉拌菜调料 香辣味1瓶+麻辣味1瓶', NULL, NULL, '香辣味1瓶+麻辣味1瓶', '//qimg.xiaohongshu.com/arkgoods/01024l01kd5bhe81cua0l0robsz8e0su8h?itemId=6260e4559882460001404817&imageView2/1/w/320/h/320/q/90', NULL, 1, 3690, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (97, 97, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (98, 98, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (99, 99, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (100, 100, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 2, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (101, 101, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (102, 102, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (103, 103, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (104, 104, '627796f6c618a40001fe17eb', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 深蓝色 5寸', NULL, NULL, '深蓝色 5寸', '//qimg.xiaohongshu.com/arkgoods/7a11a1525e7058967b5936a9c44e3fa8ff8d410c?itemId=627796f6c618a40001fe17eb&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 290, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (105, 105, '627796fdc618a40001fe1870', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 6寸', NULL, NULL, '欧美白 6寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fdc618a40001fe1870&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 990, 0, 1000, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (106, 106, '6284ddd4ec09650001a14bb5', '甜酒曲 米酒曲醪糟曲子 做糯米酒酿酵母甜味型风味型8克20袋 8g一袋*20袋', NULL, NULL, '8g一袋*20袋', '//qimg.xiaohongshu.com/arkgoods/01025i01kd5bhe81cua0l16j4yactsbl5o?itemId=6284ddd4ec09650001a14bb5&imageView2/1/w/320/h/320/q/90', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (107, 107, '6267d2fd5c083a0001f08d46', '正宗盐焗鸡粉家用盐局虾焗海鲜调味专用配料 盐焗粉30g*5包', NULL, NULL, '盐焗粉30g*5包', '//qimg.xiaohongshu.com/arkgoods/01024q01kd5bhe81cua0l14yz5i7frbtze?itemId=6267d2fd5c083a0001f08d46&imageView2/1/w/320/h/320/q/90', NULL, 1, 1280, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (108, 108, '627796fdc618a40001fe1870', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 6寸', NULL, NULL, '欧美白 6寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fdc618a40001fe1870&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1990, 0, 0, 0, 0, 0, 0);
INSERT INTO `s_xhs_order_item` VALUES (109, 109, '627796fcc618a40001fe185d', '小风扇USB风扇5寸6寸8寸迷你静音台扇桌面学生办公室台扇小电风扇 欧美白 5寸', NULL, NULL, '欧美白 5寸', '//qimg.xiaohongshu.com/arkgoods/b4acfb19d112eb6a0cbd6f11e055917fb1100c20?itemId=627796fcc618a40001fe185d&imageView2/1/w/320/h/320/q/90.jpg', NULL, 1, 1290, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for s_xhs_order_receiver
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_receiver`;
CREATE TABLE `s_xhs_order_receiver`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(0) NOT NULL DEFAULT 0 COMMENT '外键',
  `receiver` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '收件人',
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电话',
  `country` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '中国' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '市',
  `district` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '区',
  `address` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单收件人信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_xhs_order_receiver
-- ----------------------------
INSERT INTO `s_xhs_order_receiver` VALUES (1, 17, '张玉慧', '13733564533', '中国', '湖北省', '十堰市', '张湾区', '湖北省十堰市张湾区阳光蓝山郡4-901');
INSERT INTO `s_xhs_order_receiver` VALUES (2, 1, '项一妹', '15988130699', '中国', '浙江省', '杭州市', '富阳区', '浙江省杭州市富阳区鹿山街道陆家村100号');
INSERT INTO `s_xhs_order_receiver` VALUES (3, 2, '黄淑芳', '18922198259', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区广东省广州市天河区黄埔大道中天一庄锦茵阁1004房');
INSERT INTO `s_xhs_order_receiver` VALUES (4, 18, '曾桂华', '13189016523', '中国', '广东省', '广州市', '越秀区', '广东省广州市越秀区达道路丛桂访4号之二402');
INSERT INTO `s_xhs_order_receiver` VALUES (5, 16, '何惠新', '13532112794', '中国', '广东省', '惠州市', '博罗县', '广东省惠州市博罗县观音阁镇桂花街25号霞妹杂货店');
INSERT INTO `s_xhs_order_receiver` VALUES (7, 22, '小林', '13386900590', '中国', '福建省', '莆田市', '仙游县', '福建省莆田市仙游县师范路198号');
INSERT INTO `s_xhs_order_receiver` VALUES (8, 15, '樊爱早', '13881213299', '中国', '四川省', '广元市', '利州区', '四川省广元市利州区恒星城一期');
INSERT INTO `s_xhs_order_receiver` VALUES (9, 14, '朱美玲', '15116201196', '中国', '湖南省', '长沙市', '望城区', '湖南省长沙市望城区白沙洲街道晟通城17栋妈妈团');
INSERT INTO `s_xhs_order_receiver` VALUES (10, 13, '小林', '18683617471', '中国', '广东省', '揭阳市', '揭西县', '广东省揭阳市揭西县凤江镇东新村委五乡村68号');
INSERT INTO `s_xhs_order_receiver` VALUES (11, 11, '林秀荣', '18605094699', '中国', '福建省', '龙岩市', '新罗区', '福建省龙岩市新罗区龙岩技师学院凤凰北路八号');
INSERT INTO `s_xhs_order_receiver` VALUES (12, 9, '何敏', '13971904342', '中国', '湖北省', '十堰市', '茅箭区', '湖北省十堰市茅箭区北京路市民服务中心203室');
INSERT INTO `s_xhs_order_receiver` VALUES (13, 8, '杨霞', '18877125058', '中国', '广西壮族自治区', '贵港市', '港北区', '广西壮族自治区贵港市港北区贵港市港北区恒大城7栋2单元2001房');
INSERT INTO `s_xhs_order_receiver` VALUES (14, 7, '郭娜玲', '13728188777', '中国', '福建省', '厦门市', '思明区', '福建省厦门市思明区莲兴路61号1102');
INSERT INTO `s_xhs_order_receiver` VALUES (15, 6, '董梦莲', '15956546777', '中国', '安徽省', '合肥市', '庐阳区', '安徽省合肥市庐阳区安徽省合肥市庐阳区庐江县达观天下一单元9栋1101');
INSERT INTO `s_xhs_order_receiver` VALUES (16, 5, '你妍妡', '18518634959', '中国', '山东省', '青岛市', '城阳区', '山东省青岛市城阳区时光里3号楼二单元701');
INSERT INTO `s_xhs_order_receiver` VALUES (21, 37, '江帆', '13978529908', '中国', '广西壮族自治区', '玉林市', '玉州区', '广西壮族自治区玉林市玉州区民主中路175号');
INSERT INTO `s_xhs_order_receiver` VALUES (22, 38, '贺红云', '13797396828', '中国', '湖北省', '武汉市', '洪山区', '湖北省武汉市洪山区狮子山街道南李路金地圣爱米伦三号楼二单元2104室');
INSERT INTO `s_xhs_order_receiver` VALUES (23, 39, '陈巧谊', '13516555305', '中国', '广东省', '佛山市', '南海区', '广东省佛山市南海区大沥盐步河东虎榜旧村543号');
INSERT INTO `s_xhs_order_receiver` VALUES (24, 35, '黄女士', '15880291352', '中国', '福建省', '厦门市', '集美区', '福建省厦门市集美区杏林街道杏东路20号香港公馆');
INSERT INTO `s_xhs_order_receiver` VALUES (25, 33, '马红', '19818665666', '中国', '辽宁省', '营口市', '站前区', '辽宁省营口市站前区辽宁省营口市站前区东方庭院A11-22');
INSERT INTO `s_xhs_order_receiver` VALUES (26, 32, '潘金玲', '13544120505', '中国', '广东省', '肇庆市', '四会市', '广东省肇庆市四会市东城街道四会大道南水岸名都水逸角三座');
INSERT INTO `s_xhs_order_receiver` VALUES (27, 31, '许丽涵', '13808543878', '中国', '福建省', '泉州市', '晋江市', '福建省泉州市晋江市安海镇侨城海景湾1期32栋');
INSERT INTO `s_xhs_order_receiver` VALUES (28, 30, '覃维茵', '13677744922', '中国', '广西壮族自治区', '梧州市', '岑溪市', '广西壮族自治区梧州市岑溪市三堡镇三堡中学对面87号');
INSERT INTO `s_xhs_order_receiver` VALUES (29, 29, '何肖合', '18988712207', '中国', '广东省', '东莞市', '', '广东省东莞市广东省东莞市东城区主山上三杞如意四巷14号');
INSERT INTO `s_xhs_order_receiver` VALUES (32, 26, '张榕珍', '13906916876', '中国', '福建省', '福州市', '晋安区', '福建省福州市晋安区西井支路5号建发国宾府一号楼703');
INSERT INTO `s_xhs_order_receiver` VALUES (33, 27, '潘穗钰', '13679537946', '中国', '广东省', '清远市', '清城区', '广东省清远市清城区源潭镇龙凤花苑金太阳托管园');
INSERT INTO `s_xhs_order_receiver` VALUES (34, 28, '杨娇', '13349797723', '中国', '湖北省', '十堰市', '竹山县', '湖北省十堰市竹山县城关镇北大街供销合作社4栋701');
INSERT INTO `s_xhs_order_receiver` VALUES (35, 25, '宁宁', '13533246971', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区沙太路牛利岗天平花苑80号');
INSERT INTO `s_xhs_order_receiver` VALUES (36, 23, '关瑞红', '15819165470', '中国', '广东省', '阳江市', '江城区', '广东省阳江市江城区金碧路9号金碧园西街12号');
INSERT INTO `s_xhs_order_receiver` VALUES (37, 24, '章可可', '13732472279', '中国', '浙江省', '宁波市', '宁海县', '浙江省宁波市宁海县西店镇爱森电器有限公司');
INSERT INTO `s_xhs_order_receiver` VALUES (38, 19, '杨肖肖', '15657670673', '中国', '浙江省', '台州市', '临海市', '浙江省台州市临海市伟星和院1-1-501室');
INSERT INTO `s_xhs_order_receiver` VALUES (40, 4, '谢三琳', '15874715678', '中国', '湖南省', '衡阳市', '耒阳市', '湖南省衡阳市耒阳市南外街79号前进小学');
INSERT INTO `s_xhs_order_receiver` VALUES (41, 3, '何敏', '13971904342', '中国', '湖北省', '十堰市', '茅箭区', '湖北省十堰市茅箭区北京路市民服务中心203室');
INSERT INTO `s_xhs_order_receiver` VALUES (42, 20, '王倪玲', '15917358816', '中国', '广东省', '广州市', '从化区', '广东省广州市从化区街口街镇南路32岁');
INSERT INTO `s_xhs_order_receiver` VALUES (43, 36, '邓婉华', '15397082367', '中国', '浙江省', '杭州市', '西湖区', '浙江省杭州市西湖区石马新村186-1');
INSERT INTO `s_xhs_order_receiver` VALUES (45, 41, '郑文武', '13609412345', '中国', '重庆', '重庆市', '江津区', '重庆重庆市江津区维多利亚菜鸟驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (46, 40, '吉江玲', '13574894292', '中国', '湖南省', '长沙市', '浏阳市', '湖南省长沙市浏阳市恒大华府一期20栋');
INSERT INTO `s_xhs_order_receiver` VALUES (47, 42, '曹晓红', '13530655282', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区秋长镇白石唐井人才公寓管理处');
INSERT INTO `s_xhs_order_receiver` VALUES (48, 43, '张静瑶', '13318519872', '中国', '广东省', '茂名市', '茂南区', '广东省茂名市茂南区茂名市中德大道碧桂园城央首府');
INSERT INTO `s_xhs_order_receiver` VALUES (51, 46, '李冬', '13536758882', '中国', '广东省', '东莞市', '', '广东省东莞市厚街镇白濠世纪绿洲顺景轩3单元1604');
INSERT INTO `s_xhs_order_receiver` VALUES (52, 45, '孟令敏', '13942294413', '中国', '辽宁省', '鞍山市', '立山区', '辽宁省鞍山市立山区通山街8栋37号');
INSERT INTO `s_xhs_order_receiver` VALUES (53, 44, '刘志', '13631622122', '中国', '广东省', '深圳市', '南山区', '广东省深圳市南山区华侨城佛山街2栋010');
INSERT INTO `s_xhs_order_receiver` VALUES (54, 47, '蔡丁妍', '13675778087', '中国', '浙江省', '绍兴市', '诸暨市', '浙江省绍兴市诸暨市浙江省绍兴市诸暨市陶朱街道北二环路29号富润纺织有限公司');
INSERT INTO `s_xhs_order_receiver` VALUES (55, 49, '陈姗姗', '18681535607', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区宝民一路1巷65号新玥庭3单元715');
INSERT INTO `s_xhs_order_receiver` VALUES (56, 48, '杨伟', '18307851333', '中国', '广西壮族自治区', '贵港市', '桂平市', '广西壮族自治区贵港市桂平市广西壮族自治区贵港市桂平市白沙镇政府门边');
INSERT INTO `s_xhs_order_receiver` VALUES (57, 51, '郑霞', '13788215648', '中国', '广西壮族自治区', '南宁市', '邕宁区', '广西壮族自治区南宁市邕宁区广西壮族自治区南宁市邕宁区滨堤路万达茂御峰国际D9栋一单元');
INSERT INTO `s_xhs_order_receiver` VALUES (58, 52, '喜乐', '13612843357', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区龙光城北二期');
INSERT INTO `s_xhs_order_receiver` VALUES (59, 53, '贺爱群', '13590470149', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区福永怀德翠岗工业五区A栋');
INSERT INTO `s_xhs_order_receiver` VALUES (60, 54, '刘晓枝', '15173604588', '中国', '湖南省', '常德市', '武陵区', '湖南省常德市武陵区湖南常德武陵区锦都豪苑8栋一单元201');
INSERT INTO `s_xhs_order_receiver` VALUES (61, 55, '王金芝', '18500338140', '中国', '福建省', '厦门市', '湖里区', '福建省厦门市湖里区兴隆路博士山庄272号');
INSERT INTO `s_xhs_order_receiver` VALUES (62, 57, '韦红春', '18922853408', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区沙井街道共和社区福和路西四巷二十九号');
INSERT INTO `s_xhs_order_receiver` VALUES (63, 58, '雪儿', '15371179788', '中国', '江苏省', '盐城市', '大丰区', '江苏省盐城市大丰区朝阳景都21号楼');
INSERT INTO `s_xhs_order_receiver` VALUES (64, 59, '宋女士', '13925052889', '中国', '广东省', '广州市', '荔湾区', '广东省广州市荔湾区黄沙大道201号2305');
INSERT INTO `s_xhs_order_receiver` VALUES (65, 60, '段香凤', '13970717838', '中国', '江西省', '赣州市', '章贡区', '江西省赣州市章贡区恒大名都6栋3204');
INSERT INTO `s_xhs_order_receiver` VALUES (66, 61, '维维', '15868600530', '中国', '浙江省', '金华市', '义乌市', '浙江省金华市义乌市浙江省金华市义乌市北苑街道四季三区16栋5单元202 ');
INSERT INTO `s_xhs_order_receiver` VALUES (67, 62, '维维', '15868600530', '中国', '浙江省', '金华市', '义乌市', '浙江省金华市义乌市浙江省金华市义乌市北苑街道四季三区16栋5单元202 ');
INSERT INTO `s_xhs_order_receiver` VALUES (68, 63, '邵金海', '13066910777', '中国', '广东省', '深圳市', '盐田区', '广东省深圳市盐田区北山道138号中国交建');
INSERT INTO `s_xhs_order_receiver` VALUES (69, 64, '雪花', '15946636877', '中国', '广东省', '湛江市', '霞山区', '广东省湛江市霞山区文明北一路南苑家属区');
INSERT INTO `s_xhs_order_receiver` VALUES (70, 65, '朱红芳', '18680677802', '中国', '广东省', '深圳市', '龙华区', '广东省深圳市龙华区民治街道龙岸花园5栋21A');
INSERT INTO `s_xhs_order_receiver` VALUES (71, 66, '方平', '13751576178', '中国', '广东省', '惠州市', '惠阳区', '广东省惠州市惠阳区大亚湾西区龙海二路42号阳光圣菲1栋');
INSERT INTO `s_xhs_order_receiver` VALUES (72, 67, '小谢', '13715774207', '中国', '广东省', '潮州市', '潮安区', '广东省潮州市潮安区广东省潮州市潮安区金石镇后溪街桐君堂');
INSERT INTO `s_xhs_order_receiver` VALUES (73, 68, '叶琳', '13509538299', '中国', '福建省', '南平市', '顺昌县', '福建省南平市顺昌县顺兴小区发展楼46号新诚广告');
INSERT INTO `s_xhs_order_receiver` VALUES (74, 69, '伍燕霞', '13536990569', '中国', '广东省', '肇庆市', '四会市', '广东省肇庆市四会市贞山区美的公园大观一诺教育');
INSERT INTO `s_xhs_order_receiver` VALUES (75, 70, '孙惠莉', '18680164427', '中国', '广东省', '中山市', '', '广东省中山市石岐区清溪路万科金域蓝湾一期5标1栋502');
INSERT INTO `s_xhs_order_receiver` VALUES (76, 71, '莫生', '18565688823', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区石岩街道科技四路悦城小区E5-1-1608');
INSERT INTO `s_xhs_order_receiver` VALUES (77, 72, '卢大仁', '13902880730', '中国', '广东省', '江门市', '蓬江区', '广东省江门市蓬江区迎宾大道西九号（农业银行）');
INSERT INTO `s_xhs_order_receiver` VALUES (78, 73, '李丽华', '13600359797', '中国', '广东省', '江门市', '台山市', '广东省江门市台山市冲蒌镇，沙坦村');
INSERT INTO `s_xhs_order_receiver` VALUES (79, 74, '容秀辉', '18807872003', '中国', '广西壮族自治区', '钦州市', '浦北县', '广西壮族自治区钦州市浦北县小江镇自取（备注：请不要发申通快递，谢谢）');
INSERT INTO `s_xhs_order_receiver` VALUES (80, 75, '贺康华', '15171472506', '中国', '湖北省', '武汉市', '硚口区', '湖北省武汉市硚口区宝丰街道雍豪府20-2-3103');
INSERT INTO `s_xhs_order_receiver` VALUES (81, 76, '林培贞', '13433399682', '中国', '广东省', '汕头市', '澄海区', '广东省汕头市澄海区澄江路金璟苑');
INSERT INTO `s_xhs_order_receiver` VALUES (82, 78, '李学成', '18769994321', '中国', '山东省', '临沂市', '郯城县', '山东省临沂市郯城县庙山镇陈邵庄村');
INSERT INTO `s_xhs_order_receiver` VALUES (83, 80, '张燕', '13880718505', '中国', '四川省', '成都市', '龙泉驿区', '四川省成都市龙泉驿区四川省成都市龙泉驿区柏合镇黎明新村四期B区三栋二单元');
INSERT INTO `s_xhs_order_receiver` VALUES (84, 79, '秦洁霞', '13772018023', '中国', '陕西省', '西安市', '雁塔区', '陕西省西安市雁塔区高新路水晶城A座');
INSERT INTO `s_xhs_order_receiver` VALUES (85, 83, '谢洪淋', '15107821559', '中国', '广西壮族自治区', '来宾市', '兴宾区', '广西壮族自治区来宾市兴宾区平阳镇学校小学部');
INSERT INTO `s_xhs_order_receiver` VALUES (86, 82, '陈玲', '18173201308', '中国', '湖南省', '湘潭市', '湘乡市', '湖南省湘潭市湘乡市云锦花苑3栋1101');
INSERT INTO `s_xhs_order_receiver` VALUES (87, 81, '李槟槟', '13686236492', '中国', '广东省', '东莞市', '', '广东省东莞市南城区城市立方1栋410');
INSERT INTO `s_xhs_order_receiver` VALUES (88, 86, '黄强', '18376777956', '中国', '广西壮族自治区', '南宁市', '西乡塘区', '广西壮族自治区南宁市西乡塘区广西南宁市西乡塘区安吉街道屯里村安圩路23号');
INSERT INTO `s_xhs_order_receiver` VALUES (89, 85, '陈记', '13537752390', '中国', '广东省', '深圳市', '光明区', '广东省深圳市光明区圳美新围313号');
INSERT INTO `s_xhs_order_receiver` VALUES (90, 84, '刘俐君', '13973626964', '中国', '湖南省', '常德市', '武陵区', '湖南省常德市武陵区丹阳路紫荆庭院2栋3单元205');
INSERT INTO `s_xhs_order_receiver` VALUES (91, 87, '薛婷', '19811784698', '中国', '山东省', '青岛市', '市北区', '山东省青岛市市北区阜新路抚顺路11号青岛理工大学市北校区');
INSERT INTO `s_xhs_order_receiver` VALUES (93, 88, '高雪', '13644926024', '中国', '辽宁省', '鞍山市', '铁西区', '辽宁省鞍山市铁西区永发街道马驿屯菜鸟驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (94, 89, '陈久久', '13450333376', '中国', '广东省', '广州市', '天河区', '广东省广州市天河区车陂街道车陂东溪大街23号');
INSERT INTO `s_xhs_order_receiver` VALUES (95, 90, '齐李平', '1812****144', '中国', '广东省', '深圳市', '宝安区', '广东省深圳市宝安区新安街道海富社区新城花园四栋407');
INSERT INTO `s_xhs_order_receiver` VALUES (96, 91, '周梦颖', '18770452994', '中国', '广东省', '广州市', '荔湾区', '广东省广州市荔湾区龙津街道人民中路375号(近儿童医院) 广州东升医院三围街3号302房');
INSERT INTO `s_xhs_order_receiver` VALUES (97, 92, '陈彬彬', '15669836389', '中国', '浙江省', '台州市', '临海市', '浙江省台州市临海市经济开发区东方大道605号');
INSERT INTO `s_xhs_order_receiver` VALUES (98, 93, '邱红梅', '15986410557', '中国', '广东省', '广州市', '增城区', '广东省广州市增城区中新镇福和车站对面驿站');
INSERT INTO `s_xhs_order_receiver` VALUES (99, 94, '小九', '18878945311', '中国', '广东省', '中山市', '', '广东省中山市东升镇同乐村委后面G2栋');
INSERT INTO `s_xhs_order_receiver` VALUES (100, 96, '朱华丽', '13914051339', '中国', '江苏省', '苏州市', '相城区', '江苏省苏州市相城区相城区黄桥镇荷美各邸');
INSERT INTO `s_xhs_order_receiver` VALUES (101, 100, '陈佳歆', '15892610731', '中国', '四川省', '成都市', '青羊区', '四川省成都市青羊区楞伽庵街37号3单元');
INSERT INTO `s_xhs_order_receiver` VALUES (102, 98, '吴诗薇', '15623934952', '中国', '湖北省', '襄阳市', '枣阳市', '湖北省襄阳市枣阳市人民路 新华书店 门卫室');
INSERT INTO `s_xhs_order_receiver` VALUES (103, 97, '曲圣全', '15040639321', '中国', '辽宁省', '大连市', '沙河口区', '辽宁省大连市沙河口区大连市 沙河口区 五一广场 大胜街 鑫联友汽配');
INSERT INTO `s_xhs_order_receiver` VALUES (104, 0, '英', '15068659387', '中国', '浙江省', '台州市', '温岭市', '太平街道星光南路99号A幢4单元707');
INSERT INTO `s_xhs_order_receiver` VALUES (105, 0, '丁辰', '13863151151', '中国', '山东省', '威海市', '环翠区', '高区一品莲花城合家欢');

-- ----------------------------
-- Table structure for s_xhs_order_settle
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_order_settle`;
CREATE TABLE `s_xhs_order_settle`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单号',
  `afterSaleNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '售后单号',
  `orderCreateTime` datetime(0) NOT NULL COMMENT '订单创建时间',
  `orderSettleTime` datetime(0) NOT NULL COMMENT '结算时间',
  `transactionType` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '交易类型',
  `settleAccount` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '结算账户',
  `amount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '动账金额',
  `settleAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '结算金额',
  `goodsAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '商品实付/实退',
  `freightAmount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '运费实付/实退',
  `platformDiscount` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '平台优惠',
  `goodsTax` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '商品税金',
  `freightTax` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '运费税金',
  `commission` decimal(6, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `paymentChannelFee` decimal(6, 2) NOT NULL COMMENT '支付渠道费',
  `distributionCommission` decimal(6, 2) NOT NULL COMMENT '分销佣金',
  `huabeiFee` decimal(6, 2) NOT NULL COMMENT '花呗手续费',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '小红书店铺订单结算明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_xhs_order_settle
-- ----------------------------
INSERT INTO `s_xhs_order_settle` VALUES (1, 'P650962492423135701', '-', '2022-04-26 16:41:32', '2022-05-14 14:43:54', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (2, 'P650730626873861291', '-', '2022-04-24 00:17:06', '2022-05-14 11:12:36', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (3, 'P650689352935451771', '-', '2022-04-23 12:49:12', '2022-05-14 11:08:31', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (4, 'P650722151211113551', '-', '2022-04-23 21:55:51', '2022-05-14 11:08:29', '结算入账', '店铺余额', 60.82, 64.50, 64.50, 0.00, 0.00, 0.00, 0.00, -3.23, -0.45, 0.00, 0.00, '', '2022-05-16 18:24:32');
INSERT INTO `s_xhs_order_settle` VALUES (5, 'P650639118014134591', '-', '2022-04-22 22:51:58', '2022-05-14 11:07:23', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (6, 'P650607608703188391', '-', '2022-04-22 14:06:48', '2022-05-14 11:07:20', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (7, 'P650524724621383351', '-', '2022-04-21 15:05:24', '2022-05-14 11:07:09', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (8, 'P650539319449109001', '-', '2022-04-21 19:08:39', '2022-05-14 11:07:04', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (9, 'P650383653706249041', '-', '2022-04-19 23:54:13', '2022-05-14 11:06:56', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (10, 'P650204635265986711', '-', '2022-04-17 22:10:35', '2022-05-04 20:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-16 18:24:33');
INSERT INTO `s_xhs_order_settle` VALUES (11, 'P650354860921382131', '-', '2022-04-19 15:54:20', '2022-05-21 13:33:24', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:21');
INSERT INTO `s_xhs_order_settle` VALUES (12, 'P650350589611937961', '-', '2022-04-19 14:43:09', '2022-05-21 13:33:23', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:24');
INSERT INTO `s_xhs_order_settle` VALUES (13, 'P650267146717991681', '-', '2022-04-18 15:32:26', '2022-05-21 13:03:39', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (14, 'P650192591567693891', '-', '2022-04-17 18:49:51', '2022-05-21 13:03:32', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (15, 'P650198151453596501', '-', '2022-04-17 20:22:31', '2022-05-21 13:03:32', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (16, 'P650179651361905981', '-', '2022-04-17 15:14:11', '2022-05-21 13:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (17, 'P650179468150156771', '-', '2022-04-17 15:11:08', '2022-05-21 13:03:28', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (18, 'P651365028037549841', '-', '2022-05-01 08:30:28', '2022-05-21 10:46:13', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (19, 'P650167408349459561', '-', '2022-04-17 11:50:08', '2022-05-20 11:03:23', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (20, 'P650171958868691791', '-', '2022-04-17 13:05:58', '2022-05-20 11:03:23', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (21, 'P650171459360675721', '-', '2022-04-17 12:57:39', '2022-05-20 11:03:23', '结算入账', '店铺余额', 18.67, 19.80, 19.80, 0.00, 0.00, 0.00, 0.00, -0.99, -0.14, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (22, 'P650158023327622691', '-', '2022-04-17 09:13:43', '2022-05-20 11:03:22', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (23, 'P650160674547164571', '-', '2022-04-17 09:57:54', '2022-05-20 11:03:22', '结算入账', '店铺余额', 9.33, 9.90, 9.90, 0.00, 0.00, 0.00, 0.00, -0.50, -0.07, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (24, 'P651244863186803631', '-', '2022-04-29 23:07:43', '2022-05-20 10:40:04', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (25, 'P651300639424889331', '-', '2022-04-30 14:37:19', '2022-05-20 10:12:45', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (26, 'P650152018833195301', '-', '2022-04-17 07:33:38', '2022-05-17 21:31:30', '结算入账', '店铺余额', 18.67, 19.80, 19.80, 0.00, 0.00, 0.00, 0.00, -0.99, -0.14, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (27, 'P651060035066681871', '-', '2022-04-27 19:47:15', '2022-05-17 11:39:19', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (28, 'P651028113417290361', '-', '2022-04-27 10:55:13', '2022-05-17 11:39:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-21 21:18:25');
INSERT INTO `s_xhs_order_settle` VALUES (29, 'P651498332963710841', '-', '2022-05-02 21:32:12', '2022-05-22 10:18:31', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-22 10:23:53');
INSERT INTO `s_xhs_order_settle` VALUES (30, 'P651443046272776771', '-', '2022-05-02 06:10:46', '2022-05-22 10:18:08', '结算入账', '店铺余额', 24.33, 25.80, 25.80, 0.00, 0.00, 0.00, 0.00, -1.29, -0.18, 0.00, 0.00, '', '2022-05-22 10:23:53');
INSERT INTO `s_xhs_order_settle` VALUES (31, 'P650383282927259341', '-', '2022-04-19 23:48:02', '2022-05-22 12:03:59', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (32, 'P650340391360421501', '-', '2022-04-19 11:53:11', '2022-05-22 12:03:58', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (33, 'P650335287016742621', '-', '2022-04-19 10:28:07', '2022-05-22 12:03:57', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (34, 'P650278762052431911', '-', '2022-04-18 18:46:02', '2022-05-22 12:03:51', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (35, 'P650293854639134681', '-', '2022-04-18 22:57:34', '2022-05-22 12:03:51', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (36, 'P650263987743987401', '-', '2022-04-18 14:39:47', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (37, 'P650266326386558551', '-', '2022-04-18 15:18:46', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (38, 'P650273202701600891', '-', '2022-04-18 17:13:22', '2022-05-22 12:03:50', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (39, 'P650251254103670461', '-', '2022-04-18 11:07:34', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (40, 'P650239311288237481', '-', '2022-04-18 07:48:31', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (41, 'P650250238123400311', '-', '2022-04-18 10:50:38', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (42, 'P650251473635210141', '-', '2022-04-18 11:11:13', '2022-05-22 11:33:02', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (43, 'P650254633938588711', '-', '2022-04-18 12:03:53', '2022-05-22 11:33:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (44, 'P650258991490298871', '-', '2022-04-18 13:16:31', '2022-05-22 11:33:01', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (45, 'P650253875620338531', '-', '2022-04-18 11:51:15', '2022-05-22 11:33:00', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:00');
INSERT INTO `s_xhs_order_settle` VALUES (46, 'P650205653267210151', '-', '2022-04-17 22:27:33', '2022-05-22 11:32:55', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (47, 'P650204286108172701', '-', '2022-04-17 22:04:46', '2022-05-22 11:32:55', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (48, 'P650201514407536671', '-', '2022-04-17 21:18:34', '2022-05-22 11:32:54', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-22 19:21:01');
INSERT INTO `s_xhs_order_settle` VALUES (49, 'P652107941351324701', '-', '2022-05-09 22:52:21', '2022-05-30 11:35:41', '结算入账', '店铺余额', 18.76, 19.90, 19.90, 0.00, 0.00, 0.00, 0.00, -1.00, -0.14, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (50, 'P652108040599855541', '-', '2022-05-09 22:54:00', '2022-05-30 11:05:58', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (51, 'P652331849177761981', '-', '2022-05-12 13:04:09', '2022-05-28 22:36:10', '结算入账', '店铺余额', 12.23, 12.90, 2.90, 0.00, 10.00, 0.00, 0.00, -0.65, -0.02, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (52, 'P652006673545485701', '-', '2022-05-08 18:44:33', '2022-05-28 14:09:22', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (53, 'P651941129187172881', '-', '2022-05-08 00:32:09', '2022-05-28 14:08:56', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (54, 'P651877675430739391', '-', '2022-05-07 06:54:35', '2022-05-27 17:37:38', '结算入账', '店铺余额', 28.21, 29.90, 26.91, 0.00, 2.99, 0.00, 0.00, -1.50, -0.19, 0.00, 0.00, '', '2022-05-31 21:35:07');
INSERT INTO `s_xhs_order_settle` VALUES (55, 'P651745605368708111', '-', '2022-05-05 18:13:25', '2022-05-26 11:04:34', '结算入账', '店铺余额', 12.16, 12.90, 12.90, 0.00, 0.00, 0.00, 0.00, -0.65, -0.09, 0.00, 0.00, '', '2022-05-31 21:35:07');

-- ----------------------------
-- Table structure for s_xhs_refund
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_refund`;
CREATE TABLE `s_xhs_refund`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `returnsId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '小红书店铺售后id',
  `returnType` int(0) NOT NULL COMMENT '退货类型 1-退货退款, 2-换货, 3:仅退款(old) 4:仅退款(new) 理论上不会有3出现 5:未发货仅退款',
  `reasonId` int(0) DEFAULT NULL COMMENT '售后原因id',
  `shopId` int(0) NOT NULL,
  `reason` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '售后原因说明',
  `status` int(0) NOT NULL COMMENT '售后状态 1:待审核 2:待用户寄回 3:待收货 4:完成 5:取消 6:关闭 9:拒绝 9999:删除',
  `subStatus` int(0) DEFAULT NULL COMMENT '售后子状态 301-待审核 302-快递已签收 304-收货异常',
  `receiveAbnormalType` int(0) DEFAULT NULL COMMENT '收货异常类型',
  `packageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单id',
  `exchangePackageId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '换货订单id',
  `createdTime` bigint(0) NOT NULL DEFAULT 0,
  `returnExpressNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `returnExpressCompany` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `returnAddress` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `shipNeeded` int(0) NOT NULL DEFAULT 0 COMMENT '是否需要寄回 1-需要 0-不需要',
  `refunded` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否已退款',
  `refundStatus` int(0) NOT NULL DEFAULT 0 COMMENT '退款状态 108触发退款 1退款中 3退款失败 2退款成功 401已取消 101已创建 201待审核 301审核通过 302审核不通过 402自动关闭',
  `refundTime` bigint(0) NOT NULL DEFAULT 0 COMMENT '退款时间',
  `fillExpressTime` bigint(0) NOT NULL DEFAULT 0,
  `expressSignTime` bigint(0) NOT NULL DEFAULT 0,
  `refundFee` double NOT NULL DEFAULT 0,
  `returnExpressRefundable` int(0) NOT NULL DEFAULT 0,
  `returnExpressRefunded` int(0) NOT NULL DEFAULT 0,
  `expectRefundFee` double NOT NULL DEFAULT 0,
  `autoReceiveDeadline` bigint(0) NOT NULL DEFAULT 0 COMMENT '自动确认收货时间',
  `updateTime` bigint(0) NOT NULL DEFAULT 0,
  `erpSendStatus` int(0) NOT NULL DEFAULT 0 COMMENT 'erp系统发货状态（判断是否出库是否需要拦截）0未处理2已出库',
  `returnExpressCompanyCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '退货快递公司编号',
  `createOn` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifyOn` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单退款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_xhs_refund
-- ----------------------------
INSERT INTO `s_xhs_refund` VALUES (1, 'R8940930165177103', 5, 600094, 21, '多拍/拍错/不想要', 4, 201, 0, 'P650254826789409301', NULL, 1650365177103, NULL, NULL, NULL, -1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1650449230818, 0, NULL, '2022-04-20 12:28:11', '2022-04-20 18:07:10');
INSERT INTO `s_xhs_refund` VALUES (2, 'R7231546168933888', 5, 600097, 21, '发货时间太长', 4, 201, 0, 'P650262840072315461', NULL, 1650768933888, NULL, NULL, NULL, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1650772500834, 2, NULL, '2022-05-01 19:53:14', '2022-05-02 11:11:18');

-- ----------------------------
-- Table structure for s_xhs_refund_item
-- ----------------------------
DROP TABLE IF EXISTS `s_xhs_refund_item`;
CREATE TABLE `s_xhs_refund_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `refundId` bigint(0) NOT NULL COMMENT '外键',
  `itemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '商品id',
  `itemName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `boughtCount` int(0) DEFAULT NULL,
  `appliedCount` int(0) DEFAULT NULL,
  `returnedCount` int(0) DEFAULT NULL,
  `refundedCount` int(0) DEFAULT NULL,
  `returnPrice` int(0) DEFAULT NULL,
  `exchangeItemId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `exchangeItemName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `exchangeItemImage` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `skucode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `exchangeSkucode` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小红书订单退款明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scm_purchase_contract
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_contract`;
CREATE TABLE `scm_purchase_contract`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(0) DEFAULT NULL COMMENT '供应商id',
  `bill_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '单据编号',
  `contractNo` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `userId` smallint(0) DEFAULT 0 COMMENT '制单人id',
  `userName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '制单人',
  `transType` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '交易类型:BUY购货 BUYR退货 SALE销售 SALER退销 OTHER其他入库',
  `transTypeName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '交易类型名称',
  `totalAmount` decimal(10, 2) DEFAULT NULL COMMENT '购货总金额',
  `disRate` double DEFAULT 0 COMMENT '整单折扣率',
  `disAmount` double DEFAULT 0 COMMENT '整单折扣金额',
  `amount` double DEFAULT 0 COMMENT '折扣后金额',
  `totalDiscount` double DEFAULT 0 COMMENT '总折扣（计算商品折扣和整单折扣之和）',
  `totalQuantity` bigint(0) DEFAULT 0 COMMENT '总数量',
  `qualifiedQuantity` bigint(0) DEFAULT 0 COMMENT '合格数量',
  `inQuantity` bigint(0) DEFAULT 0 COMMENT '已入库数量(已出库数量)',
  `rpAmount` double DEFAULT 0 COMMENT '本次付款',
  `arrears` double DEFAULT 0 COMMENT '本次欠款',
  `freight` double DEFAULT 0 COMMENT '运费',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `billType` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'PO采购订单 OI其他入库 PUR采购入库 BAL初期余额',
  `billStatus` tinyint(1) DEFAULT 0 COMMENT '订单状态 0待审核1正常2已作废3已入库 11已验货',
  `isDelete` tinyint(1) DEFAULT 0 COMMENT '1删除  0正常',
  `checkName` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '采购单审核人',
  `checked` tinyint(1) DEFAULT 0 COMMENT '采购单审核状态0待审核1已审核',
  `createTime` bigint(0) DEFAULT NULL COMMENT '创建时间',
  `modifyTime` bigint(0) DEFAULT NULL COMMENT '更新时间',
  `salesId` smallint(0) DEFAULT NULL,
  `customerFree` double DEFAULT 0 COMMENT '客户承担费用',
  `hxStateCode` tinyint(0) DEFAULT 0 COMMENT '核销状态 0未付款  1部分付款  2全部付款',
  `hxAmount` double DEFAULT 0 COMMENT '本次核销金额',
  `payment` double DEFAULT 0 COMMENT '本次预收款',
  `srcOrderNo` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '订单编号',
  `srcOrderId` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '订单id',
  `logisticsNo` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '快递物流单号（）',
  `logisticsCompany` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流公司',
  `logisticsCompanyCode` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流公司代码',
  `logisticsNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '物流单号',
  `locationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '仓库id多个,分割',
  `inLocationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '调入仓库ID多个,分割',
  `outLocationId` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '调出仓库ID多个,分割',
  `serialno` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '序列号',
  `checkoutName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '检验人',
  `checkoutTime` bigint(0) DEFAULT 0 COMMENT '检验时间',
  `checkoutStatus` int(0) DEFAULT 0 COMMENT '0 未检验  1已检验',
  `qualifiedStatus` int(0) DEFAULT 0 COMMENT '0为合格数量为0,1为合格数量不为0',
  `stockInName` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '入库人',
  `stockInTime` bigint(0) DEFAULT 0 COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for scm_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order`;
CREATE TABLE `scm_purchase_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(0) NOT NULL COMMENT '供应商id',
  `order_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_date` date NOT NULL COMMENT '订单日期',
  `order_time` bigint(0) NOT NULL COMMENT '订单创建时间',
  `order_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `ship_amount` decimal(6, 2) NOT NULL COMMENT '物流费用',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 0待审核1已审核101供应商已确认102供应商已发货2已收货3已入库',
  `audit_user` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '采购单审核人',
  `audit_time` bigint(0) DEFAULT 0 COMMENT '审核时间',
  `supplier_confirm_time` datetime(0) DEFAULT NULL COMMENT '供应商确认时间',
  `supplier_delivery_time` datetime(0) DEFAULT NULL COMMENT '供应商发货时间',
  `received_time` datetime(0) DEFAULT NULL COMMENT '收货时间',
  `stock_in_time` datetime(0) DEFAULT NULL COMMENT '入库时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 470 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_order
-- ----------------------------
INSERT INTO `scm_purchase_order` VALUES (466, 33, 'PUR20240116144408', '2024-01-16', 1705387448, 190.00, 0.00, NULL, 3, '启航', 1705387461, '2024-01-16 14:44:30', '2024-01-16 14:49:49', '2024-01-16 00:00:00', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:44:09', 'admin', '2024-01-16 14:50:58');
INSERT INTO `scm_purchase_order` VALUES (467, 33, 'PUR20240128113656', '2024-01-28', 1706413016, 42.00, 10.00, NULL, 102, '启航', 1706413030, '2024-01-28 11:42:19', '2024-01-28 12:07:32', NULL, NULL, 'admin', '2024-01-28 11:36:56', 'admin', '2024-01-28 12:07:32');
INSERT INTO `scm_purchase_order` VALUES (468, 31, 'PUR20240424162152', '2024-04-24', 1713946912, 420.00, 12.00, NULL, 3, 'qh', 1713946921, '2024-04-24 16:22:14', '2024-04-24 16:22:40', '2024-05-25 00:00:00', '2024-05-25 09:40:04', 'admin', '2024-04-24 16:21:52', 'admin', '2024-05-25 09:40:04');
INSERT INTO `scm_purchase_order` VALUES (469, 33, 'PUR20240525093505', '2024-05-25', 1716600905, 210.00, 0.00, NULL, 3, 'q', 1716600916, '2024-05-25 09:35:21', '2024-05-25 09:35:36', '2024-05-25 00:00:00', '2024-05-25 09:35:57', 'admin', '2024-05-25 09:35:06', 'admin', '2024-05-25 09:35:57');

-- ----------------------------
-- Table structure for scm_purchase_order_cost
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_cost`;
CREATE TABLE `scm_purchase_order_cost`  (
  `id` bigint(0) NOT NULL COMMENT '采购单ID（主键）',
  `order_amount` decimal(10, 2) DEFAULT NULL COMMENT '采购单金额',
  `order_date` date DEFAULT NULL COMMENT '采购订单日期',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '采购订单编号',
  `order_spec_unit` int(0) DEFAULT NULL COMMENT '采购订单商品规格数',
  `order_goods_unit` int(0) DEFAULT NULL COMMENT '采购订单商品数',
  `order_spec_unit_total` int(0) DEFAULT NULL COMMENT '采购订单总件数',
  `actual_amount` decimal(10, 2) DEFAULT NULL COMMENT '实际金额',
  `freight` decimal(6, 2) DEFAULT NULL COMMENT '运费',
  `confirm_user` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '确认人',
  `confirm_time` datetime(0) DEFAULT NULL COMMENT '确认时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `pay_amount` decimal(10, 2) DEFAULT NULL COMMENT '已支付金额',
  `pay_time` datetime(0) DEFAULT NULL COMMENT '支付时间',
  `pay_count` int(0) DEFAULT NULL COMMENT '支付次数',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '说明',
  `status` int(0) DEFAULT NULL COMMENT '状态（0未支付1已支付）',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购订单费用确认表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_order_cost
-- ----------------------------
INSERT INTO `scm_purchase_order_cost` VALUES (466, 190.00, '2024-01-16', 'PUR20240116144408', 1, 1, 10, 190.00, 0.00, '启航', '2024-01-16 00:00:00', 'admin', 190.00, NULL, 0, NULL, 0, 'admin', '2024-04-17 14:02:43');
INSERT INTO `scm_purchase_order_cost` VALUES (468, 420.00, '2024-04-24', 'PUR20240424162152', 1, 1, 10, 420.00, 0.00, 'q', '2024-04-24 00:00:00', 'admin', 12.00, '2024-04-24 00:00:00', 0, '12', 0, 'admin', '2024-04-24 16:23:47');
INSERT INTO `scm_purchase_order_cost` VALUES (469, 210.00, '2024-05-25', 'PUR20240525093505', 1, 1, 10, 210.00, 0.00, 'q', '2024-05-25 09:35:21', 'admin', 0.00, NULL, 0, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for scm_purchase_order_item
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_item`;
CREATE TABLE `scm_purchase_order_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(0) DEFAULT 0 COMMENT '订单id',
  `order_no` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '订单编号',
  `transType` char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0' COMMENT '150501采购 150502退货',
  `amount` double DEFAULT 0 COMMENT '购货金额',
  `order_date` date DEFAULT NULL COMMENT '订单日期',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '备注',
  `goods_id` bigint(0) DEFAULT 0 COMMENT '商品ID',
  `goods_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名称',
  `spec_id` bigint(0) DEFAULT 0 COMMENT '商品规格id',
  `spec_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品规格编码',
  `color_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '颜色',
  `color_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图片',
  `size_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '尺码',
  `style_value` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '款式',
  `price` decimal(8, 2) DEFAULT 0.00 COMMENT '单价',
  `dis_amount` decimal(8, 2) DEFAULT 0.00 COMMENT '折扣额',
  `dis_rate` decimal(8, 2) DEFAULT 0.00 COMMENT '折扣率',
  `quantity` bigint(0) NOT NULL DEFAULT 0 COMMENT '数量(采购单据)',
  `inQty` bigint(0) NOT NULL DEFAULT 0 COMMENT '已入库数量',
  `locationId` int(0) DEFAULT NULL COMMENT '入库的仓库id',
  `is_delete` tinyint(1) DEFAULT 0 COMMENT '1删除 0正常',
  `status` int(0) DEFAULT 0 COMMENT '状态（同billStatus）0待审核1正常2已作废3已入库',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`transType`) USING BTREE,
  INDEX `billdate`(`order_date`) USING BTREE,
  INDEX `invId`(`goods_id`) USING BTREE,
  INDEX `transType`(`transType`) USING BTREE,
  INDEX `iid`(`order_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1966 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '采购订单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_order_item
-- ----------------------------
INSERT INTO `scm_purchase_order_item` VALUES (1962, 466, 'PUR20240116144408', 'Purchase', 190, '2024-01-16', '', 9, 'HN8026', 'HN8026牛仔短裤', 32, '2720210080260105', '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', '2XL', '', 19.00, 0.00, 0.00, 10, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1963, 467, 'PUR20240128113656', 'Purchase', 42, '2024-01-28', '', 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 438, 'HNP1825004', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 'XL', '', 21.00, 0.00, 0.00, 2, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1964, 468, 'PUR20240424162152', 'Purchase', 420, '2024-04-24', '', 68, 'JKL3112', 'JKL3112松紧腰束脚哈伦裤', 1327, 'JKL31120705', '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', '2XL', '', 42.00, 0.00, 0.00, 10, 0, NULL, 0, 0);
INSERT INTO `scm_purchase_order_item` VALUES (1965, 469, 'PUR20240525093505', 'Purchase', 210, '2024-05-25', '', 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 439, 'HNP1825005', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', '2XL', '', 21.00, 0.00, 0.00, 10, 0, NULL, 0, 0);

-- ----------------------------
-- Table structure for scm_purchase_order_payable
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_payable`;
CREATE TABLE `scm_purchase_order_payable`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(0) NOT NULL COMMENT '供应商id',
  `supplier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '供应商名称',
  `amount` decimal(10, 2) NOT NULL COMMENT '应付金额',
  `date` date NOT NULL COMMENT '应付日期',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '发票号码',
  `purchase_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '采购单号',
  `purchase_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '采购说明',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(0) NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime(0) DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购单应付款' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_order_payable
-- ----------------------------
INSERT INTO `scm_purchase_order_payable` VALUES (1, 33, '中山裤豪', 52.00, '2024-01-28', NULL, 'PUR20240128113656', '{采购商品总数量:2,不同款式:1,不同SKU:1,商品总价:42.00,运费:10}', NULL, 0, '2024-01-28 12:07:32', 'admin', NULL, NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (2, 31, '中山市金客隆服饰有限公司', 432.00, '2024-04-24', NULL, 'PUR20240424162152', '{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:420.00,运费:12}', '1', 0, '2024-04-24 16:22:40', 'admin', '2024-04-24 17:20:49', NULL);
INSERT INTO `scm_purchase_order_payable` VALUES (3, 33, '中山裤豪', 210.00, '2024-05-25', NULL, 'PUR20240525093505', '{采购商品总数量:10,不同款式:1,不同SKU:1,商品总价:210.00,运费:0}', NULL, 0, '2024-05-25 09:35:36', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for scm_purchase_order_ship
-- ----------------------------
DROP TABLE IF EXISTS `scm_purchase_order_ship`;
CREATE TABLE `scm_purchase_order_ship`  (
  `id` bigint(0) NOT NULL COMMENT '采购单ID（主键）',
  `ship_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流公司',
  `ship_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '物流单号',
  `freight` decimal(6, 0) DEFAULT NULL COMMENT '运费',
  `ship_time` datetime(0) DEFAULT NULL COMMENT '发货时间',
  `receipt_time` datetime(0) DEFAULT NULL COMMENT '收货时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `status` int(0) DEFAULT NULL COMMENT '状态（0未收货1已收货2已入库）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '说明',
  `back_count` int(0) DEFAULT NULL COMMENT '退回数量',
  `stock_in_time` datetime(0) DEFAULT NULL COMMENT '入库时间',
  `stock_in_count` int(0) DEFAULT NULL COMMENT '入库数量',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `order_date` date DEFAULT NULL COMMENT '采购订单日期',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '采购订单编号',
  `order_spec_unit` int(0) DEFAULT NULL COMMENT '采购订单商品规格数',
  `order_goods_unit` int(0) DEFAULT NULL COMMENT '采购订单商品数',
  `order_spec_unit_total` int(0) DEFAULT NULL COMMENT '采购订单总件数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '采购订单物流表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_purchase_order_ship
-- ----------------------------
INSERT INTO `scm_purchase_order_ship` VALUES (466, '菜鸟速递', 'CN223533300022', 0, '2024-01-16 00:00:00', '2024-01-16 00:00:00', 'admin', '2024-01-16 14:49:49', 2, NULL, 0, '2024-01-16 14:50:58', 0, 'admin', '2024-01-16 14:50:58', '2024-01-16', 'PUR20240116144408', 1, 1, 10);
INSERT INTO `scm_purchase_order_ship` VALUES (467, '菜鸟速递', 'CN345565767', 10, '2024-01-28 00:00:00', NULL, 'admin', '2024-01-28 12:07:32', 0, NULL, 0, NULL, 0, NULL, NULL, '2024-01-28', 'PUR20240128113656', 1, 1, 2);
INSERT INTO `scm_purchase_order_ship` VALUES (468, '菜鸟速递', 'SF232323', 12, '2024-04-24 00:00:00', '2024-05-25 00:00:00', 'admin', '2024-04-24 16:22:40', 2, '11111', 0, '2024-05-25 09:40:04', 0, 'admin', '2024-05-25 09:40:04', '2024-04-24', 'PUR20240424162152', 1, 1, 10);
INSERT INTO `scm_purchase_order_ship` VALUES (469, '菜鸟速递', 'qdd', 0, '2024-05-25 00:00:00', '2024-05-25 00:00:00', 'admin', '2024-05-25 09:35:36', 2, '2', 0, '2024-05-25 09:35:57', 0, 'admin', '2024-05-25 09:35:57', '2024-05-25', 'PUR20240525093505', 1, 1, 10);

-- ----------------------------
-- Table structure for scm_supplier
-- ----------------------------
DROP TABLE IF EXISTS `scm_supplier`;
CREATE TABLE `scm_supplier`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商名称',
  `number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '供应商编码',
  `taxRate` double DEFAULT 0 COMMENT '税率',
  `amount` double DEFAULT 0 COMMENT '期初应付款',
  `periodMoney` double DEFAULT 0 COMMENT '期初预付款',
  `difMoney` double DEFAULT 0 COMMENT '初期往来余额',
  `beginDate` date DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '职位',
  `linkMan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系人',
  `contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '联系方式',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '市',
  `county` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '区县',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '收货地址详情',
  `pinYin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `disable` tinyint(1) DEFAULT 0 COMMENT '0启用   1禁用',
  `isDelete` tinyint(1) DEFAULT 0 COMMENT '0正常 1删除',
  `purchaserName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分管采购员',
  `createTime` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scm_supplier
-- ----------------------------
INSERT INTO `scm_supplier` VALUES (1, '自营仓库', 'A0001', 0, 0, 0, 0, NULL, '', '', NULL, '15000000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:02');
INSERT INTO `scm_supplier` VALUES (26, '韩牛服饰', 'HN', 0, 0, 0, 0, NULL, '', '', NULL, '13249570000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (28, '广州衣菲妮服装厂', 'YIFEINI', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 1, 1, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (29, '中山欧熙妮服饰有限公司', 'ZSOXNFS', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:03');
INSERT INTO `scm_supplier` VALUES (31, '中山市金客隆服饰有限公司', 'JKL', 0, 0, 0, 0, NULL, '', '', NULL, '13600000000', NULL, NULL, NULL, NULL, '', 0, 0, NULL, '2023-12-29 11:01:04');
INSERT INTO `scm_supplier` VALUES (33, '中山裤豪', 'ZSKH', 0, 0, 0, 0, NULL, '', '', NULL, '', NULL, NULL, NULL, '中山市沙溪镇水牛城三区二楼35-38卡', '', 0, 0, NULL, '2023-12-29 11:01:04');

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
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '1', '1', '1', 'admin', '2023-08-07 19:31:38', 'admin', '2024-01-28 13:30:18', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-08-07 19:31:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '0/30 * * * * ?', '1', '1', '1', 'admin', '2024-01-28 13:44:43', '', '2024-01-28 13:47:13', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：2毫秒', '0', '', '2024-01-28 13:30:00');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2024-01-28 13:30:10');
INSERT INTO `sys_job_log` VALUES (3, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：2毫秒', '0', '', '2024-01-28 13:45:00');
INSERT INTO `sys_job_log` VALUES (4, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:45:30');
INSERT INTO `sys_job_log` VALUES (5, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：2毫秒', '0', '', '2024-01-28 13:46:00');
INSERT INTO `sys_job_log` VALUES (6, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:46:30');
INSERT INTO `sys_job_log` VALUES (7, '库存存货日报生成', 'SYSTEM', 'inventoryReportTask.run()', '库存存货日报生成 总共耗时：0毫秒', '0', '', '2024-01-28 13:47:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 286 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (1, '系统管理', 'oms', 0, 99, '/system', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
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
INSERT INTO `sys_menu` VALUES (2029, '店铺退款管理', 'oms', 7, 2, 'shop_refund', 'shop/refund/index', '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-12-31 17:29:03', 'admin', '2024-05-04 18:57:32', '');
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
INSERT INTO `sys_menu` VALUES (2054, '退款管理', 'oms', 7, 1, 'refund_list', 'sale/refund', NULL, 1, 0, 'C', '0', '0', '', 'size', 'admin', '2024-01-03 14:24:36', 'admin', '2024-05-05 20:14:23', '');
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
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 至简新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-08-07 19:31:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 至简系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-08-07 19:31:38', '', NULL, '管理员');

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
) ENGINE = InnoDB AUTO_INCREMENT = 449 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '启航', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-06-04 13:53:34', 'admin', '2023-08-07 19:31:37', '', '2024-06-04 13:53:33', '管理员');
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

-- ----------------------------
-- Table structure for wms_goods_bad_stock
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_bad_stock`;
CREATE TABLE `wms_goods_bad_stock`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `goodsId` int(0) NOT NULL COMMENT '商品id',
  `specId` int(0) NOT NULL COMMENT '商品规格id',
  `specNumber` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码（唯一）',
  `sourceId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '来源ID（type==1时 order_send_return主键id）',
  `type` int(0) NOT NULL COMMENT '类型（1退货报损3待退还供应商）',
  `locationId` int(0) NOT NULL DEFAULT 0 COMMENT '仓位',
  `quantity` int(0) NOT NULL DEFAULT 0 COMMENT '数量',
  `lossAmount` double NOT NULL DEFAULT 0 COMMENT '损失金额（最大成本）',
  `isDelete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `result` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '处理结果',
  `resultTime` datetime(0) DEFAULT NULL COMMENT '处理时间',
  `reason` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '理由',
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否处理0未处理1已处理',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifyTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '不良品库存' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_goods_bad_stock
-- ----------------------------
INSERT INTO `wms_goods_bad_stock` VALUES (1, 13, 88, '28202206810101', '20', 1, 0, 1, 29, 0, '计入损失', '2022-10-03 17:39:32', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-10-03 17:39:32', '2022-10-03 17:39:32');
INSERT INTO `wms_goods_bad_stock` VALUES (2, 33, 497, 'HN08017503', '76', 1, 0, 1, 28, 0, '计入损失', '2022-10-16 18:00:00', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-10-16 18:00:00', '2022-10-16 18:00:00');
INSERT INTO `wms_goods_bad_stock` VALUES (3, 33, 502, 'HN08012903', '249', 1, 0, 1, 28, 0, '计入损失', '2022-11-07 09:42:33', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-11-07 09:42:33', '2022-11-07 09:42:33');
INSERT INTO `wms_goods_bad_stock` VALUES (4, 15, 119, '28202106610102', '174', 1, 0, 1, 29, 0, '计入损失', '2022-11-07 09:43:20', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-11-07 09:43:20', '2022-11-07 09:43:20');
INSERT INTO `wms_goods_bad_stock` VALUES (5, 37, 558, 'HN1062904', '327', 1, 0, 1, 31, 0, '计入损失', '2022-12-08 10:08:14', '货物损坏，供应商拒收，消费者退款成功', 1, '2022-12-08 10:08:14', '2022-12-08 10:08:14');

-- ----------------------------
-- Table structure for wms_goods_bad_stock_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_goods_bad_stock_log`;
CREATE TABLE `wms_goods_bad_stock_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `stockId` bigint(0) NOT NULL COMMENT '商品id',
  `specId` int(0) NOT NULL COMMENT '商品规格id',
  `locationId` int(0) NOT NULL COMMENT '所在仓位',
  `type` int(0) NOT NULL COMMENT '类型1入库2出库',
  `quantity` bigint(0) NOT NULL DEFAULT 0 COMMENT '数量',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `createTime` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '不良品库存日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_goods_bad_stock_log
-- ----------------------------
INSERT INTO `wms_goods_bad_stock_log` VALUES (1, 1, 88, 0, 1, 1, '退货不良品入库SKU :28202206810101退货单号:BAD221003173932494', '2022-10-03 17:39:32');
INSERT INTO `wms_goods_bad_stock_log` VALUES (2, 2, 497, 0, 1, 1, '退货不良品入库SKU :HN08017503退货单号:BAD221016180000005', '2022-10-16 18:00:00');
INSERT INTO `wms_goods_bad_stock_log` VALUES (3, 3, 502, 0, 1, 1, '退货不良品入库SKU :HN08012903退货单号:BAD221107094233114', '2022-11-07 09:42:33');
INSERT INTO `wms_goods_bad_stock_log` VALUES (4, 4, 119, 0, 1, 1, '退货不良品入库SKU :28202106610102退货单号:BAD221107094320707', '2022-11-07 09:43:20');
INSERT INTO `wms_goods_bad_stock_log` VALUES (5, 5, 558, 0, 1, 1, '退货不良品入库SKU :HN1062904退货单号:BAD221208100814778', '2022-12-08 10:08:14');

-- ----------------------------
-- Table structure for wms_stock_in_entry
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_in_entry`;
CREATE TABLE `wms_stock_in_entry`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stock_in_num` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '入库单据编号',
  `source_no` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '来源单号',
  `source_id` bigint(0) DEFAULT NULL COMMENT '来源单id',
  `source_type` int(0) NOT NULL COMMENT '来源类型（1采购订单2退货订单）',
  `source_goods_unit` int(0) DEFAULT NULL COMMENT '采购订单商品数',
  `source_spec_unit_total` int(0) DEFAULT NULL COMMENT '采购订单总件数',
  `source_spec_unit` int(0) DEFAULT NULL COMMENT '采购订单商品规格数',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `stock_in_operator_id` int(0) DEFAULT NULL COMMENT '操作入库人id',
  `stock_in_operator` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '操作入库人',
  `stock_in_time` datetime(0) DEFAULT NULL COMMENT '入库时间',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '状态（0待入库1部分入库2全部入库）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794181606514589699 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '入库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_in_entry
-- ----------------------------
INSERT INTO `wms_stock_in_entry` VALUES (8, '20240116145057', 'PUR20240116144408', 466, 1, 1, 10, 1, NULL, 1, 'admin', '2024-01-16 00:00:00', 2, 'admin', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:52:10');
INSERT INTO `wms_stock_in_entry` VALUES (1794180570081099778, '20240525093556', 'PUR20240525093505', 469, 1, 1, 10, 1, NULL, NULL, NULL, NULL, 0, 'admin', '2024-05-25 09:35:57', NULL, NULL);
INSERT INTO `wms_stock_in_entry` VALUES (1794181606514589698, '20240525094003', 'PUR20240424162152', 468, 1, 1, 10, 1, NULL, 1, 'admin', '2024-05-25 10:19:41', 1, 'admin', '2024-05-25 09:40:04', 'admin', '2024-05-25 10:36:15');

-- ----------------------------
-- Table structure for wms_stock_in_entry_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_in_entry_item`;
CREATE TABLE `wms_stock_in_entry_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `entry_id` bigint(0) NOT NULL COMMENT '入库单id',
  `source_type` int(0) DEFAULT NULL COMMENT '来源类型（1采购订单2退货订单）',
  `source_id` bigint(0) DEFAULT NULL COMMENT '来源单id',
  `source_item_id` bigint(0) NOT NULL COMMENT '来源单itemId',
  `goods_id` bigint(0) NOT NULL COMMENT '商品id',
  `goods_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品编码',
  `goods_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品名称',
  `spec_id` bigint(0) NOT NULL COMMENT '商品规格id',
  `spec_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '商品规格编码',
  `color_value` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '颜色',
  `color_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '图片',
  `size_value` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '尺码',
  `style_value` varchar(55) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '款式',
  `original_quantity` bigint(0) DEFAULT NULL COMMENT '原始数量',
  `in_quantity` bigint(0) NOT NULL COMMENT '入库数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '备注',
  `location_id` int(0) DEFAULT NULL COMMENT '入库仓位',
  `location_num` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '入库仓位编码',
  `status` int(0) DEFAULT 0 COMMENT '状态（0待入库1部分入库2全部入库）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIndex`(`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794181606552338434 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '入库单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_in_entry_item
-- ----------------------------
INSERT INTO `wms_stock_in_entry_item` VALUES (4, 8, 1, 466, 1962, 9, 'HN8026', 'HN8026牛仔短裤', 32, '2720210080260105', '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', '2XL', '', 10, 10, '', NULL, NULL, 2, 'admin', '2024-01-16 14:50:58', 'admin', '2024-01-16 14:52:10');
INSERT INTO `wms_stock_in_entry_item` VALUES (1794180570152402946, 1794180570081099778, 1, 469, 1965, 29, 'HNP182', 'HNP182弹力紧身贴标牛仔短裤女ins', 439, 'HNP1825005', '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', '2XL', '', 10, 0, '', NULL, NULL, 0, 'admin', '2024-05-25 09:35:57', NULL, NULL);
INSERT INTO `wms_stock_in_entry_item` VALUES (1794181606552338433, 1794181606514589698, 1, 468, 1964, 68, 'JKL3112', 'JKL3112松紧腰束脚哈伦裤', 1327, 'JKL31120705', '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', '2XL', '', 10, 1, '', NULL, NULL, 1, 'admin', '2024-05-25 09:40:04', 'admin', '2024-05-25 10:36:15');

-- ----------------------------
-- Table structure for wms_stock_location
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_location`;
CREATE TABLE `wms_stock_location`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货架编号',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货架名称',
  `parent_id` int(0) NOT NULL COMMENT '上级id',
  `depth` int(0) DEFAULT 1 COMMENT '层级深度1级2级3级',
  `parent_id1` int(0) NOT NULL COMMENT '一级类目id',
  `parent_id2` int(0) NOT NULL COMMENT '二级类目id',
  `address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `isDelete` int(0) NOT NULL DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仓库货架表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_location
-- ----------------------------
INSERT INTO `wms_stock_location` VALUES (1, '001', '深圳虚拟仓库', 0, 1, 0, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:10', NULL, '2022-03-07 20:06:10');
INSERT INTO `wms_stock_location` VALUES (2, 'A', 'A区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:24', NULL, '2022-03-07 20:06:24');
INSERT INTO `wms_stock_location` VALUES (3, 'B', 'B区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:38', NULL, '2022-03-07 20:06:38');
INSERT INTO `wms_stock_location` VALUES (4, 'C', 'C区', 1, 2, 1, 0, NULL, NULL, 0, 'admin', '2022-03-07 20:06:47', NULL, '2022-03-07 20:06:47');
INSERT INTO `wms_stock_location` VALUES (5, 'A01-1-01', 'A01-1-01', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (6, 'A01-1-02', 'A01-1-02', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (7, 'A01-1-03', 'A01-1-03', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (8, 'A01-1-04', 'A01-1-04', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (9, 'A01-1-05', 'A01-1-05', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (10, 'A01-1-06', 'A01-1-06', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (11, 'A01-1-07', 'A01-1-07', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (12, 'A01-1-08', 'A01-1-08', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (13, 'A01-1-09', 'A01-1-09', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (14, 'A01-1-10', 'A01-1-10', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (15, 'A01-1-11', 'A01-1-11', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (16, 'A01-1-12', 'A01-1-12', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (17, 'A01-1-13', 'A01-1-13', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (18, 'A01-1-14', 'A01-1-14', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (19, 'A01-1-15', 'A01-1-15', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');
INSERT INTO `wms_stock_location` VALUES (20, 'A01-1-16', 'A01-1-16', 2, 3, 1, 2, NULL, NULL, 0, 'admin', '2022-03-07 20:12:39', NULL, '2022-03-07 20:12:39');

-- ----------------------------
-- Table structure for wms_stock_out_entry
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry`;
CREATE TABLE `wms_stock_out_entry`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `stock_out_num` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '出库单编号',
  `source_num` varchar(35) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '来源单据号',
  `source_id` bigint(0) DEFAULT NULL COMMENT '来源单据Id',
  `stock_out_type` int(0) NOT NULL DEFAULT 1 COMMENT '出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库',
  `goods_unit` int(0) NOT NULL COMMENT '商品数',
  `spec_unit` int(0) NOT NULL COMMENT '商品规格数',
  `spec_unit_total` int(0) NOT NULL COMMENT '总件数',
  `out_total` int(0) DEFAULT NULL COMMENT '已出库数量',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `status` int(0) NOT NULL COMMENT '状态：0待出库1部分出库2全部出库',
  `print_status` int(0) NOT NULL COMMENT '打印状态：是否打印1已打印0未打印',
  `print_time` datetime(0) DEFAULT NULL COMMENT '打印时间',
  `out_time` datetime(0) DEFAULT NULL COMMENT '出库时间',
  `complete_time` datetime(0) DEFAULT NULL COMMENT '完成出库时间',
  `operator_id` int(0) DEFAULT 0 COMMENT '出库操作人userid',
  `operator_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '出库操作人',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_by` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460481933314 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_out_entry
-- ----------------------------
INSERT INTO `wms_stock_out_entry` VALUES (1785676644348735490, '202405012220056', NULL, NULL, 1, 1, 1, 1, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-01 22:24:23', '生成拣货单', '2024-05-01 22:24:22', NULL);
INSERT INTO `wms_stock_out_entry` VALUES (1786204816504958978, '202405030923075', NULL, NULL, 1, 1, 1, 1, 1, NULL, 2, 0, NULL, '2024-05-03 10:56:33', '2024-05-03 10:56:33', 1, 'admin', '2024-05-03 09:23:09', '生成拣货单', '2024-05-03 10:56:34', '出库');
INSERT INTO `wms_stock_out_entry` VALUES (1788393466709282818, '202405091020024', NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-09 10:20:04', '生成拣货单', '2024-05-09 10:20:03', NULL);
INSERT INTO `wms_stock_out_entry` VALUES (1794205460481933313, '202405251109432', NULL, NULL, 1, 1, 1, 1, 0, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, '2024-05-25 11:14:51', '生成拣货单', '2024-05-25 11:14:51', NULL);

-- ----------------------------
-- Table structure for wms_stock_out_entry_item
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry_item`;
CREATE TABLE `wms_stock_out_entry_item`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `stock_out_type` int(0) NOT NULL COMMENT '出库类型1订单拣货出库2采购退货出库3盘点出库4报损出库',
  `entry_id` bigint(0) NOT NULL COMMENT '出库单id（外键）',
  `source_order_id` bigint(0) NOT NULL COMMENT '来源订单id',
  `source_order_item_id` bigint(0) NOT NULL COMMENT '来源订单itemId出库对应的itemId，如：order_item表id、invoice_info表id',
  `source_order_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '来源订单号',
  `goods_id` int(0) NOT NULL COMMENT '商品id',
  `spec_id` int(0) NOT NULL COMMENT '商品规格id',
  `spec_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '规格编码',
  `original_quantity` bigint(0) NOT NULL COMMENT '总数量',
  `out_quantity` bigint(0) NOT NULL DEFAULT 0 COMMENT '已出库数量',
  `complete_time` datetime(0) DEFAULT NULL COMMENT '完成出库时间',
  `picked_time` datetime(0) DEFAULT NULL COMMENT '完成拣货时间',
  `status` int(0) NOT NULL DEFAULT 0 COMMENT '状态：0待出库1部分出库2全部出库',
  `create_time` datetime(0) DEFAULT NULL,
  `update_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `specIndex`(`spec_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794205460544847874 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库单明细' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_out_entry_item
-- ----------------------------
INSERT INTO `wms_stock_out_entry_item` VALUES (1785676644373901314, 1, 1785676644348735490, 38, 442, '2055782964491095876', 9, 23, '2720210080260001', 1, 0, NULL, NULL, 0, '2024-05-01 22:24:23', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1786204816504958979, 1, 1786204816504958978, 41, 1785584827112509446, '2137984935735126281', 9, 32, '2720210080260105', 1, 1, '2024-05-03 10:56:27', '2024-05-03 10:56:26', 2, '2024-05-03 09:23:09', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1788393466763808769, 1, 1788393466709282818, 51, 1785584827112509452, 'A13885020023320', 1228, 1228, 'GZYYZ72773100', 1, 0, NULL, NULL, 0, '2024-05-09 10:20:04', NULL);
INSERT INTO `wms_stock_out_entry_item` VALUES (1794205460544847873, 1, 1794205460481933313, 49, 1785584827112509450, 'AD3702565220', 1229, 1229, 'GZYYZ72776200', 1, 0, NULL, NULL, 0, '2024-05-25 11:14:51', NULL);

-- ----------------------------
-- Table structure for wms_stock_out_entry_item_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_stock_out_entry_item_detail`;
CREATE TABLE `wms_stock_out_entry_item_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `entry_id` bigint(0) NOT NULL COMMENT '出库单ID',
  `entry_item_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '出库单ItemID',
  `goods_inventory_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '库存ID',
  `goods_inventory_detail_id` bigint(0) NOT NULL DEFAULT 0 COMMENT '库存详情ID',
  `quantity` bigint(0) NOT NULL DEFAULT 0 COMMENT '出库数量',
  `location_id` int(0) DEFAULT NULL COMMENT '出库仓位ID',
  `operator_id` int(0) DEFAULT 0 COMMENT '出库操作人userid',
  `operator_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '出库操作人',
  `out_time` datetime(0) DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_stock_info_item_id_index`(`goods_inventory_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786228283631636482 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出库明细详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_stock_out_entry_item_detail
-- ----------------------------
INSERT INTO `wms_stock_out_entry_item_detail` VALUES (1786220616376844290, 1786204816504958978, 1786204816504958979, 6, 7, 1, 20, 1, 'admin', '2024-05-03 10:25:55');
INSERT INTO `wms_stock_out_entry_item_detail` VALUES (1786228283631636481, 1786204816504958978, 1786204816504958979, 6, 7, 1, 20, 1, 'admin', '2024-05-03 10:56:24');

SET FOREIGN_KEY_CHECKS = 1;
