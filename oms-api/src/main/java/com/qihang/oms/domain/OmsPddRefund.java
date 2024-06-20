package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 拼多多订单退款表
 * @TableName oms_pdd_refund
 */
@Data
public class OmsPddRefund implements Serializable {
    /**
     * 售后编号
     */
    private Long id;

    /**
     * 内部店铺ID
     */
    private Integer shopId;

    /**
     * 订单编号
     */
    private String orderSn;

    /**
     * 售后类型 1：全部 2：仅退款 3：退货退款 4：换货 5：缺货补寄 6：维修
     */
    private Integer afterSalesType;

    /**
     * 售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款，待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处理，退款失败 13：买家逾期，超过有效期 14：换货补寄待商家处理 15：换货补寄待用户处理 16：换货补寄成功 17：换货补寄失败 18：换货补寄待用户确认完成 21：待商家同意维修 22：待用户确认发货 24：维修关闭 25：维修成功 27：待用户确认收货 31：已同意拒收退款，待用户拒收 32：补寄待商家发货 33：待商家召回
     */
    private Integer afterSalesStatus;

    /**
     * 售后原因
     */
    private String afterSaleReason;

    /**
     * 订单成团时间
     */
    private String confirmTime;

    /**
     * 创建时间
     */
    private String createdTime;

    /**
     * 订单折扣金额（元）
     */
    private Double discountAmount;

    /**
     * 1纠纷退款 0非纠纷退款
     */
    private Double disputeRefundStatus;

    /**
     * 商品图片
     */
    private String goodsImage;

    /**
     * 拼多多商品id
     */
    private Long goodsId;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品价格，单位：元
     */
    private Double goodsPrice;

    /**
     * 订单金额（元）
     */
    private Double orderAmount;

    /**
     * 退款金额（元）
     */
    private Double refundAmount;

    /**
     * 同意退款操作人角色0:"默认",1:"用户",2:"商家",3:"平台",4:"系统",5:"团长",6:"司机",7:"代理人"
     */
    private Integer refundOperatorRole;

    /**
     * 拼多多商品skuid
     */
    private Long skuId;

    /**
     * 商家外部编码（商品）
     */
    private String outerGoodsId;

    /**
     * 商家外部编码（sku）
     */
    private String outerId;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 数量
     */
    private Integer goodsNumber;

    /**
     * 退货物流公司名称
     */
    private String shippingName;

    /**
     * 极速退款标志位 1：极速退款，0：非极速退款
     */
    private Integer speedRefundFlag;

    /**
     * 极速退款状态，"1"：有极速退款资格，"2"：极速退款失败, "3" 表示极速退款成功，其他表示非极速退款
     */
    private Integer speedRefundStatus;

    /**
     * 0-未勾选 1-消费者选择的收货状态为未收到货 2-消费者选择的收货状态为已收到货
     */
    private Integer userShippingStatus;

    /**
     * 快递单号
     */
    private String trackingNumber;

    /**
     * 更新时间
     */
    private String updatedTime;

    /**
     * 
     */
    private Date createTime;

    /**
     * 系统更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}