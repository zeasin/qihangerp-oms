-- ============================================================
-- 订单审核工作台升级脚本（开源版 4.1）
-- 对齐企业版 docs/design/15-订单处理工作台.md
-- 执行前提：MySQL 8.0+；本脚本只执行一次
-- ============================================================

-- ------------------------------------------------------------
-- 1. o_order：父子单 / 审核状态 / 面单账号 / 发货快照
-- ------------------------------------------------------------
ALTER TABLE `o_order`
  ADD COLUMN `parent_order_id` bigint NOT NULL DEFAULT 0 COMMENT '父订单ID：子订单指向主订单，主订单为0' AFTER `id`,
  ADD COLUMN `order_role` tinyint NOT NULL DEFAULT 0 COMMENT '订单角色：0=主订单，1=子订单' AFTER `parent_order_id`,
  ADD COLUMN `source_order_id` bigint NULL DEFAULT NULL COMMENT '拆单来源订单ID：记录从哪个订单拆分而来' AFTER `order_role`,
  ADD COLUMN `audit_status` tinyint NOT NULL DEFAULT 1 COMMENT '审核状态：0=待审核，1=已放行，2=已转异常，3=已拆单' AFTER `order_status`,
  ADD COLUMN `audit_type` tinyint NOT NULL DEFAULT 0 COMMENT '审核类型：0=自动审核，1=人工审核' AFTER `audit_status`,
  ADD COLUMN `audit_time` datetime NULL DEFAULT NULL COMMENT '审核通过时间' AFTER `audit_type`,
  ADD COLUMN `audit_by` varchar(50) NULL DEFAULT NULL COMMENT '审核人用户名' AFTER `audit_time`,
  ADD COLUMN `audit_remark` varchar(500) NULL DEFAULT NULL COMMENT '审核备注' AFTER `audit_by`,
  ADD COLUMN `waybill_account_id` bigint NULL DEFAULT NULL COMMENT '面单账号ID（oms_shop_waybill_account.id）' AFTER `waybill_status`,
  ADD COLUMN `waybill_order_id` varchar(35) NULL DEFAULT NULL COMMENT '平台电子面单订单标识' AFTER `waybill_company`,
  ADD COLUMN `shipping_time` datetime NULL DEFAULT NULL COMMENT '实际发货时间' AFTER `waybill_order_id`,
  ADD COLUMN `latest_delivery_time` bigint NULL DEFAULT NULL COMMENT '平台最晚发货时间(epoch秒)' AFTER `shipping_time`,
  ADD COLUMN `shipping_company_code` varchar(25) NULL DEFAULT NULL COMMENT '快递公司编码' AFTER `latest_delivery_time`,
  ADD COLUMN `platform_ship_status` int NULL DEFAULT NULL COMMENT '平台回传状态，与内部 ship_status 分离' AFTER `shipping_company_code`,
  ADD COLUMN `platform_ship_result` varchar(1000) NULL DEFAULT NULL COMMENT '平台回传结果' AFTER `platform_ship_status`,
  MODIFY COLUMN `tag` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签（逗号分隔的 o_order_tag.id）';

-- 平台订单号不再全局唯一：拆单后的子订单与主单共用平台订单号
ALTER TABLE `o_order` DROP INDEX `order_sn_index`;
ALTER TABLE `o_order`
  ADD INDEX `idx_shop_order_num`(`shop_id` ASC, `shop_type` ASC, `order_num` ASC, `parent_order_id` ASC),
  ADD INDEX `idx_parent_order_id`(`parent_order_id` ASC),
  ADD INDEX `idx_source_order_id`(`source_order_id` ASC),
  ADD INDEX `idx_audit_status`(`audit_status` ASC, `order_status` ASC),
  ADD INDEX `idx_ship_status`(`ship_status` ASC, `audit_status` ASC),
  ADD INDEX `idx_waybill_account_id`(`waybill_account_id` ASC);

-- 存量订单视为已放行，避免升级后全部涌入待审核池
UPDATE `o_order` SET `audit_status` = 1, `audit_type` = 0, `audit_time` = `create_time`
WHERE `audit_status` = 1 AND `audit_time` IS NULL;
UPDATE `o_order` SET `parent_order_id` = 0 WHERE `parent_order_id` IS NULL;
UPDATE `o_order` SET `order_role` = 0 WHERE `order_role` IS NULL;

