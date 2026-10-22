package cn.qihangerp.erp.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 统一发货回传结果
 */
@Data
public class WaybillShipResult implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 平台返回消息 */
    private String platformMsg;
}
