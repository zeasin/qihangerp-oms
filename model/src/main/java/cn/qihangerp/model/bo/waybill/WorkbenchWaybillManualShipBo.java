package cn.qihangerp.model.bo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 手动发货兜底通道参数（人工录入物流公司与单号）
 */
@Data
public class WorkbenchWaybillManualShipBo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 发货单元ID（o_order.id） */
    private Long orderId;
    /** 快递公司编码 */
    private String logisticsCode;
    /** 快递公司名称 */
    private String waybillCompany;
    /** 快递单号 */
    private String waybillCode;
}
