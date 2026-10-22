package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 统一发货回传参数
 * 设计口径对齐企业版 docs/design/16-打单发货.md §8.2
 */
@Data
public class UnifiedWaybillShipBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID（o_order.id） */
    private Long orderId;
    /** 快递单号 */
    private String waybillCode;
    /** 快递公司编码 */
    private String logisticsCode;
}
