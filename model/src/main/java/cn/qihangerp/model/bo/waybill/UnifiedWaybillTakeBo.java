package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 统一取号参数（订单 + 已分配的面单账号）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §8.2
 */
@Data
public class UnifiedWaybillTakeBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID（o_order.id） */
    private Long orderId;
    /** 面单账号ID（oms_shop_waybill_account.id） */
    private Long accountId;
}
