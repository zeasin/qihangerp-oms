package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 京东订单表
 * @TableName oms_jd_order
 */
@Data
public class OmsJdOrder implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 订单id（京东平台）
     */
    private String orderId;

    /**
     * 商家id
     */
    private String venderId;

    /**
     * 	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String orderType;

    /**
     * 支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）
     */
    private String payType;

    /**
     * 订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）
     */
    private String orderTotalPrice;

    /**
     * 订单货款金额（订单总金额-商家优惠金额）
     */
    private String orderSellerPrice;

    /**
     * 用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。
     */
    private String orderPayment;

    /**
     * 商品的运费
     */
    private String freightPrice;

    /**
     * 商家优惠金额
     */
    private String sellerDiscount;

    /**
     * 	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为'等待境内发货'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码
     */
    private String orderState;

    /**
     * 订单状态说明（中文）
     */
    private String orderStateRemark;

    /**
     * 送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）
     */
    private String deliveryType;

    /**
     * 发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）
     */
    private String invoiceInfo;

    /**
     * 普通发票纳税人识别码
     */
    private String invoiceCode;

    /**
     * 买家下单时订单备注
     */
    private String orderRemark;

    /**
     * 下单时间
     */
    private String orderStartTime;

    /**
     * 结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。
     */
    private String orderEndTime;

    /**
     * 姓名
     */
    private String fullname;

    /**
     * 固定电话
     */
    private String telephone;

    /**
     * 手机
     */
    private String mobile;

    /**
     * 地址
     */
    private String fullAddress;

    /**
     * 
     */
    private String province;

    /**
     * 
     */
    private String city;

    /**
     * 
     */
    private String county;

    /**
     * 
     */
    private String town;

    /**
     * 
     */
    private String provinceId;

    /**
     * 
     */
    private String cityId;

    /**
     * 
     */
    private String countyId;

    /**
     * 
     */
    private String townId;

    /**
     * 商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String venderRemark;

    /**
     * 余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String balanceUsed;

    /**
     * 买家的账号信息
     */
    private String pin;

    /**
     * 售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String returnOrder;

    /**
     * 付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String paymentConfirmTime;

    /**
     * 运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String waybill;

    /**
     * 物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String logisticsId;

    /**
     * 订单更新时间
     */
    private String modified;

    /**
     * 	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String directParentOrderId;

    /**
     * 	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String parentOrderId;

    /**
     * 订单来源。如：移动端订单
     */
    private String orderSource;

    /**
     * 京仓订单/云仓订单/空“”
     */
    private String storeOrder;

    /**
     * 是否京配。68=京配，69=京配自提
     */
    private String idSopShipmenttype;

    /**
     * 买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    private String realPin;

    /**
     * 买家的账号信息 
     */
    private String openId;

    /**
     * 买家的账号信息(区分大小写) 可选字段
     */
    private String openIdBuyer;

    /**
     * 
     */
    private Date createTime;

    /**
     * 订单审核状态（0待审核1已审核）
     */
    private Integer auditStatus;

    /**
     * 订单审核时间
     */
    private Date auditTime;

    private static final long serialVersionUID = 1L;
}