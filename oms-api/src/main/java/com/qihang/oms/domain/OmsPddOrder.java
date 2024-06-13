package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 拼多多订单表
 * @TableName oms_pdd_order
 */
@Data
public class OmsPddOrder implements Serializable {
    /**
     * 订单id，自增
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
     * 订单类型 0-普通订单 ，1- 定金订单
     */
    private Integer tradeType;

    /**
     * 是否顺丰包邮，1-是 0-否
     */
    private Integer freeSf;

    /**
     * 是否是抽奖订单，1-非抽奖订单，2-抽奖订单
     */
    private Integer isLuckyFlag;

    /**
     * 成团状态：0：拼团中、1：已成团、2：团失败
     */
    private Integer groupStatus;

    /**
     * 成交状态：0：未成交、1：已成交、2：已取消、
     */
    private Integer confirmStatus;

    /**
     * 订单状态1：待发货，2：已发货待签收，3：已签收
     */
    private Integer orderStatus;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部
     */
    private Integer refundStatus;

    /**
     * 团长免单金额，单位：元
     */
    private Double capitalFreeDiscount;

    /**
     * 商家优惠金额，单位：元
     */
    private Double sellerDiscount;

    /**
     * 平台优惠金额，单位：元
     */
    private Double platformDiscount;

    /**
     * 商品金额，单位：元，商品金额=商品销售价格*商品数量-改价金额（接口暂无该字段）
     */
    private Double goodsAmount;

    /**
     * 折扣金额，单位：元，折扣金额=平台优惠+商家优惠+团长免单优惠金额
     */
    private Double discountAmount;

    /**
     * 支付金额，单位：元，支付金额=商品金额-折扣金额+邮费
     */
    private Double payAmount;

    /**
     * 邮费，单位：元
     */
    private Double postage;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 订单备注标记，1-红色，2-黄色，3-绿色，4-蓝色，5-紫色
     */
    private Integer remarkTag;

    /**
     * 订单备注标记名称
     */
    private String remarkTagName;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 订单的更新时间
     */
    private String updatedAt;

    /**
     * 发货时间
     */
    private String shippingTime;

    /**
     * 快递单号
     */
    private String trackingNumber;

    /**
     * 物流公司
     */
    private String trackingCompany;

    /**
     * 支付方式，枚举值：QQ,WEIXIN,ALIPAY,LIANLIANPAY
     */
    private String payType;

    /**
     * 支付单号
     */
    private String payNo;

    /**
     * 收件人地址，不拼接省市区
     */
    private String receiverAddress;

    /**
     * 收件人地址（打码）
     */
    private String receiverAddressMask;

    /**
     * 收件人姓名
     */
    private String receiverName;

    /**
     * 收件人电话
     */
    private String receiverPhone;

    /**
     * 
     */
    private String receiverPhoneMask;

    /**
     * 
     */
    private String receiverNameMask;

    /**
     * 
     */
    private String addressMask;

    /**
     * 详细地址
     */
    private String address;

    /**
     * 区县
     */
    private String town;

    /**
     * 
     */
    private Integer townId;

    /**
     * 市
     */
    private String city;

    /**
     * 城市编码
     */
    private Integer cityId;

    /**
     * 省
     */
    private String province;

    /**
     * 
     */
    private Integer provinceId;

    /**
     * 国家地区
     */
    private String country;

    /**
     * 
     */
    private Integer countryId;

    /**
     * 订单创建时间
     */
    private Date createdTime;

    /**
     * 支付时间
     */
    private String payTime;

    /**
     * 成交时间
     */
    private String confirmTime;

    /**
     * 确认收货时间
     */
    private String receiveTime;

    /**
     * 售后状态 0：无售后 2：买家申请退款，待商家处理 3：退货退款，待商家处理 4：商家同意退款，退款中 5：平台同意退款，退款中 6：驳回退款， 待买家处理 7：已同意退货退款,待用户发货 8：平台处理中 9：平台拒 绝退款，退款关闭 10：退款成功 11：买家撤销 12：买家逾期未处 理，退款失败 13：买家逾期，超过有效期 14 : 换货补寄待商家处理 15:换货补寄待用户处理 16:换货补寄成功 17:换货补寄失败 18:换货补寄待用户确认完成
     */
    private Integer afterSalesStatus;

    /**
     * 订单承诺发货时间
     */
    private String lastShipTime;

    /**
     * 标签
     */
    private String tag;

    /**
     * 是否当日发货，1-是，0-否
     */
    private Integer deliveryOneDay;

    /**
     * 是否多多批发，1-是，0-否
     */
    private Integer duoduoWholesale;

    /**
     * 送货入户并安装服务 0-不支持送货，1-送货入户不安装，2-送货入户并安装
     */
    private Integer homeDeliveryType;

    /**
     * 发票申请,1代表有 0代表无
     */
    private Integer invoiceStatus;

    /**
     * 是否为预售商品 1表示是 0表示否
     */
    private Integer isPreSale;

    /**
     * 是否缺货 0-无缺货处理 1： 有缺货处理
     */
    private Integer isStockOut;

    /**
     * 快递公司在拼多多的代码
     */
    private Long logisticsId;

    /**
     * 市场业务类型，0-普通订单，1-拼内购订单
     */
    private Integer mktBizType;

    /**
     * 只换不修，1:是，0:否
     */
    private Integer onlySupportReplace;

    /**
     * 订单改价折扣金额，单位元
     */
    private Double orderChangeAmount;

    /**
     * 预售时间
     */
    private String preSaleTime;

    /**
     * 退货包运费，1:是，0:否
     */
    private Integer returnFreightPayer;

    /**
     * 订单审核状态（0-正常订单， 1-审核中订单）
     */
    private Integer riskControlStatus;

    /**
     * 催发货时间
     */
    private String urgeShippingTime;

    /**
     * 0待确认，1已确认2已拦截-9未拉取
     */
    private Integer auditStatus;

    /**
     * 发货时间（仓库真实发货时间）
     */
    private Date auditTime;

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