package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 订单明细表
 * @TableName erp_sale_order_item
 */
@Data
public class ErpSaleOrderItem implements Serializable {
    /**
     * id，自增
     */
    private Long id;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 供应商ID
     */
    private Integer supplierId;

    /**
     * erp系统商品id
     */
    private Long goodsId;

    /**
     * erp系统商品规格id
     */
    private Long specId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品规格编码
     */
    private String specNum;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 子订单编号(来源订单)
     */
    private String originalOrderItemId;

    /**
     * 订单编号（来源订单）
     */
    private String originalOrderId;
    private String originalSkuId;

    /**
     * 是否赠品0否1是
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
     * 订单状态
     */
    private Integer orderStatus;

    /**
     * 发货类型（0仓库发货；1供应商代发）
     */
    private Integer shipType;

    /**
     * 发货状态（0待备货1备货中2已出库3已发货）
     */
    private Integer shipStatus;

    /**
     * 发货时间
     */
    private Date shipTime;

    /**
     * 快递单号
     */
    private String logisticsCode;

    /**
     * 物流公司
     */
    private String logisticsCompany;

    /**
     * 发货人
     */
    private String shipMan;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    private static final long serialVersionUID = 1L;
}