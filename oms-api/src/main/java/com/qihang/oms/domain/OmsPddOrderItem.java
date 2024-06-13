package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 拼多多订单明细表
 * @TableName oms_pdd_order_item
 */
@Data
public class OmsPddOrderItem implements Serializable {
    /**
     * id，自增
     */
    private Long id;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * 订单编号
     */
    private String orderSn;

    /**
     * erp系统商品id
     */
    private Integer erpGoodsId;

    /**
     * erp系统商品规格id
     */
    private Integer erpSpecId;

    /**
     * 拼多多商品id
     */
    private Long goodId;

    /**
     * 拼多多商品skuid
     */
    private Long skuId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 商家外部编码（商品）
     */
    private String outerGoodsId;

    /**
     * 商家外部编码（sku）
     */
    private String outerId;

    /**
     * 商品数量
     */
    private Integer goodsCount;

    /**
     * 备注
     */
    private String remark;

    /**
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 是否礼品0否1是
     */
    private Integer isGift;

    /**
     * 已退货数量
     */
    private Integer refundCount;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

    /**
     * 内部店铺ID
     */
    private Integer shopId;

    /**
     * 系统创建时间
     */
    private Date createTime;

    /**
     * 系统更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}