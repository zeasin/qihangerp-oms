package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName oms_wei_order
 */
@Data
public class OmsWeiOrder implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 订单号
     */
    private String orderId;

    /**
     * 买家身份标识
     */
    private String openid;

    /**
     * 秒级时间戳
     */
    private Integer createTime;

    /**
     * 秒级时间戳
     */
    private Integer updateTime;

    /**
     * 
     */
    private String unionid;

    /**
     * 状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；
     */
    private Integer status;

    /**
     * 售后信息json
     */
    private String aftersaleDetail;

    /**
     * 支付信息json
     */
    private String payInfo;

    /**
     * 商品总价，单位为分
     */
    private Integer productPrice;

    /**
     * 订单金额，单位为分，order_price=original_order_price-discounted_price-deduction_price-change_down_price
     */
    private Integer orderPrice;

    /**
     * 运费，单位为分
     */
    private Integer freight;

    /**
     * 优惠券优惠金额，单位为分
     */
    private Integer discountedPrice;

    /**
     * 收货人姓名
     */
    private String userName;

    /**
     * 邮编
     */
    private String postalCode;

    /**
     * 省份
     */
    private String provinceName;

    /**
     * 城市
     */
    private String cityName;

    /**
     * 区
     */
    private String countyName;

    /**
     * 详细地址
     */
    private String detailInfo;

    /**
     * 联系方式

     */
    private String telNumber;

    /**
     * 门牌号码
     */
    private String houseNumber;

    /**
     * 虚拟发货订单联系方式(deliver_method=1时返回)
     */
    private String virtualOrderTelNumber;

    /**
     * 额外的联系方式信息（虚拟号码相关）
     */
    private String telNumberExtInfo;

    /**
     * 0：不使用虚拟号码，1：使用虚拟号码
     */
    private Integer useTelNumber;

    /**
     * 标识当前店铺下一个唯一的用户收货地址
     */
    private String hashCode;

    /**
     * 发货物流信息JSON
     */
    private String deliveryProductInfo;

    /**
     * 发货完成时间，秒级时间戳
     */
    private Integer shipDoneTime;

    /**
     * 电子面单代发时的订单密文

     */
    private String ewaybillOrderCode;

    /**
     * 结算信息json
     */
    private String settleInfo;

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