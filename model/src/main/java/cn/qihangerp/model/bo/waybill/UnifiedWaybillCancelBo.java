package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 统一取消取号参数（运单信息由打单记录带入）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §8.2
 */
@Data
public class UnifiedWaybillCancelBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID（o_order.id） */
    private Long orderId;
    /** 快递单号 */
    private String waybillCode;
    /** 平台物流公司编码 */
    private String logisticsCode;
}
