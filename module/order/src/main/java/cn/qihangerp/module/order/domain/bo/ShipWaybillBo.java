package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

@Data
public class ShipWaybillBo {
    private String orderId;
    private String waybillCode;
    private Long shopId;
}
