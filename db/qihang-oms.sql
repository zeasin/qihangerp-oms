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

 Date: 24/02/2024 22:41:59
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
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '启航oms', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-02-24 21:22:55', 'admin', '2023-08-07 19:31:37', '', '2024-02-24 21:22:55', '管理员');

-- ----------------------------
-- Table structure for tao_goods
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods`;
CREATE TABLE `tao_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goodsId` bigint NOT NULL COMMENT '商品id，PDD商品id',
  `erp_goods_id` int NULL DEFAULT NULL,
  `shopId` int NOT NULL,
  `shopType` int NOT NULL,
  `goodsNum` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品货号，erp系统商品编码',
  `goodsName` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参考价格，返回价格区间，可能为空',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `thumbUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主图',
  `imageUrl` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片json',
  `isMoreSku` int NULL DEFAULT NULL,
  `isOnsale` int NULL DEFAULT NULL,
  `totalSales` int NULL DEFAULT 0 COMMENT '累计销量',
  `publishTime` datetime NULL DEFAULT NULL COMMENT '发布日期',
  `createTime` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_goods
-- ----------------------------
INSERT INTO `tao_goods` VALUES (1, 392657083276, 9, 5, 5, '2720218026', '高腰宽松直筒牛仔短裤女夏a字型显瘦甜欲风辣妹毛边2022新款黑色', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/ed63f69d82e863972d1633cad97352a2.jpeg', '', 1, 1, 1024, '2022-07-21 16:44:00', '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (2, 393216514010, 11, 5, 5, '2720220608', '高腰直筒牛仔短裤女夏天a字型翻边热裤显瘦甜欲辣妹新款学生黑色', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/cafc8ca9dbc964862ee35c4429383f74.jpeg', '', 1, 1, 56, '2022-07-22 22:18:00', '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (3, 393654097571, 0, 5, 5, 'HN270', '高腰弹力紧身牛仔打底短裤女显瘦显高辣妹a字型热裤2022夏天学生', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-07-23/58da809ecc22d16d8dc360d31e4cd064.jpeg', '', 1, 1, 30, '2022-07-23 22:34:00', '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (4, 393659007414, 10, 5, 5, '2720220858', '高腰弹力a字型牛仔短裤女学生紧身显瘦辣妹纯欲风抽绳绑带炸街潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-24/1c30e57d86fc72f3e5ba10ec860b24d2.jpeg', '', 1, 1, 486, '2022-07-23 22:50:00', '2022-10-08 20:36:12');
INSERT INTO `tao_goods` VALUES (5, 394814708558, 61, 5, 5, 'JKL8990', '高腰阔腿牛仔裤女宽松直筒学生复古港风泫雅风拖地裤chic交叉腰头', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/f671e813ff967e02f4421229be8f1c4a.jpeg', '', 1, 1, 45, '2022-07-26 21:48:00', '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (6, 395429166799, 60, 5, 5, 'JKL9950', '高腰直筒牛仔裤女宽松阔腿垂坠感设计感潮炸街学生复古港风拖地潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/b1405a6b88893d52fd4197dcb652e7fa.jpeg', '', 1, 1, 141, '2022-07-28 14:49:00', '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (7, 395930868595, 0, 5, 5, 'HN0708', '高腰牛仔短裤女夏天a字型翻边热裤双扣ins网红卷边阔腿时尚辣妹潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-24/424f2fe63587326c7c75973c42572176.jpeg', '', 1, 1, 69, '2022-07-29 20:01:00', '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (8, 398085327353, 0, 5, 5, 'yfz-tb-650212367541', '薄款裤脚开叉牛仔裤女夏季高腰新款微喇叭弹力修身显瘦拖地长裤子', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-04/c18d2469f3eb07968f4dd36ab4a00486.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:13');
INSERT INTO `tao_goods` VALUES (9, 398667645632, 0, 5, 5, '', '美式复古经典基础款超高腰显瘦弹力修身牛仔短裤女包臀性感热裤夏', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/e4021e68d40d8919bb319b7fe89f1b31.jpeg', '', 1, 0, 41, '2022-08-06 11:07:00', '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (10, 401654801488, 0, 5, 5, 'HN0025', '修身毛边九分小脚铅笔裤牛仔裤女高腰弹力修身显瘦紧身2022年新款', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-22/b99ead8c07a6743735e7e586bdb3eca4.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (11, 401781697078, 16, 5, 5, '2820210678', '高腰直筒显瘦微喇叭牛仔裤女开叉裤宽松垂坠感泫雅风浅蓝色拖地长', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/ecef07b65c530ba38561516ecb5c343b.jpeg', '', 1, 1, 23, '2022-08-13 20:59:00', '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (12, 401781826934, 18, 5, 5, 'HN0014', '浅色高腰微喇叭牛仔裤女双扣修身弹力春秋新款显瘦微喇叭开叉拖地', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/a98e7a25ec6651fcdadfacd09872b47b.jpeg', '', 1, 1, 68, '2022-08-13 21:00:00', '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (13, 401993680807, 0, 5, 5, '', '高腰牛仔背带短裤女热裤夏季新款学院风减龄卷边吊带连体裤直筒裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-14/edfc54f4eebf2392c7d6675a21a5a7c7.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:14');
INSERT INTO `tao_goods` VALUES (14, 403434723538, 24, 5, 5, 'HN20220012', '高腰阔腿牛仔裤女宽松直筒竖条纹高街vibe风拖地长裤子ins潮垂感', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-29/daee228c044d11aef6a59ba707284da8.jpeg', '', 1, 1, 42, '2022-08-18 00:11:00', '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (15, 403438406420, 0, 5, 5, 'HN0010', '修身毛边破洞九分裤小脚铅笔裤高腰牛仔裤女2022新款韩版显瘦百搭', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-18/3f2fbb00a6cd6ba918ab7fcb923fc24c.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (16, 403654853255, 0, 5, 5, 'HN015', '高腰弹力微喇叭牛仔裤女学生网红同款裤脚前开叉显瘦修身拖地长裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/0317d2b3193307c71ffa05fd80fb6860.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (17, 403877249755, 0, 5, 5, 'yfz-tb-670085078625', '牛仔裤直筒高腰修身弹力2022年新款微喇叭显瘦小个子直筒裤拖地裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/714ddb39d6867687ed2a3f9be6789889.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (18, 403877355587, 0, 5, 5, 'yfz-tb-638661096456', '牛仔裤铅笔裤韩版高腰显瘦弹力新款百搭紧身九分铅笔小脚裤子', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/597fa2707d56eb0c91e3c94f88acdb0b.jpeg', '', 1, 0, 1, NULL, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (19, 403877444479, 0, 5, 5, 'yfz-tb-639346263403', '黑色修身毛边九分小脚铅笔牛仔裤女高腰弹力显瘦显高紧身韩版百搭', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-14/c0889b9ba1dc4d1884b8cdfae91889a9.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:15');
INSERT INTO `tao_goods` VALUES (20, 403877488703, 27, 5, 5, 'HN023', '高腰直筒牛仔裤女2022秋季黑色新款百搭显瘦宽松九分烟管裤子潮流', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-24/9f69abd98877eb721a475af487bae74e.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (21, 403877607629, 23, 5, 5, 'HN20220024', '高腰提臀牛仔裤女弹力九分小脚铅笔裤双扣修身显瘦显高2022秋新款', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/c21e2ae2c578ce11e9abc6dece6d6c0e.jpeg', '', 1, 1, 10, '2022-08-19 15:49:00', '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (22, 403877716388, 0, 5, 5, 'HN0029', '修身毛边九分铅笔裤高腰小脚牛仔裤女2022年新款弹力显瘦百搭紧身', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-19/c1405585b4a6135a5b54dfb93c14893f.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (23, 404300819650, 0, 5, 5, '', '牛仔裤女夏2022年新款高腰哈伦裤显瘦气质百搭小脚裤时尚九分裤薄', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-20/f90369c63c3cca6aa012e71fbeeb0d8d.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (24, 408225561862, 0, 5, 5, 'T610041890003', '高腰弹力牛仔裤九分小脚铅笔裤紧身显瘦显高修身百搭2022年新款女', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/109763d466358b6845392d07323ae03c.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:16');
INSERT INTO `tao_goods` VALUES (25, 409855932902, 0, 5, 5, 'HN180', '高腰九分哈伦牛仔裤女小脚萝卜老爹裤小个显高新款韩版宽松显瘦潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-15/d2f7884f4ea03f5580843171d190c407.jpeg', '', 1, 1, 0, '2022-09-03 20:27:00', '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (26, 409864423309, 37, 5, 5, 'HN106', '高腰弹力九分小脚铅笔裤紧身牛仔裤女修身毛边显瘦显高百搭蓝灰色', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/3a3aa28f0de00054d4ebb3bec4190432.jpeg', '', 1, 1, 12, '2022-09-03 20:38:00', '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (27, 409866847439, 42, 5, 5, 'HN222', '高腰直筒宽松阔腿牛仔裤女胖妹妹粗腿梨型身材泫雅垂感秋冬拖地裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/316f35a521c20cc7aa5f3e5d6f48936a.jpeg', '', 1, 1, 3, '2022-09-03 20:45:00', '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (28, 409879757750, 0, 5, 5, 'HN620', '破洞牛仔裤女高腰直筒爱心2022春夏新款显瘦百搭拖地阔腿长裤时尚', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/a9cfcd02574bc7babd42d1ac9c32bc7d.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (29, 409883128005, 34, 5, 5, 'HN621', '高腰直筒牛仔裤女宽松阔腿老爹裤破洞新款垂感百搭拖地长裤时尚潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/03500eb346573bc8804e5a8f053b52ed.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:17');
INSERT INTO `tao_goods` VALUES (30, 409885859735, 0, 5, 5, 'HN630', '高腰九分哈伦牛仔裤女新款秋季韩版显瘦松紧腰小脚萝卜老爹裤休闲', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-03/d7cb2c2f269b9e70fae7cf08c16de704.jpeg', '', 1, 1, 1, '2022-09-03 21:45:00', '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (31, 410305683990, 44, 5, 5, 'HN660', '高腰阔腿牛仔裤女学生直筒拖地长裤宽松调节腰韩版简约时尚垂感潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-04/ef88fbd43b7d99b8916087a3843c0cdc.jpeg', '', 1, 1, 1, '2022-09-04 23:19:00', '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (32, 410308626596, 35, 5, 5, 'HN662', '高腰直筒阔腿牛仔裤女韩版宽松显瘦泫雅风小雏菊绣花拖地裤浅蓝', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-04/b276eaa49fd18e61d0f181cf01dd8256.jpeg', '', 1, 1, 0, '2022-09-04 23:25:00', '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (33, 410688391724, 38, 5, 5, 'HN663', '高腰直筒阔腿牛仔裤女宽松拖地长裤2022新款爱心刺绣张极同款裤子', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/a1c7708baeebd04294489303981bf1a4.jpeg', '', 1, 1, 2, '2022-09-05 22:54:00', '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (34, 410692286065, 0, 5, 5, 'HN665', '高腰直筒黑色牛仔裤女秋冬新款韩版阔腿宽松显瘦垂坠感校园风裤子', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/03d7e1fe2aac50ffea1f54332de9cc48.jpeg', '', 1, 1, 0, '2022-09-05 22:59:00', '2022-10-08 20:36:18');
INSERT INTO `tao_goods` VALUES (35, 410693529689, 0, 5, 5, 'HN666', '高腰直筒九分哈伦老爹萝卜牛仔裤女小个子2022新款百搭韩版显瘦潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/d20f19284a3ec6e8d5dfaa22fb60c4da.jpeg', '', 1, 1, 0, '2022-09-05 23:04:00', '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (36, 410694952121, 41, 5, 5, 'HN667', '高腰直筒牛仔裤女小个子新款2022年秋装显瘦宽松阔腿垂感拖地裤潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/8bd4388f10a7c0fedef8d1513104b1ab.jpeg', '', 1, 1, 17, '2022-09-05 23:08:00', '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (37, 410695996318, 40, 5, 5, 'HN668', '高腰束脚九分哈伦牛仔裤女显瘦小个子宽松腰2022新款萝卜老爹裤bf', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/17d871fc332e40f04caff43fa952fed0.jpeg', '', 1, 1, 1, '2022-09-05 23:12:00', '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (38, 410697172304, 0, 5, 5, 'HN669', '高腰直筒牛仔裤女学生松紧腰哈伦老爹裤2022新款显瘦百搭chic潮流', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-05/d611d19b8e7b76dc77287a4709cc3cfb.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (39, 411361540533, 28, 5, 5, 'HN670', '哈伦牛仔裤女直筒宽松春装2022年新款高腰显瘦九分春季老爹萝卜裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/895026ef7ecadcd6f9fda2cfe446ac90.jpeg', '', 1, 1, 7, '2022-09-07 18:43:00', '2022-10-08 20:36:19');
INSERT INTO `tao_goods` VALUES (40, 411366495987, 0, 5, 5, '665779472192', '新款高腰黑色阔腿牛仔裤女小众辣妹拖地老爹裤直筒宽松显瘦设计感', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/0194e1652ad7a11307157f30cb9e4f6f.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (41, 411370161999, 0, 5, 5, '670461866109', '高腰直筒微喇叭牛仔裤女学生复古不开叉长裤2022秋冬新款宽松百搭', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/f5abdaf1b5b54114f50b08a45ed4a3e9.jpeg', '', 1, 1, 2, '2022-09-07 18:58:00', '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (42, 411378921081, 0, 5, 5, '637993903547', '哈伦牛仔裤女学生直筒宽松2022秋冬新款小个子显瘦高腰萝卜老爹裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/cbebf578bbc128c9c701d6ca8bfd5f98.jpeg', '', 1, 1, 0, '2022-09-07 19:26:00', '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (43, 411379965590, 0, 5, 5, '668784844135', '黑色高腰直筒开叉微喇叭牛仔裤女2022年新款修身拖地垂坠感显瘦潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/b66cca1fa97d2f8abdad3af6b76717f8.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (44, 411726911306, 45, 5, 5, 'HN686', '百搭简约牛仔裤白色高腰阔腿牛仔裤女宽松vibe风显瘦直筒可调节腰', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-01/87f687ae1ad35b37f41184fc9751775a.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (45, 411728903206, 0, 5, 5, '', '扎染高腰阔腿牛仔裤女宽松vibe风裤子百搭显瘦直筒彩色拖地裤子夏', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-08/9c2159800f4698b5ba78f39bb18fedc8.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:20');
INSERT INTO `tao_goods` VALUES (46, 411729694401, 36, 5, 5, 'HN692', '九分牛仔裤女小个子哈伦老爹萝卜裤松紧高腰2022新款百搭宽松显瘦', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-17/6e54ebddf5ae7f009c369c09b42deed2.jpeg', '', 1, 1, 7, '2022-09-08 19:14:00', '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (47, 411731178725, 43, 5, 5, 'HN694', '老爹裤女小个子网红chic宽松大码直筒裤秋季新款松紧百搭阔腿裤潮', NULL, NULL, '供应商无货准备下架', 'https://img.pddpic.com/gaudit-image/2022-09-08/3d52f55f19e6062d22b9f92bbd625f60.jpeg', '', 1, 1, 1, '2022-09-08 19:19:00', '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (48, 411732581938, 32, 5, 5, 'HN697', '哈伦裤九分裤韩版双扣后松紧高腰宽松萝卜牛仔裤女2022年夏季新款', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-27/01b7f53789a750c360e7e51850618299.jpeg', '', 1, 1, 8, '2022-09-08 19:22:00', '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (49, 412120506598, 33, 5, 5, 'HN0801', '高腰哈伦牛仔裤女九分直筒宽松老爹萝卜裤2022新款韩版显瘦休闲潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/9341ee50b7003832ccee394d68a340bf.jpeg', '', 1, 1, 63, '2022-09-09 21:35:00', '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (50, 412133591017, 31, 5, 5, 'HN801', '老爹萝卜裤九分牛仔直筒哈伦裤女学生秋装2022年新款显瘦高腰宽松', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/6e17994bb795bfa7f00c1d89c24afb16.jpeg', '', 1, 1, 4, '2022-09-09 22:25:00', '2022-10-08 20:36:21');
INSERT INTO `tao_goods` VALUES (51, 412137132774, 0, 5, 5, 'HN802', '复古牛仔裤女黑灰色九分裤2022秋季新款高腰阔腿宽松老爹裤chic潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/779f5bd008d0a9f2c7ec85c4524ee087.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (52, 412138772165, 0, 5, 5, 'HN805', '破洞牛仔裤女学生韩版九分阔腿裤显瘦高腰宽松新款2022秋装chic潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/0443f63986467ecc60b800b87f994ee0.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (53, 412139652425, 0, 5, 5, 'HN807', '高腰直筒九分萝卜哈伦牛仔裤小个子松紧腰老爹裤子女春秋款韩版潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-09/b46bd47c3fdd61fcf36bff584778562a.jpeg', '', 1, 0, 0, NULL, '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (54, 414594889986, 0, 5, 5, '', '弹力紧身贴标牛仔短裤女ins夏薄款a字裤打底外穿提臀直筒阔腿热裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-16/238138bf7bc905fdd2b874e2f1e04059.jpeg', '', 1, 1, 3, '2022-09-16 21:53:00', '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (55, 415222366821, 0, 5, 5, '', '开衫v领针织衫女新款洋气外穿高档2022款毛衣外套针织上衣春秋ins', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/eb3104f22378716c41323375ebf61a71.jpeg', '', 1, 0, 0, '2022-09-18 15:28:00', '2022-10-08 20:36:22');
INSERT INTO `tao_goods` VALUES (56, 418757536479, 47, 5, 5, 'JKL805', '高腰阔腿裤女秋冬复古法式牛仔裤宽松直筒垂坠感设计感潮炸街显瘦', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-28/a2937266502b0e40b13c5d297f65f69a.jpeg', '', 1, 1, 0, '2022-09-28 19:06:00', '2022-10-08 20:36:23');
INSERT INTO `tao_goods` VALUES (57, 420535061032, 0, 5, 5, 'JKL9938', '高腰弹力微喇叭裤开叉裤脚直筒牛仔裤女修身显瘦收腰小个子九分裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-06/64a7ae96630893e2986678cc0dbe85fa.jpeg', '', 1, 1, 0, '2022-10-06 13:06:00', '2022-10-08 20:36:23');
INSERT INTO `tao_goods` VALUES (58, 3572881699002051281, 44, 22, 6, 'HN660', '腰围可调牛仔裤女春秋季高腰直筒裤宽松韩版显瘦小个子阔腿拖地裤', NULL, NULL, NULL, 'https://cbu01.alicdn.com/img/ibank/O1CN01PyeFAc2FOyCUPpZr7_!!2208857268871-0-cib.jpg', NULL, 0, 1, 0, '2022-10-08 20:45:47', '2022-10-08 20:45:53');
INSERT INTO `tao_goods` VALUES (59, 398847598958, 0, 14, 5, '', '黑灰色松紧绑带牛仔短裤女宽松高腰弹力显瘦热裤阔腿胖MMa字型', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-06/1ddd0e51a7d17a4cbbb0b654d93bc03e.jpeg', '', 1, 1, 0, '2022-08-06 20:45:00', '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (60, 399063348248, 0, 14, 5, '', '复古新款微喇牛仔裤女夏季高腰显瘦chic港味直筒宽松阔脚喇叭裤子', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-07/a5377af55bc46da117fb838acefd4752.jpeg', '', 1, 1, 0, '2022-08-07 11:48:00', '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (61, 399063851678, 0, 14, 5, 't651428823385', '高腰微喇牛仔裤女开叉显瘦喇叭长裤弹力修身百搭直筒阔腿侧开纽扣', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/c245ce52dcf00faeb70fbeb70ff95759.jpeg', '', 1, 1, 0, '2022-08-07 11:50:00', '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (62, 407249067559, 0, 14, 5, 't622135144835', '牛仔裤小脚长裤女2022秋季新款韩版高腰弹力修身显瘦休闲百搭钉珠', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-28/2f00e9b96e58363c6163eee632053cb0.jpeg', '', 1, 1, 0, '2022-08-28 11:05:00', '2022-10-08 21:40:28');
INSERT INTO `tao_goods` VALUES (63, 407356168572, 0, 14, 5, 'T624078788603', '牛仔裤女高腰微喇叭长裤秋季新款弹力紧身修身显瘦显高休闲百搭', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-28/9ec229b3320b6323a0af604193a48f94.jpeg', '', 1, 1, 0, '2022-08-28 17:03:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (64, 408246660557, 0, 14, 5, 'T610270951823', '高腰牛仔喇叭裤韩版显瘦紧身弹力百搭收腹港风宽松长裤春秋款洋气', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/104e8f9c2637c2f40adc79cb4d632b0e.jpeg', '', 1, 1, 0, '2022-08-30 19:46:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (65, 408275614162, 0, 14, 5, 'T610041890003', '铅笔裤直筒小脚高腰牛仔裤女新款百搭显瘦修身紧身女裤显高铅笔裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-08-30/bd786b8f2ea7621fa6b25b61936da0ed.jpeg', '', 1, 1, 0, '2022-08-30 21:07:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (66, 411405520617, 0, 14, 5, '675027903686', '2022新款韩版炸街牛仔裤女夏季宽松直筒阔腿高腰显瘦拖地裤百搭', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-07/f44e84454b21878f86aa369afe25db9b.jpeg', '', 1, 1, 0, '2022-09-07 21:01:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (67, 415140360909, 0, 14, 5, 'HN014', '高腰微喇牛仔裤女开叉裤高个子加长版双扣显瘦弹性修身百搭通勤潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/7c541fde9014bf21b704b2f0c7222972.jpeg', '', 1, 1, 0, '2022-09-18 11:04:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (68, 415209134293, 0, 14, 5, '', '开衫v领针织衫女新款洋气外穿高档2022款毛衣外套针织上衣春秋ins', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-09-18/d1310043dee0d103927764faff1472a8.jpeg', '', 1, 1, 0, '2022-09-18 15:06:00', '2022-10-08 21:40:29');
INSERT INTO `tao_goods` VALUES (69, 418749496896, 47, 14, 5, 'JKL805', '高腰阔腿牛仔裤女直筒宽松高个子加长微喇叭显瘦垂感潮流气质百搭', NULL, NULL, '10.8全站推广出1单', 'https://img.pddpic.com/gaudit-image/2022-10-08/de29e8e044c1dece30901ede5b2147bb.jpeg', '', 1, 1, 0, '2022-09-28 18:48:00', '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (70, 421025454368, 0, 14, 5, 'JKL8990', '高腰阔腿裤牛仔裤女小个子直筒个性设计遮肉洋气秋冬通勤潮流网红', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-08/ccaab6402c058b1785e734f427c0f454.jpeg', '', 1, 1, 0, '2022-10-08 13:27:00', '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (71, 421031955741, 33, 14, 5, 'HN0801', '老爹裤女春秋款哈伦裤高档上档次小脚修身牛仔裤加绒冬款通勤潮流', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-08/bf6649625f7a93f810c190c4eb6836bc.jpeg', '', 1, 1, 0, '2022-10-08 13:54:00', '2022-10-08 21:40:30');
INSERT INTO `tao_goods` VALUES (72, 421771728900, 33, 5, 5, 'HN0801', '加绒高腰哈伦牛仔裤女九分直筒宽松老爹萝卜裤秋冬新款韩版显瘦', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-11/74a3befbd651d6346d88a1dadb2f2038.jpeg', '', 1, 1, 0, NULL, '2022-10-11 19:26:16');
INSERT INTO `tao_goods` VALUES (73, 422383287651, 22, 5, 5, 'HN20220020', '新款加绒牛仔裤女修身弹力小脚铅笔裤冬季防寒保暖显瘦厚款个性潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-13/b33268c1cf711a642e875428cab25dca.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (74, 422437259657, 48, 5, 5, 'HN180', '浅蓝色高腰牛仔裤女修身款九分矮个子梨形身材哈伦老爹裤显高束脚', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-13/2c846bb7a2e6c721bf568b7c700ad5c6.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (75, 422742565233, 0, 5, 5, 'HN665', '阔腿高腰牛仔裤女秋季2022年新款显瘦直筒宽松垂感拖地加长裤子潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-14/0a7922b5a51156df616b9c0f799f7d35.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:48');
INSERT INTO `tao_goods` VALUES (76, 422744325067, 0, 5, 5, '', '港风复古牛仔裤子女春秋小个子小众设计感梨形身材紧身小脚铅笔裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-14/a0e22024b4cfa11155cf757a9ff15b65.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (77, 423260246680, 0, 5, 5, '', '高腰小脚牛仔裤女秋冬加绒加厚显瘦显高保暖铅笔长裤时尚百搭豹纹', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-16/1db23144091189ca733a4b65741460d4.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (78, 423441709778, 0, 5, 5, '', '【抖音爆款】马卡龙西装垂垂裤百搭显瘦阔腿裤女夏薄款粉色直筒裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/159c43ae0f01443810f4fb995e3661a6.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (79, 423486862283, 0, 5, 5, '', '哈伦老爹牛仔裤女高腰弹力撞色小个子九分直筒遮肉显腿长显瘦学生', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/72d62fa205cb8dcc0bfea512950bde89.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (80, 423492956829, 0, 5, 5, 'HN683', '牛仔裤女阔腿高腰宽松直筒大码拖地复古港风垂坠感显瘦潮便宜甩卖', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/7b0e9e0aa6ccc4db258f8f3272a352d0.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (81, 423502402446, 0, 5, 5, 'HN0802', '牛仔裤女烟管裤梨形身材高腰显瘦九分弹力直筒秋冬款修身百搭休闲', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-17/5271991ad2674ff48d43edf9e7efed1e.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:49');
INSERT INTO `tao_goods` VALUES (82, 423703312591, 0, 5, 5, 'JKL333', '加绒牛仔裤女小脚裤紧身显瘦秋冬款弹力中腰铅笔裤加厚保暖爆款潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-18/d194906f1b1f52cd52d166a4866ff5ef.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (83, 423758757026, 55, 5, 5, 'JKL906', '阔腿牛仔裤女高腰显瘦宽松垂坠感设计感潮流炸街直筒裤韩版梨形', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-18/a63bcd8016f12c69daa29d0233fc9880.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (84, 423990076571, 49, 5, 5, 'JKL9098', '哈伦老爹牛仔裤女弹力显瘦修身高腰直筒九分小个子萝卜裤梨形身材', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-19/12cb7a79e5365c49be8c43dfc7f5e456.jpeg', '', 1, 1, 0, NULL, '2022-10-20 00:07:50');
INSERT INTO `tao_goods` VALUES (85, 426190541480, 0, 5, 5, 'JKL3112', '束脚哈伦老爹裤萝卜牛仔裤女松紧腰高腰弹力宽松梨形身材九分束口', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-27/279728174052d55e207e215fe84f03e9.jpeg', '', 1, 1, 0, NULL, '2022-11-01 16:46:00');
INSERT INTO `tao_goods` VALUES (86, 426453461778, 54, 5, 5, 'JKL6010', '松紧腰牛仔裤女萝卜裤胖妹妹粗腿高腰显瘦宽松哈伦裤老爹裤九分裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-28/0a1915464ceeb27c320255acdf99e935.jpeg', '', 1, 1, 0, NULL, '2022-11-01 16:46:01');
INSERT INTO `tao_goods` VALUES (87, 426460291580, 53, 5, 5, 'JKL9907', '黑色直筒裤牛仔裤烟管裤小个子九分高腰弹力显瘦显高梨形身材米白', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-10-29/01971b48a6ae4533c256274d122b7490.jpeg', '', 1, 1, 0, NULL, '2022-11-01 16:46:01');
INSERT INTO `tao_goods` VALUES (88, 429860405885, 56, 5, 5, 'JKL9977', '牛仔裤女显瘦喇叭裤微喇高腰弹力毛边不开叉复古蓝高个子加长冬天', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-09/fb2edf70f36cbef1a8ee6019f19f523b.jpeg', '', 1, 1, 0, NULL, '2022-11-09 19:36:23');
INSERT INTO `tao_goods` VALUES (89, 429968867456, 0, 5, 5, 'JKL9962', '直筒牛仔裤女高腰宽松2022新款九分弹力翻边梨型身材通勤潮流气质', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-09/10709ca9f8cc1cf209602ae60ea55bcb.jpeg', '', 1, 1, 0, NULL, '2022-11-09 19:36:23');
INSERT INTO `tao_goods` VALUES (90, 431646818746, 0, 5, 5, 'JKL3689', '加绒牛仔裤女高腰宽松直筒九分显瘦烟管裤小个子八分秋冬季马丁靴', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-15/28f855f48145107ce2aba17ce8b93f69.jpeg', '', 1, 1, 0, NULL, '2022-11-15 18:43:39');
INSERT INTO `tao_goods` VALUES (91, 431656693618, 63, 5, 5, 'JKL6001', '小脚裤高腰修身弹力牛仔裤女秋冬款百搭铅笔裤子性感洋气潮流通勤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-15/35ff46e006092ca7ceb826857ddd38ac.jpeg', '', 1, 1, 0, NULL, '2022-11-15 18:43:39');
INSERT INTO `tao_goods` VALUES (92, 432701863744, 0, 5, 5, 'JKL2035', '撞色阔腿裤牛仔裤女高腰直筒宽松大长腿潮流气质通勤秋冬网红新款', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-18/dc1beeb997c7c339ecf6130e6a982839.jpeg', '', 1, 1, 0, NULL, '2022-11-19 17:21:15');
INSERT INTO `tao_goods` VALUES (93, 432930516051, 0, 5, 5, 'JKL1973', '老爹裤加绒牛仔裤女高腰直筒长裤宽松显瘦显高撞色设计哈伦萝卜裤', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/9fe3b9a33770ff1c3fc31f0fc56e7fb0.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (94, 432939563887, 0, 5, 5, 'JKL3705', '梨形身材烟管裤高腰直筒牛仔裤女弹力收腹显瘦八分小个子冬季加绒', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/bfb8c3dbe870550cd8d75323822efa45.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (95, 432951870483, 0, 5, 5, 'JKL1951', '深蓝色牛仔裤加长版松紧腰阔腿裤女高腰宽松直筒显瘦显高秋冬加绒', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/9166c733d64538323e4d8a5e9dd4c143.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (96, 432977920082, 0, 5, 5, 'JKL016', '阔腿裤牛仔裤女高腰直筒宽松长裤显瘦显腿长秋冬款加长ins潮炸街', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-19/1cb96371ca0c0f4f9473f0ca8726ef22.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:22');
INSERT INTO `tao_goods` VALUES (97, 432987421029, 0, 5, 5, 'JKL015', '喇叭裤微喇牛仔裤女高腰显瘦不开叉显高显腿长弹力修身通勤洋气质', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-19/13360e56062e9f960383f7a99eaf5d65.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (98, 433499680962, 0, 5, 5, 'JKL016', '高腰阔腿牛仔裤女直筒宽松显瘦修身显腿长个性遮肉通勤潮流百搭冬', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/30d878d29b675481d678059ea15ddde3.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (99, 433495415698, 0, 5, 5, 'JKL1856', '高腰阔腿牛仔裤女直筒宽松收腹显瘦遮肉垂坠感秋冬加长通勤梨形潮', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-21/a708a36aaf3a0bc9bd518d356f817ddd.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:23');
INSERT INTO `tao_goods` VALUES (100, 433742784706, 65, 5, 5, 'GZYYZ7277', '半身裙秋冬女包臀裙高腰灯芯绒复古显瘦中长款a字裙遮胯伞裙厚款', NULL, NULL, NULL, 'https://img.pddpic.com/gaudit-image/2022-11-22/f1cb07df5e8ef2d11993c0415e0119f8.jpeg', '', 1, 1, 0, NULL, '2022-11-30 14:18:24');
INSERT INTO `tao_goods` VALUES (101, 700462980460, 0, 6, 4, 'KH2012', '2023春季新款牛仔半身裙弹力包臀裙梨形性感a字裙百搭复古水洗潮', NULL, NULL, NULL, 'https://gd2.alicdn.com/imgextra/i1/49616689/O1CN01ebLlLz1zHc5njEjYt_!!49616689.jpg_400x400.jpg', NULL, 0, 1, 0, '2023-02-09 00:00:00', '2023-02-12 20:55:25');

-- ----------------------------
-- Table structure for tao_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `tao_goods_sku`;
CREATE TABLE `tao_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_goods_id` bigint NOT NULL COMMENT '外键id',
  `goodsId` bigint NOT NULL COMMENT '商品id，阿里productID',
  `skuId` bigint NOT NULL COMMENT '商品skuid，阿里',
  `spec` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'specId',
  `erp_goods_spec_id` int NULL DEFAULT NULL,
  `erp_goods_id` int NULL DEFAULT NULL,
  `erp_goods_spec_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `skuQuantity` bigint NULL DEFAULT NULL,
  `consignPrice` double NULL DEFAULT NULL COMMENT '分销基准价。代销场景均使用该价格。无SKU商品查看saleInfo中的consignPrice',
  `outerId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `outerGoodsId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'spu编码',
  `price` double NULL DEFAULT NULL COMMENT '报价时该规格的单价，国际站注意要点：含有SKU属性的在线批发产品设定具体价格时使用此值，若设置阶梯价格则使用priceRange',
  `retailPrice` double NULL DEFAULT NULL COMMENT '建议零售价',
  `amountOnSale` int NULL DEFAULT NULL COMMENT '可销售数量',
  `isSkuOnsale` int NULL DEFAULT NULL,
  `cargoNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '指定规格的货号,对应ERP系统商品specNumber',
  `attributes` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'SKU属性值json',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2282 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_goods_sku
-- ----------------------------
INSERT INTO `tao_goods_sku` VALUES (1, 1, 392657083276, 1262178610550, '复古蓝 S（80-95斤）', 400, 9, 'HN80264001', 105, NULL, 'HN80264001', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2, 1, 392657083276, 1262178610548, '黑灰色 XL（115-125斤）', 408, 9, 'HN80267504', 20, NULL, 'HN80267504', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (3, 1, 392657083276, 1262178610546, '黑灰色 M（95-105斤）', 406, 9, 'HN80267502', 20, NULL, 'HN80267502', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (4, 1, 392657083276, 1262178610552, '复古蓝 L（105-115斤）', 402, 9, 'HN80264003', 105, NULL, 'HN80264003', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (5, 1, 392657083276, 1262178610549, '黑灰色 2XL（125-135斤）', 409, 9, 'HN80267505', 20, NULL, 'HN80267505', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (6, 1, 392657083276, 1236824368730, '黑色 L（105-115斤）', 30, 9, '2720210080260103', 20, NULL, '2720210080260103', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (7, 1, 392657083276, 1262178610554, '复古蓝 2XL（125-135斤）', 404, 9, 'HN80264005', 115, NULL, 'HN80264005', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (8, 1, 392657083276, 1236824368731, '黑色 XL（115-125斤）', 31, 9, '2720210080260104', 20, NULL, '2720210080260104', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (9, 1, 392657083276, 1262178610553, '复古蓝 XL（115-125斤）', 403, 9, 'HN80264004', 105, NULL, 'HN80264004', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (10, 1, 392657083276, 1262178610551, '复古蓝 M（95-105斤）', 401, 9, 'HN80264002', 105, NULL, 'HN80264002', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (11, 1, 392657083276, 1236824368724, '白色 M（95-105斤）', 24, 9, '2720210080260002', 212, NULL, '2720210080260002', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (12, 1, 392657083276, 1236824368737, '宝蓝色 2XL（125-135斤）', 37, 9, '2720210080260205', 65, NULL, '2720210080260205', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (13, 1, 392657083276, 1262178610547, '黑灰色 L（105-115斤）', 407, 9, 'HN80267503', 20, NULL, 'HN80267503', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (14, 1, 392657083276, 1236824368723, '白色 S（80-95斤）', 23, 9, '2720210080260001', 223, NULL, '2720210080260001', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (15, 1, 392657083276, 1236824368742, '浅蓝色 2XL（125-135斤）', 42, 9, '2720210080260305', 115, NULL, '2720210080260305', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (16, 1, 392657083276, 1236824368738, '浅蓝色 S（80-95斤）', 38, 9, '2720210080260301', 112, NULL, '2720210080260301', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (17, 1, 392657083276, 1236824368740, '浅蓝色 L（105-115斤）', 40, 9, '2720210080260303', 96, NULL, '2720210080260303', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (18, 1, 392657083276, 1236824368741, '浅蓝色 XL（115-125斤）', 41, 9, '2720210080260304', 122, NULL, '2720210080260304', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (19, 1, 392657083276, 1236824368726, '白色 XL（115-125斤）', 26, 9, '2720210080260004', 204, NULL, '2720210080260004', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (20, 1, 392657083276, 1236824368725, '白色 L（105-115斤）', 25, 9, '2720210080260003', 193, NULL, '2720210080260003', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (21, 1, 392657083276, 1262178610545, '黑灰色 S（80-95斤）', 405, 9, 'HN80267501', 20, NULL, 'HN80267501', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (22, 1, 392657083276, 1236824368735, '宝蓝色 L（105-115斤）', 35, 9, '2720210080260203', 70, NULL, '2720210080260203', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (23, 1, 392657083276, 1236824368736, '宝蓝色 XL（115-125斤）', 36, 9, '2720210080260204', 71, NULL, '2720210080260204', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (24, 1, 392657083276, 1236824368734, '宝蓝色 M（95-105斤）', 34, 9, '2720210080260202', 83, NULL, '2720210080260202', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (25, 1, 392657083276, 1236824368732, '黑色 2XL（125-135斤）', 32, 9, '2720210080260105', 20, NULL, '2720210080260105', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (26, 1, 392657083276, 1236824368727, '白色 2XL（125-135斤）', 27, 9, '2720210080260005', 218, NULL, '2720210080260005', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (27, 1, 392657083276, 1236824368739, '浅蓝色 M（95-105斤）', 39, 9, '2720210080260302', 93, NULL, '2720210080260302', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (28, 1, 392657083276, 1236824368729, '黑色 M（95-105斤）', 29, 9, '2720210080260102', 20, NULL, '2720210080260102', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (29, 1, 392657083276, 1236824368728, '黑色 S（80-95斤）', 28, 9, '2720210080260101', 20, NULL, '2720210080260101', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (30, 1, 392657083276, 1236824368733, '宝蓝色 S（80-95斤）', 33, 9, '2720210080260201', 98, NULL, '2720210080260201', '2720218026', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (31, 2, 393216514010, 1249158140742, '白色 M', 59, 11, '27202206080102', 69, NULL, '27202206080102', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (32, 2, 393216514010, 1249158140748, '黑灰色 L', 70, 11, '27202206080303', 10, NULL, '27202206080303', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (33, 2, 393216514010, 1249158140744, '白色 XL', 61, 11, '27202206080104', 70, NULL, '27202206080104', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (34, 2, 393216514010, 1249158140749, '黑灰色 XL', 71, 11, '27202206080304', 10, NULL, '27202206080304', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (35, 2, 393216514010, 1249158140747, '黑灰色 M', 69, 11, '27202206080302', 10, NULL, '27202206080302', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (36, 2, 393216514010, 1238187231207, '黑色 S', 63, 11, '27202206080201', 10, NULL, '27202206080201', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (37, 2, 393216514010, 1238189648989, '浅蓝色 L', 75, 11, '27202206080403', 175, NULL, '27202206080403', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (38, 2, 393216514010, 1238187231209, '黑色 L', 65, 11, '27202206080203', 9, NULL, '27202206080203', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (39, 2, 393216514010, 1238189648988, '浅蓝色 M', 74, 11, '27202206080402', 178, NULL, '27202206080402', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (40, 2, 393216514010, 1249158140738, '深蓝色 L', 80, 11, '27202206080503', 67, NULL, '27202206080503', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (41, 2, 393216514010, 1238187231211, '黑色 2XL', 67, 11, '27202206080205', 9, NULL, '27202206080205', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (42, 2, 393216514010, 1238187231208, '黑色 M', 64, 11, '27202206080202', 10, NULL, '27202206080202', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (43, 2, 393216514010, 1249158140737, '深蓝色 M', 79, 11, '27202206080502', 66, NULL, '27202206080502', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (44, 2, 393216514010, 1238189648991, '浅蓝色 2XL', 77, 11, '27202206080405', 178, NULL, '27202206080405', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (45, 2, 393216514010, 1249158140739, '深蓝色 XL', 81, 11, '27202206080504', 68, NULL, '27202206080504', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (46, 2, 393216514010, 1249158140741, '白色 S', 58, 11, '27202206080101', 70, NULL, '27202206080101', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (47, 2, 393216514010, 1249158140745, '白色 2XL', 62, 11, '27202206080105', 68, NULL, '27202206080105', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (48, 2, 393216514010, 1238189648987, '浅蓝色 S', 73, 11, '27202206080401', 175, NULL, '27202206080401', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (49, 2, 393216514010, 1249158140746, '黑灰色 S', 68, 11, '27202206080301', 10, NULL, '27202206080301', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (50, 2, 393216514010, 1249158140750, '黑灰色 2XL', 72, 11, '27202206080305', 10, NULL, '27202206080305', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (51, 2, 393216514010, 1249158140736, '深蓝色 S', 78, 11, '27202206080501', 66, NULL, '27202206080501', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (52, 2, 393216514010, 1238187231210, '黑色 XL', 66, 11, '27202206080204', 10, NULL, '27202206080204', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (53, 2, 393216514010, 1238189648990, '浅蓝色 XL', 76, 11, '27202206080404', 178, NULL, '27202206080404', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (54, 2, 393216514010, 1249158140740, '深蓝色 2XL', 82, 11, '27202206080505', 69, NULL, '27202206080505', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (55, 2, 393216514010, 1249158140743, '白色 L', 60, 11, '27202206080103', 69, NULL, '27202206080103', '2720220608', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (56, 3, 393654097571, 1239269861271, '黑色 L', 85, 12, '27202202700103', 39, NULL, '27202202700103', 'HN270', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (57, 3, 393654097571, 1239269861273, '黑色 2XL', 87, 12, '27202202700105', 49, NULL, '27202202700105', 'HN270', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (58, 3, 393654097571, 1239269861269, '黑色 S', 83, 12, '27202202700101', 44, NULL, '27202202700101', 'HN270', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (59, 3, 393654097571, 1239269861270, '黑色 M', 84, 12, '27202202700102', 35, NULL, '27202202700102', 'HN270', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (60, 3, 393654097571, 1239269861272, '黑色 XL', 86, 12, '27202202700104', 47, NULL, '27202202700104', 'HN270', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (61, 4, 393659007414, 1239283006661, '深灰色 XL', 51, 10, '27202208580204', 134, NULL, '27202208580204', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (62, 4, 393659007414, 1239283006672, '浅蓝色 2XL', 57, 10, '27202208580305', 135, NULL, '27202208580305', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (63, 4, 393659007414, 1239283006666, '黑色 XL', 46, 10, '27202208580104', 128, NULL, '27202208580104', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (64, 4, 393659007414, 1239283006660, '深灰色 L', 50, 10, '27202208580203', 123, NULL, '27202208580203', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (65, 4, 393659007414, 1239283006662, '深灰色 2XL', 52, 10, '27202208580205', 134, NULL, '27202208580205', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (66, 4, 393659007414, 1239283006670, '浅蓝色 L', 55, 10, '27202208580303', 120, NULL, '27202208580303', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (67, 4, 393659007414, 1239283006659, '深灰色 M', 49, 10, '27202208580202', 106, NULL, '27202208580202', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (68, 4, 393659007414, 1239283006668, '浅蓝色 S', 53, 10, '27202208580301', 102, NULL, '27202208580301', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (69, 4, 393659007414, 1239283006669, '浅蓝色 M', 54, 10, '27202208580302', 115, NULL, '27202208580302', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (70, 4, 393659007414, 1239283006664, '黑色 M', 44, 10, '27202208580102', 123, NULL, '27202208580102', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (71, 4, 393659007414, 1239283006665, '黑色 L', 45, 10, '27202208580103', 106, NULL, '27202208580103', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (72, 4, 393659007414, 1239283006658, '深灰色 S', 48, 10, '27202208580201', 112, NULL, '27202208580201', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (73, 4, 393659007414, 1239283006667, '黑色 2XL', 47, 10, '27202208580105', 138, NULL, '27202208580105', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (74, 4, 393659007414, 1239283006671, '浅蓝色 XL', 56, 10, '27202208580304', 126, NULL, '27202208580304', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (75, 4, 393659007414, 1239283006663, '黑色 S', 43, 10, '27202208580101', 110, NULL, '27202208580101', '2720220858', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (76, 5, 394814708558, 1241979453566, '黑灰色 2XL', 1078, 61, 'JKL89907505', 1000, NULL, '28202206810305', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (77, 5, 394814708558, 1241979453562, '黑灰色 S', 1074, 61, 'JKL89907501', 1000, NULL, '28202206810301', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (78, 5, 394814708558, 1241979453565, '黑灰色 XL', 1077, 61, 'JKL89907504', 999, NULL, '28202206810304', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (79, 5, 394814708558, 1241979453552, '复古蓝 S', 88, 13, '28202206810101', 987, NULL, '28202206810101', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (80, 5, 394814708558, 1241979453561, '浅蓝色 2XL', 97, 13, '28202206810205', 1000, NULL, '28202206810205', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (81, 5, 394814708558, 1241979453557, '浅蓝色 S', 93, 13, '28202206810201', 999, NULL, '28202206810201', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (82, 5, 394814708558, 1241979453564, '黑灰色 L', 1076, 61, 'JKL89907503', 999, NULL, '28202206810303', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (83, 5, 394814708558, 1241979453555, '复古蓝 XL', 91, 13, '28202206810104', 989, NULL, '28202206810104', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (84, 5, 394814708558, 1241979453560, '浅蓝色 XL', 96, 13, '28202206810204', 999, NULL, '28202206810204', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (85, 5, 394814708558, 1241979453559, '浅蓝色 L', 95, 13, '28202206810203', 1000, NULL, '28202206810203', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (86, 5, 394814708558, 1241979453553, '复古蓝 M', 89, 13, '28202206810102', 985, NULL, '28202206810102', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (87, 5, 394814708558, 1241979453556, '复古蓝 2XL', 92, 13, '28202206810105', 994, NULL, '28202206810105', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (88, 5, 394814708558, 1241979453563, '黑灰色 M', 1075, 61, 'JKL89907502', 997, NULL, '28202206810302', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (89, 5, 394814708558, 1241979453554, '复古蓝 L', 90, 13, '28202206810103', 997, NULL, '28202206810103', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (90, 5, 394814708558, 1241979453558, '浅蓝色 M', 94, 13, '28202206810202', 999, NULL, '28202206810202', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (91, 6, 395429166799, 1243466497221, '复古蓝 XL（30码115-125斤）', 121, 15, '28202106610104', 317, NULL, '28202106610104', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (92, 6, 395429166799, 1243466497220, '复古蓝 L（29码105-115斤）', 120, 15, '28202106610103', 351, NULL, '28202106610103', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (93, 6, 395429166799, 1243466497222, '复古蓝 2XL（31码125-135斤）', 122, 15, '28202106610105', 731, NULL, '28202106610105', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (94, 6, 395429166799, 1243466497229, '黑灰色 M（27-28码95-105斤）', 129, 15, '28202106610302', 952, NULL, '28202106610302', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (95, 6, 395429166799, 1243466497228, '黑灰色 S（25-26码95斤以内）', 128, 15, '28202106610301', 965, NULL, '28202106610301', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (96, 6, 395429166799, 1243466497226, '浅蓝色 XL（30码115-125斤）', 126, 15, '28202106610204', 941, NULL, '28202106610204', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (97, 6, 395429166799, 1243466497218, '复古蓝 S（25-26码95斤以内）', 118, 15, '28202106610101', 279, NULL, '28202106610101', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (98, 6, 395429166799, 1243466497224, '浅蓝色 M（27-28码95-105斤）', 124, 15, '28202106610202', 920, NULL, '28202106610202', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (99, 6, 395429166799, 1243466497230, '黑灰色 L（29码105-115斤）', 130, 15, '28202106610303', 951, NULL, '28202106610303', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (100, 6, 395429166799, 1243466497232, '黑灰色 2XL（31码125-135斤）', 132, 15, '28202106610305', 961, NULL, '28202106610305', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (101, 6, 395429166799, 1243466497225, '浅蓝色 L（29码105-115斤）', 125, 15, '28202106610203', 911, NULL, '28202106610203', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (102, 6, 395429166799, 1243466497231, '黑灰色 XL（30码115-125斤）', 131, 15, '28202106610304', 973, NULL, '28202106610304', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (103, 6, 395429166799, 1243466497227, '浅蓝色 2XL（31码125-135斤）', 127, 15, '28202106610205', 954, NULL, '28202106610205', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (104, 6, 395429166799, 1243466497219, '复古蓝 M（27-28码95-105斤）', 119, 15, '28202106610102', 430, NULL, '28202106610102', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (105, 6, 395429166799, 1243466497223, '浅蓝色 S（25-26码95斤以内）', 123, 15, '28202106610201', 941, NULL, '28202106610201', 'HN0661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (106, 7, 395930868595, 1262362978280, '黑色 2XL', 112, 14, '27202207080205', 10, NULL, '27202207080205', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (107, 7, 395930868595, 1244694390444, '灰色 S', 103, 14, '27202207080101', 104, NULL, '27202207080101', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (108, 7, 395930868595, 1262362978278, '黑色 L', 110, 14, '27202207080203', 10, NULL, '27202207080203', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (109, 7, 395930868595, 1244694390446, '灰色 L', 105, 14, '27202207080103', 84, NULL, '27202207080103', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (110, 7, 395930868595, 1262362978277, '黑色 M', 109, 14, '27202207080202', 9, NULL, '27202207080202', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (111, 7, 395930868595, 1244694390445, '灰色 M', 104, 14, '27202207080102', 90, NULL, '27202207080102', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (112, 7, 395930868595, 1244694390447, '灰色 XL', 106, 14, '27202207080104', 99, NULL, '27202207080104', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (113, 7, 395930868595, 1244694390448, '灰色 2XL', 107, 14, '27202207080105', 101, NULL, '27202207080105', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (114, 7, 395930868595, 1262362978276, '黑色 S', 108, 14, '27202207080201', 10, NULL, '27202207080201', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (115, 7, 395930868595, 1262362978279, '黑色 XL', 111, 14, '27202207080204', 10, NULL, '27202207080204', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (116, 7, 395930868595, 1262362978285, '浅蓝色 2XL', 117, 14, '27202207080305', 8, NULL, '27202207080305', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (117, 7, 395930868595, 1262362978284, '浅蓝色 XL', 116, 14, '27202207080304', 10, NULL, '27202207080304', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (118, 7, 395930868595, 1262362978282, '浅蓝色 M', 114, 14, '27202207080302', 10, NULL, '27202207080302', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (119, 7, 395930868595, 1262362978281, '浅蓝色 S', 113, 14, '27202207080301', 10, NULL, '27202207080301', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (120, 7, 395930868595, 1262362978283, '浅蓝色 L', 115, 14, '27202207080303', 9, NULL, '27202207080303', 'HN0708', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (121, 8, 398085327353, 1249444023929, '浅蓝色 XS', 0, 0, '', 995, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (122, 8, 398085327353, 1249444023917, '黑色 XS', 0, 0, '', 994, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (123, 8, 398085327353, 1249444023919, '黑色 M', 0, 0, '', 976, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (124, 8, 398085327353, 1249444023922, '黑色 2XL', 0, 0, '', 981, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (125, 8, 398085327353, 1249444023920, '黑色 L', 0, 0, '', 979, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (126, 8, 398085327353, 1249444023921, '黑色 XL', 0, 0, '', 985, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (127, 8, 398085327353, 1249444023931, '浅蓝色 M', 0, 0, '', 882, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (128, 8, 398085327353, 1249444023918, '黑色 S', 0, 0, '', 987, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (129, 8, 398085327353, 1249444023933, '浅蓝色 XL', 0, 0, '', 910, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (130, 8, 398085327353, 1249444023926, '复古蓝 L', 0, 0, '', 881, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (131, 8, 398085327353, 1249444023934, '浅蓝色 2XL', 0, 0, '', 915, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (132, 8, 398085327353, 1249444023925, '复古蓝 M', 0, 0, '', 840, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (133, 8, 398085327353, 1249444023930, '浅蓝色 S', 0, 0, '', 885, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (134, 8, 398085327353, 1249444023924, '复古蓝 S', 0, 0, '', 915, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (135, 8, 398085327353, 1249444023923, '复古蓝 XS', 0, 0, '', 990, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (136, 8, 398085327353, 1249444023927, '复古蓝 XL', 0, 0, '', 907, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (137, 8, 398085327353, 1249444023932, '浅蓝色 L', 0, 0, '', 891, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (138, 8, 398085327353, 1249444023928, '复古蓝 2XL', 0, 0, '', 907, NULL, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (139, 9, 398667645632, 1250808763993, '黑色 XL', 0, 0, '', 94, NULL, '2720220270', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (140, 9, 398667645632, 1250808225395, '黑色 S', 0, 0, '', 187, NULL, '2720220270', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (141, 9, 398667645632, 1250808225397, '黑色 L', 0, 0, '', 190, NULL, '2720220270', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (142, 9, 398667645632, 1250808763994, '黑色 2XL', 0, 0, '', 98, NULL, '2720220270', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (143, 9, 398667645632, 1250808225396, '黑色 M', 0, 0, '', 177, NULL, '2720220270', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (144, 10, 401654801488, 1264138569397, '藏青色 26', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (145, 10, 401654801488, 1264138569387, '灰色 32', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (146, 10, 401654801488, 1264138569394, '浅蓝色 31', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (147, 10, 401654801488, 1264138569403, '藏青色 32', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (148, 10, 401654801488, 1264138569399, '藏青色 28', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (149, 10, 401654801488, 1264138569389, '浅蓝色 26', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (150, 10, 401654801488, 1264138569391, '浅蓝色 28', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (151, 10, 401654801488, 1264138569388, '浅蓝色 25', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (152, 10, 401654801488, 1264138569374, '黑色 27', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (153, 10, 401654801488, 1264138569375, '黑色 28', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (154, 10, 401654801488, 1264138569393, '浅蓝色 30', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (155, 10, 401654801488, 1264138569384, '灰色 29', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (156, 10, 401654801488, 1264138569386, '灰色 31', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (157, 10, 401654801488, 1264138569390, '浅蓝色 27', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (158, 10, 401654801488, 1264138569401, '藏青色 30', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (159, 10, 401654801488, 1264138569372, '黑色 25', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (160, 10, 401654801488, 1264138569392, '浅蓝色 29', 0, 0, '', 9, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (161, 10, 401654801488, 1264138569377, '黑色 30', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (162, 10, 401654801488, 1264138569382, '灰色 27', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (163, 10, 401654801488, 1264138569378, '黑色 31', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (164, 10, 401654801488, 1264138569381, '灰色 26', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (165, 10, 401654801488, 1264138569373, '黑色 26', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (166, 10, 401654801488, 1264138569385, '灰色 30', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (167, 10, 401654801488, 1264138569402, '藏青色 31', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (168, 10, 401654801488, 1264138569398, '藏青色 27', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (169, 10, 401654801488, 1264138569379, '黑色 32', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (170, 10, 401654801488, 1264138569395, '浅蓝色 32', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (171, 10, 401654801488, 1264138569396, '藏青色 25', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (172, 10, 401654801488, 1264138569380, '灰色 25', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (173, 10, 401654801488, 1264138569383, '灰色 28', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (174, 10, 401654801488, 1264138569400, '藏青色 29', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (175, 10, 401654801488, 1264138569376, '黑色 29', 0, 0, '', 10, NULL, 'HN0025', 'HN0025', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (176, 11, 401781697078, 1257978437365, '浅蓝 M', 159, 16, '28202106780002', 1802, NULL, '28202106780002', '2820210678', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (177, 11, 401781697078, 1257978437367, '浅蓝 XL', 161, 16, '28202106780004', 1855, NULL, '28202106780004', '2820210678', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (178, 11, 401781697078, 1257978437366, '浅蓝 L', 160, 16, '28202106780003', 1815, NULL, '28202106780003', '2820210678', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (179, 11, 401781697078, 1257978437364, '浅蓝 S', 158, 16, '28202106780001', 1826, NULL, '28202106780001', '2820210678', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (180, 11, 401781697078, 1257978437368, '浅蓝 2XL', 162, 16, '28202106780005', 1866, NULL, '28202106780005', '2820210678', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (181, 12, 401781826934, 1257978913179, '浅蓝色 XL', 192, 18, 'HN202200140304', 987, NULL, 'HN202200140304', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (182, 12, 401781826934, 1257978913180, '浅蓝色 2XL', 193, 18, 'HN202200140305', 995, NULL, 'HN202200140305', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (183, 12, 401781826934, 1257978913169, '黑色 XL', 182, 18, 'HN202200140104', 967, NULL, 'HN202200140104', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (184, 12, 401781826934, 1257978913176, '浅蓝色 S', 189, 18, 'HN202200140301', 980, NULL, 'HN202200140301', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (185, 12, 401781826934, 1257978913167, '黑色 M', 180, 18, 'HN202200140102', 903, NULL, 'HN202200140102', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (186, 12, 401781826934, 1257978913173, '复古蓝 L', 186, 18, 'HN202200140203', 966, NULL, 'HN202200140203', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (187, 12, 401781826934, 1257978913168, '黑色 L', 181, 18, 'HN202200140103', 952, NULL, 'HN202200140103', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (188, 12, 401781826934, 1257978913166, '黑色 S', 179, 18, 'HN202200140101', 760, NULL, 'HN202200140101', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (189, 12, 401781826934, 1257978913174, '复古蓝 XL', 187, 18, 'HN202200140204', 979, NULL, 'HN202200140204', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (190, 12, 401781826934, 1257978913170, '黑色 2XL', 183, 18, 'HN202200140105', 979, NULL, 'HN202200140105', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (191, 12, 401781826934, 1257978913178, '浅蓝色 L', 191, 18, 'HN202200140303', 987, NULL, 'HN202200140303', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (192, 12, 401781826934, 1257978913175, '复古蓝 2XL', 188, 18, 'HN202200140205', 990, NULL, 'HN202200140205', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (193, 12, 401781826934, 1257978913172, '复古蓝 M', 185, 18, 'HN202200140202', 958, NULL, 'HN202200140202', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (194, 12, 401781826934, 1257978913177, '浅蓝色 M', 190, 18, 'HN202200140302', 978, NULL, 'HN202200140302', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (195, 12, 401781826934, 1257978913171, '复古蓝 S', 184, 18, 'HN202200140201', 967, NULL, 'HN202200140201', 'HN0014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (196, 13, 401993680807, 1258473180987, '背带裤+纯棉白T S', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (197, 13, 401993680807, 1258473180985, '单件背带裤 L', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (198, 13, 401993680807, 1258473180989, '背带裤+纯棉白T L', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (199, 13, 401993680807, 1258473180983, '单件背带裤 S', 0, 0, '', 99, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (200, 13, 401993680807, 1258473180986, '单件背带裤 XL', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (201, 13, 401993680807, 1258473180984, '单件背带裤 M', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (202, 13, 401993680807, 1258473180988, '背带裤+纯棉白T M', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (203, 13, 401993680807, 1258473180990, '背带裤+纯棉白T XL', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (204, 14, 403434723538, 1261841872282, '深蓝色 2XL', 336, 24, 'HN202200120105', 45, NULL, 'HN202200120105', 'HN0012', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (205, 14, 403434723538, 1261841872279, '深蓝色 M', 333, 24, 'HN202200120102', 32, NULL, 'HN202200120102', 'HN0012', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (206, 14, 403434723538, 1261841872278, '深蓝色 S', 332, 24, 'HN202200120101', 37, NULL, 'HN202200120101', 'HN0012', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (207, 14, 403434723538, 1261841872281, '深蓝色 XL', 335, 24, 'HN202200120104', 45, NULL, 'HN202200120104', 'HN0012', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (208, 14, 403434723538, 1261841872280, '深蓝色 L', 334, 24, 'HN202200120103', 44, NULL, 'HN202200120103', 'HN0012', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (209, 15, 403438406420, 1261849774936, '蓝色 XL', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (210, 15, 403438406420, 1261851471320, '蓝色 2XL', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (211, 15, 403438406420, 1261849774929, '黑色 S', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (212, 15, 403438406420, 1261849774933, '蓝色 S', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (213, 15, 403438406420, 1261849774935, '蓝色 L', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (214, 15, 403438406420, 1261849774932, '黑色 XL', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (215, 15, 403438406420, 1261849774934, '蓝色 M', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (216, 15, 403438406420, 1261849774930, '黑色 M', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (217, 15, 403438406420, 1261851471319, '黑色 2XL', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (218, 15, 403438406420, 1261849774931, '黑色 L', 0, 0, '', 20, NULL, '', 'HN0010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (219, 16, 403654853255, 1262268996969, '黑色 2XL', 0, 0, '', 1001, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (220, 16, 403654853255, 1294385941600, '复古蓝 2XL', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (221, 16, 403654853255, 1262268996965, '黑色 S', 0, 0, '', 1006, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (222, 16, 403654853255, 1262268996980, '浅蓝色 XL', 0, 0, '', 930, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (223, 16, 403654853255, 1262268996964, '黑色 XS', 0, 0, '', 1014, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (224, 16, 403654853255, 1262268996981, '浅蓝色 2XL', 0, 0, '', 935, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (225, 16, 403654853255, 1294385941597, '复古蓝 M', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (226, 16, 403654853255, 1294385941595, '复古蓝 XS', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (227, 16, 403654853255, 1294385941599, '复古蓝 XL', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (228, 16, 403654853255, 1262268996979, '浅蓝色 L', 0, 0, '', 869, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (229, 16, 403654853255, 1262268996967, '黑色 L', 0, 0, '', 996, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (230, 16, 403654853255, 1262268996978, '浅蓝色 M', 0, 0, '', 869, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (231, 16, 403654853255, 1262268996977, '浅蓝色 S', 0, 0, '', 872, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (232, 16, 403654853255, 1262268996966, '黑色 M', 0, 0, '', 993, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (233, 16, 403654853255, 1262268996976, '浅蓝色 XS', 0, 0, '', 1015, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (234, 16, 403654853255, 1262268996968, '黑色 XL', 0, 0, '', 1005, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (235, 16, 403654853255, 1294385941596, '复古蓝 S', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (236, 16, 403654853255, 1294385941598, '复古蓝 L', 0, 0, '', 20, NULL, 'HN015', 'HN015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (237, 17, 403877249755, 1262776022851, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (238, 17, 403877249755, 1262776022853, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (239, 17, 403877249755, 1262776022852, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (240, 17, 403877249755, 1262666161431, '黑色 M', 0, 0, '', 1015, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (241, 17, 403877249755, 1262666161432, '黑色 L', 0, 0, '', 1018, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (242, 17, 403877249755, 1262776022850, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (243, 17, 403877249755, 1262666161430, '黑色 S', 0, 0, '', 1016, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (244, 17, 403877249755, 1262666161429, '黑色 XS', 0, 0, '', 1017, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (245, 17, 403877249755, 1262776022849, '浅蓝色 XS', 0, 0, '', 20, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (246, 17, 403877249755, 1262666161433, '黑色 XL', 0, 0, '', 1017, NULL, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (247, 18, 403877355587, 1262852160966, '石板灰 25', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (248, 18, 403877355587, 1262666388065, '浅蓝色 31', 0, 0, '', 508, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (249, 18, 403877355587, 1262666388053, '黑色 27', 0, 0, '', 434, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (250, 18, 403877355587, 1262666388056, '黑色 30', 0, 0, '', 462, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (251, 18, 403877355587, 1262852160973, '石板灰 32', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (252, 18, 403877355587, 1262666388059, '浅蓝色 25', 0, 0, '', 507, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (253, 18, 403877355587, 1262852160960, '深灰色 27', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (254, 18, 403877355587, 1262852160972, '石板灰 31', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (255, 18, 403877355587, 1262666388052, '黑色 26', 0, 0, '', 461, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (256, 18, 403877355587, 1262666388055, '黑色 29', 0, 0, '', 444, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (257, 18, 403877355587, 1262666388060, '浅蓝色 26', 0, 0, '', 461, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (258, 18, 403877355587, 1262852160959, '深灰色 26', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (259, 18, 403877355587, 1262852160964, '深灰色 31', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (260, 18, 403877355587, 1262666388066, '浅蓝色 32', 0, 0, '', 507, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (261, 18, 403877355587, 1262666388054, '黑色 28', 0, 0, '', 423, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (262, 18, 403877355587, 1262852160958, '深灰色 25', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (263, 18, 403877355587, 1262852160967, '石板灰 26', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (264, 18, 403877355587, 1262666388062, '浅蓝色 28', 0, 0, '', 468, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (265, 18, 403877355587, 1262852160961, '深灰色 28', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (266, 18, 403877355587, 1262666388058, '黑色 32', 0, 0, '', 480, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (267, 18, 403877355587, 1262852160963, '深灰色 30', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (268, 18, 403877355587, 1262852160965, '深灰色 32', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (269, 18, 403877355587, 1262852160970, '石板灰 29', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (270, 18, 403877355587, 1262852160969, '石板灰 28', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (271, 18, 403877355587, 1262666388061, '浅蓝色 27', 0, 0, '', 453, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (272, 18, 403877355587, 1262666388057, '黑色 31', 0, 0, '', 479, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (273, 18, 403877355587, 1262666388051, '黑色 25', 0, 0, '', 415, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (274, 18, 403877355587, 1262852160962, '深灰色 29', 0, 0, '', 18, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (275, 18, 403877355587, 1262852160968, '石板灰 27', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (276, 18, 403877355587, 1262666388063, '浅蓝色 29', 0, 0, '', 493, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (277, 18, 403877355587, 1262666388064, '浅蓝色 30', 0, 0, '', 493, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (278, 18, 403877355587, 1262852160971, '石板灰 30', 0, 0, '', 20, NULL, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (279, 19, 403877444479, 1262855741579, '黑色 25', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (280, 19, 403877444479, 1262855741584, '灰色 29', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (281, 19, 403877444479, 1262666558181, '黑色 31', 0, 0, '', 519, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (282, 19, 403877444479, 1262666558178, '黑色 28', 0, 0, '', 518, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (283, 19, 403877444479, 1262855741580, '灰色 25', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (284, 19, 403877444479, 1262855741585, '灰色 30', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (285, 19, 403877444479, 1262666558176, '黑色 26', 0, 0, '', 520, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (286, 19, 403877444479, 1262666558180, '黑色 30', 0, 0, '', 520, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (287, 19, 403877444479, 1262855741586, '灰色 31', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (288, 19, 403877444479, 1262855741581, '灰色 26', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (289, 19, 403877444479, 1262666558179, '黑色 29', 0, 0, '', 518, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (290, 19, 403877444479, 1262666558177, '黑色 27', 0, 0, '', 520, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (291, 19, 403877444479, 1262855741587, '灰色 32', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (292, 19, 403877444479, 1262855741583, '灰色 28', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (293, 19, 403877444479, 1262666558182, '黑色 32', 0, 0, '', 520, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (294, 19, 403877444479, 1262855741582, '灰色 27', 0, 0, '', 20, NULL, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (295, 20, 403877488703, 1262666698661, '黑色 31', 0, 0, '', 9987, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (296, 20, 403877488703, 1262742707196, '海蓝色 29', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (297, 20, 403877488703, 1262742707198, '海蓝色 31', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (298, 20, 403877488703, 1262666698659, '黑色 29', 0, 0, '', 9912, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (299, 20, 403877488703, 1262666698662, '黑色 32', 0, 0, '', 9981, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (300, 20, 403877488703, 1262742707205, '深灰色 30', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (301, 20, 403877488703, 1262742707199, '海蓝色 32', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (302, 20, 403877488703, 1262742707197, '海蓝色 30', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (303, 20, 403877488703, 1262742707208, '亮钢蓝 25', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (304, 20, 403877488703, 1262742707212, '亮钢蓝 29', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (305, 20, 403877488703, 1262666698655, '黑色 25', 0, 0, '', 9978, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (306, 20, 403877488703, 1262742707209, '亮钢蓝 26', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (307, 20, 403877488703, 1262742707211, '亮钢蓝 28', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (308, 20, 403877488703, 1262742707210, '亮钢蓝 27', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (309, 20, 403877488703, 1262666698656, '黑色 26', 0, 0, '', 9918, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (310, 20, 403877488703, 1262742707193, '海蓝色 26', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (311, 20, 403877488703, 1262742707214, '亮钢蓝 31', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (312, 20, 403877488703, 1262742707202, '深灰色 27', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (313, 20, 403877488703, 1262666698660, '黑色 30', 0, 0, '', 9923, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (314, 20, 403877488703, 1262742707215, '亮钢蓝 32', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (315, 20, 403877488703, 1262742707194, '海蓝色 27', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (316, 20, 403877488703, 1262742707195, '海蓝色 28', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (317, 20, 403877488703, 1262742707203, '深灰色 28', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (318, 20, 403877488703, 1262666698658, '黑色 28', 0, 0, '', 9876, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (319, 20, 403877488703, 1262742707201, '深灰色 26', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (320, 20, 403877488703, 1262742707192, '海蓝色 25', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (321, 20, 403877488703, 1262742707207, '深灰色 32', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (322, 20, 403877488703, 1262742707213, '亮钢蓝 30', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (323, 20, 403877488703, 1262666698657, '黑色 27', 0, 0, '', 9889, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (324, 20, 403877488703, 1262742707204, '深灰色 29', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (325, 20, 403877488703, 1262742707200, '深灰色 25', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (326, 20, 403877488703, 1262742707206, '深灰色 31', 0, 0, '', 20, NULL, 'HN0023', 'HN023', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (327, 21, 403877607629, 1262666896377, '黑灰色 28', 311, 23, 'HN202200240228', 1011, NULL, 'HN202200240228', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (328, 21, 403877607629, 1262666896370, '浅蓝色 28', 319, 23, 'HN202200240328', 1011, NULL, 'HN202200240328', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (329, 21, 403877607629, 1262666896361, '黑色 26', 301, 23, 'HN202200240126', 1018, NULL, 'HN202200240126', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (330, 21, 403877607629, 1262666896386, '蓝灰色 30', 329, 23, 'HN202200240430', 1013, NULL, 'HN202200240430', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (331, 21, 403877607629, 1262666896374, '浅蓝色 32', 323, 23, 'HN202200240332', 1015, NULL, 'HN202200240332', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (332, 21, 403877607629, 1262666896378, '黑灰色 29', 312, 23, 'HN202200240229', 1020, NULL, 'HN202200240229', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (333, 21, 403877607629, 1262666896365, '黑色 30', 305, 23, 'HN202200240130', 1019, NULL, 'HN202200240130', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (334, 21, 403877607629, 1262666896385, '蓝灰色 29', 328, 23, 'HN202200240429', 1018, NULL, 'HN202200240429', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (335, 21, 403877607629, 1262666896381, '黑灰色 32', 315, 23, 'HN202200240232', 1019, NULL, 'HN202200240232', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (336, 21, 403877607629, 1262666896368, '浅蓝色 26', 317, 23, 'HN202200240326', 1015, NULL, 'HN202200240326', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (337, 21, 403877607629, 1262666896373, '浅蓝色 31', 322, 23, 'HN202200240331', 1017, NULL, 'HN202200240331', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (338, 21, 403877607629, 1262666896383, '蓝灰色 27', 326, 23, 'HN202200240427', 1017, NULL, 'HN202200240427', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (339, 21, 403877607629, 1262666896367, '黑色 32', 307, 23, 'HN202200240132', 1019, NULL, 'HN202200240132', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (340, 21, 403877607629, 1262666896387, '蓝灰色 31', 330, 23, 'HN202200240431', 1018, NULL, 'HN202200240431', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (341, 21, 403877607629, 1262666896388, '蓝灰色 32', 331, 23, 'HN202200240432', 1015, NULL, 'HN202200240432', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (342, 21, 403877607629, 1262666896380, '黑灰色 31', 314, 23, 'HN202200240231', 1020, NULL, 'HN202200240231', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (343, 21, 403877607629, 1262666896364, '黑色 29', 304, 23, 'HN202200240129', 1018, NULL, 'HN202200240129', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (344, 21, 403877607629, 1262666896372, '浅蓝色 30', 321, 23, 'HN202200240330', 1010, NULL, 'HN202200240330', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (345, 21, 403877607629, 1262666896363, '黑色 28', 303, 23, 'HN202200240128', 1018, NULL, 'HN202200240128', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (346, 21, 403877607629, 1262666896371, '浅蓝色 29', 320, 23, 'HN202200240329', 1016, NULL, 'HN202200240329', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (347, 21, 403877607629, 1262666896382, '蓝灰色 26', 325, 23, 'HN202200240426', 1016, NULL, 'HN202200240426', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (348, 21, 403877607629, 1262666896366, '黑色 31', 306, 23, 'HN202200240131', 1019, NULL, 'HN202200240131', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (349, 21, 403877607629, 1262666896362, '黑色 27', 302, 23, 'HN202200240127', 1019, NULL, 'HN202200240127', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (350, 21, 403877607629, 1262666896376, '黑灰色 27', 310, 23, 'HN202200240227', 1015, NULL, 'HN202200240227', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (351, 21, 403877607629, 1262666896369, '浅蓝色 27', 318, 23, 'HN202200240327', 1012, NULL, 'HN202200240327', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (352, 21, 403877607629, 1262666896375, '黑灰色 26', 309, 23, 'HN202200240226', 1015, NULL, 'HN202200240226', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (353, 21, 403877607629, 1262666896384, '蓝灰色 28', 327, 23, 'HN202200240428', 1014, NULL, 'HN202200240428', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (354, 21, 403877607629, 1262666896379, '黑灰色 30', 313, 23, 'HN202200240230', 1020, NULL, 'HN202200240230', 'HN20220024', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (355, 22, 403877716388, 1262667109644, '黑色 28', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (356, 22, 403877716388, 1262667109643, '黑色 27', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (357, 22, 403877716388, 1262783777281, '蓝色 31', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (358, 22, 403877716388, 1262783777288, '深灰色 30', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (359, 22, 403877716388, 1262667109647, '黑色 31', 0, 0, '', 1019, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (360, 22, 403877716388, 1262783777276, '蓝色 26', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (361, 22, 403877716388, 1262783777289, '深灰色 31', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (362, 22, 403877716388, 1262783777282, '蓝色 32', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (363, 22, 403877716388, 1262783777290, '深灰色 32', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (364, 22, 403877716388, 1262783777286, '深灰色 28', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (365, 22, 403877716388, 1262783777279, '蓝色 29', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (366, 22, 403877716388, 1262783777283, '深灰色 25', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (367, 22, 403877716388, 1262667109648, '黑色 32', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (368, 22, 403877716388, 1262667109645, '黑色 29', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (369, 22, 403877716388, 1262783777277, '蓝色 27', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (370, 22, 403877716388, 1262667109646, '黑色 30', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (371, 22, 403877716388, 1262783777285, '深灰色 27', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (372, 22, 403877716388, 1262667109641, '黑色 25', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (373, 22, 403877716388, 1262667109642, '黑色 26', 0, 0, '', 1020, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (374, 22, 403877716388, 1262783777287, '深灰色 29', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (375, 22, 403877716388, 1262783777275, '蓝色 25', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (376, 22, 403877716388, 1262783777280, '蓝色 30', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (377, 22, 403877716388, 1262783777278, '蓝色 28', 0, 0, '', 19, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (378, 22, 403877716388, 1262783777284, '深灰色 26', 0, 0, '', 20, NULL, 'HN0029', 'HN0029', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (379, 23, 404300819650, 1263497350054, '32 145斤到155斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (380, 23, 404300819650, 1263497350052, '30 125斤到135斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (381, 23, 404300819650, 1263497350051, '29 115斤到125斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (382, 23, 404300819650, 1263497350055, '33 155斤到175斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (383, 23, 404300819650, 1263497350050, '28 100斤到115斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (384, 23, 404300819650, 1263497350053, '31 135斤到145斤左右', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (385, 24, 408225561862, 1271533011330, '黑灰 28', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (386, 24, 408225561862, 1271533011332, '黑灰 30', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (387, 24, 408225561862, 1271533011327, '蓝灰 32', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (388, 24, 408225561862, 1271533011334, '黑灰 32', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (389, 24, 408225561862, 1271533011331, '黑灰 29', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (390, 24, 408225561862, 1271533011321, '蓝灰 26', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (391, 24, 408225561862, 1271533011323, '蓝灰 28', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (392, 24, 408225561862, 1271533011322, '蓝灰 27', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (393, 24, 408225561862, 1271533011326, '蓝灰 31', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (394, 24, 408225561862, 1271533011329, '黑灰 27', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (395, 24, 408225561862, 1271533011325, '蓝灰 30', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (396, 24, 408225561862, 1271533011333, '黑灰 31', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (397, 24, 408225561862, 1271533011324, '蓝灰 29', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (398, 24, 408225561862, 1271533011328, '黑灰 26', 0, 0, '', 220, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (399, 25, 409855932902, 1274875964281, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0180', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (400, 25, 409855932902, 1274875964278, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0180', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (401, 25, 409855932902, 1274875964279, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0180', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (402, 25, 409855932902, 1274875964282, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0180', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (403, 25, 409855932902, 1274875964280, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0180', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (404, 26, 409864423309, 1274883221799, '蓝色 XL', 553, 37, 'HN1064004', 69, NULL, 'HN1064004', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (405, 26, 409864423309, 1274883221793, '黑色 L', 547, 37, 'HN1060103', 69, NULL, 'HN1060103', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (406, 26, 409864423309, 1274883221792, '黑色 M', 546, 37, 'HN1060102', 69, NULL, 'HN1060102', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (407, 26, 409864423309, 1274883221800, '蓝色 2XL', 554, 37, 'HN1064005', 70, NULL, 'HN1064005', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (408, 26, 409864423309, 1274883221803, '石板灰 L', 557, 37, 'HN1062903', 70, NULL, 'HN1062903', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (409, 26, 409864423309, 1274883221795, '黑色 2XL', 549, 37, 'HN1060105', 68, NULL, 'HN1060105', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (410, 26, 409864423309, 1274883221797, '蓝色 M', 551, 37, 'HN1064002', 67, NULL, 'HN1064002', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (411, 26, 409864423309, 1274883221798, '蓝色 L', 552, 37, 'HN1064003', 69, NULL, 'HN1064003', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (412, 26, 409864423309, 1274883221804, '石板灰 XL', 558, 37, 'HN1062904', 70, NULL, 'HN1062904', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (413, 26, 409864423309, 1274883221791, '黑色 S', 545, 37, 'HN1060101', 70, NULL, 'HN1060101', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (414, 26, 409864423309, 1274883221805, '石板灰 2XL', 559, 37, 'HN1062905', 70, NULL, 'HN1062905', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (415, 26, 409864423309, 1274883221796, '蓝色 S', 550, 37, 'HN1064001', 68, NULL, 'HN1064001', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (416, 26, 409864423309, 1274883221794, '黑色 XL', 548, 37, 'HN1060104', 70, NULL, 'HN1060104', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (417, 26, 409864423309, 1274883221802, '石板灰 M', 556, 37, 'HN1062902', 69, NULL, 'HN1062902', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (418, 26, 409864423309, 1274883221801, '石板灰 S', 555, 37, 'HN1062901', 69, NULL, 'HN1062901', 'HN106', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (419, 27, 409866847439, 1274887667603, '浅蓝色 29', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (420, 27, 409866847439, 1274887667608, '深蓝色 27', 0, 0, '', 18, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (421, 27, 409866847439, 1274887667601, '浅蓝色 27', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (422, 27, 409866847439, 1274887667610, '深蓝色 29', 0, 0, '', 19, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (423, 27, 409866847439, 1274887667602, '浅蓝色 28', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (424, 27, 409866847439, 1274887667604, '浅蓝色 30', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (425, 27, 409866847439, 1274887667600, '浅蓝色 26', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (426, 27, 409866847439, 1274887667612, '深蓝色 31', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (427, 27, 409866847439, 1274887667611, '深蓝色 30', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (428, 27, 409866847439, 1274887667606, '浅蓝色 32', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (429, 27, 409866847439, 1274887667605, '浅蓝色 31', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (430, 27, 409866847439, 1274887667607, '深蓝色 26', 0, 0, '', 18, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (431, 27, 409866847439, 1274887667609, '深蓝色 28', 0, 0, '', 20, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (432, 27, 409866847439, 1274887667613, '深蓝色 32', 0, 0, '', 19, NULL, 'HN0222', 'HN222', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (433, 28, 409879757750, 1274915162081, '深灰色 M', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (434, 28, 409879757750, 1274915162088, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (435, 28, 409879757750, 1274915162094, '湖蓝色 2XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (436, 28, 409879757750, 1274915162085, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (437, 28, 409879757750, 1274915162090, '湖蓝色 S', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (438, 28, 409879757750, 1274915162082, '深灰色 L', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (439, 28, 409879757750, 1274915162080, '深灰色 S', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (440, 28, 409879757750, 1274915162086, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (441, 28, 409879757750, 1274915162091, '湖蓝色 M', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (442, 28, 409879757750, 1274915162092, '湖蓝色 L', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (443, 28, 409879757750, 1274915162083, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (444, 28, 409879757750, 1274915162084, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (445, 28, 409879757750, 1274915162087, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (446, 28, 409879757750, 1274915162089, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (447, 28, 409879757750, 1274915162093, '湖蓝色 XL', 0, 0, '', 20, NULL, 'HN0620', 'HN620', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (448, 29, 409883128005, 1274920833073, '黑色 L', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (449, 29, 409883128005, 1274920833090, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (450, 29, 409883128005, 1274920833087, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (451, 29, 409883128005, 1274920833079, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (452, 29, 409883128005, 1274920833074, '黑色 XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (453, 29, 409883128005, 1274920833080, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (454, 29, 409883128005, 1274920833076, '深灰色 S', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (455, 29, 409883128005, 1274920833077, '深灰色 M', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (456, 29, 409883128005, 1274920833084, '藏青色 XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (457, 29, 409883128005, 1274920833072, '黑色 M', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (458, 29, 409883128005, 1274920833075, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (459, 29, 409883128005, 1274920833083, '藏青色 L', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (460, 29, 409883128005, 1274920833078, '深灰色 L', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (461, 29, 409883128005, 1274920833086, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (462, 29, 409883128005, 1274920833082, '藏青色 M', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (463, 29, 409883128005, 1274920833089, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (464, 29, 409883128005, 1274920833088, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (465, 29, 409883128005, 1274920833081, '藏青色 S', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (466, 29, 409883128005, 1274920833071, '黑色 S', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (467, 29, 409883128005, 1274920833085, '藏青色 2XL', 0, 0, '', 20, NULL, 'HN0621', 'HN621', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (468, 30, 409885859735, 1274926586717, '宝蓝色 L', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (469, 30, 409885859735, 1274926586713, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (470, 30, 409885859735, 1274926586712, '深灰色 L', 0, 0, '', 19, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (471, 30, 409885859735, 1274926586710, '深灰色 S', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (472, 30, 409885859735, 1274926586715, '宝蓝色 S', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (473, 30, 409885859735, 1274926586722, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (474, 30, 409885859735, 1274926586714, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (475, 30, 409885859735, 1274926586716, '宝蓝色 M', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (476, 30, 409885859735, 1274926586719, '宝蓝色 2XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (477, 30, 409885859735, 1274926586723, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (478, 30, 409885859735, 1274926586724, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (479, 30, 409885859735, 1274926586711, '深灰色 M', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (480, 30, 409885859735, 1274926586721, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (481, 30, 409885859735, 1274926586720, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (482, 30, 409885859735, 1274926586718, '宝蓝色 XL', 0, 0, '', 20, NULL, 'HN0630', 'HN630', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (483, 31, 410305683990, 1275780297875, '宝蓝色 M', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (484, 31, 410305683990, 1275780297878, '宝蓝色 2XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (485, 31, 410305683990, 1275780297882, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (486, 31, 410305683990, 1275780297874, '宝蓝色 S', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (487, 31, 410305683990, 1275780297880, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (488, 31, 410305683990, 1275780297873, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (489, 31, 410305683990, 1275780297879, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (490, 31, 410305683990, 1275780297872, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (491, 31, 410305683990, 1275780297869, '深灰色 S', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (492, 31, 410305683990, 1275780297864, '黑色 S', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (493, 31, 410305683990, 1275780297883, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (494, 31, 410305683990, 1275780297881, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (495, 31, 410305683990, 1275780297865, '黑色 M', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (496, 31, 410305683990, 1275780297867, '黑色 XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (497, 31, 410305683990, 1275780297876, '宝蓝色 L', 0, 0, '', 19, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (498, 31, 410305683990, 1275780297868, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (499, 31, 410305683990, 1275780297870, '深灰色 M', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (500, 31, 410305683990, 1275780297866, '黑色 L', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (501, 31, 410305683990, 1275780297877, '宝蓝色 XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (502, 31, 410305683990, 1275780297871, '深灰色 L', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (503, 32, 410308626596, 1275783538406, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0662', 'HN662', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (504, 32, 410308626596, 1275783538409, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0662', 'HN662', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (505, 32, 410308626596, 1275783538410, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0662', 'HN662', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (506, 32, 410308626596, 1275783538407, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0662', 'HN662', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (507, 32, 410308626596, 1275783538408, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0662', 'HN662', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (508, 33, 410688391724, 1276549759303, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (509, 33, 410688391724, 1276549759304, '黑灰色 S', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (510, 33, 410688391724, 1276549759300, '浅蓝色 M', 0, 0, '', 19, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (511, 33, 410688391724, 1276549759308, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (512, 33, 410688391724, 1276549759307, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (513, 33, 410688391724, 1276549759299, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (514, 33, 410688391724, 1276549759305, '黑灰色 M', 0, 0, '', 19, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (515, 33, 410688391724, 1276549759306, '黑灰色 L', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (516, 33, 410688391724, 1276549759302, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (517, 33, 410688391724, 1276549759301, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0663', 'HN663', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (518, 34, 410692286065, 1276552341638, '黑色 L', 0, 0, '', 20, NULL, 'HN0665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (519, 34, 410692286065, 1276552341639, '黑色 XL', 0, 0, '', 20, NULL, 'HN0665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (520, 34, 410692286065, 1276552341637, '黑色 M', 0, 0, '', 20, NULL, 'HN0665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (521, 34, 410692286065, 1276552341640, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (522, 34, 410692286065, 1276552341636, '黑色 S', 0, 0, '', 20, NULL, 'HN0665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (523, 35, 410693529689, 1276555714237, '深天蓝 L', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (524, 35, 410693529689, 1276555714229, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (525, 35, 410693529689, 1276555714242, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (526, 35, 410693529689, 1276555714239, '深天蓝 2XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (527, 35, 410693529689, 1276555714225, '黑色 S', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (528, 35, 410693529689, 1276555714228, '黑色 XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (529, 35, 410693529689, 1276555714243, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (530, 35, 410693529689, 1276555714241, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (531, 35, 410693529689, 1276555714232, '深灰色 L', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (532, 35, 410693529689, 1276555714226, '黑色 M', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (533, 35, 410693529689, 1276555714227, '黑色 L', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (534, 35, 410693529689, 1276555714234, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (535, 35, 410693529689, 1276555714233, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (536, 35, 410693529689, 1276555714235, '深天蓝 S', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (537, 35, 410693529689, 1276555714231, '深灰色 M', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (538, 35, 410693529689, 1276555714244, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (539, 35, 410693529689, 1276555714236, '深天蓝 M', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (540, 35, 410693529689, 1276555714240, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (541, 35, 410693529689, 1276555714230, '深灰色 S', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (542, 35, 410693529689, 1276555714238, '深天蓝 XL', 0, 0, '', 20, NULL, 'HN0666', 'HN666', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (543, 36, 410694952121, 1276557736043, '宝蓝色 S', 0, 0, '', 18, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (544, 36, 410694952121, 1276557736045, '宝蓝色 L', 0, 0, '', 16, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (545, 36, 410694952121, 1276557736047, '宝蓝色 2XL', 0, 0, '', 19, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (546, 36, 410694952121, 1276557736039, '浅蓝色 M', 0, 0, '', 19, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (547, 36, 410694952121, 1276557736041, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (548, 36, 410694952121, 1276557736046, '宝蓝色 XL', 0, 0, '', 17, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (549, 36, 410694952121, 1276557736038, '浅蓝色 S', 0, 0, '', 18, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (550, 36, 410694952121, 1276557736044, '宝蓝色 M', 0, 0, '', 15, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (551, 36, 410694952121, 1276557736040, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (552, 36, 410694952121, 1276557736042, '浅蓝色 2XL', 0, 0, '', 19, NULL, 'HN0667', 'HN667', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (553, 37, 410695996318, 1276560236799, '宝蓝色 XL', 592, 40, 'HN6681204', 20, NULL, 'HN6681204', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (554, 37, 410695996318, 1276560236801, '深灰色 S', 594, 40, 'HN6687501', 20, NULL, 'HN6687501', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (555, 37, 410695996318, 1276560236804, '深灰色 XL', 597, 40, 'HN6687504', 20, NULL, 'HN6687504', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (556, 37, 410695996318, 1276560236793, '浅蓝色 L', 586, 40, 'HN6685003', 20, NULL, 'HN6685003', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (557, 37, 410695996318, 1276560236798, '宝蓝色 L', 591, 40, 'HN6681203', 20, NULL, 'HN6681203', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (558, 37, 410695996318, 1276560236797, '宝蓝色 M', 590, 40, 'HN6681202', 20, NULL, 'HN6681202', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (559, 37, 410695996318, 1276560236794, '浅蓝色 XL', 587, 40, 'HN6685004', 20, NULL, 'HN6685004', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (560, 37, 410695996318, 1276560236792, '浅蓝色 M', 585, 40, 'HN6685002', 20, NULL, 'HN6685002', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (561, 37, 410695996318, 1276560236791, '浅蓝色 S', 584, 40, 'HN6685001', 19, NULL, 'HN6685001', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (562, 37, 410695996318, 1276560236796, '宝蓝色 S', 589, 40, 'HN6681201', 20, NULL, 'HN6681201', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (563, 37, 410695996318, 1276560236805, '深灰色 2XL', 598, 40, 'HN6687505', 20, NULL, 'HN6687505', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (564, 37, 410695996318, 1276560236795, '浅蓝色 2XL', 588, 40, 'HN6685005', 20, NULL, 'HN6685005', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (565, 37, 410695996318, 1276560236803, '深灰色 L', 596, 40, 'HN6687503', 20, NULL, 'HN6687503', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (566, 37, 410695996318, 1276560236800, '宝蓝色 2XL', 593, 40, 'HN6681205', 20, NULL, 'HN6681205', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (567, 37, 410695996318, 1276560236802, '深灰色 M', 595, 40, 'HN6687502', 20, NULL, 'HN6687502', 'HN668', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (568, 38, 410697172304, 1276562723239, '宝蓝色 XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (569, 38, 410697172304, 1276562723232, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (570, 38, 410697172304, 1276562723241, '黑色 S', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (571, 38, 410697172304, 1276562723233, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (572, 38, 410697172304, 1276562723231, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (573, 38, 410697172304, 1276562723242, '黑色 M', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (574, 38, 410697172304, 1276562723243, '黑色 L', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (575, 38, 410697172304, 1276562723237, '宝蓝色 M', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (576, 38, 410697172304, 1276562723238, '宝蓝色 L', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (577, 38, 410697172304, 1276562723235, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (578, 38, 410697172304, 1276562723240, '宝蓝色 2XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (579, 38, 410697172304, 1276562723245, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (580, 38, 410697172304, 1276562723234, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (581, 38, 410697172304, 1276562723236, '宝蓝色 S', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (582, 38, 410697172304, 1276562723244, '黑色 XL', 0, 0, '', 20, NULL, 'HN0669', 'HN669', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (583, 39, 411361540533, 1277927242201, '宝蓝色 2XL', 424, 28, 'HN6704005', 20, NULL, 'HN6704005', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (584, 39, 411361540533, 1277927242203, '深灰色 L', 417, 28, 'HN6707503', 19, NULL, 'HN6707503', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (585, 39, 411361540533, 1277926678779, '深灰色 S', 415, 28, 'HN6707501', 20, NULL, 'HN6707501', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (586, 39, 411361540533, 1277926678778, '宝蓝色 S', 420, 28, 'HN6704001', 19, NULL, 'HN6704001', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (587, 39, 411361540533, 1277927242196, '浅蓝色 XL', 413, 28, 'HN6705004', 20, NULL, 'HN6705004', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (588, 39, 411361540533, 1277927242197, '浅蓝色 2XL', 414, 28, 'HN6705005', 20, NULL, 'HN6705005', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (589, 39, 411361540533, 1277927242200, '宝蓝色 XL', 423, 28, 'HN6704004', 20, NULL, 'HN6704004', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (590, 39, 411361540533, 1277927242204, '深灰色 XL', 418, 28, 'HN6707504', 19, NULL, 'HN6707504', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (591, 39, 411361540533, 1277926678777, '浅蓝色 S', 410, 28, 'HN6705001', 20, NULL, 'HN6705001', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (592, 39, 411361540533, 1277927242194, '浅蓝色 M', 411, 28, 'HN6705002', 20, NULL, 'HN6705002', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (593, 39, 411361540533, 1277927242205, '深灰色 2XL', 419, 28, 'HN6707505', 19, NULL, 'HN6707505', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (594, 39, 411361540533, 1277927242195, '浅蓝色 L', 412, 28, 'HN6705003', 20, NULL, 'HN6705003', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (595, 39, 411361540533, 1277927242202, '深灰色 M', 416, 28, 'HN6707502', 18, NULL, 'HN6707502', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (596, 39, 411361540533, 1277927242198, '宝蓝色 M', 421, 28, 'HN6704002', 19, NULL, 'HN6704002', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (597, 39, 411361540533, 1277927242199, '宝蓝色 L', 422, 28, 'HN6704003', 19, NULL, 'HN6704003', 'HN670', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (598, 40, 411366495987, 1277929165137, '黑色 L', 0, 0, '', 20, NULL, 'HN0671', '665779472192', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (599, 40, 411366495987, 1277929165138, '黑色 XL', 0, 0, '', 20, NULL, 'HN0671', '665779472192', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (600, 40, 411366495987, 1277929165139, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0671', '665779472192', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (601, 40, 411366495987, 1277929165135, '黑色 S', 0, 0, '', 20, NULL, 'HN0671', '665779472192', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (602, 40, 411366495987, 1277929165136, '黑色 M', 0, 0, '', 20, NULL, 'HN0671', '665779472192', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (603, 41, 411370161999, 1277936821459, '宝蓝色 L', 0, 0, '', 19, NULL, 'HN0672', '670461866109', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (604, 41, 411370161999, 1277936821460, '宝蓝色 XL', 0, 0, '', 20, NULL, 'HN0672', '670461866109', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (605, 41, 411370161999, 1277936821457, '宝蓝色 S', 0, 0, '', 20, NULL, 'HN0672', '670461866109', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (606, 41, 411370161999, 1277936821458, '宝蓝色 M', 0, 0, '', 19, NULL, 'HN0672', '670461866109', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (607, 41, 411370161999, 1277936821461, '宝蓝色 2XL', 0, 0, '', 20, NULL, 'HN0672', '670461866109', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (608, 42, 411378921081, 1277953926674, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (609, 42, 411378921081, 1277953926679, '深灰色 XL', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (610, 42, 411378921081, 1277953926675, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (611, 42, 411378921081, 1277953926677, '深灰色 M', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (612, 42, 411378921081, 1277953926671, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (613, 42, 411378921081, 1277953926678, '深灰色 L', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (614, 42, 411378921081, 1277953926680, '深灰色 2XL', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (615, 42, 411378921081, 1277953926672, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (616, 42, 411378921081, 1277953926676, '深灰色 S', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (617, 42, 411378921081, 1277953926673, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0673', '637993903547', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (618, 43, 411379965590, 1277957033281, '黑色 M', 0, 0, '', 20, NULL, 'HN0675', '668784844135', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (619, 43, 411379965590, 1277957033284, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0675', '668784844135', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (620, 43, 411379965590, 1277957033280, '黑色 S', 0, 0, '', 20, NULL, 'HN0675', '668784844135', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (621, 43, 411379965590, 1277957033283, '黑色 XL', 0, 0, '', 20, NULL, 'HN0675', '668784844135', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (622, 43, 411379965590, 1277957033282, '黑色 L', 0, 0, '', 20, NULL, 'HN0675', '668784844135', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (623, 44, 411726911306, 1278685364127, '黑灰色 M', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (624, 44, 411726911306, 1278685364117, '白色 M', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (625, 44, 411726911306, 1278685364119, '白色 XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (626, 44, 411726911306, 1278685364129, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (627, 44, 411726911306, 1278685364121, '黑色 S', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (628, 44, 411726911306, 1278685364128, '黑灰色 L', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (629, 44, 411726911306, 1278685364118, '白色 L', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (630, 44, 411726911306, 1278685364130, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (631, 44, 411726911306, 1278685364134, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (632, 44, 411726911306, 1278685364122, '黑色 M', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (633, 44, 411726911306, 1278685364132, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (634, 44, 411726911306, 1278685364133, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (635, 44, 411726911306, 1278685364124, '黑色 XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (636, 44, 411726911306, 1278685364125, '黑色 2XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (637, 44, 411726911306, 1278685364135, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (638, 44, 411726911306, 1278685364120, '白色 2XL', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (639, 44, 411726911306, 1278685364131, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (640, 44, 411726911306, 1278685364126, '黑灰色 S', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (641, 44, 411726911306, 1278685364123, '黑色 L', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (642, 44, 411726911306, 1278685364116, '白色 S', 0, 0, '', 20, NULL, 'HN0686', 'HN686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (643, 45, 411728903206, 1278687408574, '彩色 S', 0, 0, '', 20, NULL, 'HN0687', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (644, 45, 411728903206, 1278687408576, '彩色 L', 0, 0, '', 20, NULL, 'HN0687', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (645, 45, 411728903206, 1278687408575, '彩色 M', 0, 0, '', 20, NULL, 'HN0687', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (646, 45, 411728903206, 1278687408577, '彩色 XL', 0, 0, '', 20, NULL, 'HN0687', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (647, 45, 411728903206, 1278687408578, '彩色 2XL', 0, 0, '', 20, NULL, 'HN0687', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (648, 46, 411729694401, 1278690383970, '黑灰色 2XL', 539, 36, 'HN6927505', 20, NULL, 'HN6927505', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (649, 46, 411729694401, 1278690383962, '浅蓝色 M', 541, 36, 'HN6925002', 20, NULL, 'HN6925002', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (650, 46, 411729694401, 1278690383964, '浅蓝色 XL', 543, 36, 'HN6925004', 19, NULL, 'HN6925004', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (651, 46, 411729694401, 1278690383966, '黑灰色 S', 535, 36, 'HN6927501', 18, NULL, 'HN6927501', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (652, 46, 411729694401, 1278690383961, '浅蓝色 S', 540, 36, 'HN6925001', 19, NULL, 'HN6925001', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (653, 46, 411729694401, 1278690383963, '浅蓝色 L', 542, 36, 'HN6925003', 20, NULL, 'HN6925003', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (654, 46, 411729694401, 1278690383969, '黑灰色 XL', 538, 36, 'HN6927504', 20, NULL, 'HN6927504', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (655, 46, 411729694401, 1278690383968, '黑灰色 L', 537, 36, 'HN6927503', 17, NULL, 'HN6927503', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (656, 46, 411729694401, 1278690383965, '浅蓝色 2XL', 544, 36, 'HN6925005', 20, NULL, 'HN6925005', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (657, 46, 411729694401, 1278690383967, '黑灰色 M', 536, 36, 'HN6927502', 20, NULL, 'HN6927502', 'HN692', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (658, 47, 411731178725, 1278693303512, '蓝色 M', 624, 43, 'HN6945002', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (659, 47, 411731178725, 1278693303514, '蓝色 XL', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (660, 47, 411731178725, 1278693303516, '黑灰色 S', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (661, 47, 411731178725, 1278693303520, '黑灰色 2XL', 0, 0, '', 19, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (662, 47, 411731178725, 1278693303517, '黑灰色 M', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (663, 47, 411731178725, 1278693303515, '蓝色 2XL', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (664, 47, 411731178725, 1278693303511, '蓝色 S', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (665, 47, 411731178725, 1278693303519, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (666, 47, 411731178725, 1278693303518, '黑灰色 L', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (667, 47, 411731178725, 1278693303513, '蓝色 L', 0, 0, '', 20, NULL, 'HN0694', 'HN0694', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (668, 48, 411732581938, 1278695025347, '黑灰色 L', 0, 0, '', 19, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (669, 48, 411732581938, 1278695025352, '浅蓝色 L', 0, 0, '', 17, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (670, 48, 411732581938, 1278695025353, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (671, 48, 411732581938, 1278695025345, '黑灰色 S', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (672, 48, 411732581938, 1278695025349, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (673, 48, 411732581938, 1278695025357, '杏色 L', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (674, 48, 411732581938, 1278695025346, '黑灰色 M', 0, 0, '', 19, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (675, 48, 411732581938, 1278695025354, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (676, 48, 411732581938, 1278695025359, '杏色 2XL', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (677, 48, 411732581938, 1278695025355, '杏色 S', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (678, 48, 411732581938, 1278695025348, '黑灰色 XL', 0, 0, '', 19, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (679, 48, 411732581938, 1278695025358, '杏色 XL', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (680, 48, 411732581938, 1278695025356, '杏色 M', 0, 0, '', 20, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (681, 48, 411732581938, 1278695025350, '浅蓝色 S', 0, 0, '', 19, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (682, 48, 411732581938, 1278695025351, '浅蓝色 M', 0, 0, '', 16, NULL, 'HN0697', 'HN697', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (683, 49, 412120506598, 1279515712395, '黑灰色 XL', 498, 33, 'HN08017504', 15, NULL, 'HN08017504', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (684, 49, 412120506598, 1279515712388, '黑色 M', 491, 33, 'HN08010102', 16, NULL, 'HN08010102', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (685, 49, 412120506598, 1279515712390, '黑色 XL', 493, 33, 'HN08010104', 19, NULL, 'HN08010104', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (686, 49, 412120506598, 1279515712397, '复古蓝 S', 505, 33, 'HN08014001', 19, NULL, 'HN08014001', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (687, 49, 412120506598, 1279515712405, '蓝灰色 XL', 498, 33, 'HN08017504', 17, NULL, 'HN08017504', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (688, 49, 412120506598, 1279515712402, '蓝灰色 S', 495, 33, 'HN08017501', 18, NULL, 'HN08017501', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (689, 49, 412120506598, 1279515712398, '复古蓝 M', 506, 33, 'HN08014002', 17, NULL, 'HN08014002', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (690, 49, 412120506598, 1279515712400, '复古蓝 XL', 508, 33, 'HN08014004', 19, NULL, 'HN08014004', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (691, 49, 412120506598, 1279515712389, '黑色 L', 492, 33, 'HN08010103', 14, NULL, 'HN08010103', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (692, 49, 412120506598, 1279515712387, '黑色 S', 490, 33, 'HN08010101', 18, NULL, 'HN08010101', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (693, 49, 412120506598, 1279515712401, '复古蓝 2XL', 509, 33, 'HN08014005', 20, NULL, 'HN08014005', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (694, 49, 412120506598, 1279515712396, '黑灰色 2XL', 499, 33, 'HN08017505', 17, NULL, 'HN08017505', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (695, 49, 412120506598, 1279515712406, '蓝灰色 2XL', 499, 33, 'HN08017505', 19, NULL, 'HN08017505', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (696, 49, 412120506598, 1279515712393, '黑灰色 M', 496, 33, 'HN08017502', 14, NULL, 'HN08017502', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (697, 49, 412120506598, 1279515712394, '黑灰色 L', 497, 33, 'HN08017503', 11, NULL, 'HN08017503', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (698, 49, 412120506598, 1279515712391, '黑色 2XL', 494, 33, 'HN08010105', 18, NULL, 'HN08010105', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (699, 49, 412120506598, 1279515712403, '蓝灰色 M', 496, 33, 'HN08017502', 14, NULL, 'HN08017502', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (700, 49, 412120506598, 1279515712399, '复古蓝 L', 507, 33, 'HN08014003', 19, NULL, 'HN08014003', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (701, 49, 412120506598, 1279515712392, '黑灰色 S', 495, 33, 'HN08017501', 15, NULL, 'HN08017501', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (702, 49, 412120506598, 1279515712404, '蓝灰色 L', 497, 33, 'HN08017503', 10, NULL, 'HN08017503', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (703, 50, 412133591017, 1279544038796, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (704, 50, 412133591017, 1279544038800, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (705, 50, 412133591017, 1279544038791, '蓝灰色 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (706, 50, 412133591017, 1279544038779, '黑色 XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (707, 50, 412133591017, 1279544038794, '蓝灰色 XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (708, 50, 412133591017, 1279544038793, '蓝灰色 L', 0, 0, '', 19, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (709, 50, 412133591017, 1279544038803, '杏色 L', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (710, 50, 412133591017, 1279544038780, '黑色 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (711, 50, 412133591017, 1279544038790, '复古蓝 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (712, 50, 412133591017, 1279544038778, '黑色 L', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (713, 50, 412133591017, 1279544038805, '杏色 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (714, 50, 412133591017, 1279544038784, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (715, 50, 412133591017, 1279544038786, '复古蓝 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (716, 50, 412133591017, 1279544038797, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (717, 50, 412133591017, 1279544038776, '黑色 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (718, 50, 412133591017, 1279544038799, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (719, 50, 412133591017, 1279544038782, '黑灰色 M', 0, 0, '', 19, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (720, 50, 412133591017, 1279544038787, '复古蓝 M', 0, 0, '', 18, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (721, 50, 412133591017, 1279544038795, '蓝灰色 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (722, 50, 412133591017, 1279544038777, '黑色 M', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (723, 50, 412133591017, 1279544038802, '杏色 M', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (724, 50, 412133591017, 1279544038785, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (725, 50, 412133591017, 1279544038788, '复古蓝 L', 0, 0, '', 19, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (726, 50, 412133591017, 1279544038783, '黑灰色 L', 0, 0, '', 19, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (727, 50, 412133591017, 1279544038798, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (728, 50, 412133591017, 1279544038792, '蓝灰色 M', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (729, 50, 412133591017, 1279544038789, '复古蓝 XL', 0, 0, '', 19, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (730, 50, 412133591017, 1279544038781, '黑灰色 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (731, 50, 412133591017, 1279544038804, '杏色 XL', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (732, 50, 412133591017, 1279544038801, '杏色 S', 0, 0, '', 20, NULL, 'HN801', 'HN801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (733, 51, 412137132774, 1279549091913, '黑灰色 S', 0, 0, '', 20, NULL, 'HN802', 'HN802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (734, 51, 412137132774, 1279549091917, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN802', 'HN802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (735, 51, 412137132774, 1279549091915, '黑灰色 L', 0, 0, '', 20, NULL, 'HN802', 'HN802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (736, 51, 412137132774, 1279549091914, '黑灰色 M', 0, 0, '', 20, NULL, 'HN802', 'HN802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (737, 51, 412137132774, 1279549091916, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN802', 'HN802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (738, 52, 412138772165, 1279551031198, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN805', 'HN805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (739, 52, 412138772165, 1279551031201, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN805', 'HN805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (740, 52, 412138772165, 1279551031197, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN805', 'HN805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (741, 52, 412138772165, 1279551031199, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN805', 'HN805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (742, 52, 412138772165, 1279551031200, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN805', 'HN805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (743, 53, 412139652425, 1279553631566, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (744, 53, 412139652425, 1279553631572, '复古蓝 L', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (745, 53, 412139652425, 1279553631577, '蓝灰色 L', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (746, 53, 412139652425, 1279553631578, '蓝灰色 XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (747, 53, 412139652425, 1279553631575, '蓝灰色 S', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (748, 53, 412139652425, 1279553631581, '黑灰色 M', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (749, 53, 412139652425, 1279553631565, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (750, 53, 412139652425, 1279553631576, '蓝灰色 M', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (751, 53, 412139652425, 1279553631571, '复古蓝 M', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (752, 53, 412139652425, 1279553631567, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (753, 53, 412139652425, 1279553631574, '复古蓝 2XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (754, 53, 412139652425, 1279553631583, '黑灰色 XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (755, 53, 412139652425, 1279553631573, '复古蓝 XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (756, 53, 412139652425, 1279553631568, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (757, 53, 412139652425, 1279553631579, '蓝灰色 2XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (758, 53, 412139652425, 1279553631580, '黑灰色 S', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (759, 53, 412139652425, 1279553631584, '黑灰色 2XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (760, 53, 412139652425, 1279553631570, '复古蓝 S', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (761, 53, 412139652425, 1279553631582, '黑灰色 L', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (762, 53, 412139652425, 1279553631569, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN807', 'HN807', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (763, 54, 414594889986, 1284642162278, '白色 M', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (764, 54, 414594889986, 1284642162280, '白色 XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (765, 54, 414594889986, 1284642162287, '浅蓝色 S', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (766, 54, 414594889986, 1284642162286, '黑色 2XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (767, 54, 414594889986, 1284642162283, '黑色 M', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (768, 54, 414594889986, 1284642162281, '白色 2XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (769, 54, 414594889986, 1284642162291, '浅蓝色 2XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (770, 54, 414594889986, 1284642162277, '白色 S', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (771, 54, 414594889986, 1284642162284, '黑色 L', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (772, 54, 414594889986, 1284642162285, '黑色 XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (773, 54, 414594889986, 1284642162279, '白色 L', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (774, 54, 414594889986, 1284642162282, '黑色 S', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (775, 54, 414594889986, 1284642162288, '浅蓝色 M', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (776, 54, 414594889986, 1284642162289, '浅蓝色 L', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (777, 54, 414594889986, 1284642162290, '浅蓝色 XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (778, 55, 415222366821, 1285881278694, '黑色 均码', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (779, 55, 415222366821, 1285881278693, '白色 均码', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (780, 55, 415222366821, 1285881278697, '浅蓝色 均码', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (781, 55, 415222366821, 1285881278695, '粉红色 均码', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (782, 55, 415222366821, 1285881278696, '杏色 均码', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (783, 56, 418757536479, 1292691249711, '深蓝色加长款 XS', 735, 47, 'JKL80512009', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (784, 56, 418757536479, 1292691249707, '蓝色 M', 731, 47, 'JKL8051202', 49, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (785, 56, 418757536479, 1292691249708, '蓝色 L', 732, 47, 'JKL8051203', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (786, 56, 418757536479, 1292691249706, '蓝色 S', 730, 47, 'JKL8051201', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (787, 56, 418757536479, 1292691249713, '深蓝色加长款 M', 737, 47, 'JKL80512002', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (788, 56, 418757536479, 1292691249705, '蓝色 XS', 729, 47, 'JKL8051209', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (789, 56, 418757536479, 1292691249714, '深蓝色加长款 L', 738, 47, 'JKL80512003', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (790, 56, 418757536479, 1292691249712, '深蓝色加长款 S', 736, 47, 'JKL80512001', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (791, 56, 418757536479, 1292691249715, '深蓝色加长款 XL', 739, 47, 'JKL80512004', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (792, 56, 418757536479, 1292691249710, '蓝色 2XL', 734, 47, 'JKL8051205', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (793, 56, 418757536479, 1292691249716, '深蓝色加长款 2XL', 740, 47, 'JKL80512005', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (794, 56, 418757536479, 1292691249709, '蓝色 XL', 733, 47, 'JKL8051204', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (795, 57, 420535061032, 1295810387557, '浅蓝九分 S', 1105, 62, 'JKL99385001JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (796, 57, 420535061032, 1295810387581, '深蓝长款 S', 1307, 62, 'JKL99387001', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (797, 57, 420535061032, 1295810387555, '黑色九分 2XL', 1089, 62, 'JKL99380105JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (798, 57, 420535061032, 1295810387566, '深蓝九分 XL', 1316, 62, 'JKL99386904', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (799, 57, 420535061032, 1295810387564, '深蓝九分 M', 1314, 62, 'JKL99386902', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (800, 57, 420535061032, 1295810387585, '深蓝长款 2XL', 1311, 62, 'JKL99387005', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (801, 57, 420535061032, 1295810387551, '黑色九分 S', 1081, 62, 'JKL99380101JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (802, 57, 420535061032, 1295810387567, '深蓝九分 2XL', 1317, 62, 'JKL99386905', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (803, 57, 420535061032, 1295810387569, '黑色长款 S', 1082, 62, 'JKL99380101CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (804, 57, 420535061032, 1295810387578, '浅蓝长款 XL', 1112, 62, 'JKL99385004CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (805, 57, 420535061032, 1295810387583, '深蓝长款 L', 1309, 62, 'JKL99387003', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (806, 57, 420535061032, 1295810387582, '深蓝长款 M', 1308, 62, 'JKL99387002', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (807, 57, 420535061032, 1295810387559, '浅蓝九分 L', 1109, 62, 'JKL99385003JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (808, 57, 420535061032, 1295810387561, '浅蓝九分 2XL', 1113, 62, 'JKL99385005JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (809, 57, 420535061032, 1295810387562, '深蓝九分 XS', 1312, 62, 'JKL99386909', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (810, 57, 420535061032, 1295810387577, '浅蓝长款 L', 1110, 62, 'JKL99385003CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (811, 57, 420535061032, 1295810387558, '浅蓝九分 M', 1107, 62, 'JKL99385002JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (812, 57, 420535061032, 1295810387571, '黑色长款 L', 1086, 62, 'JKL99380103CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (813, 57, 420535061032, 1295810387576, '浅蓝长款 M', 1108, 62, 'JKL99385002CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (814, 57, 420535061032, 1295810387553, '黑色九分 L', 1085, 62, 'JKL99380103JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (815, 57, 420535061032, 1295810387552, '黑色九分 M', 1083, 62, 'JKL99380102JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (816, 57, 420535061032, 1295810387568, '黑色长款 XS', 1080, 62, 'JKL99380109CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (817, 57, 420535061032, 1295810387570, '黑色长款 M', 1084, 62, 'JKL99380102CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (818, 57, 420535061032, 1295810387563, '深蓝九分 S', 1313, 62, 'JKL99386901', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (819, 57, 420535061032, 1295810387580, '深蓝长款 XS', 1306, 62, 'JKL99387009', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (820, 57, 420535061032, 1295810387565, '深蓝九分 L', 1315, 62, 'JKL99386903', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (821, 57, 420535061032, 1295810387560, '浅蓝九分 XL', 1111, 62, 'JKL99385004JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (822, 57, 420535061032, 1295810387554, '黑色九分 XL', 1087, 62, 'JKL99380104JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (823, 57, 420535061032, 1295810387573, '黑色长款 2XL', 1090, 62, 'JKL99380105CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (824, 57, 420535061032, 1295810387556, '浅蓝九分 XS', 1103, 62, 'JKL99385009JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (825, 57, 420535061032, 1295810387574, '浅蓝长款 XS', 1104, 62, 'JKL99385009CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (826, 57, 420535061032, 1295810387584, '深蓝长款 XL', 1310, 62, 'JKL99387004', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (827, 57, 420535061032, 1295810387575, '浅蓝长款 S', 1106, 62, 'JKL99385001CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (828, 57, 420535061032, 1295810387579, '浅蓝长款 2XL', 1114, 62, 'JKL99385005CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (829, 57, 420535061032, 1295810387572, '黑色长款 XL', 1088, 62, 'JKL99380104CK', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (830, 57, 420535061032, 1295810387550, '黑色九分 XS', 1079, 62, 'JKL99380109JIU', 50, NULL, 'JKL9938', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (831, 59, 398847598958, 1251236772886, '深灰色 L', 0, 0, '', 15, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (832, 59, 398847598958, 1251236772894, '浅蓝色 S', 0, 0, '', 17, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (833, 59, 398847598958, 1251236772887, '深灰色 XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (834, 59, 398847598958, 1251236772892, '黑色 XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (835, 59, 398847598958, 1251236772897, '浅蓝色 XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (836, 59, 398847598958, 1251236772898, '浅蓝色 2XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (837, 59, 398847598958, 1251236772896, '浅蓝色 L', 0, 0, '', 14, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (838, 59, 398847598958, 1251236772885, '深灰色 M', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (839, 59, 398847598958, 1251236772891, '黑色 L', 0, 0, '', 17, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (840, 59, 398847598958, 1251236772889, '黑色 S', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (841, 59, 398847598958, 1251236772890, '黑色 M', 0, 0, '', 17, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (842, 59, 398847598958, 1251236772893, '黑色 2XL', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (843, 59, 398847598958, 1251236772884, '深灰色 S', 0, 0, '', 19, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (844, 59, 398847598958, 1251236772895, '浅蓝色 M', 0, 0, '', 18, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (845, 59, 398847598958, 1251236772888, '深灰色 2XL', 0, 0, '', 20, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (846, 60, 399063348248, 1251749918980, '浅蓝色加长', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (847, 60, 399063348248, 1251749918984, '黑色长裤', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (848, 60, 399063348248, 1251749918978, '浅蓝色长裤', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (849, 60, 399063348248, 1251749918981, '复古蓝加长', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (850, 60, 399063348248, 1251749918976, '复古蓝长裤', 0, 0, '', 99, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (851, 60, 399063348248, 1251749918983, '黑色加长', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (852, 60, 399063348248, 1251749918979, '复古蓝九分', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (853, 60, 399063348248, 1251749918982, '黑色九分', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (854, 60, 399063348248, 1251749918977, '浅蓝色九分', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (855, 61, 399063851678, 1276572950561, '浅蓝色 XL', 0, 0, '', 20, NULL, 'HN0678', 't651428823385', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (856, 61, 399063851678, 1276572950560, '浅蓝色 L', 0, 0, '', 20, NULL, 'HN0678', 't651428823385', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (857, 61, 399063851678, 1276572950559, '浅蓝色 M', 0, 0, '', 20, NULL, 'HN0678', 't651428823385', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (858, 61, 399063851678, 1276572950562, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'HN0678', 't651428823385', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (859, 61, 399063851678, 1276572950558, '浅蓝色 S', 0, 0, '', 20, NULL, 'HN0678', 't651428823385', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (860, 62, 407249067559, 1269479069148, '黑色 30', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (861, 62, 407249067559, 1269479069152, '黑色 34', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (862, 62, 407249067559, 1269479069146, '黑色 28', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (863, 62, 407249067559, 1269479069140, '蓝色 30', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (864, 62, 407249067559, 1269479069151, '黑色 33', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (865, 62, 407249067559, 1269477690312, '黑色 26', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (866, 62, 407249067559, 1269479069142, '蓝色 32', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (867, 62, 407249067559, 1269479069143, '蓝色 33', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (868, 62, 407249067559, 1269479069150, '黑色 32', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (869, 62, 407249067559, 1269479069145, '黑色 27', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (870, 62, 407249067559, 1269479069137, '蓝色 27', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (871, 62, 407249067559, 1269479069149, '黑色 31', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (872, 62, 407249067559, 1269479069138, '蓝色 28', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (873, 62, 407249067559, 1269477690311, '蓝色 26', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (874, 62, 407249067559, 1269479069141, '蓝色 31', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (875, 62, 407249067559, 1269479069139, '蓝色 29', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (876, 62, 407249067559, 1269479069147, '黑色 29', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (877, 62, 407249067559, 1269479069144, '蓝色 34', 0, 0, '', 20, NULL, 'KH9695', 't622135144835', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (878, 63, 407356168572, 1269724202582, '灰色 28', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (879, 63, 407356168572, 1269724202590, '黑色 29', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (880, 63, 407356168572, 1269724202581, '灰色 27', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (881, 63, 407356168572, 1269724202585, '灰色 31', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (882, 63, 407356168572, 1269724202583, '灰色 29', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (883, 63, 407356168572, 1269724202591, '黑色 30', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (884, 63, 407356168572, 1269724202586, '灰色 32', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (885, 63, 407356168572, 1269724202588, '黑色 27', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (886, 63, 407356168572, 1269724202593, '黑色 32', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (887, 63, 407356168572, 1269724202587, '黑色 26', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (888, 63, 407356168572, 1269724202592, '黑色 31', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (889, 63, 407356168572, 1269724202584, '灰色 30', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (890, 63, 407356168572, 1269724202580, '灰色 26', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (891, 63, 407356168572, 1269724202589, '黑色 28', 0, 0, '', 20, NULL, 'KH9709', 'T624078788603', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (892, 64, 408246660557, 1271567855666, '浅蓝色 30', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (893, 64, 408246660557, 1271567855664, '浅蓝色 28', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (894, 64, 408246660557, 1271567855671, '深蓝色 28', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (895, 64, 408246660557, 1271567855661, '灰色 32', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (896, 64, 408246660557, 1271567855660, '灰色 31', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (897, 64, 408246660557, 1271567855669, '深蓝色 26', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (898, 64, 408246660557, 1271567855673, '深蓝色 30', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (899, 64, 408246660557, 1271567855672, '深蓝色 29', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (900, 64, 408246660557, 1271567855663, '浅蓝色 27', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (901, 64, 408246660557, 1271567855655, '灰色 26', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (902, 64, 408246660557, 1271567855667, '浅蓝色 31', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (903, 64, 408246660557, 1271567855656, '灰色 27', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (904, 64, 408246660557, 1271567855659, '灰色 30', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (905, 64, 408246660557, 1271567855658, '灰色 29', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (906, 64, 408246660557, 1271567855657, '灰色 28', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (907, 64, 408246660557, 1271567855674, '深蓝色 31', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (908, 64, 408246660557, 1271567855668, '浅蓝色 32', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (909, 64, 408246660557, 1271567855675, '深蓝色 32', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (910, 64, 408246660557, 1271567855662, '浅蓝色 26', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (911, 64, 408246660557, 1271567855670, '深蓝色 27', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (912, 64, 408246660557, 1271567855665, '浅蓝色 29', 0, 0, '', 20, NULL, 'KH9685', 'T610270951823', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (913, 65, 408275614162, 1271623290129, '黑灰 32', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (914, 65, 408275614162, 1271623290119, '蓝灰 29', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (915, 65, 408275614162, 1271623290118, '蓝灰 28', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (916, 65, 408275614162, 1271623290116, '蓝灰 26', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (917, 65, 408275614162, 1271623290126, '黑灰 29', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (918, 65, 408275614162, 1271623290121, '蓝灰 31', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (919, 65, 408275614162, 1271623290127, '黑灰 30', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (920, 65, 408275614162, 1271623290125, '黑灰 28', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (921, 65, 408275614162, 1271623290122, '蓝灰 32', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (922, 65, 408275614162, 1271623290120, '蓝灰 30', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (923, 65, 408275614162, 1271623290117, '蓝灰 27', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (924, 65, 408275614162, 1271623290124, '黑灰 27', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (925, 65, 408275614162, 1271623290123, '黑灰 26', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (926, 65, 408275614162, 1271623290128, '黑灰 31', 0, 0, '', 20, NULL, 'KH9688', 'T610041890003', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (927, 66, 411405520617, 1278013335025, '宝蓝色 2XL', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (928, 66, 411405520617, 1278013335019, '浅蓝色 XL', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (929, 66, 411405520617, 1278013335018, '浅蓝色 L', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (930, 66, 411405520617, 1278013335020, '浅蓝色 2XL', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (931, 66, 411405520617, 1278013335023, '宝蓝色 L', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (932, 66, 411405520617, 1278013335024, '宝蓝色 XL', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (933, 66, 411405520617, 1278013335017, '浅蓝色 M', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (934, 66, 411405520617, 1278013335016, '浅蓝色 S', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (935, 66, 411405520617, 1278013335021, '宝蓝色 S', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (936, 66, 411405520617, 1278013335022, '宝蓝色 M', 0, 0, '', 20, NULL, 'KH22318', '675027903686', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (937, 67, 415140360909, 1285730382209, '黑色 S', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (938, 67, 415140360909, 1285730382215, '浅蓝色 M', 0, 0, '', 49, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (939, 67, 415140360909, 1285730382219, '宝蓝色 S', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (940, 67, 415140360909, 1285730382211, '黑色 L', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (941, 67, 415140360909, 1285730382212, '黑色 XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (942, 67, 415140360909, 1285730382223, '宝蓝色 2XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (943, 67, 415140360909, 1285730382213, '黑色 2XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (944, 67, 415140360909, 1285730382216, '浅蓝色 L', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (945, 67, 415140360909, 1285730382214, '浅蓝色 S', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (946, 67, 415140360909, 1285730382221, '宝蓝色 L', 0, 0, '', 49, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (947, 67, 415140360909, 1285730382217, '浅蓝色 XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (948, 67, 415140360909, 1285730382210, '黑色 M', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (949, 67, 415140360909, 1285730382222, '宝蓝色 XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (950, 67, 415140360909, 1285730382220, '宝蓝色 M', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (951, 67, 415140360909, 1285730382218, '浅蓝色 2XL', 0, 0, '', 50, NULL, 'HN014', 'HN014', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (952, 68, 415209134293, 1285863953219, '白色 均码', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (953, 68, 415209134293, 1285863953220, '黑色 均码', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (954, 68, 415209134293, 1285863953221, '粉红色 均码', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (955, 68, 415209134293, 1285863953222, '杏色 均码', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (956, 68, 415209134293, 1285863953223, '浅蓝色 均码', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (957, 69, 418749496896, 1292679844924, '深蓝色长款 2XL', 0, 0, '', 49, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (958, 69, 418749496896, 1292679844920, '深蓝色长款 S', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (959, 69, 418749496896, 1292679844926, '蓝色 S', 729, 47, 'JKL8051209', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (960, 69, 418749496896, 1292679844929, '蓝色 XL', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (961, 69, 418749496896, 1292679844927, '蓝色 M', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (962, 69, 418749496896, 1292679844919, '深蓝色长款 XS', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (963, 69, 418749496896, 1292679844921, '深蓝色长款 M', 0, 0, '', 49, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (964, 69, 418749496896, 1292679844922, '深蓝色长款 L', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (965, 69, 418749496896, 1292679844923, '深蓝色长款 XL', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (966, 69, 418749496896, 1292679844930, '蓝色 2XL', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (967, 69, 418749496896, 1292679844928, '蓝色 L', 0, 0, '', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (968, 69, 418749496896, 1292679844925, '蓝色 XS', 729, 47, 'JKL8051209', 50, NULL, 'JKL805', 'JKL805', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (969, 70, 421025454368, 1296578397962, '蓝色 M', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (970, 70, 421025454368, 1296578397963, '蓝色 L', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (971, 70, 421025454368, 1296578397967, '黑色 S', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (972, 70, 421025454368, 1296578397965, '蓝色 2XL', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (973, 70, 421025454368, 1296578397964, '蓝色 XL', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (974, 70, 421025454368, 1296578397968, '黑色 M', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (975, 70, 421025454368, 1296578397960, '蓝色 XS', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (976, 70, 421025454368, 1296578397961, '蓝色 S', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (977, 70, 421025454368, 1296578397970, '黑色 XL', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (978, 70, 421025454368, 1296578397969, '黑色 L', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (979, 70, 421025454368, 1296578397966, '黑色 XS', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (980, 70, 421025454368, 1296578397971, '黑色 2XL', 0, 0, '', 50, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (981, 71, 421031955741, 1296587850812, '蓝灰色加绒 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (982, 71, 421031955741, 1296587850789, '复古蓝 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (983, 71, 421031955741, 1296587850799, '杏色 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (984, 71, 421031955741, 1296587850814, '蓝灰色加绒 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (985, 71, 421031955741, 1296587850813, '蓝灰色加绒 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (986, 71, 421031955741, 1296587850816, '复古蓝加绒 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (987, 71, 421031955741, 1296587850800, '杏色 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (988, 71, 421031955741, 1296587850809, '黑灰色加绒 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (989, 71, 421031955741, 1296587850771, '黑色 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (990, 71, 421031955741, 1296587850773, '黑色 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (991, 71, 421031955741, 1296587850804, '黑色加绒 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (992, 71, 421031955741, 1296587850803, '黑色加绒 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (993, 71, 421031955741, 1296587850784, '蓝灰色 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (994, 71, 421031955741, 1296587850787, '复古蓝 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (995, 71, 421031955741, 1296587850815, '蓝灰色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (996, 71, 421031955741, 1296587850808, '黑灰色加绒 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (997, 71, 421031955741, 1296587850791, '浅蓝色 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (998, 71, 421031955741, 1296587850802, '黑色加绒 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (999, 71, 421031955741, 1296587850774, '黑色 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1000, 71, 421031955741, 1296587850817, '复古蓝加绒 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1001, 71, 421031955741, 1296587850776, '黑灰色 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1002, 71, 421031955741, 1296587850823, '浅蓝色加绒 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1003, 71, 421031955741, 1296587850775, '黑色 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1004, 71, 421031955741, 1296587850782, '蓝灰色 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1005, 71, 421031955741, 1296587850801, '黑色加绒 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1006, 71, 421031955741, 1296587850811, '蓝灰色加绒 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1007, 71, 421031955741, 1296587850795, '浅蓝色 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1008, 71, 421031955741, 1296587850820, '复古蓝加绒 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1009, 71, 421031955741, 1296587850792, '浅蓝色 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1010, 71, 421031955741, 1296587850779, '黑灰色 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1011, 71, 421031955741, 1296587850783, '蓝灰色 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1012, 71, 421031955741, 1296587850793, '浅蓝色 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1013, 71, 421031955741, 1296587850794, '浅蓝色 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1014, 71, 421031955741, 1296587850818, '复古蓝加绒 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1015, 71, 421031955741, 1296587850781, '蓝灰色 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1016, 71, 421031955741, 1296587850798, '杏色 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1017, 71, 421031955741, 1296587850785, '蓝灰色 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1018, 71, 421031955741, 1296587850772, '黑色 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1019, 71, 421031955741, 1296587850788, '复古蓝 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1020, 71, 421031955741, 1296587850790, '复古蓝 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1021, 71, 421031955741, 1296587850822, '浅蓝色加绒 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1022, 71, 421031955741, 1296587850825, '浅蓝色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1023, 71, 421031955741, 1296587850810, '黑灰色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1024, 71, 421031955741, 1296587850780, '黑灰色 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1025, 71, 421031955741, 1296587850786, '复古蓝 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1026, 71, 421031955741, 1296587850777, '黑灰色 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1027, 71, 421031955741, 1296587850796, '杏色 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1028, 71, 421031955741, 1296587850797, '杏色 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1029, 71, 421031955741, 1296587850807, '黑灰色加绒 M', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1030, 71, 421031955741, 1296587850778, '黑灰色 L', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1031, 71, 421031955741, 1296587850824, '浅蓝色加绒 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1032, 71, 421031955741, 1296587850806, '黑灰色加绒 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1033, 71, 421031955741, 1296587850821, '浅蓝色加绒 S', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1034, 71, 421031955741, 1296587850819, '复古蓝加绒 XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1035, 71, 421031955741, 1296587850805, '黑色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1036, 31, 410305683990, 1297861756228, '复古蓝 L', 0, 0, '', 19, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1037, 31, 410305683990, 1297861756227, '复古蓝 M', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1038, 31, 410305683990, 1297861756229, '复古蓝 XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1039, 31, 410305683990, 1297861756226, '复古蓝 S', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1040, 31, 410305683990, 1297861756230, '复古蓝 2XL', 0, 0, '', 20, NULL, 'HN0660', 'HN660', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1041, 49, 412120506598, 1297847604596, '蓝灰色加绒 M', 762, 33, 'HN080112902', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1042, 49, 412120506598, 1297847604597, '蓝灰色加绒 L', 763, 33, 'HN080112903', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1043, 49, 412120506598, 1297847604601, '复古蓝加绒 M', 767, 33, 'HN080114002', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1044, 49, 412120506598, 1297847604587, '黑色加绒 L', 753, 33, 'HN080110103', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1045, 49, 412120506598, 1297848305476, '杏色 L', 748, 33, 'HN08011003', 1050, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1046, 49, 412120506598, 1297847604603, '复古蓝加绒 XL', 769, 33, 'HN080114004', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1047, 49, 412120506598, 1297847604586, '黑色加绒 M', 752, 33, 'HN080110102', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1048, 49, 412120506598, 1297848305469, '浅蓝色 S', 741, 33, 'HN08015001', 1050, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1049, 49, 412120506598, 1297847604595, '蓝灰色加绒 S', 761, 33, 'HN080112901', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1050, 49, 412120506598, 1297848305474, '杏色 S', 746, 33, 'HN08011001', 1050, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1051, 49, 412120506598, 1297847604591, '黑灰色加绒 M', 757, 33, 'HN080117502', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1052, 49, 412120506598, 1297847604604, '复古蓝加绒 2XL', 770, 33, 'HN080114005', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1053, 49, 412120506598, 1297847604608, '浅蓝色加绒 XL', 774, 33, 'HN080115004', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1054, 49, 412120506598, 1297848305475, '杏色 M', 747, 33, 'HN08011002', 1050, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1055, 49, 412120506598, 1297847604606, '浅蓝色加绒 M', 772, 33, 'HN080115002', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1056, 49, 412120506598, 1297848305478, '杏色 2XL', 750, 33, 'HN08011005', 1050, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1057, 49, 412120506598, 1297847604609, '浅蓝色加绒 2XL', 775, 33, 'HN080115005', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1058, 49, 412120506598, 1297847604599, '蓝灰色加绒 2XL', 765, 33, 'HN080112905', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1059, 49, 412120506598, 1297847604607, '浅蓝色加绒 L', 773, 33, 'HN080115003', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1060, 49, 412120506598, 1297847604593, '黑灰色加绒 XL', 759, 33, 'HN080117504', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1061, 49, 412120506598, 1297848305471, '浅蓝色 L', 743, 33, 'HN08015003', 1050, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1062, 49, 412120506598, 1297847604590, '黑灰色加绒 S', 756, 33, 'HN080117501', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1063, 49, 412120506598, 1297847604600, '复古蓝加绒 S', 766, 33, 'HN080114001', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1064, 49, 412120506598, 1297847604585, '黑色加绒 S', 751, 33, 'HN080110101', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1065, 49, 412120506598, 1297847604592, '黑灰色加绒 L', 758, 33, 'HN080117503', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1066, 49, 412120506598, 1297848305472, '浅蓝色 XL', 744, 33, 'HN08015004', 1050, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1067, 49, 412120506598, 1297847604605, '浅蓝色加绒 S', 771, 33, 'HN080115001', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1068, 49, 412120506598, 1297847604589, '黑色加绒 2XL', 755, 33, 'HN080110105', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1069, 49, 412120506598, 1297847604602, '复古蓝加绒 L', 768, 33, 'HN080114003', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1070, 49, 412120506598, 1297847604598, '蓝灰色加绒 XL', 764, 33, 'HN080112904', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1071, 49, 412120506598, 1297848305470, '浅蓝色 M', 742, 33, 'HN08015002', 1050, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1072, 49, 412120506598, 1297847604588, '黑色加绒 XL', 754, 33, 'HN080110104', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1073, 49, 412120506598, 1297847604594, '黑灰色加绒 2XL', 760, 33, 'HN080117505', 1050, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1074, 49, 412120506598, 1297848305473, '浅蓝色 2XL', 745, 33, 'HN08015005', 1050, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1075, 49, 412120506598, 1297848305477, '杏色 XL', 749, 33, 'HN08011004', 1050, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1076, 72, 421771728900, 1297849667188, '蓝灰色 S', 495, 33, 'HN08017501', 50, NULL, 'HN08017501', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1077, 72, 421771728900, 1297849667191, '蓝灰色 XL', 498, 33, 'HN08017504', 50, NULL, 'HN08017504', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1078, 72, 421771728900, 1297849667222, '复古蓝加绒 2XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1079, 72, 421771728900, 1297849667178, '黑灰色 S', 495, 33, 'HN08017501', 50, NULL, 'HN08017501', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1080, 72, 421771728900, 1297849667206, '黑色加绒 XL', 0, 0, '', 49, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1081, 72, 421771728900, 1297849667189, '蓝灰色 M', 496, 33, 'HN08017502', 50, NULL, 'HN08017502', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1082, 72, 421771728900, 1297849667180, '黑灰色 L', 497, 33, 'HN08017503', 50, NULL, 'HN08017503', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1083, 72, 421771728900, 1297849667214, '蓝灰色加绒 M', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1084, 72, 421771728900, 1297849667216, '蓝灰色加绒 XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1085, 72, 421771728900, 1297849667207, '黑色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1086, 72, 421771728900, 1297849667187, '复古蓝 2XL', 509, 33, 'HN08014005', 50, NULL, 'HN08014005', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1087, 72, 421771728900, 1297849667210, '黑灰色加绒 L', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1088, 72, 421771728900, 1297849667209, '黑灰色加绒 M', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1089, 72, 421771728900, 1297849667205, '黑色加绒 L', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1090, 72, 421771728900, 1297849667215, '蓝灰色加绒 L', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1091, 72, 421771728900, 1297849667220, '复古蓝加绒 L', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1092, 72, 421771728900, 1297849667225, '浅蓝色加绒 L', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1093, 72, 421771728900, 1297849667182, '黑灰色 2XL', 499, 33, 'HN08017505', 50, NULL, 'HN08017505', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1094, 72, 421771728900, 1297849667196, '浅蓝色 XL', 0, 0, '', 50, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1095, 72, 421771728900, 1297849667193, '浅蓝色 S', 0, 0, '', 50, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1096, 72, 421771728900, 1297849667226, '浅蓝色加绒 XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1097, 72, 421771728900, 1297849667190, '蓝灰色 L', 497, 33, 'HN08017503', 50, NULL, 'HN08017503', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1098, 72, 421771728900, 1297849667203, '黑色加绒 S', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1099, 72, 421771728900, 1297849667212, '黑灰色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1100, 72, 421771728900, 1297849667221, '复古蓝加绒 XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1101, 72, 421771728900, 1297849667174, '黑色 M', 491, 33, 'HN08010102', 50, NULL, 'HN08010102', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1102, 72, 421771728900, 1297849667183, '复古蓝 S', 505, 33, 'HN08014001', 50, NULL, 'HN08014001', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1103, 72, 421771728900, 1297849667204, '黑色加绒 M', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1104, 72, 421771728900, 1297849667198, '杏色 S', 0, 0, '', 50, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1105, 72, 421771728900, 1297849667227, '浅蓝色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1106, 72, 421771728900, 1297849667179, '黑灰色 M', 496, 33, 'HN08017502', 50, NULL, 'HN08017502', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1107, 72, 421771728900, 1297849667181, '黑灰色 XL', 498, 33, 'HN08017504', 50, NULL, 'HN08017504', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1108, 72, 421771728900, 1297849667217, '蓝灰色加绒 2XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1109, 72, 421771728900, 1297849667219, '复古蓝加绒 M', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1110, 72, 421771728900, 1297849667224, '浅蓝色加绒 M', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1111, 72, 421771728900, 1297849667199, '杏色 M', 0, 0, '', 50, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1112, 72, 421771728900, 1297849667176, '黑色 XL', 493, 33, 'HN08010104', 50, NULL, 'HN08010104', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1113, 72, 421771728900, 1297849667200, '杏色 L', 0, 0, '', 50, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1114, 72, 421771728900, 1297849667186, '复古蓝 XL', 508, 33, 'HN08014004', 50, NULL, 'HN08014004', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1115, 72, 421771728900, 1297849667218, '复古蓝加绒 S', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1116, 72, 421771728900, 1297849667208, '黑灰色加绒 S', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1117, 72, 421771728900, 1297849667213, '蓝灰色加绒 S', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1118, 72, 421771728900, 1297849667184, '复古蓝 M', 506, 33, 'HN08014002', 50, NULL, 'HN08014002', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1119, 72, 421771728900, 1297849667194, '浅蓝色 M', 0, 0, '', 50, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1120, 72, 421771728900, 1297849667223, '浅蓝色加绒 S', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1121, 72, 421771728900, 1297849667173, '黑色 S', 490, 33, 'HN08010101', 50, NULL, 'HN08010101', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1122, 72, 421771728900, 1297849667175, '黑色 L', 492, 33, 'HN08010103', 50, NULL, 'HN08010103', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1123, 72, 421771728900, 1297849667177, '黑色 2XL', 494, 33, 'HN08010105', 50, NULL, 'HN08010105', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1124, 72, 421771728900, 1297849667201, '杏色 XL', 0, 0, '', 50, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1125, 72, 421771728900, 1297849667195, '浅蓝色 L', 0, 0, '', 50, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1126, 72, 421771728900, 1297849667197, '浅蓝色 2XL', 0, 0, '', 50, NULL, 'HN0801Q', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1127, 72, 421771728900, 1297849667202, '杏色 2XL', 0, 0, '', 50, NULL, 'HN0801X', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1128, 72, 421771728900, 1297849667185, '复古蓝 L', 507, 33, 'HN08014003', 50, NULL, 'HN08014003', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1129, 72, 421771728900, 1297849667211, '黑灰色加绒 XL', 0, 0, '', 50, NULL, 'HN0801J', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1130, 72, 421771728900, 1297849667192, '蓝灰色 2XL', 499, 33, 'HN08017505', 50, NULL, 'HN08017505', 'HN0801', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1131, 5, 394814708558, 1300815075470, '蓝灰色 2XL', 0, 0, '', 100, NULL, '', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1132, 5, 394814708558, 1300815075468, '蓝灰色 L', 0, 0, '', 100, NULL, '', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1133, 5, 394814708558, 1300815075466, '蓝灰色 S', 0, 0, '', 100, NULL, '', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1134, 5, 394814708558, 1300815075467, '蓝灰色 M', 0, 0, '', 100, NULL, '', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1135, 5, 394814708558, 1300815075469, '蓝灰色 XL', 0, 0, '', 100, NULL, '', 'HN0681', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1136, 6, 395429166799, 1300789840464, '黑色 M（27-28码95-105斤）', 0, 0, '', 100, NULL, '', 'HN661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1137, 6, 395429166799, 1300789840465, '黑色 L（29码105-115斤）', 0, 0, '', 100, NULL, '', 'HN661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1138, 6, 395429166799, 1300789840467, '黑色 2XL（31码125-135斤）', 0, 0, '', 100, NULL, '', 'HN661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1139, 6, 395429166799, 1300789840466, '黑色 XL（30码115-125斤）', 0, 0, '', 100, NULL, '', 'HN661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1140, 6, 395429166799, 1300789840463, '黑色 S（25-26码95斤以内）', 0, 0, '', 100, NULL, '', 'HN661', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1141, 73, 422383287651, 1298984457787, '浅蓝色 27', 286, 22, 'HN202200200327', 500, NULL, 'HN202200200327', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1142, 73, 422383287651, 1298984457817, '浅蓝色加绒 25', 800, 22, 'HN2022002015025', 500, NULL, 'HN2022002015025', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1143, 73, 422383287651, 1298984457815, '蓝灰色加绒 31', 798, 22, 'HN2022002012931', 500, NULL, 'HN2022002012931', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1144, 73, 422383287651, 1298984457822, '浅蓝色加绒 30', 805, 22, 'HN2022002015030', 500, NULL, 'HN2022002015030', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1145, 73, 422383287651, 1298984457792, '浅蓝色 32', 291, 22, 'HN202200200332', 500, NULL, 'HN202200200332', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1146, 73, 422383287651, 1298984457813, '蓝灰色加绒 29', 796, 22, 'HN2022002012929', 500, NULL, 'HN2022002012929', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1147, 73, 422383287651, 1298984457764, '黑色 28', 271, 22, 'HN202200200128', 500, NULL, 'HN202200200128', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1148, 73, 422383287651, 1298984457801, '黑灰色加绒 25', 784, 22, 'HN2022002017525', 500, NULL, 'HN2022002017525', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1149, 73, 422383287651, 1298984457790, '浅蓝色 30', 289, 22, 'HN202200200330', 500, NULL, 'HN202200200330', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1150, 73, 422383287651, 1298984457802, '黑灰色加绒 26', 785, 22, 'HN2022002017526', 500, NULL, 'HN2022002017526', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1151, 73, 422383287651, 1298984457782, '蓝灰色 30', 297, 22, 'HN202200200430', 500, NULL, 'HN202200200430', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1152, 73, 422383287651, 1298984457781, '蓝灰色 29', 296, 22, 'HN202200200429', 500, NULL, 'HN202200200429', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1153, 73, 422383287651, 1298984457803, '黑灰色加绒 27', 786, 22, 'HN2022002017527', 500, NULL, 'HN2022002017527', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1154, 73, 422383287651, 1298984457768, '黑色 32', 275, 22, 'HN202200200132', 500, NULL, 'HN202200200132', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1155, 73, 422383287651, 1298984457779, '蓝灰色 27', 294, 22, 'HN202200200427', 500, NULL, 'HN202200200427', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1156, 73, 422383287651, 1298984457769, '黑灰色 25', 276, 22, 'HN202200200225', 500, NULL, 'HN202200200225', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1157, 73, 422383287651, 1298984457809, '蓝灰色加绒 25', 792, 22, 'HN2022002012925', 500, NULL, 'HN2022002012925', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1158, 73, 422383287651, 1298984457772, '黑灰色 28', 279, 22, 'HN202200200228', 500, NULL, 'HN202200200228', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1159, 73, 422383287651, 1298984457814, '蓝灰色加绒 30', 797, 22, 'HN2022002012930', 500, NULL, 'HN2022002012930', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1160, 73, 422383287651, 1298984457771, '黑灰色 27', 278, 22, 'HN202200200227', 500, NULL, 'HN202200200227', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1161, 73, 422383287651, 1298984457773, '黑灰色 29', 280, 22, 'HN202200200229', 500, NULL, 'HN202200200229', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1162, 73, 422383287651, 1298984457793, '黑色加绒 25', 776, 22, 'HN2022002010125', 500, NULL, 'HN2022002010125', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1163, 73, 422383287651, 1298984457798, '黑色加绒 30', 781, 22, 'HN2022002010130', 500, NULL, 'HN2022002010130', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1164, 73, 422383287651, 1298984457794, '黑色加绒 26', 777, 22, 'HN2022002010126', 500, NULL, 'HN2022002010126', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1165, 73, 422383287651, 1298984457811, '蓝灰色加绒 27', 794, 22, 'HN2022002012927', 500, NULL, 'HN2022002012927', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1166, 73, 422383287651, 1298984457786, '浅蓝色 26', 285, 22, 'HN202200200326', 500, NULL, 'HN202200200326', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1167, 73, 422383287651, 1298984457800, '黑色加绒 32', 783, 22, 'HN2022002010132', 500, NULL, 'HN2022002010132', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1168, 73, 422383287651, 1298984457788, '浅蓝色 28', 287, 22, 'HN202200200328', 500, NULL, 'HN202200200328', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1169, 73, 422383287651, 1298984457761, '黑色 25', 268, 22, 'HN202200200125', 500, NULL, 'HN202200200125', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1170, 73, 422383287651, 1298984457805, '黑灰色加绒 29', 788, 22, 'HN2022002017529', 500, NULL, 'HN2022002017529', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1171, 73, 422383287651, 1298984457780, '蓝灰色 28', 295, 22, 'HN202200200428', 500, NULL, 'HN202200200428', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1172, 73, 422383287651, 1298984457778, '蓝灰色 26', 293, 22, 'HN202200200426', 500, NULL, 'HN202200200426', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1173, 73, 422383287651, 1298984457765, '黑色 29', 272, 22, 'HN202200200129', 500, NULL, 'HN202200200129', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1174, 73, 422383287651, 1298984457791, '浅蓝色 31', 290, 22, 'HN202200200331', 500, NULL, 'HN202200200331', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1175, 73, 422383287651, 1298984457789, '浅蓝色 29', 288, 22, 'HN202200200329', 500, NULL, 'HN202200200329', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1176, 73, 422383287651, 1298984457795, '黑色加绒 27', 778, 22, 'HN2022002010127', 500, NULL, 'HN2022002010127', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1177, 73, 422383287651, 1298984457796, '黑色加绒 28', 779, 22, 'HN2022002010128', 500, NULL, 'HN2022002010128', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1178, 73, 422383287651, 1298984457804, '黑灰色加绒 28', 787, 22, 'HN2022002017528', 500, NULL, 'HN2022002017528', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1179, 73, 422383287651, 1298984457820, '浅蓝色加绒 28', 803, 22, 'HN2022002015028', 500, NULL, 'HN2022002015028', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1180, 73, 422383287651, 1298984457816, '蓝灰色加绒 32', 799, 22, 'HN2022002012932', 500, NULL, 'HN2022002012932', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1181, 73, 422383287651, 1298984457824, '浅蓝色加绒 32', 807, 22, 'HN2022002015032', 500, NULL, 'HN2022002015032', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1182, 73, 422383287651, 1298984457808, '黑灰色加绒 32', 791, 22, 'HN2022002017532', 500, NULL, 'HN2022002017532', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1183, 73, 422383287651, 1298984457766, '黑色 30', 273, 22, 'HN202200200130', 500, NULL, 'HN202200200130', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1184, 73, 422383287651, 1298984457774, '黑灰色 30', 281, 22, 'HN202200200230', 500, NULL, 'HN202200200230', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1185, 73, 422383287651, 1298984457783, '蓝灰色 31', 298, 22, 'HN202200200431', 500, NULL, 'HN202200200431', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1186, 73, 422383287651, 1298984457819, '浅蓝色加绒 27', 802, 22, 'HN2022002015027', 500, NULL, 'HN2022002015027', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1187, 73, 422383287651, 1298984457823, '浅蓝色加绒 31', 806, 22, 'HN2022002015031', 500, NULL, 'HN2022002015031', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1188, 73, 422383287651, 1298984457806, '黑灰色加绒 30', 789, 22, 'HN2022002017530', 500, NULL, 'HN2022002017530', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1189, 73, 422383287651, 1298984457775, '黑灰色 31', 282, 22, 'HN202200200231', 500, NULL, 'HN202200200231', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1190, 73, 422383287651, 1298984457797, '黑色加绒 29', 780, 22, 'HN2022002010129', 499, NULL, 'HN2022002010129', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1191, 73, 422383287651, 1298984457777, '蓝灰色 25', 292, 22, 'HN202200200425', 500, NULL, 'HN202200200425', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1192, 73, 422383287651, 1298984457810, '蓝灰色加绒 26', 793, 22, 'HN2022002012926', 500, NULL, 'HN2022002012926', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1193, 73, 422383287651, 1298984457767, '黑色 31', 274, 22, 'HN202200200131', 500, NULL, 'HN202200200131', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1194, 73, 422383287651, 1298984457812, '蓝灰色加绒 28', 795, 22, 'HN2022002012928', 500, NULL, 'HN2022002012928', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1195, 73, 422383287651, 1298984457763, '黑色 27', 270, 22, 'HN202200200127', 500, NULL, 'HN202200200127', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1196, 73, 422383287651, 1298984457762, '黑色 26', 269, 22, 'HN202200200126', 500, NULL, 'HN202200200126', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1197, 73, 422383287651, 1298984457776, '黑灰色 32', 283, 22, 'HN202200200232', 500, NULL, 'HN202200200232', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1198, 73, 422383287651, 1298984457785, '浅蓝色 25', 284, 22, 'HN202200200325', 500, NULL, 'HN202200200325', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1199, 73, 422383287651, 1298984457799, '黑色加绒 31', 782, 22, 'HN2022002010131', 500, NULL, 'HN2022002010131', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1200, 73, 422383287651, 1298984457770, '黑灰色 26', 277, 22, 'HN202200200226', 500, NULL, 'HN202200200226', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1201, 73, 422383287651, 1298984457807, '黑灰色加绒 31', 790, 22, 'HN2022002017531', 500, NULL, 'HN2022002017531', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1202, 73, 422383287651, 1298984457821, '浅蓝色加绒 29', 804, 22, 'HN2022002015029', 500, NULL, 'HN2022002015029', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1203, 73, 422383287651, 1298984457818, '浅蓝色加绒 26', 801, 22, 'HN2022002015026', 500, NULL, 'HN2022002015026', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1204, 73, 422383287651, 1298984457784, '蓝灰色 32', 299, 22, 'HN202200200435', 500, NULL, 'HN202200200435', 'HN20220020', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1205, 74, 422437259657, 1299097648611, '浅蓝色 M', 809, 48, 'HN1805002', 100, NULL, 'HN1805002', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1206, 74, 422437259657, 1299097648610, '浅蓝色 S', 808, 48, 'HN1805001', 100, NULL, 'HN1805001', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1207, 74, 422437259657, 1299097648614, '浅蓝色 2XL', 812, 48, 'HN1805005', 100, NULL, 'HN1805005', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1208, 74, 422437259657, 1299097648613, '浅蓝色 XL', 811, 48, 'HN1805004', 100, NULL, 'HN1805004', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1209, 74, 422437259657, 1299097648612, '浅蓝色 L', 810, 48, 'HN1805003', 100, NULL, 'HN1805003', 'HN180', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1210, 75, 422742565233, 1299618145899, '黑色 M', 0, 0, '', 50, NULL, 'HN665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1211, 75, 422742565233, 1299618145902, '黑色 S', 0, 0, '', 50, NULL, 'HN665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1212, 75, 422742565233, 1299618145898, '黑色 2XL', 0, 0, '', 50, NULL, 'HN665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1213, 75, 422742565233, 1299618145900, '黑色 XL', 0, 0, '', 50, NULL, 'HN665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1214, 75, 422742565233, 1299618145901, '黑色 L', 0, 0, '', 50, NULL, 'HN665', 'HN665', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1215, 76, 422744325067, 1299618998188, '黑色 M', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1216, 76, 422744325067, 1299618998187, '黑色 S', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1217, 76, 422744325067, 1299618998189, '黑色 L', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1218, 76, 422744325067, 1299618998185, '蓝色 M', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1219, 76, 422744325067, 1299618998186, '蓝色 L', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1220, 76, 422744325067, 1299618998184, '蓝色 S', 0, 0, '', 100, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1221, 77, 423260246680, 1300536155526, '烟灰色 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1222, 77, 423260246680, 1300536155554, '烟灰色加绒 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1223, 77, 423260246680, 1300536155519, '黑色 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1224, 77, 423260246680, 1300536155537, '蓝灰色 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1225, 77, 423260246680, 1300536155525, '烟灰色 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1226, 77, 423260246680, 1300536155518, '黑色 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1227, 77, 423260246680, 1300536155563, '蓝灰色加绒 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1228, 77, 423260246680, 1300536155528, '烟灰色 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1229, 77, 423260246680, 1300536155552, '黑色加绒 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1230, 77, 423260246680, 1300536155549, '黑色加绒 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1231, 77, 423260246680, 1300536155541, '浅蓝色 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1232, 77, 423260246680, 1300536155543, '浅蓝色 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1233, 77, 423260246680, 1300536155567, '浅蓝色加绒 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1234, 77, 423260246680, 1300536155550, '黑色加绒 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1235, 77, 423260246680, 1300536155559, '烟灰色加绒 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1236, 77, 423260246680, 1300536155530, '烟灰色 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1237, 77, 423260246680, 1300536155531, '烟灰色 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1238, 77, 423260246680, 1300536155547, '黑色加绒 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1239, 77, 423260246680, 1300536155522, '黑色 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1240, 77, 423260246680, 1300536155556, '烟灰色加绒 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1241, 77, 423260246680, 1300536155527, '烟灰色 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1242, 77, 423260246680, 1300536155571, '浅蓝色加绒 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1243, 77, 423260246680, 1300536155538, '蓝灰色 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1244, 77, 423260246680, 1300536155566, '蓝灰色加绒 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1245, 77, 423260246680, 1300536155570, '浅蓝色加绒 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1246, 77, 423260246680, 1300536155521, '黑色 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1247, 77, 423260246680, 1300536155564, '蓝灰色加绒 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1248, 77, 423260246680, 1300536155539, '浅蓝色 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1249, 77, 423260246680, 1300536155544, '浅蓝色 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1250, 77, 423260246680, 1300536155562, '蓝灰色加绒 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1251, 77, 423260246680, 1300536155524, '黑色 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1252, 77, 423260246680, 1300536155557, '烟灰色加绒 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1253, 77, 423260246680, 1300536155529, '烟灰色 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1254, 77, 423260246680, 1300536155573, '浅蓝色加绒 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1255, 77, 423260246680, 1300536155523, '黑色 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1256, 77, 423260246680, 1300536155535, '蓝灰色 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1257, 77, 423260246680, 1300536155520, '黑色 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1258, 77, 423260246680, 1300536155555, '烟灰色加绒 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1259, 77, 423260246680, 1300536155540, '浅蓝色 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1260, 77, 423260246680, 1300536155551, '黑色加绒 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1261, 77, 423260246680, 1300536155572, '浅蓝色加绒 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1262, 77, 423260246680, 1300536155561, '蓝灰色加绒 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1263, 77, 423260246680, 1300536155560, '蓝灰色加绒 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1264, 77, 423260246680, 1300536155545, '浅蓝色 32', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1265, 77, 423260246680, 1300536155569, '浅蓝色加绒 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1266, 77, 423260246680, 1300536155533, '蓝灰色 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1267, 77, 423260246680, 1300536155558, '烟灰色加绒 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1268, 77, 423260246680, 1300536155534, '蓝灰色 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1269, 77, 423260246680, 1300536155546, '黑色加绒 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1270, 77, 423260246680, 1300536155565, '蓝灰色加绒 31', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1271, 77, 423260246680, 1300536155568, '浅蓝色加绒 27', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1272, 77, 423260246680, 1300536155542, '浅蓝色 29', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1273, 77, 423260246680, 1300536155553, '烟灰色加绒 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1274, 77, 423260246680, 1300536155532, '蓝灰色 26', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1275, 77, 423260246680, 1300536155536, '蓝灰色 30', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1276, 77, 423260246680, 1300536155548, '黑色加绒 28', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1277, 78, 423441709778, 1300835762157, '米黄 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1278, 78, 423441709778, 1300835762149, '黑色 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1279, 78, 423441709778, 1300835762148, '黑色 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1280, 78, 423441709778, 1300835762164, '青草色 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1281, 78, 423441709778, 1300835762167, '天空蓝 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1282, 78, 423441709778, 1300835762165, '青草色 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1283, 78, 423441709778, 1300835762154, '米黄 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1284, 78, 423441709778, 1300835762151, '粉红色 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1285, 78, 423441709778, 1300835762147, '黑色 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1286, 78, 423441709778, 1300835762150, '粉红色 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1287, 78, 423441709778, 1300835762152, '粉红色 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1288, 78, 423441709778, 1300835762169, '天空蓝 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1289, 78, 423441709778, 1300835762162, '青草色 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1290, 78, 423441709778, 1300835762158, '紫色 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1291, 78, 423441709778, 1300835762160, '紫色 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1292, 78, 423441709778, 1300835762146, '黑色 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1293, 78, 423441709778, 1300835762166, '天空蓝 S', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1294, 78, 423441709778, 1300835762163, '青草色 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1295, 78, 423441709778, 1300835762155, '米黄 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1296, 78, 423441709778, 1300835762159, '紫色 M', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1297, 78, 423441709778, 1300835762156, '米黄 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1298, 78, 423441709778, 1300835762161, '紫色 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1299, 78, 423441709778, 1300835762153, '粉红色 XL', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1300, 78, 423441709778, 1300835762168, '天空蓝 L', 0, 0, '', 50, NULL, '', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1301, 79, 423486862283, 1300918958614, '蓝色 M', 0, 0, '', 50, NULL, 'HN0804', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1302, 79, 423486862283, 1300918958616, '蓝色 XL', 0, 0, '', 50, NULL, 'HN0804', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1303, 79, 423486862283, 1300918958617, '蓝色 2XL', 0, 0, '', 50, NULL, 'HN0804', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1304, 79, 423486862283, 1300918958615, '蓝色 L', 0, 0, '', 50, NULL, 'HN0804', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1305, 79, 423486862283, 1300918958613, '蓝色 S', 0, 0, '', 50, NULL, 'HN0804', '', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1306, 80, 423492956829, 1300930893642, '复古蓝 XL', 0, 0, '', 50, NULL, 'HN683', 'HN683', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1307, 80, 423492956829, 1300930893639, '复古蓝 S', 0, 0, '', 50, NULL, 'HN683', 'HN683', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1308, 80, 423492956829, 1300930893640, '复古蓝 M', 0, 0, '', 50, NULL, 'HN683', 'HN683', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1309, 80, 423492956829, 1300930893641, '复古蓝 L', 0, 0, '', 50, NULL, 'HN683', 'HN683', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1310, 80, 423492956829, 1300930893643, '复古蓝 2XL', 0, 0, '', 50, NULL, 'HN683', 'HN683', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1311, 81, 423502402446, 1300950070710, '黑色 L', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1312, 81, 423502402446, 1300950070713, '黑灰色 S', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1313, 81, 423502402446, 1300950070721, '复古蓝 XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1314, 81, 423502402446, 1300950070727, '蓝灰色 2XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1315, 81, 423502402446, 1300950070708, '黑色 S', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1316, 81, 423502402446, 1300950070723, '蓝灰色 S', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1317, 81, 423502402446, 1300950070709, '黑色 M', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1318, 81, 423502402446, 1300950070726, '蓝灰色 XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1319, 81, 423502402446, 1300950070724, '蓝灰色 M', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1320, 81, 423502402446, 1300950070712, '黑色 2XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1321, 81, 423502402446, 1300950070718, '复古蓝 S', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1322, 81, 423502402446, 1300950070719, '复古蓝 M', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1323, 81, 423502402446, 1300950070717, '黑灰色 2XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1324, 81, 423502402446, 1300950070725, '蓝灰色 L', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1325, 81, 423502402446, 1300950070711, '黑色 XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1326, 81, 423502402446, 1300950070720, '复古蓝 L', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1327, 81, 423502402446, 1300950070722, '复古蓝 2XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1328, 81, 423502402446, 1300950070714, '黑灰色 M', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1329, 81, 423502402446, 1300950070715, '黑灰色 L', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1330, 81, 423502402446, 1300950070716, '黑灰色 XL', 0, 0, '', 100, NULL, 'HN0802', 'HN0802', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1331, 82, 423703312591, 1301302432802, '卡其色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1332, 82, 423703312591, 1301302432705, '酒红色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1333, 82, 423703312591, 1301302432748, '咖啡色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1334, 82, 423703312591, 1301302432781, '宝蓝色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1335, 82, 423703312591, 1301302432779, '宝蓝色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1336, 82, 423703312591, 1301302432699, '酒红色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1337, 82, 423703312591, 1301302432769, '灰色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1338, 82, 423703312591, 1301302432727, '白色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1339, 82, 423703312591, 1301302432741, '咖啡色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1340, 82, 423703312591, 1301302432776, '灰色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1341, 82, 423703312591, 1301302432719, '白色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1342, 82, 423703312591, 1301302432744, '咖啡色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1343, 82, 423703312591, 1301302432754, '深紫色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1344, 82, 423703312591, 1301302432760, '墨绿色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1345, 82, 423703312591, 1301302432691, '红色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1346, 82, 423703312591, 1301302432756, '深紫色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1347, 82, 423703312591, 1301302432713, '黑色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1348, 82, 423703312591, 1301302432740, '咖啡色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1349, 82, 423703312591, 1301302432764, '墨绿色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1350, 82, 423703312591, 1301302432689, '红色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1351, 82, 423703312591, 1301302432692, '红色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1352, 82, 423703312591, 1301302432758, '深紫色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1353, 82, 423703312591, 1301302432762, '墨绿色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1354, 82, 423703312591, 1301302432721, '白色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1355, 82, 423703312591, 1301302432724, '白色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1356, 82, 423703312591, 1301302432706, '酒红色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1357, 82, 423703312591, 1301302432767, '墨绿色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1358, 82, 423703312591, 1301302432801, '卡其色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1359, 82, 423703312591, 1301302432785, '宝蓝色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1360, 82, 423703312591, 1301302432772, '灰色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1361, 82, 423703312591, 1301302432703, '酒红色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1362, 82, 423703312591, 1301302432759, '墨绿色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1363, 82, 423703312591, 1301302432730, '藏蓝 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1364, 82, 423703312591, 1301302432787, '宝蓝色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1365, 82, 423703312591, 1301302432729, '藏蓝 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1366, 82, 423703312591, 1301302432737, '藏蓝 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1367, 82, 423703312591, 1301302432765, '墨绿色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1368, 82, 423703312591, 1301302432788, '宝蓝色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1369, 82, 423703312591, 1301302432693, '红色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1370, 82, 423703312591, 1301302432804, '卡其色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1371, 82, 423703312591, 1301302432786, '宝蓝色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1372, 82, 423703312591, 1301302432797, '海军兰 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1373, 82, 423703312591, 1301302432690, '红色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1374, 82, 423703312591, 1301302432770, '灰色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1375, 82, 423703312591, 1301302432778, '灰色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1376, 82, 423703312591, 1301302432757, '深紫色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1377, 82, 423703312591, 1301302432807, '卡其色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1378, 82, 423703312591, 1301302432704, '酒红色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1379, 82, 423703312591, 1301302432714, '黑色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1380, 82, 423703312591, 1301302432716, '黑色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1381, 82, 423703312591, 1301302432782, '宝蓝色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1382, 82, 423703312591, 1301302432723, '白色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1383, 82, 423703312591, 1301302432796, '海军兰 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1384, 82, 423703312591, 1301302432789, '海军兰 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1385, 82, 423703312591, 1301302432700, '酒红色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1386, 82, 423703312591, 1301302432694, '红色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1387, 82, 423703312591, 1301302432742, '咖啡色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1388, 82, 423703312591, 1301302432777, '灰色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1389, 82, 423703312591, 1301302432738, '藏蓝 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1390, 82, 423703312591, 1301302432728, '白色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1391, 82, 423703312591, 1301302432753, '深紫色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1392, 82, 423703312591, 1301302432734, '藏蓝 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1393, 82, 423703312591, 1301302432749, '深紫色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1394, 82, 423703312591, 1301302432803, '卡其色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1395, 82, 423703312591, 1301302432743, '咖啡色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1396, 82, 423703312591, 1301302432768, '墨绿色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1397, 82, 423703312591, 1301302432726, '白色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1398, 82, 423703312591, 1301302432695, '红色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1399, 82, 423703312591, 1301302432775, '灰色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1400, 82, 423703312591, 1301302432793, '海军兰 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1401, 82, 423703312591, 1301302432798, '海军兰 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1402, 82, 423703312591, 1301302432794, '海军兰 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1403, 82, 423703312591, 1301302432799, '卡其色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1404, 82, 423703312591, 1301302432751, '深紫色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1405, 82, 423703312591, 1301302432697, '红色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1406, 82, 423703312591, 1301302432739, '咖啡色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1407, 82, 423703312591, 1301302432806, '卡其色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1408, 82, 423703312591, 1301302432792, '海军兰 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1409, 82, 423703312591, 1301302432736, '藏蓝 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1410, 82, 423703312591, 1301302432784, '宝蓝色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1411, 82, 423703312591, 1301302432712, '黑色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1412, 82, 423703312591, 1301302432763, '墨绿色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1413, 82, 423703312591, 1301302432701, '酒红色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1414, 82, 423703312591, 1301302432710, '黑色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1415, 82, 423703312591, 1301302432783, '宝蓝色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1416, 82, 423703312591, 1301302432718, '黑色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1417, 82, 423703312591, 1301302432707, '酒红色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1418, 82, 423703312591, 1301302432702, '酒红色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1419, 82, 423703312591, 1301302432722, '白色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1420, 82, 423703312591, 1301302432774, '灰色 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1421, 82, 423703312591, 1301302432790, '海军兰 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1422, 82, 423703312591, 1301302432750, '深紫色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1423, 82, 423703312591, 1301302432720, '白色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1424, 82, 423703312591, 1301302432711, '黑色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1425, 82, 423703312591, 1301302432745, '咖啡色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1426, 82, 423703312591, 1301302432735, '藏蓝 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1427, 82, 423703312591, 1301302432747, '咖啡色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1428, 82, 423703312591, 1301302432795, '海军兰 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1429, 82, 423703312591, 1301302432773, '灰色 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1430, 82, 423703312591, 1301302432708, '酒红色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1431, 82, 423703312591, 1301302432800, '卡其色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1432, 82, 423703312591, 1301302432791, '海军兰 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1433, 82, 423703312591, 1301302432725, '白色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1434, 82, 423703312591, 1301302432771, '灰色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1435, 82, 423703312591, 1301302432733, '藏蓝 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1436, 82, 423703312591, 1301302432715, '黑色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1437, 82, 423703312591, 1301302432698, '红色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1438, 82, 423703312591, 1301302432696, '红色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1439, 82, 423703312591, 1301302432731, '藏蓝 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1440, 82, 423703312591, 1301302432717, '黑色 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1441, 82, 423703312591, 1301302432761, '墨绿色 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1442, 82, 423703312591, 1301302432755, '深紫色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1443, 82, 423703312591, 1301302432808, '卡其色 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1444, 82, 423703312591, 1301302432732, '藏蓝 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1445, 82, 423703312591, 1301302432780, '宝蓝色 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1446, 82, 423703312591, 1301302432766, '墨绿色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1447, 82, 423703312591, 1301302432709, '黑色 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1448, 82, 423703312591, 1301302432746, '咖啡色 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1449, 82, 423703312591, 1301302432805, '卡其色 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1450, 82, 423703312591, 1301302432752, '深紫色 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1451, 83, 423758757026, 1301404846098, '复古蓝 S', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1452, 83, 423758757026, 1301404846101, '复古蓝 XL', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1453, 83, 423758757026, 1301404846099, '复古蓝 M', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1454, 83, 423758757026, 1301404846103, '浅蓝色 XS', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1455, 83, 423758757026, 1301404846097, '复古蓝 XS', 987, 55, 'JKL9064009', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1456, 83, 423758757026, 1301404846104, '浅蓝色 S', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1457, 83, 423758757026, 1301404846107, '浅蓝色 XL', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1458, 83, 423758757026, 1301404846106, '浅蓝色 L', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1459, 83, 423758757026, 1301404846100, '复古蓝 L', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1460, 83, 423758757026, 1301404846105, '浅蓝色 M', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1461, 83, 423758757026, 1301404846102, '复古蓝 2XL', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1462, 83, 423758757026, 1301404846108, '浅蓝色 2XL', 0, 0, '', 100, NULL, 'JKL906', 'JKL906', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1463, 84, 423990076571, 1301814344129, '蓝灰色 29', 865, 49, 'JKL90986429', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1464, 84, 423990076571, 1301814344122, '复古蓝 29', 858, 49, 'JKL90984829', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1465, 84, 423990076571, 1301814344119, '复古蓝 26', 855, 49, 'JKL90984826', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1466, 84, 423990076571, 1301814344132, '蓝灰色 32', 868, 49, 'JKL90986432', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1467, 84, 423990076571, 1301814344126, '蓝灰色 26', 862, 49, 'JKL90986426', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1468, 84, 423990076571, 1301814344133, '黑色 26', 869, 49, 'JKL90986526', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1469, 84, 423990076571, 1301814344120, '复古蓝 27', 856, 49, 'JKL90984827', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1470, 84, 423990076571, 1301814344128, '蓝灰色 28', 864, 49, 'JKL90986428', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1471, 84, 423990076571, 1301814344127, '蓝灰色 27', 863, 49, 'JKL90986427', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1472, 84, 423990076571, 1301814344138, '黑色 31', 874, 49, 'JKL90986531', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1473, 84, 423990076571, 1301814344124, '复古蓝 31', 860, 49, 'JKL90984831', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1474, 84, 423990076571, 1301814344136, '黑色 29', 872, 49, 'JKL90986529', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1475, 84, 423990076571, 1301814344135, '黑色 28', 871, 49, 'JKL90986528', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1476, 84, 423990076571, 1301814344131, '蓝灰色 31', 867, 49, 'JKL90986431', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1477, 84, 423990076571, 1301814344137, '黑色 30', 873, 49, 'JKL90986530', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1478, 84, 423990076571, 1301814344139, '黑色 32', 875, 49, 'JKL90986532', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1479, 84, 423990076571, 1301814344130, '蓝灰色 30', 866, 49, 'JKL90986430', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1480, 84, 423990076571, 1301814344134, '黑色 27', 870, 49, 'JKL90986527', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1481, 84, 423990076571, 1301814344123, '复古蓝 30', 859, 49, 'JKL90984830', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1482, 84, 423990076571, 1301814344121, '复古蓝 28', 857, 49, 'JKL90984828', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1483, 84, 423990076571, 1301814344125, '复古蓝 32', 861, 49, 'JKL90984832', 100, NULL, 'JKL9098', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1484, 84, 423990076571, 1305326156472, '黑色加绒长裤 30', 852, 49, 'JKL909810130', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1485, 84, 423990076571, 1305326156470, '黑色加绒长裤 28', 850, 49, 'JKL909810128', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1486, 84, 423990076571, 1305326156452, '黑色长裤 31', 832, 49, 'JKL90980131', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1487, 84, 423990076571, 1305326156460, '复古蓝加绒长裤 32', 840, 49, 'JKL909814032', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1488, 84, 423990076571, 1305326156444, '蓝灰色长裤 30', 824, 49, 'JKL90982930', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1489, 84, 423990076571, 1305326156442, '蓝灰色长裤 28', 822, 49, 'JKL90982928', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1490, 84, 423990076571, 1305326156468, '黑色加绒长裤 26', 848, 49, 'JKL909810126', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1491, 84, 423990076571, 1305326156437, '复古蓝长裤 30', 817, 49, 'JKL90984030', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1492, 84, 423990076571, 1305326156434, '复古蓝长裤 27', 814, 49, 'JKL90984027', 99, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1493, 84, 423990076571, 1305326156441, '蓝灰色长裤 27', 821, 49, 'JKL90982927', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1494, 84, 423990076571, 1305326156450, '黑色长裤 29', 830, 49, 'JKL90980129', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1495, 84, 423990076571, 1305326156473, '黑色加绒长裤 31', 853, 49, 'JKL909810131', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1496, 84, 423990076571, 1305326156469, '黑色加绒长裤 27', 849, 49, 'JKL909810127', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1497, 84, 423990076571, 1305326156433, '复古蓝长裤 26', 813, 49, 'JKL90984026', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1498, 84, 423990076571, 1305326156439, '复古蓝长裤 32', 819, 49, 'JKL90984032', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1499, 84, 423990076571, 1305326156455, '复古蓝加绒长裤 27', 835, 49, 'JKL909814027', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1500, 84, 423990076571, 1305326156457, '复古蓝加绒长裤 29', 837, 49, 'JKL909814029', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1501, 84, 423990076571, 1305326156465, '蓝灰色加绒长裤 30', 845, 49, 'JKL909812930', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1502, 84, 423990076571, 1305326156443, '蓝灰色长裤 29', 823, 49, 'JKL90982929', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1503, 84, 423990076571, 1305326156448, '黑色长裤 27', 828, 49, 'JKL90980127', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1504, 84, 423990076571, 1305326156440, '蓝灰色长裤 26', 820, 49, 'JKL90982926', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1505, 84, 423990076571, 1305326156454, '复古蓝加绒长裤 26', 834, 49, 'JKL909814026', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1506, 84, 423990076571, 1305326156451, '黑色长裤 30', 831, 49, 'JKL90980130', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1507, 84, 423990076571, 1305326156456, '复古蓝加绒长裤 28', 836, 49, 'JKL909814028', 99, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1508, 84, 423990076571, 1305326156459, '复古蓝加绒长裤 31', 839, 49, 'JKL909814031', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1509, 84, 423990076571, 1305326156449, '黑色长裤 28', 829, 49, 'JKL90980128', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1510, 84, 423990076571, 1305326156453, '黑色长裤 32', 833, 49, 'JKL90980132', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1511, 84, 423990076571, 1305326156446, '蓝灰色长裤 32', 826, 49, 'JKL90982932', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1512, 84, 423990076571, 1305326156436, '复古蓝长裤 29', 816, 49, 'JKL90984029', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1513, 84, 423990076571, 1305326156463, '蓝灰色加绒长裤 28', 843, 49, 'JKL909812928', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1514, 84, 423990076571, 1305326156445, '蓝灰色长裤 31', 825, 49, 'JKL90982931', 99, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1515, 84, 423990076571, 1305326156474, '黑色加绒长裤 32', 854, 49, 'JKL909810132', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1516, 84, 423990076571, 1305326156438, '复古蓝长裤 31', 818, 49, 'JKL90984031', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1517, 84, 423990076571, 1305326156435, '复古蓝长裤 28', 815, 49, 'JKL90984028', 99, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1518, 84, 423990076571, 1305326156458, '复古蓝加绒长裤 30', 838, 49, 'JKL909814030', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1519, 84, 423990076571, 1305326156461, '蓝灰色加绒长裤 26', 841, 49, 'JKL909812926', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1520, 84, 423990076571, 1305326156464, '蓝灰色加绒长裤 29', 844, 49, 'JKL909812929', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1521, 84, 423990076571, 1305326156462, '蓝灰色加绒长裤 27', 842, 49, 'JKL909812927', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1522, 84, 423990076571, 1305326156466, '蓝灰色加绒长裤 31', 846, 49, 'JKL909812931', 99, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1523, 84, 423990076571, 1305326156471, '黑色加绒长裤 29', 851, 49, 'JKL909810129', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1524, 84, 423990076571, 1305326156467, '蓝灰色加绒长裤 32', 847, 49, 'JKL909812932', 100, NULL, 'JKL9098CKJR', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1525, 84, 423990076571, 1305326156447, '黑色长裤 26', 827, 49, 'JKL90980126', 100, NULL, 'JKL9098CK', 'JKL9098', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1526, 85, 426190541480, 1305765412474, '深蓝色 XL', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1527, 85, 426190541480, 1305765412466, '烟灰色 S', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1528, 85, 426190541480, 1305765412471, '深蓝色 S', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1529, 85, 426190541480, 1305765412467, '烟灰色 M', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1530, 85, 426190541480, 1305765412473, '深蓝色 L', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1531, 85, 426190541480, 1305765412468, '烟灰色 L', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1532, 85, 426190541480, 1305765412470, '烟灰色 2XL', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1533, 85, 426190541480, 1305765412472, '深蓝色 M', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1534, 85, 426190541480, 1305765412475, '深蓝色 2XL', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1535, 85, 426190541480, 1305765412469, '烟灰色 XL', 0, 0, '', 100, NULL, 'JKL3112', 'JKL3112', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1536, 86, 426453461778, 1306230875151, '蓝色 30', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1537, 86, 426453461778, 1306230875152, '蓝色 31', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1538, 86, 426453461778, 1306230875156, '黑灰 29', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1539, 86, 426453461778, 1306230875149, '蓝色 28', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1540, 86, 426453461778, 1306230875157, '黑灰 30', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1541, 86, 426453461778, 1306230875153, '黑灰 26', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1542, 86, 426453461778, 1306230875147, '蓝色 26', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1543, 86, 426453461778, 1306230875148, '蓝色 27', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1544, 86, 426453461778, 1306230875150, '蓝色 29', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1545, 86, 426453461778, 1306230875154, '黑灰 27', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1546, 86, 426453461778, 1306230875155, '黑灰 28', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1547, 86, 426453461778, 1306230875158, '黑灰 31', 0, 0, '', 100, NULL, 'JKL6010', 'JKL6010', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1548, 87, 426460291580, 1306248813005, '卡其色 28', 912, 53, 'JKL99072828JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1549, 87, 426460291580, 1306248813004, '卡其色 27', 909, 53, 'JKL99072827JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1550, 87, 426460291580, 1306248813009, '卡其色 32', 924, 53, 'JKL99072832JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1551, 87, 426460291580, 1306248813016, '卡灰 31', 969, 53, 'JKL99075131JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1552, 87, 426460291580, 1306248813012, '卡灰 27', 957, 53, 'JKL99075127JIU', 99, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1553, 87, 426460291580, 1306248813022, '米白色 29', 939, 53, 'JKL99074729JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1554, 87, 426460291580, 1306248661999, '黑色 30', 894, 53, 'JKL99070130JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1555, 87, 426460291580, 1306248813003, '卡其色 26', 906, 53, 'JKL99072826JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1556, 87, 426460291580, 1306248813007, '卡其色 30', 918, 53, 'JKL99072830JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1557, 87, 426460291580, 1306248661998, '黑色 29', 891, 53, 'JKL99070129JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1558, 87, 426460291580, 1306248813000, '黑色 31', 897, 53, 'JKL99070131JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1559, 87, 426460291580, 1306248813006, '卡其色 29', 915, 53, 'JKL99072829JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1560, 87, 426460291580, 1306248813017, '卡灰 32', 972, 53, 'JKL99075132JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1561, 87, 426460291580, 1306248813021, '米白色 28', 936, 53, 'JKL99074728JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1562, 87, 426460291580, 1306248813024, '米白色 31', 945, 53, 'JKL99074731JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1563, 87, 426460291580, 1306248813011, '卡灰 26', 954, 53, 'JKL99075126JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1564, 87, 426460291580, 1306248813013, '卡灰 28', 960, 53, 'JKL99075128JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1565, 87, 426460291580, 1306248813002, '卡其色 25', 903, 53, 'JKL99072825JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1566, 87, 426460291580, 1306248813025, '米白色 32', 948, 53, 'JKL99074732JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1567, 87, 426460291580, 1306248813019, '米白色 26', 930, 53, 'JKL99074726JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1568, 87, 426460291580, 1306248661996, '黑色 27', 885, 53, 'JKL99070127JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1569, 87, 426460291580, 1306248813023, '米白色 30', 942, 53, 'JKL99074730JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1570, 87, 426460291580, 1306248813015, '卡灰 30', 966, 53, 'JKL99075130JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1571, 87, 426460291580, 1306248813020, '米白色 27', 933, 53, 'JKL99074727JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1572, 87, 426460291580, 1306248661995, '黑色 26', 882, 53, 'JKL99070126JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1573, 87, 426460291580, 1306248813018, '米白色 25', 927, 53, 'JKL99074725JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1574, 87, 426460291580, 1306248813001, '黑色 32', 900, 53, 'JKL99070132JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1575, 87, 426460291580, 1306248813014, '卡灰 29', 963, 53, 'JKL99075129JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1576, 87, 426460291580, 1306248661994, '黑色 25', 880, 53, 'JKL99070125BA', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1577, 87, 426460291580, 1306248813008, '卡其色 31', 921, 53, 'JKL99072831JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1578, 87, 426460291580, 1306248661997, '黑色 28', 888, 53, 'JKL99070128JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1579, 87, 426460291580, 1306248813010, '卡灰 25', 951, 53, 'JKL99075125JIU', 100, NULL, 'JKL9907', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1580, 5, 394814708558, 1312048359777, '蓝色 M', 1069, 61, 'JKL89903502', 983, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1581, 5, 394814708558, 1312048359780, '蓝色 2XL', 1072, 61, 'JKL89903505', 994, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1582, 5, 394814708558, 1312049473907, '蓝色 XS', 1067, 61, 'JKL89903509', 0, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1583, 5, 394814708558, 1312049473909, '黑灰色 XS', 1073, 61, 'JKL89907509', 100, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1584, 5, 394814708558, 1312048359778, '蓝色 L', 1070, 61, 'JKL89903503', 997, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1585, 5, 394814708558, 1312049473910, '蓝灰色 XS', 0, 0, '', 0, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1586, 5, 394814708558, 1312048359776, '蓝色 S', 1068, 61, 'JKL89903501', 987, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1587, 5, 394814708558, 1312048359779, '蓝色 XL', 1071, 61, 'JKL89903504', 987, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1588, 5, 394814708558, 1312049473908, '浅蓝色 XS', 0, 0, '', 0, NULL, 'JKL8990', 'JKL8990', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1589, 6, 395429166799, 1312070165525, '深蓝色加绒 27', 1061, 60, 'JKL99505927', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1590, 6, 395429166799, 1312070165514, '浅蓝色 32', 1050, 60, 'JKL99505032', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1591, 6, 395429166799, 1312070165519, '深蓝色 29', 1055, 60, 'JKL99501229', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1592, 6, 395429166799, 1312070165509, '浅蓝色 27', 1045, 60, 'JKL99505027', 99, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1593, 6, 395429166799, 1312070165507, '浅蓝色 25', 1043, 60, 'JKL99505025', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1594, 6, 395429166799, 1312070165513, '浅蓝色 31', 1049, 60, 'JKL99505031', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1595, 6, 395429166799, 1312070165524, '深蓝色加绒 26', 1060, 60, 'JKL99505926', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1596, 6, 395429166799, 1312070165516, '深蓝色 26', 1052, 60, 'JKL99501226', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1597, 6, 395429166799, 1312070165510, '浅蓝色 28', 1046, 60, 'JKL99505028', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1598, 6, 395429166799, 1312070165515, '深蓝色 25', 1051, 60, 'JKL99501225', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1599, 6, 395429166799, 1312070165518, '深蓝色 28', 1054, 60, 'JKL99501228', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1600, 6, 395429166799, 1312070165517, '深蓝色 27', 1053, 60, 'JKL99501227', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1601, 6, 395429166799, 1312070165529, '深蓝色加绒 31', 1065, 60, 'JKL99505931', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1602, 6, 395429166799, 1312070165527, '深蓝色加绒 29', 1063, 60, 'JKL99505929', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1603, 6, 395429166799, 1312070165526, '深蓝色加绒 28', 1062, 60, 'JKL99505928', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1604, 6, 395429166799, 1312070165528, '深蓝色加绒 30', 1064, 60, 'JKL99505930', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1605, 6, 395429166799, 1312070165522, '深蓝色 32', 1058, 60, 'JKL99501232', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1606, 6, 395429166799, 1312070165530, '深蓝色加绒 32', 1066, 60, 'JKL99505932', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1607, 6, 395429166799, 1312070165508, '浅蓝色 26', 1044, 60, 'JKL99505026', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1608, 6, 395429166799, 1312070165512, '浅蓝色 30', 1048, 60, 'JKL99505030', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1609, 6, 395429166799, 1312070165520, '深蓝色 30', 1056, 60, 'JKL99501230', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1610, 6, 395429166799, 1312070165523, '深蓝色加绒 25', 1059, 60, 'JKL99505925', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1611, 6, 395429166799, 1312070165511, '浅蓝色 29', 1047, 60, 'JKL99505029', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1612, 6, 395429166799, 1312070165521, '深蓝色 31', 1057, 60, 'JKL99501231', 100, NULL, 'JKL9950', 'JKL9950', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1613, 87, 426460291580, 1308303884195, '卡其九分加绒 28', 914, 53, 'JKL99072828JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1614, 87, 426460291580, 1308303884186, '黑色九分加绒 27', 887, 53, 'JKL99070127JR', 99, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1615, 87, 426460291580, 1308303884213, '卡灰九分加绒 30', 968, 53, 'JKL99075130JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1616, 87, 426460291580, 1308303884214, '卡灰九分加绒 31', 971, 53, 'JKL99075131JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1617, 87, 426460291580, 1308302794013, '黑色八分 27', 886, 53, 'JKL99070127BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1618, 87, 426460291580, 1308303884203, '米白九分加绒 28', 938, 53, 'JKL99074728JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1619, 87, 426460291580, 1308303884200, '米白九分加绒 25', 929, 53, 'JKL99074725JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1620, 87, 426460291580, 1308303884191, '黑色九分加绒 32', 902, 53, 'JKL99070132JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1621, 87, 426460291580, 1308302794031, '卡灰八分 29', 964, 53, 'JKL99075129BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1622, 87, 426460291580, 1308303884187, '黑色九分加绒 28', 890, 53, 'JKL99070128JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1623, 87, 426460291580, 1308302794034, '卡灰八分 32', 973, 53, 'JKL99075132BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1624, 87, 426460291580, 1308302794041, '米白色八分 31', 946, 53, 'JKL99074731BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1625, 87, 426460291580, 1308303884185, '黑色九分加绒 26', 884, 53, 'JKL99070126JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1626, 87, 426460291580, 1308302794020, '卡其八分 26', 907, 53, 'JKL99072826BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1627, 87, 426460291580, 1308303884205, '米白九分加绒 30', 944, 53, 'JKL99074730JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1628, 87, 426460291580, 1308303884207, '米白九分加绒 32', 950, 53, 'JKL99074732JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1629, 87, 426460291580, 1308303884209, '卡灰九分加绒 26', 956, 53, 'JKL99075126JR', 99, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1630, 87, 426460291580, 1308302794022, '卡其八分 28', 913, 53, 'JKL99072828BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1631, 87, 426460291580, 1308302794030, '卡灰八分 28', 961, 53, 'JKL99075128BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1632, 87, 426460291580, 1308303884208, '卡灰九分加绒 25', 953, 53, 'JKL99075125JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1633, 87, 426460291580, 1308302794028, '卡灰八分 26', 955, 53, 'JKL99075126BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1634, 87, 426460291580, 1308302794026, '卡其八分 32', 925, 53, 'JKL99072832BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1635, 87, 426460291580, 1308303884202, '米白九分加绒 27', 935, 53, 'JKL99074727JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1636, 87, 426460291580, 1308302794039, '米白色八分 29', 940, 53, 'JKL99074729BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1637, 87, 426460291580, 1308303884211, '卡灰九分加绒 28', 962, 53, 'JKL99075128JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1638, 87, 426460291580, 1308302794037, '米白色八分 27', 934, 53, 'JKL99074727BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1639, 87, 426460291580, 1308303884193, '卡其九分加绒 26', 908, 53, 'JKL99072826JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1640, 87, 426460291580, 1308302794014, '黑色八分 28', 888, 53, 'JKL99070128JIU', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1641, 87, 426460291580, 1308303884189, '黑色九分加绒 30', 896, 53, 'JKL99070130JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1642, 87, 426460291580, 1308302794040, '米白色八分 30', 943, 53, 'JKL99074730BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1643, 87, 426460291580, 1308302794019, '卡其八分 25', 904, 53, 'JKL99072825BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1644, 87, 426460291580, 1308302794027, '卡灰八分 25', 952, 53, 'JKL99075125BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1645, 87, 426460291580, 1308303884212, '卡灰九分加绒 29', 965, 53, 'JKL99075129JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1646, 87, 426460291580, 1308302794024, '卡其八分 30', 919, 53, 'JKL99072830BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1647, 87, 426460291580, 1308302794025, '卡其八分 31', 922, 53, 'JKL99072831BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1648, 87, 426460291580, 1308302794036, '米白色八分 26', 931, 53, 'JKL99074726BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1649, 87, 426460291580, 1308303884196, '卡其九分加绒 29', 917, 53, 'JKL99072829JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1650, 87, 426460291580, 1308303884198, '卡其九分加绒 31', 923, 53, 'JKL99072831JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1651, 87, 426460291580, 1308303884206, '米白九分加绒 31', 947, 53, 'JKL99074731JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1652, 87, 426460291580, 1308302794042, '米白色八分 32', 949, 53, 'JKL99074732BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1653, 87, 426460291580, 1308303884192, '卡其九分加绒 25', 905, 53, 'JKL99072825JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1654, 87, 426460291580, 1308302794035, '米白色八分 25', 928, 53, 'JKL99074725BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1655, 87, 426460291580, 1308302794023, '卡其八分 29', 916, 53, 'JKL99072829BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1656, 87, 426460291580, 1308303884184, '黑色九分加绒 25', 881, 53, 'JKL99070125JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1657, 87, 426460291580, 1308302794018, '黑色八分 32', 901, 53, 'JKL99070132BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1658, 87, 426460291580, 1308303884210, '卡灰九分加绒 27', 959, 53, 'JKL99075127JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1659, 87, 426460291580, 1308303884199, '卡其九分加绒 32', 926, 53, 'JKL99072832JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1660, 87, 426460291580, 1308303884194, '卡其九分加绒 27', 911, 53, 'JKL99072827JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1661, 87, 426460291580, 1308302794029, '卡灰八分 27', 958, 53, 'JKL99075127BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1662, 87, 426460291580, 1308303884190, '黑色九分加绒 31', 899, 53, 'JKL99070131JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1663, 87, 426460291580, 1308303884201, '米白九分加绒 26', 932, 53, 'JKL99074726JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1664, 87, 426460291580, 1308302794016, '黑色八分 30', 895, 53, 'JKL99070130BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1665, 87, 426460291580, 1308303884197, '卡其九分加绒 30', 920, 53, 'JKL99072830JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1666, 87, 426460291580, 1308303884188, '黑色九分加绒 29', 893, 53, 'JKL99070129JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1667, 87, 426460291580, 1308302794012, '黑色八分 26', 883, 53, 'JKL99070126BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1668, 87, 426460291580, 1308302794032, '卡灰八分 30', 967, 53, 'JKL99075130BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1669, 87, 426460291580, 1308303884204, '米白九分加绒 29', 941, 53, 'JKL99074729JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1670, 87, 426460291580, 1308302794033, '卡灰八分 31', 970, 53, 'JKL99075131BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1671, 87, 426460291580, 1308303884215, '卡灰九分加绒 32', 974, 53, 'JKL99075132JR', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1672, 87, 426460291580, 1308302794015, '黑色八分 29', 892, 53, 'JKL99070129BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1673, 87, 426460291580, 1308302794011, '黑色八分 25', 880, 53, 'JKL99070125BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1674, 87, 426460291580, 1308302794021, '卡其八分 27', 910, 53, 'JKL99072827BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1675, 87, 426460291580, 1308302794038, '米白色八分 28', 937, 53, 'JKL99074728BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1676, 87, 426460291580, 1308302794017, '黑色八分 31', 898, 53, 'JKL99070131BA', 100, NULL, '', 'JKL9907', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1677, 88, 429860405885, 1312014329097, '锁边加长款（165以上） XL', 1008, 56, 'JKL99774004JC', 100, NULL, 'JKL99774004JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1678, 88, 429860405885, 1312014329092, '锁边长款（165以下） 2XL', 1009, 56, 'JKL99774005CK', 100, NULL, 'JKL99774005CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1679, 88, 429860405885, 1312014329085, '毛边加长款（165以上） XL', 1040, 59, 'JKL99784004JC', 100, NULL, 'JKL99784004JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1680, 88, 429860405885, 1312014329090, '锁边长款（165以下） L', 1005, 56, 'JKL99774003CK', 100, NULL, 'JKL99774003CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1681, 88, 429860405885, 1312014329093, '锁边加长款（165以上） XS', 1000, 56, 'JKL99774009JC', 100, NULL, 'JKL99774009JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1682, 88, 429860405885, 1312014329083, '毛边加长款（165以上） M', 1036, 59, 'JKL99784002JC', 100, NULL, 'JKL99784002JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1683, 88, 429860405885, 1312014329078, '毛边长款（165以下） L', 1037, 59, 'JKL99784003CK', 100, NULL, 'JKL99784003CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1684, 88, 429860405885, 1312014329089, '锁边长款（165以下） M', 1003, 56, 'JKL99774002CK', 100, NULL, 'JKL99774002CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1685, 88, 429860405885, 1312014329091, '锁边长款（165以下） XL', 1007, 56, 'JKL99774004CK', 100, NULL, 'JKL99774004CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1686, 88, 429860405885, 1312014329075, '毛边长款（165以下） XS', 1031, 59, 'JKL99784009CK', 100, NULL, 'JKL99784009CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1687, 88, 429860405885, 1312014329076, '毛边长款（165以下） S', 1033, 59, 'JKL99784001CK', 100, NULL, 'JKL99784001CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1688, 88, 429860405885, 1312014329087, '锁边长款（165以下） XS', 999, 56, 'JKL99774009CK', 100, NULL, 'JKL99774009CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1689, 88, 429860405885, 1312014329088, '锁边长款（165以下） S', 1001, 56, 'JKL99774001CK', 100, NULL, 'JKL99774001CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1690, 88, 429860405885, 1312014329084, '毛边加长款（165以上） L', 1038, 59, 'JKL99784003JC', 100, NULL, 'JKL99784003JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1691, 88, 429860405885, 1312014329096, '锁边加长款（165以上） L', 1006, 56, 'JKL99774003JC', 100, NULL, 'JKL99774003JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1692, 88, 429860405885, 1312014329079, '毛边长款（165以下） XL', 1039, 59, 'JKL99784004CK', 100, NULL, 'JKL99784004CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1693, 88, 429860405885, 1312014329082, '毛边加长款（165以上） S', 1034, 59, 'JKL99784001JC', 100, NULL, 'JKL99784001JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1694, 88, 429860405885, 1312014329086, '毛边加长款（165以上） 2XL', 1042, 59, 'JKL99784005JC', 100, NULL, 'JKL99784005JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1695, 88, 429860405885, 1312014329094, '锁边加长款（165以上） S', 1002, 56, 'JKL99774001JC', 100, NULL, 'JKL99774001JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1696, 88, 429860405885, 1312014329080, '毛边长款（165以下） 2XL', 1041, 59, 'JKL99784005CK', 100, NULL, 'JKL99784005CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1697, 88, 429860405885, 1312014329077, '毛边长款（165以下） M', 1035, 59, 'JKL99784002CK', 100, NULL, 'JKL99784002CK', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1698, 88, 429860405885, 1312014329095, '锁边加长款（165以上） M', 1004, 56, 'JKL99774002JC', 100, NULL, 'JKL99774002JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1699, 88, 429860405885, 1312014329081, '毛边加长款（165以上） XS', 1032, 59, 'JKL99784009JC', 100, NULL, 'JKL99784009JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1700, 88, 429860405885, 1312014329098, '锁边加长款（165以上） 2XL', 1010, 56, 'JKL99774005JC', 100, NULL, 'JKL99774005JC', 'JKL9977', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1701, 89, 429968867456, 1312203466678, '蓝色 27', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1702, 89, 429968867456, 1312203466690, '灰色 31', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1703, 89, 429968867456, 1312203466680, '蓝色 29', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1704, 89, 429968867456, 1312203466679, '蓝色 28', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1705, 89, 429968867456, 1312203466683, '蓝色 32', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1706, 89, 429968867456, 1312203466687, '灰色 28', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1707, 89, 429968867456, 1312203466677, '蓝色 26', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1708, 89, 429968867456, 1312203466684, '灰色 25', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1709, 89, 429968867456, 1312203466676, '蓝色 25', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1710, 89, 429968867456, 1312203466691, '灰色 32', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1711, 89, 429968867456, 1312203466688, '灰色 29', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1712, 89, 429968867456, 1312203466685, '灰色 26', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1713, 89, 429968867456, 1312203466682, '蓝色 31', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1714, 89, 429968867456, 1312203466686, '灰色 27', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1715, 89, 429968867456, 1312203466681, '蓝色 30', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1716, 89, 429968867456, 1312203466689, '灰色 30', 0, 0, '', 100, NULL, 'JKL9962', 'JKL9962', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1717, 12, 401781826934, 1312259695962, '黑色 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1718, 12, 401781826934, 1312259695963, '黑色 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1719, 12, 401781826934, 1312259695988, '黑色长款 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1720, 12, 401781826934, 1312259695945, '深蓝色 26', 0, 0, '', 99, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1721, 12, 401781826934, 1312259695954, '浅蓝色 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1722, 12, 401781826934, 1312259695956, '浅蓝色 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1723, 12, 401781826934, 1312259695958, '浅蓝色 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1724, 12, 401781826934, 1312259695983, '浅蓝 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1725, 12, 401781826934, 1312259695960, '黑色 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1726, 12, 401781826934, 1312259695979, '浅蓝 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1727, 12, 401781826934, 1312259695972, '深蓝 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1728, 12, 401781826934, 1312259695957, '浅蓝色 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1729, 12, 401781826934, 1312259695959, '浅蓝色 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1730, 12, 401781826934, 1312259695977, '浅蓝 26', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1731, 12, 401781826934, 1312259695990, '黑色长款 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1732, 12, 401781826934, 1312259695949, '深蓝色 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1733, 12, 401781826934, 1312259695975, '深蓝 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1734, 12, 401781826934, 1312259695970, '深蓝 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1735, 12, 401781826934, 1312259695944, '深蓝色 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1736, 12, 401781826934, 1312259695969, '深蓝 26', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1737, 12, 401781826934, 1312259695973, '深蓝 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1738, 12, 401781826934, 1312259695991, '黑色长款 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1739, 12, 401781826934, 1312259695961, '黑色 26', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1740, 12, 401781826934, 1312259695951, '深蓝色 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1741, 12, 401781826934, 1312259695968, '深蓝 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1742, 12, 401781826934, 1312259695965, '黑色 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1743, 12, 401781826934, 1312259695952, '浅蓝色 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1744, 12, 401781826934, 1312259695946, '深蓝色 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1745, 12, 401781826934, 1312259695985, '黑色长款 26', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1746, 12, 401781826934, 1312259695976, '浅蓝 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1747, 12, 401781826934, 1312259695947, '深蓝色 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1748, 12, 401781826934, 1312259695978, '浅蓝 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1749, 12, 401781826934, 1312259695953, '浅蓝色 26', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1750, 12, 401781826934, 1312259695980, '浅蓝 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1751, 12, 401781826934, 1312259695984, '黑色长款 25', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1752, 12, 401781826934, 1312259695966, '黑色 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1753, 12, 401781826934, 1312259695967, '黑色 32', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1754, 12, 401781826934, 1312259695987, '黑色长款 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1755, 12, 401781826934, 1312259695971, '深蓝 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1756, 12, 401781826934, 1312259695982, '浅蓝 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1757, 12, 401781826934, 1312259695981, '浅蓝 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1758, 12, 401781826934, 1312259695964, '黑色 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1759, 12, 401781826934, 1312259695955, '浅蓝色 28', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1760, 12, 401781826934, 1312259695974, '深蓝 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1761, 12, 401781826934, 1312259695948, '深蓝色 29', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1762, 12, 401781826934, 1312259695950, '深蓝色 31', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1763, 12, 401781826934, 1312259695989, '黑色长款 30', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1764, 12, 401781826934, 1312259695986, '黑色长款 27', 0, 0, '', 100, NULL, 'JKL9909', 'JKL9909', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1765, 21, 403877607629, 1312601942987, '深蓝 27', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1766, 21, 403877607629, 1312601942992, '深蓝 32', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1767, 21, 403877607629, 1312601942989, '深蓝 29', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1768, 21, 403877607629, 1312601942983, '浅蓝色 25', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1769, 21, 403877607629, 1312601942988, '深蓝 28', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1770, 21, 403877607629, 1312601942984, '蓝灰色 25', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1771, 21, 403877607629, 1312601942986, '深蓝 26', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1772, 21, 403877607629, 1312601942991, '深蓝 31', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1773, 21, 403877607629, 1312601942990, '深蓝 30', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1774, 21, 403877607629, 1312601942981, '黑色 25', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1775, 21, 403877607629, 1312601942982, '黑灰色 25', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1776, 21, 403877607629, 1312601942985, '深蓝 25', 0, 0, '', 1000, NULL, 'JKL8967', 'JKL8967', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1777, 82, 423703312591, 1314707340353, '黑色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1778, 82, 423703312591, 1314708624494, '咖啡色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1779, 82, 423703312591, 1314708624520, '墨绿色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1780, 82, 423703312591, 1314707340343, '酒红色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1781, 82, 423703312591, 1314708624493, '咖啡色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1782, 82, 423703312591, 1314708624504, '深紫色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1783, 82, 423703312591, 1314709895298, '宝蓝色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1784, 82, 423703312591, 1314707340347, '酒红色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1785, 82, 423703312591, 1314708624511, '墨绿色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1786, 82, 423703312591, 1314707340357, '黑色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1787, 82, 423703312591, 1314707340358, '黑色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1788, 82, 423703312591, 1314709895303, '卡其色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1789, 82, 423703312591, 1314707340375, '藏蓝色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1790, 82, 423703312591, 1314709895292, '宝蓝色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1791, 82, 423703312591, 1314709895305, '卡其色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1792, 82, 423703312591, 1314704618609, '大红加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1793, 82, 423703312591, 1314707340361, '白色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1794, 82, 423703312591, 1314708624525, '灰色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1795, 82, 423703312591, 1314704618616, '大红加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1796, 82, 423703312591, 1314707340369, '白色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1797, 82, 423703312591, 1314708624500, '咖啡色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1798, 82, 423703312591, 1314708624523, '灰色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1799, 82, 423703312591, 1314708624522, '灰色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1800, 82, 423703312591, 1314709895304, '卡其色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1801, 82, 423703312591, 1314707340364, '白色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1802, 82, 423703312591, 1314707340351, '黑色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1803, 82, 423703312591, 1314708624502, '深紫色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1804, 82, 423703312591, 1314708624510, '深紫色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1805, 82, 423703312591, 1314709895301, '宝蓝色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1806, 82, 423703312591, 1314708624496, '咖啡色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1807, 82, 423703312591, 1314708624509, '深紫色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1808, 82, 423703312591, 1314707340374, '藏蓝色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1809, 82, 423703312591, 1314708624501, '深紫色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1810, 82, 423703312591, 1314708624517, '墨绿色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1811, 82, 423703312591, 1314707340348, '酒红色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1812, 82, 423703312591, 1314707340366, '白色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1813, 82, 423703312591, 1314707340341, '酒红色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1814, 82, 423703312591, 1314708624521, '灰色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1815, 82, 423703312591, 1314708624507, '深紫色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1816, 82, 423703312591, 1314709895297, '宝蓝色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1817, 82, 423703312591, 1314704618617, '大红加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1818, 82, 423703312591, 1314708624499, '咖啡色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1819, 82, 423703312591, 1314709895299, '宝蓝色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1820, 82, 423703312591, 1314709895294, '宝蓝色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1821, 82, 423703312591, 1314707340342, '酒红色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1822, 82, 423703312591, 1314707340356, '黑色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1823, 82, 423703312591, 1314707340344, '酒红色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1824, 82, 423703312591, 1314704618615, '大红加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1825, 82, 423703312591, 1314708624524, '灰色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1826, 82, 423703312591, 1314707340378, '藏蓝色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1827, 82, 423703312591, 1314707340367, '白色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1828, 82, 423703312591, 1314708624515, '墨绿色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1829, 82, 423703312591, 1314709895302, '卡其色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1830, 82, 423703312591, 1314707340379, '藏蓝色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1831, 82, 423703312591, 1314708624512, '墨绿色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1832, 82, 423703312591, 1314708624527, '灰色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1833, 82, 423703312591, 1314707340352, '黑色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1834, 82, 423703312591, 1314708624495, '咖啡色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1835, 82, 423703312591, 1314707340363, '白色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1836, 82, 423703312591, 1314708624497, '咖啡色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1837, 82, 423703312591, 1314707340346, '酒红色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1838, 82, 423703312591, 1314704618618, '大红加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1839, 82, 423703312591, 1314709895309, '卡其色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1840, 82, 423703312591, 1314708624528, '灰色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1841, 82, 423703312591, 1314708624503, '深紫色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1842, 82, 423703312591, 1314709895296, '宝蓝色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1843, 82, 423703312591, 1314708624518, '墨绿色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1844, 82, 423703312591, 1314707340354, '黑色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1845, 82, 423703312591, 1314707340372, '藏蓝色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1846, 82, 423703312591, 1314707340362, '白色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1847, 82, 423703312591, 1314707340345, '酒红色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1848, 82, 423703312591, 1314707340355, '黑色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1849, 82, 423703312591, 1314704618613, '大红加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1850, 82, 423703312591, 1314709895306, '卡其色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1851, 82, 423703312591, 1314707340373, '藏蓝色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1852, 82, 423703312591, 1314707340368, '白色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1853, 82, 423703312591, 1314709895310, '卡其色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1854, 82, 423703312591, 1314709895308, '卡其色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1855, 82, 423703312591, 1314708624516, '墨绿色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1856, 82, 423703312591, 1314704618614, '大红加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1857, 82, 423703312591, 1314707340350, '酒红色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1858, 82, 423703312591, 1314707340380, '藏蓝色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1859, 82, 423703312591, 1314707340377, '藏蓝色加绒 31', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1860, 82, 423703312591, 1314704618612, '大红加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1861, 82, 423703312591, 1314707340371, '藏蓝色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1862, 82, 423703312591, 1314709895295, '宝蓝色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1863, 82, 423703312591, 1314708624529, '灰色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1864, 82, 423703312591, 1314708624492, '咖啡色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1865, 82, 423703312591, 1314707340376, '藏蓝色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1866, 82, 423703312591, 1314709895311, '卡其色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1867, 82, 423703312591, 1314708624526, '灰色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1868, 82, 423703312591, 1314709895293, '宝蓝色加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1869, 82, 423703312591, 1314707340360, '黑色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1870, 82, 423703312591, 1314707340349, '酒红色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1871, 82, 423703312591, 1314708624506, '深紫色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1872, 82, 423703312591, 1314704618611, '大红加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1873, 82, 423703312591, 1314708624519, '墨绿色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1874, 82, 423703312591, 1314708624508, '深紫色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1875, 82, 423703312591, 1314707340365, '白色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1876, 82, 423703312591, 1314704618610, '大红加绒 26', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1877, 82, 423703312591, 1314709895300, '宝蓝色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1878, 82, 423703312591, 1314708624505, '深紫色加绒 29', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1879, 82, 423703312591, 1314708624530, '灰色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1880, 82, 423703312591, 1314709895307, '卡其色加绒 30', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1881, 82, 423703312591, 1314708624491, '咖啡色加绒 25', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1882, 82, 423703312591, 1314707340370, '白色加绒 34', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1883, 82, 423703312591, 1314708624498, '咖啡色加绒 32', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1884, 82, 423703312591, 1314708624514, '墨绿色加绒 28', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1885, 82, 423703312591, 1314708624513, '墨绿色加绒 27', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1886, 82, 423703312591, 1314707340359, '黑色加绒 33', 0, 0, '', 100, NULL, 'JKL333', 'JKL333', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1887, 90, 431646818746, 1315016127254, '八分薄绒 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1888, 90, 431646818746, 1315016127255, '八分薄绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1889, 90, 431646818746, 1315016127263, '九分单裤 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1890, 90, 431646818746, 1315016127270, '九分薄绒 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1891, 90, 431646818746, 1315016127247, '八分单裤 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1892, 90, 431646818746, 1315016127266, '九分单裤 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1893, 90, 431646818746, 1315016127265, '九分单裤 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1894, 90, 431646818746, 1315016127249, '八分单裤 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1895, 90, 431646818746, 1315016127271, '九分薄绒 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1896, 90, 431646818746, 1315016127268, '九分薄绒 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1897, 90, 431646818746, 1315016127251, '八分薄绒 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1898, 90, 431646818746, 1315016127258, '八分加绒 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1899, 90, 431646818746, 1315016127262, '九分单裤 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1900, 90, 431646818746, 1315016127246, '八分单裤 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1901, 90, 431646818746, 1315016127277, '九分加绒 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1902, 90, 431646818746, 1315016127250, '八分薄绒 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1903, 90, 431646818746, 1315016127253, '八分薄绒 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1904, 90, 431646818746, 1315016127244, '八分单裤 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1905, 90, 431646818746, 1315016127252, '八分薄绒 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1906, 90, 431646818746, 1315016127259, '八分加绒 L', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1907, 90, 431646818746, 1315016127267, '九分单裤 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1908, 90, 431646818746, 1315016127276, '九分加绒 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1909, 90, 431646818746, 1315016127264, '九分单裤 M', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1910, 90, 431646818746, 1315016127261, '八分加绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1911, 90, 431646818746, 1315016127278, '九分加绒 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1912, 90, 431646818746, 1315016127279, '九分加绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1913, 90, 431646818746, 1315016127260, '八分加绒 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1914, 90, 431646818746, 1315016127274, '九分加绒 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1915, 90, 431646818746, 1315016127273, '九分薄绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1916, 90, 431646818746, 1315016127248, '八分单裤 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1917, 90, 431646818746, 1315016127275, '九分加绒 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1918, 90, 431646818746, 1315016127272, '九分薄绒 XL', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1919, 90, 431646818746, 1315016127269, '九分薄绒 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1920, 90, 431646818746, 1315016127245, '八分单裤 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1921, 90, 431646818746, 1315016127256, '八分加绒 XS', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1922, 90, 431646818746, 1315016127257, '八分加绒 S', 0, 0, '', 100, NULL, '', 'JKL3689', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1923, 91, 431656693618, 1315037060999, '米白色 26', 1165, 63, 'JKL600147268', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1924, 91, 431656693618, 1315037060973, '卡其色 32', 1145, 63, 'JKL600128328', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1925, 91, 431656693618, 1315037060964, '黑色（加绒） 31', 1128, 63, 'JKL600101319', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1926, 91, 431656693618, 1315037060966, '卡其色 25', 1131, 63, 'JKL600128258', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1927, 91, 431656693618, 1315037060994, '卡灰色（加绒） 29', 1156, 63, 'JKL600151299', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1928, 91, 431656693618, 1315037060955, '黑色 30', 1125, 63, 'JKL600101308', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1929, 91, 431656693618, 1315037060996, '卡灰色（加绒） 31', 1160, 63, 'JKL600151319', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1930, 91, 431656693618, 1315037139001, '米白色 28', 1169, 63, 'JKL600147288', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1931, 91, 431656693618, 1315037060988, '卡灰色 31', 1159, 63, 'JKL600151318', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1932, 91, 431656693618, 1315037060998, '米白色 25', 1163, 63, 'JKL600147258', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1933, 91, 431656693618, 1315037060959, '黑色（加绒） 26', 1118, 63, 'JKL600101269', 99, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1934, 91, 431656693618, 1315037060957, '黑色 32', 1129, 63, 'JKL600101328', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1935, 91, 431656693618, 1315037139012, '米白色（加绒） 31', 1176, 63, 'JKL600147319', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1936, 91, 431656693618, 1315037060965, '黑色（加绒） 32', 1130, 63, 'JKL600101329', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1937, 91, 431656693618, 1315037060997, '卡灰色（加绒） 32', 1162, 63, 'JKL600151329', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1938, 91, 431656693618, 1315037060950, '黑色 25', 1115, 63, 'JKL600101258', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1939, 91, 431656693618, 1315037060963, '黑色（加绒） 30', 1126, 63, 'JKL600101309', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1940, 91, 431656693618, 1315037060961, '黑色（加绒） 28', 1122, 63, 'JKL600101289', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1941, 91, 431656693618, 1315037060954, '黑色 29', 1123, 63, 'JKL600101298', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1942, 91, 431656693618, 1315037139013, '米白色（加绒） 32', 1178, 63, 'JKL600147329', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1943, 91, 431656693618, 1315037060983, '卡灰色 26', 1149, 63, 'JKL600151268', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1944, 91, 431656693618, 1315037060956, '黑色 31', 1127, 63, 'JKL600101318', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1945, 91, 431656693618, 1315037060951, '黑色 26', 1117, 63, 'JKL600101268', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1946, 91, 431656693618, 1315037139008, '米白色（加绒） 27', 1168, 63, 'JKL600147279', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1947, 91, 431656693618, 1315037060987, '卡灰色 30', 1157, 63, 'JKL600151308', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1948, 91, 431656693618, 1315037060976, '卡其色（加绒） 27', 1136, 63, 'JKL600128279', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1949, 91, 431656693618, 1315037060981, '卡其色（加绒） 32', 1146, 63, 'JKL600128329', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1950, 91, 431656693618, 1315037139005, '米白色 32', 1177, 63, 'JKL600147328', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1951, 91, 431656693618, 1315037060967, '卡其色 26', 1133, 63, 'JKL600128268', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1952, 91, 431656693618, 1315037060953, '黑色 28', 1121, 63, 'JKL600101288', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1953, 91, 431656693618, 1315037139007, '米白色（加绒） 26', 1166, 63, 'JKL600147269', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1954, 91, 431656693618, 1315037060995, '卡灰色（加绒） 30', 1158, 63, 'JKL600151309', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1955, 91, 431656693618, 1315037139010, '米白色（加绒） 29', 1172, 63, 'JKL600147299', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1956, 91, 431656693618, 1315037139004, '米白色 31', 1175, 63, 'JKL600147318', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1957, 91, 431656693618, 1315037060989, '卡灰色 32', 1161, 63, 'JKL600151328', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1958, 91, 431656693618, 1315037060985, '卡灰色 28', 1153, 63, 'JKL600151288', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1959, 91, 431656693618, 1315037060974, '卡其色（加绒） 25', 1132, 63, 'JKL600128259', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1960, 91, 431656693618, 1315037060990, '卡灰色（加绒） 25', 1148, 63, 'JKL600151259', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1961, 91, 431656693618, 1315037060992, '卡灰色（加绒） 27', 1152, 63, 'JKL600151279', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1962, 91, 431656693618, 1315037060986, '卡灰色 29', 1155, 63, 'JKL600151298', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1963, 91, 431656693618, 1315037060960, '黑色（加绒） 27', 1120, 63, 'JKL600101279', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1964, 91, 431656693618, 1315037060969, '卡其色 28', 1137, 63, 'JKL600128288', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1965, 91, 431656693618, 1315037060972, '卡其色 31', 1143, 63, 'JKL600128318', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1966, 91, 431656693618, 1315037060971, '卡其色 30', 1141, 63, 'JKL600128308', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1967, 91, 431656693618, 1315037139002, '米白色 29', 1171, 63, 'JKL600147298', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1968, 91, 431656693618, 1315037139011, '米白色（加绒） 30', 1174, 63, 'JKL600147309', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1969, 91, 431656693618, 1315037060979, '卡其色（加绒） 30', 1142, 63, 'JKL600128309', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1970, 91, 431656693618, 1315037060980, '卡其色（加绒） 31', 1144, 63, 'JKL600128319', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1971, 91, 431656693618, 1315037060952, '黑色 27', 1119, 63, 'JKL600101278', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1972, 91, 431656693618, 1315037060962, '黑色（加绒） 29', 1124, 63, 'JKL600101299', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1973, 91, 431656693618, 1315037060978, '卡其色（加绒） 29', 1140, 63, 'JKL600128299', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1974, 91, 431656693618, 1315037060977, '卡其色（加绒） 28', 1138, 63, 'JKL600128289', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1975, 91, 431656693618, 1315037139009, '米白色（加绒） 28', 1170, 63, 'JKL600147289', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1976, 91, 431656693618, 1315037139003, '米白色 30', 1173, 63, 'JKL600147308', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1977, 91, 431656693618, 1315037060970, '卡其色 29', 1139, 63, 'JKL600128298', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1978, 91, 431656693618, 1315037060958, '黑色（加绒） 25', 1116, 63, 'JKL600101259', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1979, 91, 431656693618, 1315037060984, '卡灰色 27', 1151, 63, 'JKL600151278', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1980, 91, 431656693618, 1315037139006, '米白色（加绒） 25', 1164, 63, 'JKL600147259', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1981, 91, 431656693618, 1315037060968, '卡其色 27', 1135, 63, 'JKL600128278', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1982, 91, 431656693618, 1315037060982, '卡灰色 25', 1147, 63, 'JKL600151258', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1983, 91, 431656693618, 1315037060993, '卡灰色（加绒） 28', 1154, 63, 'JKL600151289', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1984, 91, 431656693618, 1315037139000, '米白色 27', 1167, 63, 'JKL600147278', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1985, 91, 431656693618, 1315037060991, '卡灰色（加绒） 26', 1150, 63, 'JKL600151269', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1986, 91, 431656693618, 1315037060975, '卡其色（加绒） 26', 1134, 63, 'JKL600128269', 100, NULL, '', 'JKL6001', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1987, 92, 432701863744, 1316793142326, '黑色 XL', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1988, 92, 432701863744, 1316793142327, '黑色 2XL', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1989, 92, 432701863744, 1316793142318, '黑色撞色（九分） M', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1990, 92, 432701863744, 1316793142322, '黑色 XS', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1991, 92, 432701863744, 1316793142321, '黑色撞色（九分） 2XL', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1992, 92, 432701863744, 1316793142316, '黑色撞色（九分） XS', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1993, 92, 432701863744, 1316793142320, '黑色撞色（九分） XL', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1994, 92, 432701863744, 1316793142324, '黑色 M', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1995, 92, 432701863744, 1316793142319, '黑色撞色（九分） L', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1996, 92, 432701863744, 1316793142323, '黑色 S', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1997, 92, 432701863744, 1316793142317, '黑色撞色（九分） S', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1998, 92, 432701863744, 1316793142325, '黑色 L', 0, 0, '', 100, NULL, '', 'JKL2035', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (1999, 93, 432930516051, 1317172515738, '复古蓝 S', 1232, 66, 'JKL197340018', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2000, 93, 432930516051, 1317172515741, '复古蓝 XL', 1238, 66, 'JKL197340048', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2001, 93, 432930516051, 1317172515748, '复古蓝（加绒） 2XL', 1241, 66, 'JKL197340059', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2002, 93, 432930516051, 1317172515742, '复古蓝 2XL', 1240, 66, 'JKL197340058', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2003, 93, 432930516051, 1317172515737, '复古蓝 XS', 1230, 66, 'JKL197340098', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2004, 93, 432930516051, 1317172515746, '复古蓝（加绒） L', 1237, 66, 'JKL197340039', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2005, 93, 432930516051, 1317172515740, '复古蓝 L', 1236, 66, 'JKL197340038', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2006, 93, 432930516051, 1317172515745, '复古蓝（加绒） M', 1235, 66, 'JKL197340029', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2007, 93, 432930516051, 1317172515743, '复古蓝（加绒） XS', 1231, 66, 'JKL197340099', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2008, 93, 432930516051, 1317172515747, '复古蓝（加绒） XL', 1239, 66, 'JKL197340049', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2009, 93, 432930516051, 1317172515744, '复古蓝（加绒） S', 1233, 66, 'JKL197340019', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2010, 93, 432930516051, 1317172515739, '复古蓝 M', 1234, 66, 'JKL197340028', 100, NULL, '', 'JKL1973', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2011, 94, 432939563887, 1317186166417, '八分抓绒 L', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2012, 94, 432939563887, 1317186166412, '九分单裤 XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2013, 94, 432939563887, 1317186166422, '九分抓绒 M', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2014, 94, 432939563887, 1317186166416, '八分抓绒 M', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2015, 94, 432939563887, 1317186166403, '八分单裤 S', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2016, 94, 432939563887, 1317186166405, '八分单裤 L', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2017, 94, 432939563887, 1317186166406, '八分单裤 XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2018, 94, 432939563887, 1317186166404, '八分单裤 M', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2019, 94, 432939563887, 1317186166413, '九分单裤 2XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2020, 94, 432939563887, 1317186166407, '八分单裤 2XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2021, 94, 432939563887, 1317186166410, '九分单裤 M', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2022, 94, 432939563887, 1317186166411, '九分单裤 L', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2023, 94, 432939563887, 1317186166425, '九分抓绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2024, 94, 432939563887, 1317186166424, '九分抓绒 XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2025, 94, 432939563887, 1317186166419, '八分抓绒 2XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2026, 94, 432939563887, 1317186166415, '八分抓绒 S', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2027, 94, 432939563887, 1317186166402, '八分单裤 XS', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2028, 94, 432939563887, 1317186166408, '九分单裤 XS', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2029, 94, 432939563887, 1317186166421, '九分抓绒 S', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2030, 94, 432939563887, 1317186166409, '九分单裤 S', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2031, 94, 432939563887, 1317186166414, '八分抓绒 XS', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2032, 94, 432939563887, 1317186166418, '八分抓绒 XL', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2033, 94, 432939563887, 1317186166420, '九分抓绒 XS', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2034, 94, 432939563887, 1317186166423, '九分抓绒 L', 0, 0, '', 100, NULL, '', 'JKL3705', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2035, 95, 432951870483, 1317207478166, '深蓝色（长裤） 30', 1262, 67, 'JKL19511230CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2036, 95, 432951870483, 1317207478168, '深蓝色（长裤） 32', 1270, 67, 'JKL19511232CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2037, 95, 432951870483, 1317207478181, '深蓝色（加长裤） 29', 1260, 67, 'JKL19511229JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2038, 95, 432951870483, 1317207478176, '复古蓝（长裤） 32', 1302, 67, 'JKL19514032CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2039, 95, 432951870483, 1317207478194, '深蓝色（长裤加绒） 26', 1247, 67, 'JKL19511226CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2040, 95, 432951870483, 1317207478216, '深蓝色（加长裤加绒） 32', 1273, 67, 'JKL19511232JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2041, 95, 432951870483, 1317207478219, '复古蓝（加长裤加绒） 27', 1285, 67, 'JKL19514027JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2042, 95, 432951870483, 1317207478206, '复古蓝（长裤加绒） 30', 1295, 67, 'JKL19514030CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2043, 95, 432951870483, 1317207478208, '复古蓝（长裤加绒） 32', 1303, 67, 'JKL19514032CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2044, 95, 432951870483, 1317207478169, '复古蓝（长裤） 25', 1274, 67, 'JKL19514025CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2045, 95, 432951870483, 1317207478205, '复古蓝（长裤加绒） 29', 1291, 67, 'JKL19514029CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2046, 95, 432951870483, 1317207478221, '复古蓝（加长裤加绒） 29', 1293, 67, 'JKL19514029JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2047, 95, 432951870483, 1317207478174, '复古蓝（长裤） 30', 1294, 67, 'JKL19514030CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2048, 95, 432951870483, 1317207478185, '复古蓝（加长裤） 25', 1276, 67, 'JKL19514025JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2049, 95, 432951870483, 1317207478197, '深蓝色（长裤加绒） 29', 1259, 67, 'JKL19511229CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2050, 95, 432951870483, 1317207478183, '深蓝色（加长裤） 31', 1268, 67, 'JKL19511231JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2051, 95, 432951870483, 1317207478188, '复古蓝（加长裤） 28', 1288, 67, 'JKL19514028JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2052, 95, 432951870483, 1317207478207, '复古蓝（长裤加绒） 31', 1299, 67, 'JKL19514031CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2053, 95, 432951870483, 1317207478217, '复古蓝（加长裤加绒） 25', 1277, 67, 'JKL19514025JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2054, 95, 432951870483, 1317207478165, '深蓝色（长裤） 29', 1258, 67, 'JKL19511229CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2055, 95, 432951870483, 1317207478196, '深蓝色（长裤加绒） 28', 1255, 67, 'JKL19511228CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2056, 95, 432951870483, 1317207478184, '深蓝色（加长裤） 32', 1272, 67, 'JKL19511232JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2057, 95, 432951870483, 1317207478204, '复古蓝（长裤加绒） 28', 1287, 67, 'JKL19514028CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2058, 95, 432951870483, 1317207478211, '深蓝色（加长裤加绒） 27', 1253, 67, 'JKL19511227JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2059, 95, 432951870483, 1317207478170, '复古蓝（长裤） 26', 1278, 67, 'JKL19514026CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2060, 95, 432951870483, 1317207478192, '复古蓝（加长裤） 32', 1304, 67, 'JKL19514032JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2061, 95, 432951870483, 1317207478172, '复古蓝（长裤） 28', 1286, 67, 'JKL19514028CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2062, 95, 432951870483, 1317207478178, '深蓝色（加长裤） 26', 1248, 67, 'JKL19511226JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2063, 95, 432951870483, 1317207478209, '深蓝色（加长裤加绒） 25', 1245, 67, 'JKL19511225JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2064, 95, 432951870483, 1317207478195, '深蓝色（长裤加绒） 27', 1251, 67, 'JKL19511227CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2065, 95, 432951870483, 1317207478180, '深蓝色（加长裤） 28', 1256, 67, 'JKL19511228JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2066, 95, 432951870483, 1317207478189, '复古蓝（加长裤） 29', 1292, 67, 'JKL19514029JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2067, 95, 432951870483, 1317207478200, '深蓝色（长裤加绒） 32', 1271, 67, 'JKL19511232CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2068, 95, 432951870483, 1317207478171, '复古蓝（长裤） 27', 1282, 67, 'JKL19514027CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2069, 95, 432951870483, 1317207478198, '深蓝色（长裤加绒） 30', 1263, 67, 'JKL19511230CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2070, 95, 432951870483, 1317207478186, '复古蓝（加长裤） 26', 1280, 67, 'JKL19514026JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2071, 95, 432951870483, 1317207478187, '复古蓝（加长裤） 27', 1284, 67, 'JKL19514027JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2072, 95, 432951870483, 1317207478203, '复古蓝（长裤加绒） 27', 1283, 67, 'JKL19514027CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2073, 95, 432951870483, 1317207478223, '复古蓝（加长裤加绒） 31', 1301, 67, 'JKL19514031JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2074, 95, 432951870483, 1317207478163, '深蓝色（长裤） 27', 1250, 67, 'JKL19511227CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2075, 95, 432951870483, 1317207478164, '深蓝色（长裤） 28', 1254, 67, 'JKL19511228CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2076, 95, 432951870483, 1317207478182, '深蓝色（加长裤） 30', 1264, 67, 'JKL19511230JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2077, 95, 432951870483, 1317207478179, '深蓝色（加长裤） 27', 1252, 67, 'JKL19511227JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2078, 95, 432951870483, 1317207478173, '复古蓝（长裤） 29', 1290, 67, 'JKL19514029CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2079, 95, 432951870483, 1317207478199, '深蓝色（长裤加绒） 31', 1267, 67, 'JKL19511231CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2080, 95, 432951870483, 1317207478201, '复古蓝（长裤加绒） 25', 1275, 67, 'JKL19514025CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2081, 95, 432951870483, 1317207478202, '复古蓝（长裤加绒） 26', 1279, 67, 'JKL19514026CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2082, 95, 432951870483, 1317207478212, '深蓝色（加长裤加绒） 28', 1257, 67, 'JKL19511228JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2083, 95, 432951870483, 1317207478213, '深蓝色（加长裤加绒） 29', 1261, 67, 'JKL19511229JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2084, 95, 432951870483, 1317207478218, '复古蓝（加长裤加绒） 26', 1281, 67, 'JKL19514026JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2085, 95, 432951870483, 1317207478214, '深蓝色（加长裤加绒） 30', 1265, 67, 'JKL19511230JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2086, 95, 432951870483, 1317207478191, '复古蓝（加长裤） 31', 1300, 67, 'JKL19514031JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2087, 95, 432951870483, 1317207478210, '深蓝色（加长裤加绒） 26', 1249, 67, 'JKL19511226JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2088, 95, 432951870483, 1317207478177, '深蓝色（加长裤） 25', 1244, 67, 'JKL19511225JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2089, 95, 432951870483, 1317207478190, '复古蓝（加长裤） 30', 1296, 67, 'JKL19514030JC', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2090, 95, 432951870483, 1317207478222, '复古蓝（加长裤加绒） 30', 1297, 67, 'JKL19514030JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2091, 95, 432951870483, 1317207478193, '深蓝色（长裤加绒） 25', 1243, 67, 'JKL19511225CR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2092, 95, 432951870483, 1317207478220, '复古蓝（加长裤加绒） 28', 1289, 67, 'JKL19514028JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2093, 95, 432951870483, 1317207478167, '深蓝色（长裤） 31', 1266, 67, 'JKL19511231CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2094, 95, 432951870483, 1317207478162, '深蓝色（长裤） 26', 1246, 67, 'JKL19511226CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2095, 95, 432951870483, 1317207478161, '深蓝色（长裤） 25', 1242, 67, 'JKL19511225CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2096, 95, 432951870483, 1317207478175, '复古蓝（长裤） 31', 1298, 67, 'JKL19514031CK', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2097, 95, 432951870483, 1317207478215, '深蓝色（加长裤加绒） 31', 1269, 67, 'JKL19511231JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2098, 95, 432951870483, 1317207478224, '复古蓝（加长裤加绒） 32', 1305, 67, 'JKL19514032JCR', 100, NULL, '', 'JKL1951', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2099, 96, 432977920082, 1317250246880, '深蓝色（长裤） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2100, 96, 432977920082, 1317250246891, '浅蓝色（加长） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2101, 96, 432977920082, 1317250246879, '深蓝色（长裤） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2102, 96, 432977920082, 1317250246892, '浅蓝色（加长） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2103, 96, 432977920082, 1317250246884, '浅蓝色 XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2104, 96, 432977920082, 1317250246889, '深蓝色（加长） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2105, 96, 432977920082, 1317250246886, '深蓝色（加长） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2106, 96, 432977920082, 1317250246882, '浅蓝色 M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2107, 96, 432977920082, 1317250246887, '深蓝色（加长） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2108, 96, 432977920082, 1317250246893, '浅蓝色（加长） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2109, 96, 432977920082, 1317250246890, '深蓝色（加长） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2110, 96, 432977920082, 1317250246888, '深蓝色（加长） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2111, 96, 432977920082, 1317250246877, '深蓝色（长裤） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2112, 96, 432977920082, 1317250246885, '浅蓝色 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2113, 96, 432977920082, 1317250246881, '浅蓝色 S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2114, 96, 432977920082, 1317250246876, '深蓝色（长裤） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2115, 96, 432977920082, 1317250246878, '深蓝色（长裤） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2116, 96, 432977920082, 1317250246883, '浅蓝色 L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2117, 96, 432977920082, 1317250246894, '浅蓝色（加长） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2118, 96, 432977920082, 1317250246895, '浅蓝色（加长） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2119, 97, 432987421029, 1317264242865, '深蓝（长裤） S', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2120, 97, 432987421029, 1317264242875, '深蓝（加长） S', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2121, 97, 432987421029, 1317264242871, '浅蓝色 M', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2122, 97, 432987421029, 1317264242883, '浅蓝色（加长） XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2123, 97, 432987421029, 1317264242882, '浅蓝色（加长） L', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2124, 97, 432987421029, 1317264242869, '深蓝（长裤） 2XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2125, 97, 432987421029, 1317264242874, '浅蓝色 2XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2126, 97, 432987421029, 1317264242868, '深蓝（长裤） XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2127, 97, 432987421029, 1317264242872, '浅蓝色 L', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2128, 97, 432987421029, 1317264242866, '深蓝（长裤） M', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2129, 97, 432987421029, 1317264242870, '浅蓝色 S', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2130, 97, 432987421029, 1317264242884, '浅蓝色（加长） 2XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2131, 97, 432987421029, 1317264242877, '深蓝（加长） L', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2132, 97, 432987421029, 1317264242876, '深蓝（加长） M', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2133, 97, 432987421029, 1317264242880, '浅蓝色（加长） S', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2134, 97, 432987421029, 1317264242873, '浅蓝色 XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2135, 97, 432987421029, 1317264242878, '深蓝（加长） XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2136, 97, 432987421029, 1317264242879, '深蓝（加长） 2XL', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2137, 97, 432987421029, 1317264242867, '深蓝（长裤） L', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2138, 97, 432987421029, 1317264242881, '浅蓝色（加长） M', 0, 0, '', 100, NULL, '', 'JKL015', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2139, 98, 433499680962, 1318135707031, '中蓝（长裤） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2140, 98, 433499680962, 1318135707044, '中蓝（加长款） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2141, 98, 433499680962, 1318135707033, '中蓝（长裤） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2142, 98, 433499680962, 1318135707040, '深蓝（加长款） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2143, 98, 433499680962, 1318135707042, '中蓝（加长款） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2144, 98, 433499680962, 1318135707027, '深蓝（长裤） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2145, 98, 433499680962, 1318135707038, '深蓝（加长款） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2146, 98, 433499680962, 1318135707030, '深蓝（长裤） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2147, 98, 433499680962, 1318135707035, '中蓝（长裤） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2148, 98, 433499680962, 1318135707032, '中蓝（长裤） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2149, 98, 433499680962, 1318135707028, '深蓝（长裤） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2150, 98, 433499680962, 1318135707029, '深蓝（长裤） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2151, 98, 433499680962, 1318135707039, '深蓝（加长款） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2152, 98, 433499680962, 1318135707041, '中蓝（加长款） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2153, 98, 433499680962, 1318135707043, '中蓝（加长款） L', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2154, 98, 433499680962, 1318135707037, '深蓝（加长款） M', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2155, 98, 433499680962, 1318135707045, '中蓝（加长款） 2XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2156, 98, 433499680962, 1318135707026, '深蓝（长裤） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2157, 98, 433499680962, 1318135707034, '中蓝（长裤） XL', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2158, 98, 433499680962, 1318135707036, '深蓝（加长款） S', 0, 0, '', 100, NULL, '', 'JKL016', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2159, 99, 433495415698, 1318175941084, '复古蓝（长裤加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2160, 99, 433495415698, 1318159290557, '浅蓝色（加长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2161, 99, 433495415698, 1318175941064, '黑灰（长裤加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2162, 99, 433495415698, 1318175941072, '黑灰（加长加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2163, 99, 433495415698, 1318159290494, '黑灰（九分） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2164, 99, 433495415698, 1318159290512, '黑灰（加长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2165, 99, 433495415698, 1318159290523, '复古蓝（九分） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2166, 99, 433495415698, 1318175941088, '复古蓝（长裤加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2167, 99, 433495415698, 1318159290556, '浅蓝色（长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2168, 99, 433495415698, 1318159290529, '复古蓝（长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2169, 99, 433495415698, 1318159290508, '黑灰（长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2170, 99, 433495415698, 1318175941083, '复古蓝（九分加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2171, 99, 433495415698, 1318175941059, '黑灰（九分加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2172, 99, 433495415698, 1318159290499, '黑灰（九分） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2173, 99, 433495415698, 1318159290527, '复古蓝（长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2174, 99, 433495415698, 1318159290528, '复古蓝（长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2175, 99, 433495415698, 1318159290509, '黑灰（加长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2176, 99, 433495415698, 1318175941075, '黑灰（加长加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2177, 99, 433495415698, 1318175941078, '复古蓝（九分加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2178, 99, 433495415698, 1318175941056, '黑灰（九分加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2179, 99, 433495415698, 1318175941073, '黑灰（加长加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2180, 99, 433495415698, 1318175941099, '复古蓝（加长加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2181, 99, 433495415698, 1318159290495, '黑灰（九分） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2182, 99, 433495415698, 1318159290525, '复古蓝（长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2183, 99, 433495415698, 1318159290534, '复古蓝（加长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2184, 99, 433495415698, 1318159290545, '浅蓝色 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2185, 99, 433495415698, 1318159290542, '浅蓝色 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2186, 99, 433495415698, 1318175941082, '复古蓝（九分加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2187, 99, 433495415698, 1318159290543, '浅蓝色 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2188, 99, 433495415698, 1318159290531, '复古蓝（长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2189, 99, 433495415698, 1318159290547, '浅蓝色 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2190, 99, 433495415698, 1318159290507, '黑灰（长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2191, 99, 433495415698, 1318175941057, '黑灰（九分加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2192, 99, 433495415698, 1318159290533, '复古蓝（加长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2193, 99, 433495415698, 1318159290518, '复古蓝（九分） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2194, 99, 433495415698, 1318159290540, '复古蓝（加长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2195, 99, 433495415698, 1318159290500, '黑灰（九分） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2196, 99, 433495415698, 1318159290538, '复古蓝（加长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2197, 99, 433495415698, 1318159290506, '黑灰（长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2198, 99, 433495415698, 1318159290503, '黑灰（长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2199, 99, 433495415698, 1318159290521, '复古蓝（九分） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2200, 99, 433495415698, 1318159290541, '浅蓝色 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2201, 99, 433495415698, 1318159290515, '黑灰（加长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2202, 99, 433495415698, 1318175941065, '黑灰（长裤加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2203, 99, 433495415698, 1318175941077, '复古蓝（九分加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2204, 99, 433495415698, 1318175941093, '复古蓝（加长加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2205, 99, 433495415698, 1318159290555, '浅蓝色（长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2206, 99, 433495415698, 1318175941086, '复古蓝（长裤加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2207, 99, 433495415698, 1318175941054, '黑灰（九分加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2208, 99, 433495415698, 1318159290510, '黑灰（加长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2209, 99, 433495415698, 1318175941070, '黑灰（加长加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2210, 99, 433495415698, 1318175941066, '黑灰（长裤加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2211, 99, 433495415698, 1318159290513, '黑灰（加长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2212, 99, 433495415698, 1318159290553, '浅蓝色（长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2213, 99, 433495415698, 1318159290551, '浅蓝色（长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2214, 99, 433495415698, 1318175941081, '复古蓝（九分加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2215, 99, 433495415698, 1318175941060, '黑灰（长裤加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2216, 99, 433495415698, 1318175941089, '复古蓝（长裤加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2217, 99, 433495415698, 1318159290522, '复古蓝（九分） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2218, 99, 433495415698, 1318159290501, '黑灰（长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2219, 99, 433495415698, 1318159290563, '浅蓝色（加长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2220, 99, 433495415698, 1318159290517, '复古蓝（九分） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2221, 99, 433495415698, 1318159290561, '浅蓝色（加长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2222, 99, 433495415698, 1318159290498, '黑灰（九分） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2223, 99, 433495415698, 1318159290524, '复古蓝（九分） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2224, 99, 433495415698, 1318175941063, '黑灰（长裤加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2225, 99, 433495415698, 1318159290546, '浅蓝色 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2226, 99, 433495415698, 1318159290520, '复古蓝（九分） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2227, 99, 433495415698, 1318175941097, '复古蓝（加长加绒） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2228, 99, 433495415698, 1318159290552, '浅蓝色（长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2229, 99, 433495415698, 1318175941094, '复古蓝（加长加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2230, 99, 433495415698, 1318159290497, '黑灰（九分） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2231, 99, 433495415698, 1318175941090, '复古蓝（长裤加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2232, 99, 433495415698, 1318175941080, '复古蓝（九分加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2233, 99, 433495415698, 1318159290554, '浅蓝色（长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2234, 99, 433495415698, 1318175941061, '黑灰（长裤加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2235, 99, 433495415698, 1318175941085, '复古蓝（长裤加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2236, 99, 433495415698, 1318159290564, '浅蓝色（加长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2237, 99, 433495415698, 1318159290496, '黑灰（九分） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2238, 99, 433495415698, 1318175941092, '复古蓝（加长加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2239, 99, 433495415698, 1318175941068, '黑灰（加长加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2240, 99, 433495415698, 1318175941058, '黑灰（九分加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2241, 99, 433495415698, 1318175941071, '黑灰（加长加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2242, 99, 433495415698, 1318175941074, '黑灰（加长加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2243, 99, 433495415698, 1318175941052, '黑灰（九分加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2244, 99, 433495415698, 1318175941055, '黑灰（九分加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2245, 99, 433495415698, 1318159290514, '黑灰（加长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2246, 99, 433495415698, 1318159290532, '复古蓝（长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2247, 99, 433495415698, 1318175941091, '复古蓝（长裤加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2248, 99, 433495415698, 1318159290502, '黑灰（长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2249, 99, 433495415698, 1318159290536, '复古蓝（加长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2250, 99, 433495415698, 1318159290516, '黑灰（加长裤） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2251, 99, 433495415698, 1318175941062, '黑灰（长裤加绒） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2252, 99, 433495415698, 1318159290550, '浅蓝色（长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2253, 99, 433495415698, 1318175941095, '复古蓝（加长加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2254, 99, 433495415698, 1318159290544, '浅蓝色 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2255, 99, 433495415698, 1318159290493, '黑灰（九分） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2256, 99, 433495415698, 1318159290504, '黑灰（长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2257, 99, 433495415698, 1318175941087, '复古蓝（长裤加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2258, 99, 433495415698, 1318175941079, '复古蓝（九分加绒） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2259, 99, 433495415698, 1318159290560, '浅蓝色（加长裤） 28', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2260, 99, 433495415698, 1318159290539, '复古蓝（加长裤） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2261, 99, 433495415698, 1318159290548, '浅蓝色 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2262, 99, 433495415698, 1318159290562, '浅蓝色（加长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2263, 99, 433495415698, 1318159290558, '浅蓝色（加长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2264, 99, 433495415698, 1318175941076, '复古蓝（九分加绒） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2265, 99, 433495415698, 1318159290530, '复古蓝（长裤） 30', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2266, 99, 433495415698, 1318175941069, '黑灰（加长加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2267, 99, 433495415698, 1318159290505, '黑灰（长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2268, 99, 433495415698, 1318159290537, '复古蓝（加长裤） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2269, 99, 433495415698, 1318175941067, '黑灰（长裤加绒） 32', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2270, 99, 433495415698, 1318175941096, '复古蓝（加长加绒） 29', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2271, 99, 433495415698, 1318159290511, '黑灰（加长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2272, 99, 433495415698, 1318159290519, '复古蓝（九分） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2273, 99, 433495415698, 1318159290526, '复古蓝（长裤） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2274, 99, 433495415698, 1318159290559, '浅蓝色（加长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2275, 99, 433495415698, 1318159290535, '复古蓝（加长裤） 27', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2276, 99, 433495415698, 1318175941098, '复古蓝（加长加绒） 31', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2277, 99, 433495415698, 1318159290549, '浅蓝色（长裤） 25', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2278, 99, 433495415698, 1318175941053, '黑灰（九分加绒） 26', 0, 0, '', 100, NULL, '', 'JKL1856', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2279, 100, 433742784706, 1318560053562, '绿色 均码', 1229, 65, 'GZYYZ72776200', 100, NULL, '', 'GZYYZ7277', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2280, 100, 433742784706, 1318560053561, '黑色 均码', 1227, 65, 'GZYYZ72770100', 100, NULL, '', 'GZYYZ7277', NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `tao_goods_sku` VALUES (2281, 100, 433742784706, 1318560053563, '咖啡色 均码', 1228, 65, 'GZYYZ72773100', 99, NULL, '', 'GZYYZ7277', NULL, NULL, NULL, 1, NULL, NULL);

-- ----------------------------
-- Table structure for tao_order
-- ----------------------------
DROP TABLE IF EXISTS `tao_order`;
CREATE TABLE `tao_order`  (
  `id` bigint NOT NULL COMMENT '订单id（天猫订单id）',
  `shopId` int NOT NULL DEFAULT 0 COMMENT '店铺id',
  `orderSource` int NULL DEFAULT 1 COMMENT '订单来源0天猫1淘宝',
  `buyerName` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '买家昵称',
  `totalAmount` decimal(10, 2) NOT NULL COMMENT '应付款总金额，totalAmount = ∑itemAmount + shippingFee，单位为元',
  `shippingFee` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
  `discountAmount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `payAmount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际支付金额',
  `discountRemark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '优惠描述',
  `orderCreateTime` datetime NOT NULL COMMENT '订单创建时间',
  `orderModifyTime` datetime NULL DEFAULT NULL COMMENT '订单修改时间',
  `payTime` datetime NULL DEFAULT NULL COMMENT '付款时间，如果有多次付款，这里返回的是首次付款时间',
  `confirmedTime` datetime NULL DEFAULT NULL COMMENT '确认时间',
  `deliveredTime` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `completeTime` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `sellerMemo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '卖家备忘信息',
  `buyerFeedback` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家留言，不超过500字',
  `closeReason` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '关闭原因。buyerCancel:买家取消订单，sellerGoodsLack:卖家库存不足，other:其它',
  `receivingTime` datetime NULL DEFAULT NULL COMMENT '收货时间，这里返回的是完全收货时间',
  `statusStr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '订单状态',
  `status` int NOT NULL DEFAULT 0 COMMENT '交易状态，waitbuyerpay:等待买家付款;waitsellersend:等待卖家发货;waitlogisticstakein:等待物流公司揽件;waitbuyerreceive:等待买家收货;waitbuyersign:等待买家签收;signinsuccess:买家已签收;confirm_goods:已收货;success:交易成功;cancel:交易取消;terminated:交易终止;未枚举:其他状态',
  `logisticsCompany` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `logisticsCompanyCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `logisticsCode` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `refundId` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款单ID',
  `refundAmount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额，单位为元',
  `refundStatus` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单的售中退款状态，等待卖家同意：waitselleragree ，待买家修改：waitbuyermodify，等待买家退货：waitbuyersend，等待卖家确认收货：waitsellerreceive，退款成功：refundsuccess，退款失败：refundclose',
  `auditStatus` int NOT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `auditTime` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  `sendStatus` int NULL DEFAULT 0 COMMENT '发货状态（0待出库1拣货中2已拣货3已出库4已发货）',
  `sendTime` datetime NULL DEFAULT NULL COMMENT '仓库发货时间',
  `tag` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签(1：实售2：淘宝客3：刷单4：返现)',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_comment` tinyint(1) NULL DEFAULT 0 COMMENT '是否评价',
  `is_merge` tinyint(1) NULL DEFAULT 0 COMMENT '是否合并发货(0:否1:是)',
  `createTime` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `createBy` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `updateTime` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `updateBy` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order
-- ----------------------------
INSERT INTO `tao_order` VALUES (1631273557325601885, 6, 0, '', 28.90, 0.00, 0.00, 28.90, '', '2022-07-31 18:14:00', '2022-07-31 18:14:00', '2022-07-31 18:14:00', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432700565699461', NULL, NULL, NULL, 1, '2024-01-16 13:44:26', 0, '2022-07-31 19:55:48', NULL, NULL, NULL, 0, '2022-07-31 18:13:59', NULL, '2024-01-16 13:44:26', 'admin');
INSERT INTO `tao_order` VALUES (1634650644223535380, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-05 18:54:56', '2022-08-05 18:54:56', '2022-08-05 18:54:56', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409379', NULL, NULL, NULL, 0, '2022-08-05 18:54:56', 0, '2022-08-05 19:52:56', NULL, NULL, NULL, 0, '2022-08-05 18:54:56', NULL, '2022-08-05 19:52:56', NULL);
INSERT INTO `tao_order` VALUES (1635222253871665598, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-05 18:48:51', '2022-08-05 18:48:51', '2022-08-05 18:48:51', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409767', NULL, NULL, NULL, 1, '2024-01-28 19:55:37', 0, '2022-08-05 19:49:12', NULL, NULL, NULL, 0, '2022-08-05 18:48:51', NULL, '2024-01-28 19:55:37', 'admin');
INSERT INTO `tao_order` VALUES (1635963673656309898, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-06 18:26:01', '2022-08-06 18:26:01', '2022-08-06 18:26:01', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752762', NULL, NULL, NULL, 0, '2022-08-06 18:26:01', 0, '2022-08-09 19:19:10', NULL, NULL, NULL, 0, '2022-08-06 18:26:01', NULL, '2022-08-09 19:19:10', NULL);
INSERT INTO `tao_order` VALUES (1638101679063535380, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-09 19:34:24', '2022-08-09 19:34:24', '2022-08-09 19:34:24', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432716874752516', NULL, NULL, NULL, 0, '2022-08-09 19:34:24', 0, '2022-08-09 22:45:55', NULL, NULL, NULL, 0, '2022-08-09 19:34:24', NULL, '2022-08-09 22:45:55', NULL);
INSERT INTO `tao_order` VALUES (1638388920088435398, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-10 17:17:21', '2022-08-10 17:17:21', '2022-08-10 17:17:21', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432718792062072', NULL, NULL, NULL, 0, '2022-08-10 17:17:21', 0, '2022-08-10 19:47:37', NULL, NULL, NULL, 0, '2022-08-10 17:17:21', NULL, '2022-08-10 19:47:37', NULL);
INSERT INTO `tao_order` VALUES (1639000560200588828, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-11 18:26:09', '2022-08-11 18:26:09', '2022-08-11 18:26:09', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432720544409446', NULL, NULL, NULL, 0, '2022-08-11 18:26:09', 0, '2022-08-12 19:50:15', NULL, NULL, NULL, 0, '2022-08-11 18:26:09', NULL, '2022-08-12 19:50:15', NULL);
INSERT INTO `tao_order` VALUES (1639678765959282960, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-11 18:24:58', '2022-08-11 18:24:58', '2022-08-11 18:24:58', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '中通快递', NULL, '78605337159555', NULL, NULL, NULL, 0, '2022-08-11 18:24:58', 0, '2022-08-12 19:50:28', NULL, NULL, NULL, 0, '2022-08-11 18:24:58', NULL, '2022-08-12 19:50:28', NULL);
INSERT INTO `tao_order` VALUES (1640039089142149277, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-11 18:27:07', '2022-08-11 18:27:07', '2022-08-11 18:27:07', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432720552181285', NULL, NULL, NULL, 0, '2022-08-11 18:27:07', 0, '2022-08-12 19:50:02', NULL, NULL, NULL, 0, '2022-08-11 18:27:07', NULL, '2022-08-12 19:50:02', NULL);
INSERT INTO `tao_order` VALUES (1640069402434910729, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-11 18:28:22', '2022-08-11 18:28:22', '2022-08-11 18:28:22', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432720547617821', NULL, NULL, NULL, 0, '2022-08-11 18:28:22', 0, '2022-08-12 19:49:46', NULL, NULL, NULL, 0, '2022-08-11 18:28:22', NULL, '2022-08-12 19:49:46', NULL);
INSERT INTO `tao_order` VALUES (1641540792944799598, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-13 19:06:15', '2022-08-13 19:06:15', '2022-08-13 19:06:15', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432723807527213', NULL, NULL, NULL, 0, '2022-08-13 19:06:15', 0, '2022-08-13 21:24:12', NULL, NULL, NULL, 0, '2022-08-13 19:06:15', NULL, '2022-08-13 21:24:12', NULL);
INSERT INTO `tao_order` VALUES (1642459225787395472, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-13 19:08:09', '2022-08-13 19:08:09', '2022-08-13 19:08:09', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432723807527023', NULL, NULL, NULL, 0, '2022-08-13 19:08:09', 0, '2022-08-13 21:23:49', NULL, NULL, NULL, 0, '2022-08-13 19:08:09', NULL, '2022-08-13 21:23:49', NULL);
INSERT INTO `tao_order` VALUES (1642473483353670599, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-13 19:09:13', '2022-08-13 19:09:13', '2022-08-13 19:09:13', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432723807526979', NULL, NULL, NULL, 1, '2024-01-16 15:04:52', 0, '2022-08-13 21:23:33', NULL, NULL, NULL, 0, '2022-08-13 19:09:13', NULL, '2024-01-16 15:04:52', 'admin');
INSERT INTO `tao_order` VALUES (1645143458981500079, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-16 19:17:01', '2022-08-16 19:17:01', '2022-08-16 19:17:01', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432728674221907', NULL, NULL, NULL, 0, '2022-08-16 19:17:01', 0, '2022-08-16 19:49:48', NULL, NULL, NULL, 0, '2022-08-16 19:17:01', NULL, '2022-08-16 19:49:48', NULL);
INSERT INTO `tao_order` VALUES (1645147956136238382, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-17 18:18:37', '2022-08-17 18:18:37', '2022-08-17 18:18:37', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432730372496826', NULL, NULL, NULL, 0, '2022-08-17 18:18:37', 0, '2022-08-17 19:51:41', NULL, NULL, NULL, 0, '2022-08-17 18:18:37', NULL, '2022-08-17 19:51:41', NULL);
INSERT INTO `tao_order` VALUES (1646030496778058766, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:19:41', '2022-08-18 19:19:41', '2022-08-18 19:19:41', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189595068', NULL, NULL, NULL, 0, '2022-08-18 19:19:41', 0, '2022-08-18 19:46:12', NULL, NULL, NULL, 0, '2022-08-18 19:19:41', NULL, '2022-08-18 19:46:12', NULL);
INSERT INTO `tao_order` VALUES (1646522582072053096, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-17 19:01:05', '2022-08-17 19:01:05', '2022-08-17 19:01:05', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432730372496544', NULL, NULL, NULL, 0, '2022-08-17 19:01:05', 0, '2022-08-17 19:50:08', NULL, NULL, NULL, 0, '2022-08-17 19:01:05', NULL, '2022-08-17 19:50:08', NULL);
INSERT INTO `tao_order` VALUES (1647209246565575386, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:23:04', '2022-08-18 19:23:04', '2022-08-18 19:23:04', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189594715', NULL, NULL, NULL, 0, '2022-08-18 19:23:04', 0, '2022-08-18 19:44:31', NULL, NULL, NULL, 0, '2022-08-18 19:23:04', NULL, '2022-08-18 19:44:31', NULL);
INSERT INTO `tao_order` VALUES (1647477879589747479, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:37:22', '2022-08-18 19:37:22', '2022-08-18 19:37:22', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732194247917', NULL, NULL, NULL, 0, '2022-08-18 19:37:22', 0, '2022-08-18 19:39:35', NULL, NULL, NULL, 0, '2022-08-18 19:37:22', NULL, '2022-08-18 19:39:35', NULL);
INSERT INTO `tao_order` VALUES (1649326118935313381, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-21 19:27:21', '2022-08-21 19:27:21', '2022-08-21 19:27:21', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432737498051156', NULL, NULL, NULL, 0, '2022-08-21 19:27:21', 0, '2022-08-21 19:50:24', NULL, NULL, NULL, 0, '2022-08-21 19:27:21', NULL, '2022-08-21 19:50:24', NULL);
INSERT INTO `tao_order` VALUES (1653154394408665996, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-25 20:12:35', '2022-08-25 20:12:35', '2022-08-25 20:12:35', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432745220903636', NULL, NULL, NULL, 0, '2022-08-25 20:12:35', 0, '2022-08-25 20:23:07', NULL, NULL, NULL, 0, '2022-08-25 20:12:35', NULL, '2022-08-25 20:23:07', NULL);
INSERT INTO `tao_order` VALUES (1654118401554519282, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-26 19:53:24', '2022-08-26 19:53:24', '2022-08-26 19:53:24', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432747058224996', NULL, NULL, NULL, 0, '2022-08-26 19:53:24', 0, '2022-08-26 20:49:23', NULL, NULL, NULL, 0, '2022-08-26 19:53:24', NULL, '2022-08-26 20:49:23', NULL);
INSERT INTO `tao_order` VALUES (1664188610043377195, 6, 1, '', 19.90, 0.00, 0.00, 19.90, NULL, '2022-09-06 23:05:35', NULL, '2022-09-06 23:05:57', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012001081470', NULL, NULL, NULL, 1, '2024-01-07 16:03:56', 0, '2022-09-07 19:20:59', NULL, NULL, 0, 0, '2022-09-07 18:06:01', NULL, '2024-01-07 16:03:56', 'admin');
INSERT INTO `tao_order` VALUES (1664990796806753993, 6, 1, '', 24.90, 0.00, 0.00, 24.90, NULL, '2022-09-08 13:44:02', NULL, '2022-09-08 13:44:12', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012093953057', NULL, NULL, NULL, 0, '2022-09-08 19:50:50', 0, '2022-09-08 21:22:23', NULL, NULL, 0, 0, '2022-09-08 19:50:50', NULL, '2022-09-08 21:22:23', NULL);
INSERT INTO `tao_order` VALUES (1666956540494199587, 6, 1, '', 34.90, 0.00, 0.00, 34.90, NULL, '2022-09-10 17:43:28', NULL, '2022-09-10 17:43:32', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012292164995', NULL, NULL, NULL, 0, '2022-09-10 19:28:38', 0, '2022-09-11 18:15:40', NULL, NULL, 0, 0, '2022-09-10 19:28:38', NULL, '2022-09-11 18:15:40', NULL);
INSERT INTO `tao_order` VALUES (1668790597296915884, 6, 1, '', 51.91, 0.00, 0.00, 51.91, NULL, '2022-09-11 21:32:48', NULL, '2022-09-11 21:33:08', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012393584895', NULL, NULL, NULL, 0, '2022-09-12 19:19:49', 0, '2022-09-12 19:43:47', NULL, NULL, 0, 0, '2022-09-12 19:19:49', NULL, '2022-09-12 19:43:47', NULL);
INSERT INTO `tao_order` VALUES (1681236338785922394, 6, 1, '', 43.49, 0.00, 0.00, 43.49, NULL, '2022-09-25 14:51:29', NULL, '2022-09-25 14:51:37', NULL, NULL, NULL, '送腰带', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3013527906908', NULL, NULL, NULL, 0, '2022-09-25 18:31:43', 0, '2022-09-27 17:01:02', NULL, NULL, 0, 0, '2022-09-25 18:31:43', NULL, '2022-09-27 17:01:02', NULL);
INSERT INTO `tao_order` VALUES (1683558230877541495, 6, 1, '', 49.63, 0.00, 0.00, 49.63, NULL, '2022-09-27 10:15:53', NULL, '2022-09-27 10:15:57', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3013717179230', NULL, NULL, NULL, 1, '2022-09-27 17:12:03', 0, '2022-09-27 20:17:50', '1', '不要腰带', 0, 0, '2022-09-27 17:12:03', NULL, '2022-09-27 20:17:50', NULL);
INSERT INTO `tao_order` VALUES (1707397970934272173, 6, 1, '', 52.30, 0.00, 0.00, 52.30, NULL, '2022-10-19 14:56:17', NULL, '2022-10-19 14:58:35', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432854235143832', NULL, NULL, NULL, 1, '2022-10-19 17:54:54', 4, '2022-10-19 19:28:49', '1', '', 0, 0, '2022-10-19 17:54:54', NULL, '2022-10-19 19:28:49', NULL);
INSERT INTO `tao_order` VALUES (1719046705687156592, 6, 1, '', 67.15, 0.00, 0.00, 67.15, NULL, '2022-10-30 10:27:56', NULL, '2022-10-30 10:43:37', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '773189893623897', NULL, NULL, NULL, 1, '2022-10-30 15:13:17', 4, '2022-10-30 19:05:10', '1', '', 0, 0, '2022-10-30 15:13:17', NULL, '2022-10-30 19:05:10', NULL);
INSERT INTO `tao_order` VALUES (1727577552380645780, 6, 1, '', 69.22, 0.00, 0.00, 69.22, NULL, '2022-11-06 14:12:16', NULL, '2022-11-06 14:12:43', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '773191590346950', NULL, NULL, NULL, 1, '2022-11-06 17:19:32', 4, '2022-11-06 18:45:54', '1', '', 0, 0, '2022-11-06 17:19:32', NULL, '2022-11-06 18:45:54', NULL);
INSERT INTO `tao_order` VALUES (1732019991903645780, 6, 1, '', 69.22, 0.00, 0.00, 69.22, NULL, '2022-11-10 09:28:11', NULL, '2022-11-10 09:28:19', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '773192240748155', NULL, NULL, NULL, 1, '2022-11-10 17:12:48', 4, '2022-11-10 18:04:02', '1', '', 0, 0, '2022-11-10 17:12:48', NULL, '2022-11-10 18:04:02', NULL);
INSERT INTO `tao_order` VALUES (1747680279246507087, 6, 1, '', 52.30, 0.00, 0.00, 52.30, NULL, '2022-11-23 10:50:31', NULL, '2022-11-23 10:50:36', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432931916667103', NULL, NULL, NULL, 1, '2022-11-23 18:13:01', 4, '2022-11-23 18:13:42', '1', '', 0, 0, '2022-11-23 18:13:01', NULL, '2022-11-23 18:13:42', NULL);
INSERT INTO `tao_order` VALUES (2788451498824204701, 6, 0, '', 68.80, 0.00, 0.00, 68.80, '', '2022-07-30 10:31:54', '2022-07-30 10:31:54', '2022-07-30 10:31:54', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432698835564622', NULL, NULL, NULL, 0, '2022-07-30 10:31:53', 0, '2022-07-31 19:56:43', NULL, NULL, NULL, 0, '2022-07-30 10:31:53', NULL, '2022-07-31 19:56:43', NULL);
INSERT INTO `tao_order` VALUES (2791618416440640000, 6, 0, '', 28.90, 0.00, 0.00, 28.90, '', '2022-08-01 12:39:31', '2022-08-01 12:39:31', '2022-08-01 12:39:31', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432702683305097', NULL, NULL, NULL, 0, '2022-08-01 12:39:31', 0, '2022-08-02 13:13:56', NULL, NULL, NULL, 0, '2022-08-01 12:39:31', NULL, '2022-08-02 13:13:56', NULL);
INSERT INTO `tao_order` VALUES (2791875816618556115, 6, 0, '', 28.90, 0.00, 0.00, 28.90, '', '2022-08-01 12:41:45', '2022-08-01 12:41:45', '2022-08-01 12:41:45', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432702683304937', NULL, NULL, NULL, 0, '2022-08-01 12:41:44', 0, '2022-08-02 13:13:34', NULL, NULL, NULL, 0, '2022-08-01 12:41:44', NULL, '2022-08-02 13:13:34', NULL);
INSERT INTO `tao_order` VALUES (2794387284993651835, 6, 0, '', 28.90, 0.00, 0.00, 28.90, '', '2022-08-02 19:15:12', '2022-08-02 19:15:12', '2022-08-02 19:15:12', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432704536834253', NULL, NULL, NULL, 0, '2022-08-02 19:15:12', 0, '2022-08-03 19:16:11', NULL, NULL, NULL, 0, '2022-08-02 19:15:12', NULL, '2022-08-03 19:16:11', NULL);
INSERT INTO `tao_order` VALUES (2794909754785461846, 6, 0, '', 43.90, 0.00, 0.00, 43.90, '', '2022-08-02 19:25:47', '2022-08-02 19:25:47', '2022-08-02 19:25:47', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432704536834161', NULL, NULL, NULL, 0, '2022-08-02 19:25:46', 0, '2022-08-03 19:15:42', NULL, NULL, NULL, 0, '2022-08-02 19:25:46', NULL, '2022-08-03 19:15:42', NULL);
INSERT INTO `tao_order` VALUES (2797896566867104830, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-03 19:21:02', '2022-08-03 19:21:02', '2022-08-03 19:21:02', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432706257999725', NULL, NULL, NULL, 0, '2022-08-03 19:21:01', 0, '2022-08-03 19:37:44', NULL, NULL, NULL, 0, '2022-08-03 19:21:01', NULL, '2022-08-03 19:37:44', NULL);
INSERT INTO `tao_order` VALUES (2798109939719431759, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-03 19:19:42', '2022-08-03 19:19:42', '2022-08-03 19:19:42', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432706257999822', NULL, NULL, NULL, 0, '2022-08-03 19:19:41', 0, '2022-08-03 19:38:15', NULL, NULL, NULL, 0, '2022-08-03 19:19:41', NULL, '2022-08-03 19:38:15', NULL);
INSERT INTO `tao_order` VALUES (2799354781289326116, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-04 19:04:08', '2022-08-04 19:04:08', '2022-08-04 19:04:08', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432708000082578', NULL, NULL, NULL, 0, '2022-08-04 19:04:07', 0, '2022-08-04 20:07:46', NULL, NULL, NULL, 0, '2022-08-04 19:04:07', NULL, '2022-08-04 20:07:46', NULL);
INSERT INTO `tao_order` VALUES (2800972080243121364, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-05 18:53:58', '2022-08-05 18:53:58', '2022-08-05 18:53:58', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409476', NULL, NULL, NULL, 0, '2022-08-05 18:53:58', 0, '2022-08-05 19:52:00', NULL, NULL, NULL, 0, '2022-08-05 18:53:58', NULL, '2022-08-05 19:52:00', NULL);
INSERT INTO `tao_order` VALUES (2800981981958381045, 6, 0, '', 35.92, 0.00, 0.00, 35.92, '', '2022-08-05 18:47:40', '2022-08-05 18:47:40', '2022-08-05 18:47:40', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409864', NULL, NULL, NULL, 0, '2022-08-05 18:47:40', 0, '2022-08-05 19:48:12', NULL, NULL, NULL, 0, '2022-08-05 18:47:40', NULL, '2022-08-05 19:48:12', NULL);
INSERT INTO `tao_order` VALUES (2801304685533500951, 6, 0, '', 69.46, 0.00, 0.00, 69.46, '', '2022-08-05 18:51:24', '2022-08-05 18:51:24', '2022-08-05 18:51:24', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409670', NULL, NULL, NULL, 0, '2022-08-05 18:51:24', 0, '2022-08-05 19:50:29', NULL, NULL, NULL, 0, '2022-08-05 18:51:24', NULL, '2022-08-05 19:50:29', NULL);
INSERT INTO `tao_order` VALUES (2802425367037543128, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-05 18:52:49', '2022-08-05 18:52:49', '2022-08-05 18:52:49', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409573', NULL, NULL, NULL, 0, '2022-08-05 18:52:49', 0, '2022-08-05 19:51:16', NULL, NULL, NULL, 0, '2022-08-05 18:52:49', NULL, '2022-08-05 19:51:16', NULL);
INSERT INTO `tao_order` VALUES (2802458485756587847, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-06 18:20:20', '2022-08-06 18:20:20', '2022-08-06 18:20:20', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752302', NULL, NULL, NULL, 0, '2022-08-06 18:20:20', 0, '2022-08-09 19:20:15', NULL, NULL, NULL, 0, '2022-08-06 18:20:20', NULL, '2022-08-09 19:20:15', NULL);
INSERT INTO `tao_order` VALUES (2803060765578343137, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-06 18:24:17', '2022-08-06 18:24:17', '2022-08-06 18:24:17', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752032', NULL, NULL, NULL, 0, '2022-08-06 18:24:17', 0, '2022-08-09 19:19:28', NULL, NULL, NULL, 0, '2022-08-06 18:24:17', NULL, '2022-08-09 19:19:28', NULL);
INSERT INTO `tao_order` VALUES (2803069443945496644, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-05 19:32:52', '2022-08-05 19:32:52', '2022-08-05 19:32:52', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432709738409961', NULL, NULL, NULL, 0, '2022-08-05 19:32:52', 0, '2022-08-05 19:41:54', NULL, NULL, NULL, 0, '2022-08-05 19:32:52', NULL, '2022-08-05 19:41:54', NULL);
INSERT INTO `tao_order` VALUES (2803379438025412245, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-06 18:23:12', '2022-08-06 18:23:12', '2022-08-06 18:23:12', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752122', NULL, NULL, NULL, 0, '2022-08-06 18:23:12', 0, '2022-08-09 19:19:44', NULL, NULL, NULL, 0, '2022-08-06 18:23:12', NULL, '2022-08-09 19:19:44', NULL);
INSERT INTO `tao_order` VALUES (2803541439021384333, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-06 18:21:47', '2022-08-06 18:21:47', '2022-08-06 18:21:47', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752212', NULL, NULL, NULL, 0, '2022-08-06 18:21:47', 0, '2022-08-09 19:20:00', NULL, NULL, NULL, 0, '2022-08-06 18:21:47', NULL, '2022-08-09 19:20:00', NULL);
INSERT INTO `tao_order` VALUES (2803676041615853522, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-06 18:27:22', '2022-08-06 18:27:22', '2022-08-06 18:27:22', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752672', NULL, NULL, NULL, 0, '2022-08-06 18:27:22', 0, '2022-08-09 19:18:56', NULL, NULL, NULL, 0, '2022-08-06 18:27:22', NULL, '2022-08-09 19:18:56', NULL);
INSERT INTO `tao_order` VALUES (2803823065336497560, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-06 18:28:44', '2022-08-06 18:28:44', '2022-08-06 18:28:44', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752582', NULL, NULL, NULL, 0, '2022-08-06 18:28:44', 0, '2022-08-09 19:18:43', NULL, NULL, NULL, 0, '2022-08-06 18:28:44', NULL, '2022-08-09 19:18:43', NULL);
INSERT INTO `tao_order` VALUES (2804237174661134517, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-06 18:30:01', '2022-08-06 18:30:01', '2022-08-06 18:30:01', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432711322752492', NULL, NULL, NULL, 0, '2022-08-06 18:30:01', 0, '2022-08-09 19:18:30', NULL, NULL, NULL, 0, '2022-08-06 18:30:01', NULL, '2022-08-09 19:18:30', NULL);
INSERT INTO `tao_order` VALUES (2806128469605311766, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-12 10:14:35', '2022-08-12 10:14:35', '2022-08-12 10:14:35', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '000000', NULL, NULL, NULL, 0, '2022-08-12 10:14:35', 0, '2022-08-12 10:14:48', NULL, NULL, NULL, 0, '2022-08-12 10:14:35', NULL, '2022-08-12 10:14:48', NULL);
INSERT INTO `tao_order` VALUES (2806463700630730938, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-09 19:23:55', '2022-08-09 19:23:55', '2022-08-09 19:23:55', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432714519516515', NULL, NULL, NULL, 0, '2022-08-09 19:23:55', 0, '2022-08-09 19:24:10', NULL, NULL, NULL, 0, '2022-08-09 19:23:55', NULL, '2022-08-09 19:24:10', NULL);
INSERT INTO `tao_order` VALUES (2807235686784026944, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-09 19:26:51', '2022-08-09 19:26:51', '2022-08-09 19:26:51', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432714519516703', NULL, NULL, NULL, 0, '2022-08-09 19:26:51', 0, '2022-08-09 19:27:03', NULL, NULL, NULL, 0, '2022-08-09 19:26:51', NULL, '2022-08-09 19:27:03', NULL);
INSERT INTO `tao_order` VALUES (2807896683249463307, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-09 19:25:30', '2022-08-09 19:25:30', '2022-08-09 19:25:30', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432714519516609', NULL, NULL, NULL, 0, '2022-08-09 19:25:30', 0, '2022-08-09 19:25:40', NULL, NULL, NULL, 0, '2022-08-09 19:25:30', NULL, '2022-08-09 19:25:40', NULL);
INSERT INTO `tao_order` VALUES (2809380888296826747, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-09 19:31:08', '2022-08-09 19:31:08', '2022-08-09 19:31:08', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432716874752606', NULL, NULL, NULL, 0, '2022-08-09 19:31:08', 0, '2022-08-09 22:46:11', NULL, NULL, NULL, 0, '2022-08-09 19:31:08', NULL, '2022-08-09 22:46:11', NULL);
INSERT INTO `tao_order` VALUES (2810157841775119046, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-09 19:30:02', '2022-08-09 19:30:02', '2022-08-09 19:30:02', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432716874752796', NULL, NULL, NULL, 0, '2022-08-09 19:30:02', 0, '2022-08-09 22:46:24', NULL, NULL, NULL, 0, '2022-08-09 19:30:02', NULL, '2022-08-09 22:46:24', NULL);
INSERT INTO `tao_order` VALUES (2810277795520609508, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-09 19:28:55', '2022-08-09 19:28:55', '2022-08-09 19:28:55', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432716874752426', NULL, NULL, NULL, 0, '2022-08-09 19:28:55', 0, '2022-08-09 22:46:35', NULL, NULL, NULL, 0, '2022-08-09 19:28:55', NULL, '2022-08-09 22:46:35', NULL);
INSERT INTO `tao_order` VALUES (2811933036666454704, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-10 17:15:20', '2022-08-10 17:15:20', '2022-08-10 17:15:20', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432718792062162', NULL, NULL, NULL, 0, '2022-08-10 17:15:20', 0, '2022-08-10 19:48:13', NULL, NULL, NULL, 0, '2022-08-10 17:15:20', NULL, '2022-08-10 19:48:13', NULL);
INSERT INTO `tao_order` VALUES (2814908799866290421, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-11 18:29:23', '2022-08-11 18:29:23', '2022-08-11 18:29:23', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432720552180903', NULL, NULL, NULL, 0, '2022-08-11 18:29:23', 0, '2022-08-12 19:49:29', NULL, NULL, NULL, 0, '2022-08-11 18:29:23', NULL, '2022-08-12 19:49:29', NULL);
INSERT INTO `tao_order` VALUES (2814967981966512411, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-12 19:54:07', '2022-08-12 19:54:07', '2022-08-12 19:54:07', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432722269061442', NULL, NULL, NULL, 0, '2022-08-12 19:54:07', 0, '2022-08-12 20:03:27', NULL, NULL, NULL, 0, '2022-08-12 19:54:07', NULL, '2022-08-12 20:03:27', NULL);
INSERT INTO `tao_order` VALUES (2815872879709626454, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-12 19:55:09', '2022-08-12 19:55:09', '2022-08-12 19:55:09', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432722269061353', NULL, NULL, NULL, 0, '2022-08-12 19:55:09', 0, '2022-08-12 20:02:41', NULL, NULL, NULL, 0, '2022-08-12 19:55:09', NULL, '2022-08-12 20:02:41', NULL);
INSERT INTO `tao_order` VALUES (2816024978330891142, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-12 19:56:03', '2022-08-12 19:56:03', '2022-08-12 19:56:03', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432722269061264', NULL, NULL, NULL, 0, '2022-08-12 19:56:03', 0, '2022-08-12 20:02:25', NULL, NULL, NULL, 0, '2022-08-12 19:56:03', NULL, '2022-08-12 20:02:25', NULL);
INSERT INTO `tao_order` VALUES (2817362126131487212, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-13 19:07:19', '2022-08-13 19:07:19', '2022-08-13 19:07:19', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432723807527118', NULL, NULL, NULL, 0, '2022-08-13 19:07:19', 0, '2022-08-13 21:24:02', NULL, NULL, NULL, 0, '2022-08-13 19:07:19', NULL, '2022-08-13 21:24:02', NULL);
INSERT INTO `tao_order` VALUES (2821066273607033246, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-15 19:56:21', '2022-08-15 19:56:21', '2022-08-15 19:56:21', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432727009545994', NULL, NULL, NULL, 0, '2022-08-15 19:56:21', 0, '2022-08-16 09:28:17', NULL, NULL, NULL, 0, '2022-08-15 19:56:21', NULL, '2022-08-16 09:28:17', NULL);
INSERT INTO `tao_order` VALUES (2821131792906086156, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-15 19:57:17', '2022-08-15 19:57:17', '2022-08-15 19:57:17', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432727009545801', NULL, NULL, NULL, 0, '2022-08-15 19:57:17', 0, '2022-08-16 09:27:58', NULL, NULL, NULL, 0, '2022-08-15 19:57:17', NULL, '2022-08-16 09:27:58', NULL);
INSERT INTO `tao_order` VALUES (2821439630766120201, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-15 19:55:28', '2022-08-15 19:55:28', '2022-08-15 19:55:28', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432727009546049', NULL, NULL, NULL, 0, '2022-08-15 19:55:28', 0, '2022-08-16 09:28:28', NULL, NULL, NULL, 0, '2022-08-15 19:55:28', NULL, '2022-08-16 09:28:28', NULL);
INSERT INTO `tao_order` VALUES (2824177932760871937, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-17 18:19:35', '2022-08-17 18:19:35', '2022-08-17 18:19:35', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432730372496732', NULL, NULL, NULL, 0, '2022-08-17 18:19:35', 0, '2022-08-17 19:51:25', NULL, NULL, NULL, 0, '2022-08-17 18:19:35', NULL, '2022-08-17 19:51:25', NULL);
INSERT INTO `tao_order` VALUES (2824824564086115520, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-17 18:20:51', '2022-08-17 18:20:51', '2022-08-17 18:20:51', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432730372496638', NULL, NULL, NULL, 0, '2022-08-17 18:20:51', 0, '2022-08-17 19:50:28', NULL, NULL, NULL, 0, '2022-08-17 18:20:51', NULL, '2022-08-17 19:50:28', NULL);
INSERT INTO `tao_order` VALUES (2825385264263717249, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:17:49', '2022-08-18 19:17:49', '2022-08-18 19:17:49', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189595254', NULL, NULL, NULL, 0, '2022-08-18 19:17:49', 0, '2022-08-18 19:46:39', NULL, NULL, NULL, 0, '2022-08-18 19:17:49', NULL, '2022-08-18 19:46:39', NULL);
INSERT INTO `tao_order` VALUES (2826089316520532138, 6, 0, '', 59.84, 0.00, 0.00, 59.84, '', '2022-08-18 19:20:48', '2022-08-18 19:20:48', '2022-08-18 19:20:48', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189594999', NULL, NULL, NULL, 0, '2022-08-18 19:20:48', 0, '2022-08-18 19:45:02', NULL, NULL, NULL, 0, '2022-08-18 19:20:48', NULL, '2022-08-18 19:45:02', NULL);
INSERT INTO `tao_order` VALUES (2826557209416120201, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:18:51', '2022-08-18 19:18:51', '2022-08-18 19:18:51', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189595161', NULL, NULL, NULL, 0, '2022-08-18 19:18:51', 0, '2022-08-18 19:46:27', NULL, NULL, NULL, 0, '2022-08-18 19:18:51', NULL, '2022-08-18 19:46:27', NULL);
INSERT INTO `tao_order` VALUES (2827254996108810615, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-18 19:23:54', '2022-08-18 19:23:54', '2022-08-18 19:23:54', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189594623', NULL, NULL, NULL, 0, '2022-08-18 19:23:54', 0, '2022-08-18 19:38:36', NULL, NULL, NULL, 0, '2022-08-18 19:23:54', NULL, '2022-08-18 19:38:36', NULL);
INSERT INTO `tao_order` VALUES (2828255115947158925, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-18 19:22:06', '2022-08-18 19:22:06', '2022-08-18 19:22:06', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432732189594807', NULL, NULL, NULL, 0, '2022-08-18 19:22:06', 0, '2022-08-18 19:44:46', NULL, NULL, NULL, 0, '2022-08-18 19:22:06', NULL, '2022-08-18 19:44:46', NULL);
INSERT INTO `tao_order` VALUES (2830086181549556227, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-19 19:03:26', '2022-08-19 19:03:26', '2022-08-19 19:03:26', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432733936340176', NULL, NULL, NULL, 0, '2022-08-19 19:03:26', 0, '2022-08-19 21:01:55', NULL, NULL, NULL, 0, '2022-08-19 19:03:26', NULL, '2022-08-19 21:01:55', NULL);
INSERT INTO `tao_order` VALUES (2833459166397538046, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-21 19:26:23', '2022-08-21 19:26:23', '2022-08-21 19:26:23', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432737498051245', NULL, NULL, NULL, 0, '2022-08-21 19:26:23', 0, '2022-08-21 19:51:00', NULL, NULL, NULL, 0, '2022-08-21 19:26:23', NULL, '2022-08-21 19:51:00', NULL);
INSERT INTO `tao_order` VALUES (2833487605081053215, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-21 19:28:07', '2022-08-21 19:28:07', '2022-08-21 19:28:07', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432737498051067', NULL, NULL, NULL, 0, '2022-08-21 19:28:07', 0, '2022-08-21 19:49:51', NULL, NULL, NULL, 0, '2022-08-21 19:28:07', NULL, '2022-08-21 19:49:51', NULL);
INSERT INTO `tao_order` VALUES (2834586612989989214, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-22 17:25:13', '2022-08-22 17:25:13', '2022-08-22 17:25:13', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432739376980052', NULL, NULL, NULL, 0, '2022-08-22 17:25:13', 0, '2022-08-23 19:53:08', NULL, NULL, NULL, 0, '2022-08-22 17:25:13', NULL, '2022-08-23 19:53:08', NULL);
INSERT INTO `tao_order` VALUES (2835997560685460338, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-23 19:54:11', '2022-08-23 19:54:11', '2022-08-23 19:54:11', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432741412357862', NULL, NULL, NULL, 0, '2022-08-23 19:54:11', 0, '2022-08-24 19:40:01', NULL, NULL, NULL, 0, '2022-08-23 19:54:11', NULL, '2022-08-24 19:40:01', NULL);
INSERT INTO `tao_order` VALUES (2836651827420622606, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-22 17:26:21', '2022-08-22 17:26:21', '2022-08-22 17:26:21', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432739376979983', NULL, NULL, NULL, 0, '2022-08-22 17:26:21', 0, '2022-08-23 19:52:56', NULL, NULL, NULL, 0, '2022-08-22 17:26:21', NULL, '2022-08-23 19:52:56', NULL);
INSERT INTO `tao_order` VALUES (2838936061398720816, 6, 0, '', 47.92, 0.00, 0.00, 47.92, '', '2022-08-23 19:59:52', '2022-08-23 19:59:52', '2022-08-23 19:59:52', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432741412357672', NULL, NULL, NULL, 0, '2022-08-23 19:59:52', 0, '2022-08-24 19:40:44', NULL, NULL, NULL, 0, '2022-08-23 19:59:52', NULL, '2022-08-24 19:40:44', NULL);
INSERT INTO `tao_order` VALUES (2839011483867148800, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-23 19:54:59', '2022-08-23 19:54:59', '2022-08-23 19:54:59', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432741412357767', NULL, NULL, NULL, 0, '2022-08-23 19:54:59', 0, '2022-08-24 19:40:29', NULL, NULL, NULL, 0, '2022-08-23 19:54:59', NULL, '2022-08-24 19:40:29', NULL);
INSERT INTO `tao_order` VALUES (2840584645454757805, 6, 0, '', 29.92, 0.00, 0.00, 29.92, '', '2022-08-24 19:41:38', '2022-08-24 19:41:38', '2022-08-24 19:41:38', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432743309404365', NULL, NULL, NULL, 0, '2022-08-24 19:41:38', 0, '2022-08-24 19:46:58', NULL, NULL, NULL, 0, '2022-08-24 19:41:38', NULL, '2022-08-24 19:46:58', NULL);
INSERT INTO `tao_order` VALUES (2855773766822325815, 6, 0, '', 39.52, 0.00, 0.00, 39.52, '', '2022-08-31 17:43:01', '2022-08-31 17:43:01', '2022-08-31 17:43:01', NULL, NULL, NULL, '', NULL, '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432756595827114', NULL, NULL, NULL, 0, '2022-08-31 17:43:01', 0, '2022-08-31 19:48:59', NULL, NULL, NULL, 0, '2022-08-31 17:43:01', NULL, '2022-08-31 19:48:59', NULL);
INSERT INTO `tao_order` VALUES (2863795574656667447, 6, 1, '', 47.92, 0.00, 0.00, 47.92, NULL, '2022-09-03 15:34:29', NULL, '2022-09-03 15:34:33', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3011645933337', NULL, NULL, NULL, 0, '2022-09-03 18:08:20', 0, '2022-09-03 19:47:51', NULL, NULL, 0, 0, '2022-09-03 18:08:20', NULL, '2022-09-03 19:47:51', NULL);
INSERT INTO `tao_order` VALUES (2871618367375154549, 6, 1, '', 27.90, 0.00, 0.00, 27.90, NULL, '2022-09-06 20:03:11', NULL, '2022-09-06 20:03:13', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012001081492', NULL, NULL, NULL, 0, '2022-09-07 18:06:01', 0, '2022-09-07 19:20:00', NULL, NULL, 0, 0, '2022-09-07 18:06:01', NULL, '2022-09-07 19:20:00', NULL);
INSERT INTO `tao_order` VALUES (2871656887230113338, 6, 1, '', 27.90, 0.00, 0.00, 27.90, NULL, '2022-09-06 20:05:01', NULL, '2022-09-06 20:05:02', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012001081492', NULL, NULL, NULL, 0, '2022-09-07 18:06:01', 0, '2022-09-07 19:20:09', NULL, NULL, 0, 0, '2022-09-07 18:06:01', NULL, '2022-09-07 19:20:09', NULL);
INSERT INTO `tao_order` VALUES (2872120393981932527, 6, 1, '', 25.14, 0.00, 0.00, 25.14, NULL, '2022-09-06 22:50:50', NULL, '2022-09-06 22:50:57', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012001081481', NULL, NULL, NULL, 0, '2022-09-07 18:06:01', 0, '2022-09-07 19:20:24', NULL, NULL, 0, 0, '2022-09-07 18:06:01', NULL, '2022-09-07 19:20:24', NULL);
INSERT INTO `tao_order` VALUES (2873372763545381646, 6, 1, '', 55.92, 0.00, 0.00, 55.92, NULL, '2022-09-07 09:17:05', NULL, '2022-09-07 09:17:22', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012001081469', NULL, NULL, NULL, 0, '2022-09-07 18:06:01', 0, '2022-09-07 19:21:10', NULL, NULL, 0, 0, '2022-09-07 18:06:01', NULL, '2022-09-07 19:21:10', NULL);
INSERT INTO `tao_order` VALUES (2882180559719256611, 6, 1, '', 39.52, 0.00, 0.00, 39.52, NULL, '2022-09-11 15:10:21', NULL, '2022-09-11 15:10:28', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012313812238', NULL, NULL, NULL, 0, '2022-09-11 18:20:17', 0, '2022-09-11 20:03:30', NULL, NULL, 0, 0, '2022-09-11 18:20:17', NULL, '2022-09-11 20:03:30', NULL);
INSERT INTO `tao_order` VALUES (2894222592323299060, 6, 1, '', 53.91, 0.00, 0.00, 53.91, NULL, '2022-09-18 13:56:25', NULL, '2022-09-18 13:56:28', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3012900266448', NULL, NULL, NULL, 0, '2022-09-18 20:25:12', 0, '2022-09-18 20:33:36', NULL, NULL, 0, 0, '2022-09-18 20:25:12', NULL, '2022-09-18 20:33:36', NULL);
INSERT INTO `tao_order` VALUES (2899913437459231759, 6, 1, '', 39.52, 0.00, 0.00, 39.52, NULL, '2022-09-20 21:23:12', NULL, '2022-09-20 21:40:20', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3013085384696', NULL, NULL, NULL, 0, '2022-09-20 22:05:07', 0, '2022-09-20 22:17:34', NULL, NULL, 0, 0, '2022-09-20 22:05:07', NULL, '2022-09-20 22:17:34', NULL);
INSERT INTO `tao_order` VALUES (2900221419737927908, 6, 1, '', 29.92, 0.00, 0.00, 29.92, NULL, '2022-09-20 18:13:56', NULL, '2022-09-20 18:13:58', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3013083656908', NULL, NULL, NULL, 0, '2022-09-20 20:30:31', 0, '2022-09-20 22:17:53', NULL, NULL, 0, 0, '2022-09-20 20:30:31', NULL, '2022-09-20 22:17:53', NULL);
INSERT INTO `tao_order` VALUES (2923690718502279654, 6, 1, '', 54.90, 0.00, 0.00, 54.90, NULL, '2022-10-02 01:22:04', NULL, '2022-10-02 01:23:13', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3014110318112', NULL, NULL, NULL, 1, '2022-10-02 17:14:28', 0, '2022-10-02 19:51:49', '1', '\'', 0, 0, '2022-10-02 17:14:28', NULL, '2022-10-02 19:51:49', NULL);
INSERT INTO `tao_order` VALUES (2927935514314953754, 6, 1, '', 53.61, 0.00, 0.00, 53.61, NULL, '2022-10-04 07:32:38', NULL, '2022-10-04 07:32:44', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3014278403520', NULL, NULL, NULL, 1, '2022-10-04 19:23:44', 0, '2022-10-04 19:58:27', '1', '\'', 0, 0, '2022-10-04 19:23:44', NULL, '2022-10-04 19:58:27', NULL);
INSERT INTO `tao_order` VALUES (2934328755836161104, 6, 1, '', 133.03, 0.00, 0.00, 133.03, NULL, '2022-10-06 23:58:12', NULL, '2022-10-06 23:58:21', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '极兔速递', NULL, 'JT3014544579342', NULL, NULL, NULL, 1, '2022-10-07 18:10:19', 0, '2022-10-07 20:27:37', '1', '\'', 0, 0, '2022-10-07 18:10:19', NULL, '2022-10-07 20:27:37', NULL);
INSERT INTO `tao_order` VALUES (2989950941864043634, 6, 1, '', 63.90, 0.00, 0.00, 63.90, NULL, '2022-10-31 21:21:23', NULL, '2022-10-31 21:21:40', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '773190534080476', NULL, NULL, NULL, 1, '2022-11-01 18:50:16', 4, '2022-11-01 19:09:15', '1', '', 0, 0, '2022-11-01 18:50:16', NULL, '2022-11-01 19:09:15', NULL);
INSERT INTO `tao_order` VALUES (2996431995920305209, 6, 1, '', 53.91, 0.00, 0.00, 53.91, NULL, '2022-11-02 01:40:10', NULL, '2022-11-02 01:40:12', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432883942432533', NULL, NULL, NULL, 1, '2022-11-02 15:11:44', 4, '2022-11-02 16:39:35', '1', '', 0, 0, '2022-11-02 15:11:44', NULL, '2022-11-02 16:39:35', NULL);
INSERT INTO `tao_order` VALUES (3007753525735252502, 6, 1, '', 29.01, 0.00, 0.00, 29.01, NULL, '2022-11-06 14:18:00', NULL, '2022-11-06 14:18:02', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432893399430806', NULL, NULL, NULL, 1, '2022-11-06 17:19:32', 4, '2022-11-06 18:45:15', '1', '', 0, 0, '2022-11-06 17:19:32', NULL, '2022-11-06 18:45:15', NULL);
INSERT INTO `tao_order` VALUES (3020629500584706539, 6, 1, '', 56.85, 0.00, 0.00, 56.85, NULL, '2022-11-11 07:55:56', NULL, '2022-11-11 07:56:08', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '773192733587587', NULL, NULL, NULL, 1, '2022-11-11 12:56:22', 4, '2022-11-11 18:22:36', '1', '', 0, 0, '2022-11-11 12:56:22', NULL, '2022-11-11 18:22:36', NULL);
INSERT INTO `tao_order` VALUES (3068371695265649519, 6, 1, '', 58.11, 0.00, 0.00, 58.11, NULL, '2022-12-03 15:19:34', NULL, '2022-12-03 15:19:39', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '432947479125602', NULL, NULL, NULL, 1, '2022-12-03 18:46:25', 4, '2022-12-03 18:52:12', '1', '', 0, 0, '2022-12-03 18:46:25', NULL, '2022-12-03 18:52:12', NULL);
INSERT INTO `tao_order` VALUES (3176359130095573624, 6, 1, '', 87.21, 0.00, 0.00, 87.21, NULL, '2023-02-01 07:46:58', NULL, '2023-02-01 07:47:07', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '中通快递', NULL, '78653479793989', NULL, NULL, NULL, 1, '2023-02-01 16:00:23', 4, '2023-02-01 21:39:31', '1', '', 0, 0, '2023-02-01 16:00:23', NULL, '2023-02-01 21:39:31', NULL);
INSERT INTO `tao_order` VALUES (3198002834286896419, 6, 1, '', 24.00, 0.00, 0.00, 24.00, NULL, '2023-02-13 00:04:10', NULL, '2023-02-13 00:04:20', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433063122463688', NULL, NULL, NULL, 1, '2023-02-13 19:19:15', 4, '2023-02-13 20:01:31', '1', '', 0, 0, '2023-02-13 19:19:15', NULL, '2023-02-13 20:01:31', NULL);
INSERT INTO `tao_order` VALUES (3199194974134669907, 6, 1, '', 23.13, 0.00, 0.00, 23.13, NULL, '2023-02-13 17:21:51', NULL, '2023-02-13 17:21:58', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433063114339003', NULL, NULL, NULL, 1, '2023-02-13 19:19:15', 4, '2023-02-13 20:01:21', '1', '', 0, 0, '2023-02-13 19:19:15', NULL, '2023-02-13 20:01:21', NULL);
INSERT INTO `tao_order` VALUES (3200980287903658205, 6, 1, '', 84.90, 0.00, 0.00, 84.90, NULL, '2023-02-14 14:11:28', NULL, '2023-02-14 14:11:34', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '申通快递', NULL, '78657308957007', NULL, NULL, NULL, 1, '2023-02-14 17:17:27', 4, '2023-02-15 17:14:56', '1', '', 0, 0, '2023-02-14 17:17:27', NULL, '2023-02-15 17:14:56', NULL);
INSERT INTO `tao_order` VALUES (3202795730989743130, 6, 1, '', 23.13, 0.00, 0.00, 23.13, NULL, '2023-02-15 15:33:52', NULL, '2023-02-15 15:34:00', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433067053019083', NULL, NULL, NULL, 1, '2023-02-15 17:22:05', 4, '2023-02-15 17:35:46', '1', '', 0, 0, '2023-02-15 17:22:05', NULL, '2023-02-15 17:35:46', NULL);
INSERT INTO `tao_order` VALUES (3203383969440472843, 6, 1, '', 23.13, 0.00, 0.00, 23.13, NULL, '2023-02-15 23:16:19', NULL, '2023-02-15 23:16:29', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433069082682593', NULL, NULL, NULL, 1, '2023-02-16 18:04:18', 4, '2023-02-16 18:11:21', '1', '', 0, 0, '2023-02-16 18:04:18', NULL, '2023-02-16 18:11:21', NULL);
INSERT INTO `tao_order` VALUES (3207092509128923220, 6, 1, '', 84.90, 0.00, 0.00, 84.90, NULL, '2023-02-17 21:32:52', NULL, '2023-02-17 21:32:56', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '中通快递', NULL, '78658550530176', NULL, NULL, NULL, 1, '2023-02-18 16:31:49', 4, '2023-02-21 19:46:44', '1', '', 0, 0, '2023-02-18 16:31:49', NULL, '2023-02-21 19:46:44', NULL);
INSERT INTO `tao_order` VALUES (3212109471054044857, 6, 1, '', 84.90, 0.00, 0.00, 84.90, NULL, '2023-02-20 08:08:45', NULL, '2023-02-20 08:08:47', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433079039535713', NULL, NULL, NULL, 1, '2023-02-21 19:45:23', 4, '2023-02-21 19:46:08', '1', '', 0, 0, '2023-02-21 19:45:23', NULL, '2023-02-21 19:46:08', NULL);
INSERT INTO `tao_order` VALUES (3214812817200681765, 6, 1, '', 82.21, 0.00, 0.00, 82.21, NULL, '2023-02-21 19:31:08', NULL, '2023-02-21 19:31:21', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433079025482626', NULL, NULL, NULL, 1, '2023-02-21 20:03:58', 4, '2023-02-21 20:47:29', '1', '', 0, 0, '2023-02-21 20:03:58', NULL, '2023-02-21 20:47:29', NULL);
INSERT INTO `tao_order` VALUES (3217043487978326218, 6, 1, '', 84.90, 0.00, 0.00, 84.90, NULL, '2023-02-22 17:46:00', NULL, '2023-02-22 17:46:07', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433080943458113', NULL, NULL, NULL, 1, '2023-02-22 18:10:19', 4, '2023-02-22 19:18:26', '1', '', 0, 0, '2023-02-22 18:10:19', NULL, '2023-02-22 19:18:26', NULL);
INSERT INTO `tao_order` VALUES (3236924701745643410, 6, 1, '', 44.90, 0.00, 0.00, 44.90, NULL, '2023-03-04 20:06:23', NULL, '2023-03-04 20:06:39', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433100961138996', NULL, NULL, NULL, 1, '2023-03-05 14:38:03', 4, '2023-03-05 16:19:34', '1', '', 0, 0, '2023-03-05 14:38:03', NULL, '2023-03-05 16:19:34', NULL);
INSERT INTO `tao_order` VALUES (3237115646950643410, 6, 1, '', 44.90, 0.00, 0.00, 44.90, NULL, '2023-03-04 20:07:06', NULL, '2023-03-04 20:07:09', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433100961138996', NULL, NULL, NULL, 1, '2023-03-05 14:38:03', 4, '2023-03-05 16:19:39', '1', '', 0, 0, '2023-03-05 14:38:03', NULL, '2023-03-05 16:19:39', NULL);
INSERT INTO `tao_order` VALUES (3238963057148759844, 6, 1, '', 82.21, 0.00, 0.00, 82.21, NULL, '2023-03-05 12:48:00', NULL, '2023-03-05 12:50:20', NULL, NULL, NULL, '', '', '', NULL, '等待买家确认收货', 3, '韵达速递', NULL, '433101363722890', NULL, NULL, NULL, 1, '2023-03-05 14:38:03', 4, '2023-03-05 21:27:21', '1', '', 0, 0, '2023-03-05 14:38:03', NULL, '2023-03-05 21:27:21', NULL);

-- ----------------------------
-- Table structure for tao_order_address
-- ----------------------------
DROP TABLE IF EXISTS `tao_order_address`;
CREATE TABLE `tao_order_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL COMMENT '订单id',
  `contactPerson` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `province` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `area` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `areaCode` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `town` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `townCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order_address
-- ----------------------------
INSERT INTO `tao_order_address` VALUES (4, 2788451498824204701, '张玉华', '15921900960', '上海', '', '', NULL, NULL, NULL, '上海上海市 浦东新区 曹路镇 龚华路479弄1号龚新居委1楼 ');
INSERT INTO `tao_order_address` VALUES (5, 1631273557325601885, '王淑芳', '18704389133', '吉林', '', '', NULL, NULL, NULL, '吉林吉林省松原市扶余市 三井子镇 里');
INSERT INTO `tao_order_address` VALUES (6, 2791618416440640000, '张莲玉8538', '18466694352', '山东', '', '', NULL, NULL, NULL, '山东山东省临沂市沂水县 沂城街道 莲旺街与小河路交叉路口北侧御水苑东南侧月租公寓8538');
INSERT INTO `tao_order_address` VALUES (7, 2791875816618556115, '钱多多', '18161070067', '广东', '', '', NULL, NULL, NULL, '广东广东省深圳市龙岗区 龙岗街道 龙岗大道龙岗段5018号荣群大厦');
INSERT INTO `tao_order_address` VALUES (8, 2794387284993651835, '卢海雁', '15771091855', '湖北', '', '', NULL, NULL, NULL, '湖北湖北省十堰市茅箭区 二堰街道 富康小区41栋601');
INSERT INTO `tao_order_address` VALUES (9, 2794909754785461846, '李芯月', '18328043792', '四川', '', '', NULL, NULL, NULL, '四川四川省成都市龙泉驿区 大面街道 车城西五路557号附近 龙安佳苑龙华二期A区2栋3单元1103');
INSERT INTO `tao_order_address` VALUES (10, 2798109939719431759, '旺康文具', '13425457495', '广东', '', '', NULL, NULL, NULL, '广东广东省中山市古镇古二村东方路14号8卡');
INSERT INTO `tao_order_address` VALUES (11, 2797896566867104830, '阳女士', '17773448135', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省衡阳市衡东县 洣水镇 峥嵘北路金良宾馆');
INSERT INTO `tao_order_address` VALUES (12, 2799354781289326116, '唐女士', '15323626261', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省长沙市雨花区 洞井街道 时代阳光大道世纪桃花苑1栋403');
INSERT INTO `tao_order_address` VALUES (13, 2800981981958381045, '焦丹丹', '15038517557', '福建', '', '', NULL, NULL, NULL, '福建福建省 宁德市 蕉城区 七都镇 宁德时代新能源科技有限公司L16');
INSERT INTO `tao_order_address` VALUES (14, 1635222253871665598, '小红', '15635244122', '上海', '', '', NULL, NULL, NULL, '上海上海 上海市 徐汇区 华泾镇 华发路368弄 馨宁公寓馨宁公寓368弄23号楼1501');
INSERT INTO `tao_order_address` VALUES (15, 2801304685533500951, '燕子', '15867203257', '四川', '', '', NULL, NULL, NULL, '四川四川省 广元市 剑阁县 公兴镇 剑南街18号');
INSERT INTO `tao_order_address` VALUES (16, 2802425367037543128, '王文静', '18250497319', '福建', '', '', NULL, NULL, NULL, '福建福建省 福州市 闽侯县 甘蔗街道 万家广场四楼酷动健身门口，匠心，店铺 ');
INSERT INTO `tao_order_address` VALUES (17, 2800972080243121364, '郝利佳', '13231911432', '河北', '', '', NULL, NULL, NULL, '河北河北省 邢台市 沙河市 新城镇 白错村');
INSERT INTO `tao_order_address` VALUES (18, 1634650644223535380, '杨琴', '13880931736', '四川', '', '', NULL, NULL, NULL, '四川四川省 眉山市 仁寿县 视高镇 工业园区倍特电动车公司');
INSERT INTO `tao_order_address` VALUES (19, 2803069443945496644, '李小姐', '18602008969', '广东', '', '', NULL, NULL, NULL, '广东东省 广州市 天河区 凤凰街道 柯木塱金铺北街放菜鸟驿站');
INSERT INTO `tao_order_address` VALUES (20, 2802458485756587847, '汪喜林', '13956778051', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 苏州市 昆山市 玉山镇 共青小区C区44幢303');
INSERT INTO `tao_order_address` VALUES (21, 2803541439021384333, '何梅莲', '15980888349', '福建', '', '', NULL, NULL, NULL, '福建福建省 厦门市 同安区 祥平街道 杜桥路鸿伟家具 ');
INSERT INTO `tao_order_address` VALUES (22, 2803379438025412245, '陈丽', '18668412632-5045', '广东', '', '', NULL, NULL, NULL, '广东广东省 东莞市 寮步镇 国际汽车城广汽丰田骏鸣店');
INSERT INTO `tao_order_address` VALUES (23, 2803060765578343137, '李女士', '17751331897', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 扬州市 宝应县 安宜镇 白田南路御景豪庭25栋');
INSERT INTO `tao_order_address` VALUES (24, 1635963673656309898, '朱松梅', '13725742593', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省 邵阳市 城步苗族自治县儒林镇湘西南幼儿园旁边');
INSERT INTO `tao_order_address` VALUES (25, 2803676041615853522, '周莉萍', '13600550802', '浙江', '', '', NULL, NULL, NULL, '浙江浙江省 嘉兴市 嘉善县 罗星街道 晋阳东路271号，嘉虹旅行社');
INSERT INTO `tao_order_address` VALUES (26, 2803823065336497560, '王玮', '13886065417', '湖北', '', '', NULL, NULL, NULL, '湖北湖北省 武汉市 蔡甸区 沌阳街道 太子湖路万科翡翠玖玺8015-1-204');
INSERT INTO `tao_order_address` VALUES (27, 2804237174661134517, '刘毛毛', '18134108633', '河北', '', '', NULL, NULL, NULL, '河北河北省 邯郸市 馆陶县 馆陶镇 政府街超远二期3号楼');
INSERT INTO `tao_order_address` VALUES (28, 2806463700630730938, '李爱容', '18923174464', '广东', '', '', NULL, NULL, NULL, '广东广东省 佛山市 南海区 里水镇 大冲碧桂园山水桃园79座803');
INSERT INTO `tao_order_address` VALUES (29, 2807896683249463307, '杨光秀', '15251912574', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 常州市 钟楼区 北港街道 紫薇路36瑞点科技有限公司');
INSERT INTO `tao_order_address` VALUES (30, 2807235686784026944, '王富贵', '18680080903', '广东', '', '', NULL, NULL, NULL, '广东广东省 东莞市 常平镇 常平万科城常平爱弥儿外国语幼儿园');
INSERT INTO `tao_order_address` VALUES (31, 2810277795520609508, 'dariceinez', '18925436128', '广东', '', '', NULL, NULL, NULL, '广东广东省 东莞市 东城街道 牛山汇京路2号');
INSERT INTO `tao_order_address` VALUES (32, 2810157841775119046, '刘洁', '13570259034', '广东', '', '', NULL, NULL, NULL, '广东广东省 广州市 天河区 前进街道 石溪村牛涌街11巷2号店菜鸟驿站');
INSERT INTO `tao_order_address` VALUES (33, 2809380888296826747, '安仔', '13433007297', '广东', '', '', NULL, NULL, NULL, '广东广东省 东莞市 长安镇 新民社区新星路五巷2号和安公寓管理处');
INSERT INTO `tao_order_address` VALUES (34, 1638101679063535380, '杨琴', '13880931736', '四川', '', '', NULL, NULL, NULL, '四川四川省 眉山市 仁寿县 视高镇 工业园区倍特电动车公司');
INSERT INTO `tao_order_address` VALUES (35, 2811933036666454704, '廖丽珍', '15078500368', '广西', '', '', NULL, NULL, NULL, '广西广西壮族自治区 柳州市 融水苗族自治县 融水镇 玉融大道32号苏盟家园10栋114号城中美味滤粉');
INSERT INTO `tao_order_address` VALUES (36, 1638388920088435398, '叶润好', '13622522205', '广东', '', '', NULL, NULL, NULL, '广东广东省 佛山市 顺德区 容桂街道 佛山市顺德区容桂镇公园路五号逸涛居五座602号房');
INSERT INTO `tao_order_address` VALUES (37, 1639678765959282960, '小辫儿', '18236155082', '上海', '', '', NULL, NULL, NULL, '上海上海市 浦东新区 金桥经济技术开发区 金海路1000号金领之都45号楼二楼');
INSERT INTO `tao_order_address` VALUES (38, 1639000560200588828, '罗奕', '13162972344-4017', '四川', '', '', NULL, NULL, NULL, '四川四川省 成都市 青白江区 福洪镇 隆盛街48号');
INSERT INTO `tao_order_address` VALUES (39, 1640039089142149277, '朱水玲', '13529231405', '四川', '', '', NULL, NULL, NULL, '四川四川省 成都市 青白江区 弥牟镇 民族花园1306号');
INSERT INTO `tao_order_address` VALUES (40, 1640069402434910729, '欧阳玲', '13617070575', '江西', '', '', NULL, NULL, NULL, '江西江西省 赣州市 安远县 欣山镇 青年路永俊诊所');
INSERT INTO `tao_order_address` VALUES (41, 2814908799866290421, '艳艳', '18823163061', '广东', '', '', NULL, NULL, NULL, '广东广东省 深圳市 龙华区 民治街道 书香门第中心大厦一楼雪瑞尔健康养发.放雪瑞尔本店');
INSERT INTO `tao_order_address` VALUES (42, 2806128469605311766, '小果', '18046646513', '江西', '', '', NULL, NULL, NULL, '江西江西省新余市渝水区 新钢街道 老西街21号');
INSERT INTO `tao_order_address` VALUES (43, 2814967981966512411, '周碧', '18570506623', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省 岳阳市 君山区 柳林洲街道 君山大道88号岳阳家宁时尚酒店奶茶店一楼');
INSERT INTO `tao_order_address` VALUES (44, 2815872879709626454, '周东芳', '15996094551', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 泰州市 兴化市 垛田街道 星湖湾12号楼901室');
INSERT INTO `tao_order_address` VALUES (45, 2816024978330891142, '王思萍', '13376692493', '广东', '', '', NULL, NULL, NULL, '广东广东省 佛山市 禅城区 石湾镇街道 保利碧桂园天汇天旭公馆一座30号店菜鸟驿站');
INSERT INTO `tao_order_address` VALUES (46, 1641540792944799598, '寇兵', '17381189159', '四川', '', '', NULL, NULL, NULL, '四川四川省 绵阳市 游仙区 观太镇 绵阳市游仙区观太镇');
INSERT INTO `tao_order_address` VALUES (47, 2817362126131487212, '程梅', '15887036632', '四川', '', '', NULL, NULL, NULL, '四川四川省 宜宾市 筠连县 巡司镇 渡船口街千艺理发店三号');
INSERT INTO `tao_order_address` VALUES (48, 1642459225787395472, '陆红', '15896273421', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 南通市 海门区 海门市经济技术开发区 广州路1777号南通龙漉包装制品有限公司');
INSERT INTO `tao_order_address` VALUES (49, 1642473483353670599, '戴志兰', '17321293202', '上海', '', '', NULL, NULL, NULL, '上海上海 上海市 徐汇区 天平路街道 建国西路382号三楼4室 ');
INSERT INTO `tao_order_address` VALUES (50, 2821439630766120201, '马姐', '15208548633', '贵州', '', '', NULL, NULL, NULL, '贵州贵州省 黔南布依族苗族自治州 贵定县 金南街道 大都会：二单元1543');
INSERT INTO `tao_order_address` VALUES (51, 2821066273607033246, '韦海霞', '13540563891', '四川', '', '', NULL, NULL, NULL, '四川四川省 乐山市 犍为县 舞雩乡 玉泉村四组');
INSERT INTO `tao_order_address` VALUES (52, 2821131792906086156, '中中', '18902812490', '广东', '', '', NULL, NULL, NULL, '广东广东省 佛山市 南海区 大沥镇 黄岐名雅花园31座1701');
INSERT INTO `tao_order_address` VALUES (53, 1645143458981500079, '黄敬', '13979440086', '江西', '', '', NULL, NULL, NULL, '江西江西省 抚州市 南城县 建昌镇 江西省南城县新贸街191彩票店');
INSERT INTO `tao_order_address` VALUES (54, 1645147956136238382, '马女士', '18716087233', '河北', '', '', NULL, NULL, NULL, '河北河北省 唐山市 路北区 光明街道 唐山市路北区盛馨园底商秋酒吧');
INSERT INTO `tao_order_address` VALUES (55, 2824177932760871937, '秋燕', '15877274529', '广西', '', '', NULL, NULL, NULL, '广西广西壮族自治区 柳州市 柳南区 河西街道 柳工生活北区5栋');
INSERT INTO `tao_order_address` VALUES (56, 2824824564086115520, '梁锡惠', '13996070041', '重庆', '', '', NULL, NULL, NULL, '重庆重庆 重庆市 江津区 几江街道 江岸丽都D幢11一5');
INSERT INTO `tao_order_address` VALUES (57, 1646522582072053096, '环', '15816723935', '广东', '', '', NULL, NULL, NULL, '广东广东省 汕头市 金平区 东墩街道 汕头市金平区金墩园16栋北楼2梯704');
INSERT INTO `tao_order_address` VALUES (58, 2825385264263717249, '林萍', '17783416371', '福建', '', '', NULL, NULL, NULL, '福建福建省 泉州市 晋江市 晋江市经济开发区 欣荣路12号大三豪公司');
INSERT INTO `tao_order_address` VALUES (59, 2826557209416120201, '马姐', '15208548633', '贵州', '', '', NULL, NULL, NULL, '贵州贵州省 黔南布依族苗族自治州 贵定县 金南街道 大都会：二单元1543');
INSERT INTO `tao_order_address` VALUES (60, 1646030496778058766, '赵娜娜', '13938477971', '河南', '', '', NULL, NULL, NULL, '河南河南省 郑州市 新郑市 薛店镇 世纪大道新郑味驰食品有限公司');
INSERT INTO `tao_order_address` VALUES (61, 2826089316520532138, '王雪燕', '15066754161', '山东', '', '', NULL, NULL, NULL, '山东山东省 烟台市 牟平区 文化街道 工商大街665号春华商店代收');
INSERT INTO `tao_order_address` VALUES (62, 2828255115947158925, '汪小轩', '15873666433', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省 常德市 武陵区 白马湖街道 人民路九重天花园黄老板商店收');
INSERT INTO `tao_order_address` VALUES (63, 1647209246565575386, '黄燕珍', '15220842175', '广东', '', '', NULL, NULL, NULL, '广东广东省 韶关市 武江区 惠民街道 武江北路388号凯旋华府A7幢501房');
INSERT INTO `tao_order_address` VALUES (64, 2827254996108810615, '罗培兰', '15108069447', '广东', '', '', NULL, NULL, NULL, '广东广东省 东莞市 常平镇 塘角六街55号');
INSERT INTO `tao_order_address` VALUES (65, 1647477879589747479, '任昌进', '15900834752', '上海', '', '', NULL, NULL, NULL, '上海上海 上海市 金山区 朱泾镇 西林街298号');
INSERT INTO `tao_order_address` VALUES (66, 2830086181549556227, '吴', '13350894872', '四川', '', '', NULL, NULL, NULL, '四川四川省 成都市 青羊区 苏坡街道 光华西三路30号');
INSERT INTO `tao_order_address` VALUES (67, 2833459166397538046, '李鑫', '19130060709', '四川', '', '', NULL, NULL, NULL, '四川四川省 泸州市 泸县 玄滩镇 通山村');
INSERT INTO `tao_order_address` VALUES (68, 1649326118935313381, '黄珍玉', '13799632002', '福建', '', '', NULL, NULL, NULL, '福建福建省 莆田市 涵江区 国欢镇 新坡村兴利科技园对面锐步鞋业');
INSERT INTO `tao_order_address` VALUES (69, 2833487605081053215, '姑苏刘亦菲', '18861190363', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 苏州市 姑苏区 双塔街道 姑苏区双塔街道钟楼新村西大门快递柜');
INSERT INTO `tao_order_address` VALUES (70, 2834586612989989214, '黄英', '13921670840', '江苏', '', '', NULL, NULL, NULL, '江苏江苏省 南通市 通州区 先锋街道 双盟村北工业园区100号俪铭纺织');
INSERT INTO `tao_order_address` VALUES (71, 2836651827420622606, '谭固生', '13502893647', '广东', '', '', NULL, NULL, NULL, '广东广东省 深圳市 宝安区 西乡街道 黄麻布南区二巷');
INSERT INTO `tao_order_address` VALUES (72, 2835997560685460338, '戴玉贵', '15674678962', '湖南', '', '', NULL, NULL, NULL, '湖南湖南省 永州市 冷水滩区 杨家桥街道 福善街 ');
INSERT INTO `tao_order_address` VALUES (73, 2839011483867148800, '桂仙', '18897790612', '广东', '', '', NULL, NULL, NULL, '广东广东省 江门市 蓬江区 荷塘镇 中兴二路六坊市场侧西盛坊51号汇四方蒸笼饭');
INSERT INTO `tao_order_address` VALUES (74, 2838936061398720816, '尹春歌', '18037871978', '河南', '', '', NULL, NULL, NULL, '河南河南省 郑州市 中原区 桐柏路街道 西十里铺路19-7创尔特');
INSERT INTO `tao_order_address` VALUES (75, 2840584645454757805, '叶四琼', '18312499316', '广西', '', '', NULL, NULL, NULL, '广西广西壮族自治区 钦州市 灵山县 武利镇 灵山县武利镇');
INSERT INTO `tao_order_address` VALUES (76, 1653154394408665996, '田泽庆', '13462218315', '河南', '', '', NULL, NULL, NULL, '河南河南省 新乡市 新乡县 小冀镇 民兴路yooz电子烟体验店');
INSERT INTO `tao_order_address` VALUES (77, 1654118401554519282, '岳友勤', '13698390281', '四川', '', '', NULL, NULL, NULL, '四川四川省 乐山市 峨眉山市 绥山镇 光福路46号院3栋3单元302室 ');
INSERT INTO `tao_order_address` VALUES (78, 2855773766822325815, '程飞', '18137956726', '广东', '', '', NULL, NULL, NULL, '广东广东省 深圳市 龙华区 大浪街道 华霆路36号美律店菜鸟驿站');
INSERT INTO `tao_order_address` VALUES (79, 2863795574656667447, '黄君妹', '18797630200', '湖南省', '长沙市', '长沙县', NULL, NULL, NULL, '湖南省 长沙市 长沙县 泉塘街道中国铁建国际城2期23栋2单元1007(000000)');
INSERT INTO `tao_order_address` VALUES (80, 2873372763545381646, '胡秀梅', '13575198925', '湖南省', '常德市', '临澧县', NULL, NULL, NULL, '湖南省 常德市 临澧县 安福镇八方楼巷40号(000000)');
INSERT INTO `tao_order_address` VALUES (81, 1664188610043377195, '甄国彦', '13437349578', '广东省', '江门市', '台山市', NULL, NULL, NULL, '广东省 江门市 台山市 台城街道台冲路加油站侧亿华厂门卫(000000)');
INSERT INTO `tao_order_address` VALUES (82, 2872120393981932527, '丫丫', '18800328719', '四川省', '成都市', '双流区', NULL, NULL, NULL, '四川省 成都市 双流区 中和街道朝阳路425号盛世嘉苑277号35栋2单元703 我就在家(000000)');
INSERT INTO `tao_order_address` VALUES (83, 2871656887230113338, '李同学', '15622164649', '广东省', '广州市', '越秀区', NULL, NULL, NULL, '广东省 广州市 越秀区 珠光街道越秀南路145号后座703房(000000)');
INSERT INTO `tao_order_address` VALUES (84, 2871618367375154549, '李同学', '15622164649', '广东省', '广州市', '越秀区', NULL, NULL, NULL, '广东省 广州市 越秀区 珠光街道越秀南路145号后座703 房(000000)');
INSERT INTO `tao_order_address` VALUES (85, 1664990796806753993, '阿二', '18787958519', '云南省', '西双版纳傣族自治州', '景洪市', NULL, NULL, NULL, '云南省 西双版纳傣族自治州 景洪市 允景洪街道嘎兰中路11号妈妈驿站(666100)');
INSERT INTO `tao_order_address` VALUES (86, 1666956540494199587, '静静', '18677633925', '广东省', '佛山市', '禅城区', NULL, NULL, NULL, '广东省 佛山市 禅城区 张槎街道莲大北路28号富莱商务酒店(000000)');
INSERT INTO `tao_order_address` VALUES (87, 2882180559719256611, '椰挞', '13790037017', '广东省', '佛山市', '南海区', NULL, NULL, NULL, '广东省 佛山市 南海区 桂城街道佛平四路16号海伦堡海汇广场3座(000000)');
INSERT INTO `tao_order_address` VALUES (88, 1668790597296915884, '赵娜', '15235737682', '山东省', '青岛市', '市南区', NULL, NULL, NULL, '山东省 青岛市 市南区  香港中路街道   宁夏路308号青岛大学浮山校区西院');
INSERT INTO `tao_order_address` VALUES (89, 2894222592323299060, '肖肖', '16620870394', '广东省', '深圳市', '龙华区', NULL, NULL, NULL, '广东省 深圳市 龙华区 龙华街道地址:广东省深圳市大浪街道龙园二区99栋\\n1(000000)');
INSERT INTO `tao_order_address` VALUES (90, 2900221419737927908, '小晓', '15912115297', '浙江省', '温州市', '瓯海区', NULL, NULL, NULL, '浙江省 温州市 瓯海区 南白象街道万邦中心周天遇见二楼(000000)');
INSERT INTO `tao_order_address` VALUES (91, 2899913437459231759, '王雪花', '13161414841-4953', '甘肃省', '武威市', '凉州区', NULL, NULL, NULL, '甘肃省 武威市 凉州区 金羊镇甘肃省武威市凉州区碧水兰庭南门(733000)');
INSERT INTO `tao_order_address` VALUES (92, 1681236338785922394, '雨点儿', '17634726886', '湖北省', '襄阳市', '襄城区', NULL, NULL, NULL, '湖北省 襄阳市 襄城区 隆中街道致远路湖北文理学院南区(000000)');
INSERT INTO `tao_order_address` VALUES (93, 1683558230877541495, '懿懿', '18746691919', '黑龙江省', '哈尔滨市', '香坊区', NULL, NULL, NULL, '黑龙江省 哈尔滨市 香坊区 进乡街道华润中央公园6栋3单元1102(000000)');
INSERT INTO `tao_order_address` VALUES (94, 2923690718502279654, '江华', '15728158676', '广东省', '惠州市', '惠城区', NULL, NULL, NULL, '广东省 惠州市 惠城区 河南岸街道湖山村兔喜快递代理点(000000)');
INSERT INTO `tao_order_address` VALUES (95, 2927935514314953754, '刘彩凤', '15142300630', '辽宁省', '大连市', '瓦房店市', NULL, NULL, NULL, '辽宁省 大连市 瓦房店市 长兴岛街道大连长兴岛三堂理想家园景翠路159-1号半颗柠檬2楼禾沐美甲(000000)');
INSERT INTO `tao_order_address` VALUES (96, 2934328755836161104, '劉沛昕', '13316802674', '广东省', '深圳市', '宝安区', NULL, NULL, NULL, '广东省 深圳市 宝安区 福海街道建安路18号中创汇科技创新园1栋1楼（超峰国际）@TCAJXWI3#R1LEA2U8VHKAL#(000000)');
INSERT INTO `tao_order_address` VALUES (97, 1707397970934272173, '小迪', '18400302723-1900', '云南省', '昆明市', '官渡区', NULL, NULL, NULL, '云南省 昆明市 官渡区 小板桥街道晓东村(000000)');
INSERT INTO `tao_order_address` VALUES (98, 1719046705687156592, '高媛媛', '18416725085-9422', '山东省', '济南市', '章丘区', NULL, NULL, NULL, '山东省 济南市 章丘区 埠村街道经十东路8678号山东传媒职业学院(000000)');
INSERT INTO `tao_order_address` VALUES (99, 2989950941864043634, '吴RR', '13696948060', '福建省', '厦门市', '思明区', NULL, NULL, NULL, '福建省 厦门市 思明区 中华街道镇海路64号之一公安局出入境管理处大楼（不要放驿站！不要放驿站！不要放鸟箱！不要放鸟箱！）放车库保安谢谢！(361001)');
INSERT INTO `tao_order_address` VALUES (100, 2996431995920305209, '张依依', '13913538217', '江苏省', '苏州市', '吴江区', NULL, NULL, NULL, '江苏省 苏州市 吴江区 震泽镇新富路6号  你别走公寓6008(000000)');
INSERT INTO `tao_order_address` VALUES (101, 3007753525735252502, '关素琼', '13528347072', '广东省', '江门市', '开平市', NULL, NULL, NULL, '广东省 江门市 开平市 长沙街道人民西路12号4幢203房(529300)');
INSERT INTO `tao_order_address` VALUES (102, 1727577552380645780, '索远芹', '13815380556', '江苏省', '徐州市', '邳州市', NULL, NULL, NULL, '江苏省 徐州市 邳州市 运河街道青年东路太平洋购物中心对过泰戈宠物店旁边二楼(000000)');
INSERT INTO `tao_order_address` VALUES (103, 1732019991903645780, '索远芹', '13815380556', '江苏省', '徐州市', '邳州市', NULL, NULL, NULL, '江苏省 徐州市 邳州市 运河街道青年东路太平洋购物中心对过泰戈宠物店旁边二楼(000000)');
INSERT INTO `tao_order_address` VALUES (104, 3020629500584706539, '黄雅雅', '13159007738', '福建省', '泉州市', '晋江市', NULL, NULL, NULL, '福建省 泉州市 晋江市 梅岭街道泉安中路与松苑路交叉口东北60米 赤西社区鸿盛兴文具(000000)');
INSERT INTO `tao_order_address` VALUES (105, 1747680279246507087, '王菲', '14795808638-2094', '湖北省', '恩施土家族苗族自治州', '恩施市', NULL, NULL, NULL, '湖北省 恩施土家族苗族自治州 恩施市 舞阳坝街道恩施市黄泥坝施州富苑五号楼一单元1702(000000)');
INSERT INTO `tao_order_address` VALUES (106, 3068371695265649519, '密小姐', '13527091195', '广东省', '肇庆市', '德庆县', NULL, NULL, NULL, '广东省 肇庆市 德庆县 武垄镇德庆县武垄镇(526600)');
INSERT INTO `tao_order_address` VALUES (107, 3176359130095573624, '夏小琴', '13862712839', '江苏省', '南通市', '海安市', NULL, NULL, NULL, '江苏省 南通市 海安市 胡集街道胡青北路19号菜鸟驿站(000000)');
INSERT INTO `tao_order_address` VALUES (108, 3199194974134669907, '王林梅', '18466132863-8484', '重庆', '重庆市', '丰都县', NULL, NULL, NULL, '重庆 重庆市 丰都县 名山街道名山镇森林派出所(000000)');
INSERT INTO `tao_order_address` VALUES (109, 3198002834286896419, 'ltb1900650', '19035940650', '山西省', '运城市', '稷山县', NULL, NULL, NULL, '山西省 运城市 稷山县 稷峰镇华锦小区ltb1900650(000000)');
INSERT INTO `tao_order_address` VALUES (110, 3200980287903658205, '杨群芝', '13250898104-9656', '四川省', '宜宾市', '兴文县', NULL, NULL, NULL, '四川省 宜宾市 兴文县 麒麟苗族乡三官店韵达快递(000000)');
INSERT INTO `tao_order_address` VALUES (111, 3202795730989743130, '玥儿', '13902358118', '广东省', '清远市', '清城区', NULL, NULL, NULL, '广东省 清远市 清城区 洲心街道北江三路49号 创富·御水湾(00000)');
INSERT INTO `tao_order_address` VALUES (112, 3203383969440472843, '陈素容', '13550800673', '四川省', '绵阳市', '江油市', NULL, NULL, NULL, '四川省 绵阳市 江油市 中坝街道中坝镇 川信小区A幢5单元(621700)');
INSERT INTO `tao_order_address` VALUES (113, 3207092509128923220, '高玉影', '15630998596', '河北省', '邢台市', '襄都区', NULL, NULL, NULL, '河北省 邢台市 襄都区 南长街街道泉南东大街89号丁记(054001)');
INSERT INTO `tao_order_address` VALUES (114, 3212109471054044857, '顾建勇', '15557074702-4247', '浙江省', '宁波市', '鄞州区', NULL, NULL, NULL, '浙江省 宁波市 鄞州区 东钱湖镇下王村桥下87号(000000)');
INSERT INTO `tao_order_address` VALUES (115, 3214812817200681765, '胡敏', '18466137013-4164', '四川省', '宜宾市', '叙州区', NULL, NULL, NULL, '四川省 宜宾市 叙州区 龙池乡龙池卫生院(000000)');
INSERT INTO `tao_order_address` VALUES (116, 3217043487978326218, '林雅', '13123136624-3782', '福建省', '泉州市', '安溪县', NULL, NULL, NULL, '福建省 泉州市 安溪县 凤城镇河滨北路247号(000000)');
INSERT INTO `tao_order_address` VALUES (117, 3238963057148759844, '周静', '17822627951-4875', '四川省', '内江市', '东兴区', NULL, NULL, NULL, '四川省 内江市 东兴区 东兴街道中兴路1104号上海花园2幢30－2(000000)');
INSERT INTO `tao_order_address` VALUES (118, 3237115646950643410, '#', '18400656752-3383', '北京', '北京市', '丰台区', NULL, NULL, NULL, '北京 北京市 丰台区 卢沟桥乡万丰路312号金悦缘ktv旁边的丰巢e栈柜里(000000)');
INSERT INTO `tao_order_address` VALUES (119, 3236924701745643410, '#', '18400656752-3383', '北京', '北京市', '丰台区', NULL, NULL, NULL, '北京 北京市 丰台区 卢沟桥乡万丰路312号金悦缘ktv旁边的丰巢e栈柜里(000000)');
INSERT INTO `tao_order_address` VALUES (120, 123323243, 'sa', 'ad', '北京市', '市辖区', '西城区', NULL, NULL, NULL, 'asfdsafda');
INSERT INTO `tao_order_address` VALUES (121, 32, 'sdf', 'sfda', '北京市', '市辖区', '东城区', NULL, NULL, NULL, 'sdafds');

-- ----------------------------
-- Table structure for tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tao_order_item`;
CREATE TABLE `tao_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderId` bigint NOT NULL COMMENT '订单id',
  `subItemId` bigint NOT NULL COMMENT '天猫子订单id',
  `itemAmount` decimal(10, 2) NULL DEFAULT NULL COMMENT '明细总金额',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额',
  `goodsTitle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goodsNumber` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品货号，对应系统商品编码',
  `productImgUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `productUrl` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品链接',
  `productId` bigint NULL DEFAULT NULL COMMENT '天猫的商品Id',
  `skuId` bigint NULL DEFAULT NULL COMMENT '天猫的SKUID',
  `specNumber` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '单品货号，对应系统sku编码',
  `skuInfo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'SKU字符串',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际单价',
  `quantity` decimal(4, 0) NULL DEFAULT NULL COMMENT '数量',
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子订单状态',
  `statusStr` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子订单状态',
  `refundStatus` int NOT NULL DEFAULT 0 COMMENT '退款状态0无售后1售后中',
  `refundStatusStr` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'NO_REFUND' COMMENT '退款状态',
  `refundAmount` decimal(4, 0) NULL DEFAULT NULL COMMENT '退款金额',
  `refundId` bigint NULL DEFAULT NULL COMMENT '退款单id',
  `logisticsStatus` int NULL DEFAULT NULL COMMENT '1 未发货 2 已发货 3 已收货 4 已经退货 5 部分发货 8 还未创建物流订单',
  `new_spec_id` int NOT NULL DEFAULT 0 COMMENT '确认订单最新规格id',
  `new_spec_number` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '确认订单最新规格编码',
  `after_sale_state` int NULL DEFAULT 0 COMMENT '售后状态0未申请售后1售后申请中(退款待审核)2同意退货(退款待收货)3买家已发货，待收货(待收货)4已收货（待退款）5退款退货成功(退款完成)6退款拒绝7已确认收货，正在退款中 8退款取消',
  `erpGoodsId` int NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erpGoodsSpecId` int NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `isGift` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否礼品0否1是',
  `isSwap` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否换货(0:否1:是)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order_item
-- ----------------------------
INSERT INTO `tao_order_item` VALUES (3, 2788451498824204701, 2788451498824204701, 34.40, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260005', '白色,2XL', 34.40, 1, NULL, NULL, 1, 'REFUNDING', 34, 174018204093200147, NULL, 0, NULL, 0, 9, 27, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (4, 2788451498824204701, 2788451498824204701, 34.40, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260205', '深蓝色,2XL', 34.40, 1, NULL, NULL, 1, 'REFUNDING', 34, 174008953672200147, NULL, 0, NULL, 0, 9, 37, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (5, 1631273557325601885, 1631273557325601885, 28.90, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260105', '黑色,2XL', 28.90, 1, NULL, NULL, 0, 'REFUNDING', 0, 0, NULL, 0, NULL, 0, 9, 32, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (6, 2791618416440640000, 2791618416440640000, 28.90, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260202', '深蓝色,M', 28.90, 1, NULL, NULL, 1, 'REFUNDING', 29, 174760311645640000, NULL, 0, NULL, 0, 9, 34, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (7, 2791875816618556115, 2791875816618556115, 28.90, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260302', '浅蓝色,M', 28.90, 1, NULL, NULL, 0, 'REFUNDING', 0, 0, NULL, 0, NULL, 0, 9, 39, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (8, 2794387284993651835, 2794387284993651835, 28.90, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 28.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (9, 2794909754785461846, 2794909754785461846, 43.90, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 43.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (10, 2798109939719431759, 2798109939719431759, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260301', '浅蓝色,S', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 174530628624435917, NULL, 0, NULL, 0, 9, 38, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (11, 2797896566867104830, 2797896566867104830, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (12, 2799354781289326116, 2799354781289326116, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', NULL, 0, 0, '27202208580201', '黑灰色,S', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 48, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (13, 2800981981958381045, 2800981981958381045, 35.92, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580105', '黑色,2XL', 35.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 47, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (14, 1635222253871665598, 1635222253871665598, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260303', '浅蓝色,L', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 105324169380669855, NULL, 0, NULL, 0, 9, 40, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (15, 2801304685533500951, 2801304685533500951, 29.94, NULL, NULL, '270牛仔短裤', '2720220207', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', NULL, 0, 0, '27202202070101', '黑色,S', 29.94, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 12, 83, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (16, 2801304685533500951, 2801304685533500951, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', NULL, 0, 0, '27202208580302', '浅蓝色,M', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 54, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (17, 2802425367037543128, 2802425367037543128, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580104', '黑色,XL', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 46, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (18, 2800972080243121364, 2800972080243121364, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260302', '浅蓝色,M', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 175552813527126413, NULL, 0, NULL, 0, 9, 39, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (19, 1634650644223535380, 1634650644223535380, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580104', '黑色,XL', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 46, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (20, 2803069443945496644, 2803069443945496644, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', NULL, 0, 0, '27202208580204', '黑灰色,XL', 39.52, 1, NULL, NULL, 1, 'REFUNDING', 40, 175092482372494466, NULL, 0, NULL, 0, 10, 51, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (21, 2802458485756587847, 2802458485756587847, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (22, 2803541439021384333, 2803541439021384333, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260203', '深蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (23, 2803379438025412245, 2803379438025412245, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260302', '浅蓝色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 39, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (24, 2803060765578343137, 2803060765578343137, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260103', '黑色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 30, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (25, 1635963673656309898, 1635963673656309898, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', NULL, 0, 0, '27202208580302', '浅蓝色,M', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 54, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (26, 2803676041615853522, 2803676041615853522, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260102', '黑色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 29, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (27, 2803823065336497560, 2803823065336497560, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260205', '深蓝色,2XL', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 175461194594496075, NULL, 0, NULL, 0, 9, 37, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (28, 2804237174661134517, 2804237174661134517, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 1, 'REFUNDING', 40, 175059146148131745, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (29, 2806463700630730938, 2806463700630730938, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260003', '白色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 25, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (30, 2807896683249463307, 2807896683249463307, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260003', '白色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 25, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (31, 2807235686784026944, 2807235686784026944, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (32, 2810277795520609508, 2810277795520609508, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260304', '浅蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 41, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (33, 2810157841775119046, 2810157841775119046, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260204', '深蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 36, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (34, 2809380888296826747, 2809380888296826747, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260204', '深蓝色,XL', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 105655441623824767, NULL, 0, NULL, 0, 9, 36, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (35, 1638101679063535380, 1638101679063535380, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', NULL, 0, 0, '27202208580303', '浅蓝色,L', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 55, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (36, 2811933036666454704, 2811933036666454704, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260203', '深蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (37, 1638388920088435398, 1638388920088435398, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260003', '白色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 25, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (38, 1639678765959282960, 1639678765959282960, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260303', '浅蓝色,L', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 175555874222286029, NULL, 0, NULL, 0, 9, 40, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (39, 1639000560200588828, 1639000560200588828, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260104', '黑色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 31, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (40, 1640039089142149277, 1640039089142149277, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260205', '深蓝色,2XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 37, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (41, 1640069402434910729, 1640069402434910729, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260002', '白色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 24, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (42, 2814908799866290421, 2814908799866290421, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (43, 2806128469605311766, 2806128469605311766, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580103', '黑色,L', 39.52, 1, NULL, NULL, 1, 'REFUNDING', 40, 174964968310316617, NULL, 0, NULL, 0, 10, 45, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (44, 2814967981966512411, 2814967981966512411, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580101', '黑色,S', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 43, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (45, 2815872879709626454, 2815872879709626454, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260005', '白色,2XL', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 175673665740625464, NULL, 0, NULL, 0, 9, 27, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (46, 2816024978330891142, 2816024978330891142, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260304', '浅蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 41, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (47, 1641540792944799598, 1641540792944799598, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260205', '深蓝色,2XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 37, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (48, 2817362126131487212, 2817362126131487212, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580101', '黑色,S', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 43, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (49, 1642459225787395472, 1642459225787395472, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260304', '浅蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 41, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (50, 1642473483353670599, 1642473483353670599, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260105', '黑色,2XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 32, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (51, 2821439630766120201, 2821439630766120201, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260304', '浅蓝色,XL', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 175970162913120102, NULL, 0, NULL, 0, 9, 41, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (52, 2821066273607033246, 2821066273607033246, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260302', '浅蓝色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 39, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (53, 2821131792906086156, 2821131792906086156, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260003', '白色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 25, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (54, 1645143458981500079, 1645143458981500079, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260305', '浅蓝色,2XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 42, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (55, 1645147956136238382, 1645147956136238382, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (56, 2824177932760871937, 2824177932760871937, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', NULL, 0, 0, '27202208580301', '浅蓝色,S', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 53, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (57, 2824824564086115520, 2824824564086115520, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260203', '深蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (58, 1646522582072053096, 1646522582072053096, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260105', '黑色,2XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 32, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (59, 2825385264263717249, 2825385264263717249, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260301', '浅蓝色,S', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 38, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (60, 2826557209416120201, 2826557209416120201, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260203', '深蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (61, 1646030496778058766, 1646030496778058766, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (62, 2826089316520532138, 2826089316520532138, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260104', '黑色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 31, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (63, 2826089316520532138, 2826089316520532138, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (64, 2828255115947158925, 2828255115947158925, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/6z7p3rdtdb85704lz4nrgm259w1sv7qf', NULL, 0, 0, '27202208580202', '黑灰色,M', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 49, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (65, 1647209246565575386, 1647209246565575386, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260303', '浅蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 40, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (66, 2827254996108810615, 2827254996108810615, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260103', '黑色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 30, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (67, 1647477879589747479, 1647477879589747479, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260002', '白色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 24, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (68, 2830086181549556227, 2830086181549556227, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260002', '白色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 24, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (69, 2833459166397538046, 2833459166397538046, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260304', '浅蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 41, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (70, 1649326118935313381, 1649326118935313381, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260002', '白色,M', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 24, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (71, 2833487605081053215, 2833487605081053215, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260303', '浅蓝色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 40, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (72, 2834586612989989214, 2834586612989989214, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260103', '黑色,L', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 30, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (73, 2836651827420622606, 2836651827420622606, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (74, 2835997560685460338, 2835997560685460338, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260204', '深蓝色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 36, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (75, 2839011483867148800, 2839011483867148800, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260103', '黑色,L', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 177098796584140088, NULL, 0, NULL, 0, 9, 30, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (76, 2838936061398720816, 2838936061398720816, 47.92, NULL, NULL, 'HN0015裤脚开叉牛仔裤', 'HN20220015', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', NULL, 0, 0, 'HN202200150229', '复古蓝,XL', 47.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 21, 260, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (77, 2840584645454757805, 2840584645454757805, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260204', '深蓝色,XL', 29.92, 1, NULL, NULL, 1, 'REFUNDING', 30, 177634911027750578, NULL, 0, NULL, 0, 9, 36, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (78, 1653154394408665996, 1653154394408665996, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580104', '黑色,XL', 39.52, 1, NULL, NULL, 1, 'REFUNDING', 40, 106476564604669659, NULL, 0, NULL, 0, 10, 46, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (79, 1654118401554519282, 1654118401554519282, 29.92, NULL, NULL, '8026牛仔短裤', '272021008026', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', NULL, 0, 0, '2720210080260004', '白色,XL', 29.92, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 26, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (80, 2855773766822325815, 2855773766822325815, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, 0, 0, '27202208580102', '黑色,M', 39.52, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 44, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (81, 2863795574656667447, 2863795574656667447, 47.92, NULL, NULL, 'HN0015裤脚开叉牛仔裤', 'HN20220015', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', NULL, NULL, NULL, NULL, '颜色分类：复古蓝;尺寸：M[91-100斤]', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 21, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (82, 2873372763545381646, 2873372763545381646, 55.92, NULL, NULL, 'HN0630松紧腰九分老爹哈伦裤', 'HN0630', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', NULL, NULL, NULL, NULL, '颜色分类：浅蓝色;尺寸：S', 69.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 26, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (83, 1664188610043377195, 1664188610043377195, 19.90, NULL, NULL, '8026牛仔短裤', '2720218026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, NULL, NULL, '2720218026', '颜色分类：深蓝色;尺寸：L[101-110]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (84, 2872120393981932527, 2872120393981932527, 24.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：黑灰色;尺寸：M[91-100斤]', 54.90, 1, NULL, NULL, 1, 'REFUNDING', 25, 179419141878932725, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (85, 2871656887230113338, 2871656887230113338, 27.90, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：黑灰色;尺寸：L[101-110斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (86, 2871618367375154549, 2871618367375154549, 27.90, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：浅蓝色;尺寸：L[101-110斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (87, 1664990796806753993, 1664990796806753993, 24.90, NULL, NULL, '8026牛仔短裤', '2720218026', 'http://img.huayikeji.com/geq3vm4dcvntd6vnzclxhbh481v1jx5p', NULL, NULL, NULL, NULL, '颜色分类：浅蓝色;尺寸：2XL[121-125斤]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (88, 1666956540494199587, 1666956540494199587, 34.90, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：黑灰色;尺寸：S[90斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (89, 2882180559719256611, 2882180559719256611, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：黑色;尺寸：L[101-110斤]', 54.90, 1, NULL, NULL, 1, 'REFUNDING', 40, 179683094483251166, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (90, 1668790597296915884, 1668790597296915884, 51.91, NULL, NULL, 'HN023小直筒牛仔裤', 'HN023', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', NULL, NULL, NULL, NULL, '颜色分类：复古蓝;尺寸：27', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 27, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (91, 2894222592323299060, 2894222592323299060, 53.91, NULL, NULL, 'HN0014前开叉微喇叭牛仔裤', 'HN0014', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', NULL, NULL, NULL, NULL, '颜色分类：浅蓝色;尺寸：M', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 18, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (92, 2900221419737927908, 2900221419737927908, 29.92, NULL, NULL, '8026牛仔短裤', '2720218026', 'http://img.huayikeji.com/geq3vm4dcvntd6vnzclxhbh481v1jx5p', NULL, NULL, NULL, NULL, '颜色分类：黑色;尺寸：L[101-110]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (93, 2899913437459231759, 2899913437459231759, 39.52, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, NULL, NULL, '颜色分类：黑色;尺寸：XL[111-120斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (94, 1681236338785922394, 1681236338786922394, 43.49, NULL, NULL, 'HN621高腰直筒宽松破洞牛仔裤', 'HN621', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', NULL, NULL, NULL, NULL, '颜色分类：黑灰色;尺寸：L', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 34, 0, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (95, 1683558230877541495, 1683558230878541495, 49.63, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'HN022', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', NULL, NULL, 578, 'HN0222927', '颜色分类：蓝灰色;尺寸：27', 59.90, 1, NULL, NULL, 1, 'REFUNDING', 50, 108941522538549514, NULL, 0, NULL, 0, 39, 578, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (96, 2923690718502279654, 2923690718502279654, 54.90, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/owqk4691mjiqif46s38sikzxdp3zkrn9', NULL, NULL, 55, '27202208580303', '颜色分类：浅蓝色;尺寸：L[101-110斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 55, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (97, 2927935514314953754, 2927935514314953754, 53.61, NULL, NULL, 'HN023小直筒牛仔裤', 'HN023', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', NULL, NULL, 395, 'HN0230128', '颜色分类：黑色;尺寸：28', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 27, 395, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (98, 2934328755836161104, 2934328755837161104, 97.10, NULL, NULL, 'HN0020九分铅笔小脚裤子', 'HN20220020', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', NULL, NULL, 286, 'HN202200200327', '颜色分类：浅蓝色;尺寸：27', 59.90, 2, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 22, 286, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (99, 2934328755836161104, 2934328755838161104, 35.93, NULL, NULL, 'HN660高腰直筒牛仔裤女腰围可调春秋季', 'HN660', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', NULL, NULL, 649, 'HN6604002', '颜色分类：复古蓝;尺寸：M', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 44, 649, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (100, 1707397970934272173, 1707397970934272173, 52.30, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'HN022', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', NULL, NULL, 571, 'HN0220127', '颜色分类：黑色;尺寸：27', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 39, 571, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (101, 1719046705687156592, 1719046705687156592, 67.15, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'JKL805', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', NULL, NULL, 738, 'JKL80512003', '颜色分类：深蓝色加长款;尺寸：L', 89.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 47, 738, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (102, 2989950941864043634, 2989950941864043634, 63.90, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'JKL805', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', NULL, NULL, 737, 'JKL80512002', '颜色分类：深蓝色加长款;尺寸：M', 89.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 47, 737, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (103, 2996431995920305209, 2996431995920305209, 53.91, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'HN022', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', NULL, NULL, 570, 'HN0220126', '颜色分类：黑色;尺寸：26', 59.90, 1, NULL, NULL, 1, 'REFUNDING', 54, 188634457153300952, NULL, 0, NULL, 0, 39, 570, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (104, 3007753525735252502, 3007753525735252502, 29.01, NULL, NULL, '858牛仔短裤', '2720220858', 'http://img.huayikeji.com/iy5dedjmji0e10ju6plgpwgj9er04vsz', NULL, NULL, 46, '27202208580104', '颜色分类：黑色;尺寸：XL[111-120斤]', 54.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 46, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (105, 1727577552380645780, 1727577552380645780, 69.22, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'JKL805', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', NULL, NULL, 739, 'JKL80512004', '颜色分类：深蓝色加长款;尺寸：XL', 89.90, 1, NULL, NULL, 1, 'REFUNDING', 69, 112173313472648057, NULL, 0, NULL, 0, 47, 739, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (106, 1732019991903645780, 1732019991903645780, 69.22, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'JKL805', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', NULL, NULL, 733, 'JKL8051204', '颜色分类：深蓝色[九分款];尺寸：XL', 89.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 47, 733, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (107, 3020629500584706539, 3020629500584706539, 56.85, NULL, NULL, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'JKL805', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', NULL, NULL, 730, 'JKL8051201', '颜色分类：深蓝色[九分款];尺寸：S', 89.90, 1, NULL, NULL, 1, 'REFUNDING', 57, 190685196805703965, NULL, 0, NULL, 0, 47, 730, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (108, 1747680279246507087, 1747680279246507087, 52.30, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'HN022', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', NULL, NULL, 570, 'HN0220126', '颜色分类：黑色;尺寸：26', 59.90, 1, NULL, NULL, 1, 'REFUNDING', 52, 114179089881508770, NULL, 0, NULL, 0, 39, 570, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (109, 3068371695265649519, 3068371695265649519, 58.11, NULL, NULL, 'HN022高腰弹力九分小脚铅笔裤', 'HN022', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', NULL, NULL, 577, 'HN0222926', '颜色分类：蓝灰色;尺寸：26', 59.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 39, 577, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (110, 3176359130095573624, 3176359130095573624, 87.21, NULL, NULL, 'JKL6010松紧腰哈伦裤', 'JKL6010', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', NULL, NULL, 985, 'JKL60107530', '颜色分类：黑灰色;尺寸：30', 89.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 54, 985, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (111, 3199194974134669907, 3199194974134669907, 23.13, NULL, NULL, '8026牛仔短裤', '2720218026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, NULL, 36, '2720210080260204', '颜色分类：深蓝色;尺寸：XL[111-120斤]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 36, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (112, 3198002834286896419, 3198002834286896419, 24.00, NULL, NULL, '8026牛仔短裤', '2720218026', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', NULL, NULL, 42, '2720210080260305', '颜色分类：浅蓝色;尺寸：2XL[121-125斤]', 39.90, 1, NULL, NULL, 1, 'REFUNDING', 24, 205639742516891964, NULL, 0, NULL, 0, 9, 42, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (113, 3200980287903658205, 3200980287903658205, 84.90, NULL, NULL, 'JKL3112松紧腰束脚哈伦裤', 'JKL3112', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', NULL, NULL, 1318, 'JKL31121201', '颜色分类：深蓝色;尺寸：S', 129.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 68, 1318, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (114, 3202795730989743130, 3202795730989743130, 23.13, NULL, NULL, '8026牛仔短裤', '2720218026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, NULL, 35, '2720210080260203', '颜色分类：深蓝色;尺寸：L[101-110]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (115, 3203383969440472843, 3203383969440472843, 21.56, NULL, NULL, '8026牛仔短裤', '2720218026', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', NULL, NULL, 35, '2720210080260203', '颜色分类：深蓝色;尺寸：L[101-110]', 39.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 9, 35, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (116, 3207092509128923220, 3207092509128923220, 84.90, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'KH9734', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', NULL, NULL, 1337, 'KH97345028', '颜色分类：浅蓝色;尺寸：28', 129.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 69, 1337, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (117, 3212109471054044857, 3212109471054044857, 84.90, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'KH9734', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', NULL, NULL, 1335, 'KH97345026', '颜色分类：浅蓝色;尺寸：26', 129.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 69, 1335, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (118, 3214812817200681765, 3214812817200681765, 82.21, NULL, NULL, 'KH9826小脚牛仔裤女', 'KH9826', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', NULL, NULL, 1351, 'KH98260128', '颜色分类：黑色;尺寸：28', 129.90, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 70, 1351, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (119, 3217043487978326218, 3217043487978326218, 84.90, NULL, NULL, 'JKL3112松紧腰束脚哈伦裤', 'JKL3112', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', NULL, NULL, 1321, 'JKL31121204', '颜色分类：深蓝色;尺寸：XL', 129.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 68, 1321, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (120, 3238963057148759844, 3238963057148759844, 82.21, NULL, NULL, 'KH9734微喇叭牛仔裤女开叉', 'KH9734', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', NULL, NULL, 1336, 'KH97345027', '颜色分类：浅蓝色;尺寸：27', 129.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 69, 1336, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (121, 3237115646950643410, 3237115646950643410, 44.90, NULL, NULL, 'HN858牛仔短裤', 'HN858', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', NULL, NULL, 53, '27202208580301', '颜色分类：浅蓝色;尺寸：S', 79.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 53, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (122, 3236924701745643410, 3236924701745643410, 44.90, NULL, NULL, 'HN858牛仔短裤', 'HN858', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', NULL, NULL, 43, '27202208580101', '颜色分类：黑色;尺寸：S', 79.00, 1, NULL, NULL, 0, 'NO_REFUND', NULL, NULL, NULL, 0, NULL, 0, 10, 43, NULL, 0, 0);
INSERT INTO `tao_order_item` VALUES (123, 123323243, 123323243, 21.00, 0.00, 0.00, 'HNP182弹力紧身贴标牛仔短裤女ins', 'HNP182', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', '', NULL, NULL, 'HNP1821505', '白色 2XL ', 21.00, 1, '2', '', 0, '', NULL, NULL, 0, 0, '', 0, 29, 434, '', 0, 0);
INSERT INTO `tao_order_item` VALUES (124, 32, 32, 21.00, 0.00, 0.00, 'HNP182弹力紧身贴标牛仔短裤女ins', 'HNP182', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', '', NULL, NULL, 'HNP1825001', '浅蓝色 S ', 21.00, 1, '2', '', 0, '', NULL, NULL, 0, 0, '', 0, 29, 435, '', 0, 0);

-- ----------------------------
-- Table structure for tao_order_refund
-- ----------------------------
DROP TABLE IF EXISTS `tao_order_refund`;
CREATE TABLE `tao_order_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款id',
  `after_sales_type` int NOT NULL COMMENT '类型（1退货3换货）',
  `shopId` int NOT NULL COMMENT '店铺id',
  `tid` bigint NULL DEFAULT NULL COMMENT '淘宝交易单号（订单号）',
  `oid` bigint NULL DEFAULT NULL COMMENT '子订单号。如果是单笔交易oid会等于tid',
  `refund_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `created` bigint NULL DEFAULT NULL COMMENT '退款申请时间',
  `modified` bigint NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `good_status` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
  `num` bigint NOT NULL DEFAULT 0 COMMENT '退货数量',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:true(是),false(否)',
  `reason` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `remark` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款说明',
  `logisticsCompany` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logisticsCode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `send_time` varchar(25) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '买家发货时间',
  `auditStatus` int NOT NULL DEFAULT 0 COMMENT '2已签收9供应商已退款',
  `auditTime` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `receivedTime` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `erpGoodsId` int NULL DEFAULT 0,
  `erpGoodsSpecId` int NULL DEFAULT 0,
  `productId` bigint NULL DEFAULT NULL COMMENT '天猫的商品Id',
  `skuId` bigint NULL DEFAULT NULL COMMENT '天猫的SKUID',
  `goodsTitle` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goodsNumber` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品货号，对应系统商品编码',
  `specNumber` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku编号',
  `productImgUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `skuInfo` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'SKU字符串',
  `refund_phase` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '退款阶段，可选值：onsale/aftersale',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tao_order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for tao_shop
-- ----------------------------
DROP TABLE IF EXISTS `tao_shop`;
CREATE TABLE `tao_shop`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名',
  `nickName` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺别名',
  `ename` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标识',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺主题',
  `type` int NOT NULL COMMENT '对应第三方平台Id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '店铺url',
  `orderNum` int NOT NULL DEFAULT 9 COMMENT '排序',
  `isDelete` int NOT NULL DEFAULT 0 COMMENT '是否删除0否1是',
  `isShow` int NULL DEFAULT 0 COMMENT '是否显示(0：是1否）',
  `modify_on` bigint NOT NULL COMMENT '更新时间',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `sellerUserId` bigint NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id，淘宝天猫开放平台使用',
  `sellerUserIdStr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '卖家userId',
  `sessionKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `appkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appkey',
  `appSercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Appsercet',
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
INSERT INTO `tao_shop` VALUES (1, '其他渠道', NULL, NULL, NULL, 99, NULL, 9, 0, 0, 1704416716, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_shop` VALUES (5, '梦小妮潮流女装', '拼多多-梦小妮', 'pdd', '煜梦服饰', 5, NULL, 99, 0, 1, 1680698886, 'pdd10006159121', 100061591, '', '87f8044d2a5f45a489aa3a952785b0d35e61788a', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_shop` VALUES (6, '梦小妮牛仔裤', '淘宝-梦小妮', 'taobao', '煜梦服饰', 4, '', 98, 0, 1, 0, '', 2200787809358, '0', '610140071d1070a37cecea89f1c1f3d6e5d19bf4b58dd942200787809358', '31014100', '7b0769269b0c0ca88949791c14eb3a5c', NULL, NULL, NULL, NULL, 'http://gw.api.taobao.com/router/rest');
INSERT INTO `tao_shop` VALUES (13, '梦小妮牛仔裤-快手', '快手小店', 'kuaishou', '华衣云商', 13, NULL, 9, 1, 0, 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_shop` VALUES (21, '珍姐姐de衣柜的店', '启航家常菜的店-小红书', 'xhs', '启航', 7, 'https://ark.xiaohongshu.com/ark/open_api/v3/common_controller', 2, 0, 0, 1658303081, NULL, 21, '6255224c3801e1000190d3d0', 'token-0f3f8a5fc5aa465aa29a66d27c6cf170-dad68769d83e4e1a9f52a950a680b9f2', '621919dd99484598a69c', '1747d77da2ce58b97483932041c5503e', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tao_shop` VALUES (22, '梦小妮牛仔裤', '抖音-梦小妮', 'douyin', '华衣云商', 6, 'http://openapi.jinritemai.com', 87, 0, 1, 1653672695, NULL, 4463798, '0', '', '7249607407477720636', '36a12497-fb9d-4b54-8cd1-fd1617346687', NULL, NULL, NULL, NULL, '2');

SET FOREIGN_KEY_CHECKS = 1;
