package com.qihang.wei.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName wei_order_item
 */
@Data
public class WeiOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 外键id
     */
    private Long weiOrderId;

    /**
     * 商品spuid
     */
    private String productId;

    /**
     * 商品skuid

     */
    private String skuId;

    /**
     * sku小图
     */
    private String thumbImg;

    /**
     * sku数量
     */
    private Integer skuCnt;

    /**
     * 售卖单价（单位：分）
     */
    private Integer salePrice;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 正在售后/退款流程中的 sku 数量
     */
    private Integer onAftersaleSkuCnt;

    /**
     * 完成售后/退款的 sku 数量
     */
    private Integer finishAftersaleSkuCnt;

    /**
     * 商品编码
     */
    private String skuCode;

    /**
     * 市场单价（单位：分）
     */
    private Integer marketPrice;

    /**
     * sku属性JSON
     */
    private String skuAttrs;

    /**
     * sku实付总价，取estimate_price和change_price中较小值
     */
    private Integer realPrice;

    /**
     * 商品外部spuid
     */
    private String outProductId;

    /**
     * 商品外部skuid
     */
    private String outSkuId;

    /**
     * 是否有优惠金额，非必填，默认为false
     */
    private String isDiscounted;

    /**
     * 优惠后sku总价，非必填，is_discounted为true时有值
     */
    private Integer estimatePrice;

    /**
     * 是否修改过价格，非必填，默认为false
     */
    private String isChangePrice;

    /**
     * 改价后sku总价，非必填，is_change_price为true时有值
     */
    private Integer changePrice;

    /**
     * 区域库存id
     */
    private String outWarehouseId;

    /**
     * 商品发货信息JSON
     */
    private String skuDeliverInfo;

    /**
     * 商品额外服务信息JSON
     */
    private String extraService;

    /**
     * 是否使用了会员积分抵扣

     */
    private String useDeduction;

    /**
     * 会员积分抵扣金额，单位为分
     */
    private Integer deductionPrice;

    /**
     * 商品优惠券信息，逐步替换 order.order_detail.coupon_info
     */
    private String orderProductCouponInfoList;

    private static final long serialVersionUID = 1L;
}