package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 分配/改派参数：选中面单账号即同时确定发货主体 + 快递公司 + 发货网点
 * 设计口径对齐企业版 docs/design/16-打单发货.md §3.1
 */
@Data
public class WorkbenchWaybillDistributeBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID列表（o_order.id） */
    private Long[] orderIds;
    /** 面单账号ID（oms_shop_waybill_account.id） */
    private Long accountId;
}
