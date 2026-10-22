package cn.qihangerp.erp.waybill;

import cn.qihangerp.model.entity.OOrder;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 统一发货回传上下文
 * logisticsCode=快递公司编码，waybillCode=快递单号
 */
@Data
@AllArgsConstructor
public class WaybillShipContext implements Serializable {
    private static final long serialVersionUID = 1L;

    private OOrder order;
    /** 快递公司编码（o_order.shipping_company_code） */
    private String logisticsCode;
    /** 快递单号（o_order.waybill_code） */
    private String waybillCode;
}
