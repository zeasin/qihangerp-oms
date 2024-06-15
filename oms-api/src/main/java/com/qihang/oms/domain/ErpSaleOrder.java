package com.qihang.oms.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

/**
 * 订单表
 * @TableName erp_sale_order
 */
@Data
public class ErpSaleOrder implements Serializable {
    /**
     * 订单id，自增
     */
    private String id;

    /**
     * 订单编号（来源订单）
     */
    private String orderNum;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 店铺ID
     */
    private Integer shopId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 买家留言信息
     */
    private String buyerMemo;
    private String sellerMemo;

    /**
     * 标签
     */
    private String tag;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部
     */
    private Integer refundStatus;

    /**
     * 订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款
     */
    private Integer orderStatus;

    /**
     * 商品金额
     */
    private Double goodsAmount;

    /**
     * 卖家优惠金额
     */
    private Double sellerDiscount;
    /**
     * 卖家优惠金额
     */
    private Double platformDiscount;

    /**
     * 运费
     */
    private Double postage;

    /**
     * 订单金额
     */
    private Double orderAmount;
    /**
     * 支付金额，单位：元
     */
    private Double payAmount;

    /**
     * 收件人姓名
     */
    private String receiverName;

    /**
     * 收件人手机号
     */
    private String receiverPhone;

    /**
     * 收件人地址
     */
    private String address;

    /**
     * 国家/地区
     */
    private String country;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String town;

    /**
     * 订单创建时间
     */
    private Date orderTime;

    /**
     * 支付时间
     */
    private Date payTime;

    /**
     * 订单确认时间
     */
    private Date confirmTime;

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
    private Date shippingTime;

    /**
     * 快递单号
     */
    private String shippingNumber;

    /**
     * 物流公司
     */
    private String shippingCompany;

    /**
     * 发货人
     */
    private String shippingMan;

    /**
     * 发货费用
     */
    private BigDecimal shippingCost;

    /**
     * 订单创建时间
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

    /**
     * 长
     */
    private Double length;

    /**
     * 宽
     */
    private Double width;

    /**
     * 高
     */
    private Double height;

    /**
     * 重量
     */
    private Double weight;

    @TableField(exist = false)
    List<ErpSaleOrderItem> itemList;

    private static final long serialVersionUID = 1L;
}