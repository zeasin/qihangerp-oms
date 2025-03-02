package cn.qihangerp.oms.domain.bo;

import lombok.Data;

@Data
public class ShipWaybillBo {
    private String orderId;
    private String waybillCode;
    private Long shopId;
}
