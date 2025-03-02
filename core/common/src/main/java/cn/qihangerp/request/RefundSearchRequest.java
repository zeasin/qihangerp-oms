package cn.qihangerp.request;

import lombok.Data;

@Data
public class RefundSearchRequest {
    private String refundNum;
    private Integer shopId;
    private String orderNum;
    private String skuId;

}
