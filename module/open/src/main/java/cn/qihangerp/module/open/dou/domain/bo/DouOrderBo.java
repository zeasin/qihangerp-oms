package cn.qihangerp.module.open.dou.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class DouOrderBo implements Serializable {
    private String orderId;
    private Long skuId;
    private Long erpGoodsSkuId;
    private Integer shopId;
    private String orderStatus;
    private String startTime;
    private String endTime;
}
