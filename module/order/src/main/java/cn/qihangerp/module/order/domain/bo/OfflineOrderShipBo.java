package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

@Data
public class OfflineOrderShipBo {
    private String orderNum;
    private String shippingCompany;
    private String shippingNumber;

}
