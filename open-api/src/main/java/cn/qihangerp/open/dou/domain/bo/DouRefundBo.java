package cn.qihangerp.open.dou.domain.bo;

import lombok.Data;

@Data
public class DouRefundBo {
    private Integer shopId;
    private Integer aftersaleType;
    private Long orderId;
    private String aftersaleId;
    private Integer aftersaleStatus;
}
