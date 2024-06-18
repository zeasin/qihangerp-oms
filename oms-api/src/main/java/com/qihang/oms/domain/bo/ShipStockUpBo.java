package com.qihang.oms.domain.bo;

import lombok.Data;

@Data
public class ShipStockUpBo {
    private String orderNum;
    private String outSkuId;
    private Long shopId;
}
