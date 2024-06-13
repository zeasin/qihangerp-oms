package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * pdd商品SKU表
 * @TableName oms_pdd_goods_sku
 */
@Data
public class OmsPddGoodsSku implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * sku编码
     */
    private Long skuId;

    /**
     * pdd商品编码
     */
    private Long goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品缩略图
     */
    private String thumbUrl;

    /**
     * 商家外部编码（sku）
     */
    private String outerId;

    /**
     * sku库存
     */
    private Long skuQuantity;

    /**
     * 规格名称
     */
    private String spec;

    /**
     * sku是否在架上，0-下架中，1-架上
     */
    private Integer isSkuOnsale;

    /**
     * 商品id(o_goods外键)
     */
    private Long erpGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long erpGoodsSkuId;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}