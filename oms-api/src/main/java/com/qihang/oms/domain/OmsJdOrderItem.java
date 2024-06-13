package com.qihang.oms.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 京东订单明细表
 * @TableName oms_jd_order_item
 */
@Data
public class OmsJdOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 订单id（京东平台）
     */
    private Long orderId;

    /**
     * 京东内部SKU的ID
     */
    private String skuId;

    /**
     * SKU外部ID（极端情况下不保证返回，建议从商品接口获取
     */
    private String outerSkuId;

    /**
     * 商品的名称+SKU规格
     */
    private String skuName;

    /**
     * SKU的京东价
     */
    private String jdPrice;

    /**
     * 赠送积分
     */
    private String giftPoint;

    /**
     * 	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）
     */
    private String wareId;

    /**
     * 数量
     */
    private String itemTotal;

    /**
     * 
     */
    private String productNo;

    /**
     * 
     */
    private String serviceName;

    /**
     * 
     */
    private String newStoreId;

    private static final long serialVersionUID = 1L;
}