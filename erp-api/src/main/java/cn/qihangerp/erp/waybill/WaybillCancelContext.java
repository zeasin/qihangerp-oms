package cn.qihangerp.erp.waybill;

import cn.qihangerp.model.entity.OOrder;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 统一取消取号上下文（运单信息由打单记录带入）
 */
@Data
@AllArgsConstructor
public class WaybillCancelContext implements Serializable {
    private static final long serialVersionUID = 1L;

    private OOrder order;
    /** 平台物流公司编码 */
    private String logisticsCode;
    /** 快递单号 */
    private String waybillCode;
}
