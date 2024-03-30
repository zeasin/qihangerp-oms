package com.qihang.wei.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName wei_goods_sku
 */
@Data
public class WeiGoodsSku implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 外键id
     */
    private Long weiGoodsId;

    /**
     * skuID
     */
    private String skuId;

    /**
     * 商家自定义skuID。如果添加时没录入，回包可能不包含该字段
     */
    private String outSkuId;

    /**
     * sku小图
     */
    private String thumbImg;

    /**
     * 售卖价格，以分为单位
     */
    private Integer salePrice;

    /**
     * sku库存
     */
    private Integer stockNum;

    /**
     * sku编码
     */
    private String skuCode;

    /**
     * sku状态
     */
    private Integer status;

    /**
     * sku_attrs
     */
    private String skuAttrs;

    /**
     * sku_deliver_info
     */
    private String skuDeliverInfo;

    /**
     * erp系统商品id
     */
    private Long erpGoodsId;

    /**
     * erp系统商品skuid
     */
    private Long erpGoodsSkuId;

    private static final long serialVersionUID = 1L;
}