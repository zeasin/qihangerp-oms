package com.qihang.oms.domain.vo;

import lombok.Data;

import java.util.Date;

@Data
public class OrderItemListVo {
    private String id;
    /**
     * 订单ID（o_order外键）
     */
    private String orderId;

    /**
     * 子订单号（第三方平台）
     */
    private String originalOrderItemId;
    private String originalOrderId;
    private String originalSkuId;

    private Integer shopId;
    private String goodsImg;
    private String goodsTitle;
    private String goodsSpec;
    private String skuId;
    private String goodsSkuId;
    private String outerErpSkuId;
    private String goodsId;
    private String skuNum;
    private Double goodsPrice;
    private Double itemAmount;
    private Double payment;
    private Integer quantity;
    private String remark;
    private Integer refundCount;
    private Integer refundStatus;
    private Integer orderStatus;
    private Integer hasPushErp;
    private Date createTime;
    private Date orderTime;
}
