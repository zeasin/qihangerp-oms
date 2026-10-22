-- ============================================================
-- 打单发货工作台菜单升级脚本（开源版 4.1）
-- 对齐企业版 docs/design/16-打单发货.md（统一打单发货工作台）
-- 作用：把旧「打单发货」菜单（按平台分 tab 的 shipping/ewaybillPrint 页面）
--       切换为新的统一工作台页面 shipping/waybillWorkbench/index
-- 执行前提：MySQL 8.0+；脚本幂等，可重复执行
-- ============================================================

-- ------------------------------------------------------------
-- 更新菜单：menu_id=894（docs/qihang-erp.sql 中「打单发货」）
-- 兼容处理：若本地库 menu_id 不一致，则按旧 path='print_ship' + 旧组件路径兜底命中
-- ------------------------------------------------------------
UPDATE `sys_menu`
SET `menu_name` = '打单发货',
    `path`      = 'waybill_workbench',
    `component` = 'shipping/waybillWorkbench/index',
    `perms`     = 'orderWorkbench:waybill:list',
    `update_by` = 'admin',
    `update_time` = NOW(),
    `remark`    = '统一打单发货工作台（取号/打印/发货/分配面单账号）'
WHERE `menu_id` = 894
   OR (`path` = 'print_ship' AND `component` LIKE 'shipping/ewaybillPrint%');

-- ------------------------------------------------------------
-- 校验（可选执行）：应返回 1 行且 component 为新页面
-- SELECT menu_id, menu_name, path, component, perms FROM sys_menu WHERE menu_id = 894;
-- ------------------------------------------------------------