-- ------------------------------------------------------------
-- 2. o_order_item：拆单商品行角色与溯源
-- ------------------------------------------------------------
ALTER TABLE `o_order_item`
  ADD COLUMN `source_order_item_id` bigint NULL DEFAULT NULL COMMENT '来源订单明细ID：拆单前原商品行ID' AFTER `id`,
  ADD COLUMN `item_role` tinyint NOT NULL DEFAULT 0 COMMENT '商品行角色：0=主订单原始行，1=子订单履约行' AFTER `source_order_item_id`,
  ADD COLUMN `sort_no` int NOT NULL DEFAULT 0 COMMENT '商品行排序号：拆单后保持原顺序' AFTER `item_role`,
  ADD INDEX `idx_source_order_item_id`(`source_order_item_id` ASC),
  ADD INDEX `idx_order_sort`(`order_id` ASC, `sort_no` ASC);

-- 存量商品行均为主订单原始行
UPDATE `o_order_item` SET `item_role` = 0 WHERE `item_role` IS NULL;

-- ------------------------------------------------------------
-- 3. o_order_tag：订单标签字典（通用标签 + 异常池分类标签）
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `o_order_tag`;
CREATE TABLE `o_order_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '标签id，自增',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称（如：发供应商A/顺丰/断货跟进）',
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签颜色（如#6366F1）',
  `merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '商户ID（0=总部公共标签）',
  `op_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序号，越小越靠前',
  `bind_pool` tinyint NOT NULL DEFAULT 0 COMMENT '关联状态池（0=通用标签；2=异常池分类标签）',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态（0停用 1启用）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_merchant_status`(`merchant_id` ASC, `status` ASC, `sort` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单处理工作台-订单标签字典' ROW_FORMAT = DYNAMIC;

-- ------------------------------------------------------------
-- 4. o_order_search_scheme：组合条件方案
-- ------------------------------------------------------------
DROP TABLE IF EXISTS `o_order_search_scheme`;
CREATE TABLE `o_order_search_scheme`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '方案id，自增',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方案名称',
  `conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '筛选条件JSON（前端筛选面板生成）',
  `merchant_id` bigint NOT NULL DEFAULT 0 COMMENT '商户ID（0=总部公共方案）',
  `op_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `sort` int NOT NULL DEFAULT 0 COMMENT '排序号，越小越靠前',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态（0停用 1启用）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_merchant_status`(`merchant_id` ASC, `status` ASC, `sort` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单处理工作台-组合条件方案' ROW_FORMAT = DYNAMIC;

-- ------------------------------------------------------------
-- 5. oms_shop_waybill_account：面单账号绑定发货主体（打单发货阶段使用）
-- ------------------------------------------------------------
ALTER TABLE `oms_shop_waybill_account`
  ADD COLUMN `shipper_type` int NULL DEFAULT NULL COMMENT '发货主体类型（EnumShipType：0店铺自用 100/110/200云仓 300供应商）' AFTER `merchant_id`,
  ADD COLUMN `shipper_id` bigint NULL DEFAULT NULL COMMENT '发货主体ID（仓库ID或供应商ID，店铺自用为0）' AFTER `shipper_type`,
  ADD COLUMN `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态（0停用 1启用）' AFTER `shipper_id`;

-- ------------------------------------------------------------
-- 6. 人工审单开关（开源版默认开启：平台拉单进入待审核）
-- ------------------------------------------------------------
INSERT INTO `sys_config`
  (`config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `remark`)
VALUES
  ('订单人工审单开关', 'order.manual_audit.enabled', 'true', 'Y', 'admin', NOW(), 'true=拉单进入待审核池；false=拉单自动放行');

-- ------------------------------------------------------------
-- 7. 订单审核菜单（订单管理 > 订单审核）
-- ------------------------------------------------------------
INSERT INTO `sys_menu`
  (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`)
VALUES
  (2110, '订单审核', 1, 5, 'order_audit', 'order/audit/index', NULL, 1, 0, 'C', '0', '0', 'order:audit:list', 'audit', 'admin', NOW(), '', NULL, '订单审核工作台');
