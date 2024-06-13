package com.qihang.oms.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 抖店订单明细表
 * @TableName oms_dou_order_item
 */
@Data
public class OmsDouOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺子订单号，抖店平台生成，平台下唯一；注意：一笔订单下有一个子订单和父订单单号相同。
     */
    private String orderId;

    /**
     * 店铺父订单号，抖店平台生成，平台下唯一；
     */
    private String parentOrderId;

    /**
     * 订单层级
     */
    private Integer orderLevel;

    /**
     * 广告来源，video-短视频 live-直播
     */
    private String adEnvType;

    /**
     * 售后状态；6-售后申请；27-拒绝售后申请；12-售后成功；7-售后退货中；11-售后已发货；29-售后退货拒绝；13-【换货返回：换货售后换货商家发货】，【补寄返回：补寄待用户收货】； 14-【换货返回：（换货）售后换货用户收货】，【补寄返回：（补寄）用户已收货】 ；28-售后失败；51-订单取消成功；53-逆向交易已完成；
     */
    private Integer afterSaleStatus;

    /**
     * 售后类型 ；0-退货退款;1-已发货仅退款;2-未发货仅退款;3-换货;4-系统取消;5-用户取消;6-价保;7-补寄;
     */
    private Integer afterSaleType;

    /**
     * 退款状态:1-待退款；3-退款成功； 4-退款失败；当买家发起售后后又主动取消售后，此时after_sale_status=28并且refund_status=1的状态不变，不会流转至4状态；
     */
    private Integer refundStatus;

    /**
     * 作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额
     */
    private Integer authorCostAmount;

    /**
     * 直播主播id（达人）;仅直播间和橱窗产生的订单会有值返回;
     */
    private Integer authorId;

    /**
     * 直播主播名称;仅直播间和橱窗产生的订单会有值返回
     */
    private String authorName;

    /**
     * 【C端流量来源】 0-unknown 2-精选联盟 8-小店自卖
     */
    private Integer cBiz;

    /**
     * C端流量来源业务类型描述
     */
    private String cBizDesc;

    /**
     * 
取消原因
     */
    private String cancelReason;

    /**
     * 支付渠道的流水号
     */
    private String channelPaymentNo;

    /**
     * 商家后台商品编码
     */
    private String code;

    /**
     * 用户确认收货时间
     */
    private Integer confirmReceiptTime;

    /**
     * 订单完成时间，时间戳，秒
     */
    private Integer finishTime;

    /**
     * 
商品原价（单位：分）
     */
    private Integer goodsPrice;

    /**
     * 【商品类型】 0-实体 1-虚拟
     */
    private Integer goodsType;

    /**
     * 
是否评价 :1-已评价，0-未评价，2 -追评
     */
    private Integer isComment;

    /**
     * 订单商品数量
     */
    private Integer itemNum;

    /**
     * 物流收货时间 
     */
    private Integer logisticsReceiptTime;

    /**
     * 
改价金额变化量（单位：分）
     */
    private Integer modifyAmount;

    /**
     * 改价运费金额变化量（单位：分）
     */
    private Integer modifyPostAmount;

    /**
     * 仅平台承担金额（单位：分），订单参与活动和优惠中平台承担部分的总金额
     */
    private Integer onlyPlatformCostAmount;

    /**
     * 订单金额（单位：分）
     */
    private Integer orderAmount;

    /**
     * 支付金额（单位：分）
     */
    private Integer payAmount;

    /**
     * 运费险金额（单位：分）
     */
    private Integer postInsuranceAmount;

    /**
     * 订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额
     */
    private Integer promotionAmount;

    /**
     * 店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionShopAmount;

    /**
     * 平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionPlatformAmount;

    /**
     * 商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额
     */
    private Integer shopCostAmount;

    /**
     * 平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount
     */
    private Integer platformCostAmount;

    /**
     * 达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionTalentAmount;

    /**
     * 支付优惠金额（单位：分），支付渠道上的优惠金额
     */
    private Integer promotionPayAmount;

    /**
     * 商品现价（单位：分）
     */
    private Integer originAmount;

    /**
     * 商品外部编码
     */
    private String outProductId;

    /**
     * 外部Skuid
     */
    private String outSkuId;

    /**
     * 商品ID
     */
    private Long productId;

    /**
     * 商品skuId
     */
    private Long skuId;

    /**
     * 商品名称
     */
    private String productName;

    /**
     * 商品图片
     */
    private String productPic;

    /**
     * 平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionRedpackAmount;

    /**
     * 平台红包优惠金额（单位：分），属于平台的红包的优惠金额
     */
    private Integer promotionRedpackPlatformAmount;

    /**
     * 达人红包优惠金额（单位：分），属于达人的红包的优惠金额
     */
    private Integer promotionRedpackTalentAmount;

    /**
     * 直播间id，有值则代表订单来自直播间
     */
    private Integer roomId;

    /**
     * 
发货时间
     */
    private Integer shipTime;

    /**
     * 规格信息JSON
     */
    private String spec;

    /**
     * 下单来源描述（废弃）
     */
    private String themeTypeDesc;

    /**
     * 订单更新时间，时间戳，秒
     */
    private Integer updateTime;

    /**
     * 下单时间，时间戳，秒
     */
    private Integer createTime;

    /**
     * 视频id，有值则代表订单来自短视频video_id
     */
    private String videoId;

    private static final long serialVersionUID = 1L;
}