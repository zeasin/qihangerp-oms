package com.qihang.tao.common;

import lombok.Data;

@Data
public class TaoRequest {
    private Long shopId;//店铺Id
    private Long orderId;//订单id
    private Integer updType;//更新类型0拉取新订单1更新订单
    private Long refundId;


}
