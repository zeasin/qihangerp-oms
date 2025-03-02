package cn.qihangerp.module.open.wei.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName oms_wei_goods_sku
 */
@Data
public class OmsWeiGoodsSku implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 产品id
     */
    private String productId;

    /**
     * skuID
     */
    private String skuId;

    /**
     * 商家自定义skuID。如果添加时没录入，回包可能不包含该字段
     */
    private String outSkuId;

    /**
     * 商品标题
     */
    private String title;

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
     * sku属性
     */
    private String skuAttr;

    /**
     * sku_attrs
     */
    private String skuAttrs;

    /**
     * sku_deliver_info
     */
    private String skuDeliverInfo;

    /**
     * 商品id(o_goods外键)
     */
    private Long oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long oGoodsSkuId;

    private static final long serialVersionUID = 1L;
}