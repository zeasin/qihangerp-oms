package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 抖店订单表
 * @TableName oms_dou_order
 */
@Data
public class OmsDouOrder implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺父订单号，抖店平台生成，平台下唯一；
     */
    private String orderId;

    /**
     * 订单层级，主订单是2级
     */
    private Integer orderLevel;

    /**
     * 定金预售阶段单json
     */
    private String orderPhaseList;

    /**
     * 订单状态1 待确认/待支付（订单创建完毕）105 已支付 2 备货中 101 部分发货 3 已发货（全部发货）4 已取消5 已完成（已收货）
     */
    private Integer orderStatus;

    /**
     * 订单状态描述
     */
    private String orderStatusDesc;

    /**
     * 
订单的一些c端标签json
     */
    private String orderTag;

    /**
     * 【订单类型】 0、普通订单 2、虚拟商品订单 4、电子券（poi核销） 5、三方核销
     */
    private Integer orderType;

    /**
     * 订单类型描述
     */
    private String orderTypeDesc;

    /**
     * 具体某个小程序的ID
     */
    private Integer appId;

    /**
     * 抖音小程序ID
     */
    private String openId;

    /**
     * 小时达订单的接单状态 0-未接单；1-已接单；2-超时取消，或商家取消
     */
    private Integer acceptOrderStatus;

    /**
     * 预约发货时间
     */
    private Integer appointmentShipTime;

    /**
     * 作者（达人）承担金额（单位：分），订单参与活动和优惠中作者（达人）承担部分的总金额
     */
    private Integer authorCostAmount;

    /**
     * 达人抖音号，样品订单场景下才会返回的申样达人信息；
     */
    private String awemeId;

    /**
     * 【下单端】 0、站外 1、火山 2、抖音 3、头条 4、西瓜 5、微信 6、值点app 7、头条lite 8、懂车帝 9、皮皮虾 11、抖音极速版 12、TikTok 13、musically 14、穿山甲 15、火山极速版 16、服务市场 26、番茄小说 27、UG教育营销电商平台 28、Jumanji 29、电商SDK
     */
    private Integer bType;

    /**
     * 下单端描述
     */
    private String bTypeDesc;

    /**
     * 【下单场景】 0、未知 1、app内-原生 2、app内-小程序 3、H5 13、电商SDK-头条 35、电商SDK-头条lite
     */
    private Integer subBType;

    /**
     * 下单场景描述
     */
    private String subBTypeDesc;

    /**
     * 【业务来源】 1 -鲁班 2 -小店 3 -好好学习 4 -ev 5 -虚拟 6 -建站 7 -核销 8 -玉石 9 -ez 10 -ep 11 -虚拟卡券 12 -服务市场 13 - EP 视频课 14 - EP 直播课 21 -跨境BBC 22 -跨境BC 23 -跨境CC|UPU 24 -手机充值 25 -拍卖保证金 26 -懂车帝抵扣券 27 -懂车帝返现券 28 -离岛免税 29 -海南会员购 30 -抽奖 31 -清北-企业代付 32 -抖+券 33 -联盟寄样 49 -刀剑 53 -通信卡 66 -加油包 76 -大闸蟹 99 -保险 102-小店海外 108-上门取件收款
     */
    private Integer biz;

    /**
     * 业务来源描述
     */
    private String bizDesc;

    /**
     * 买家留言
     */
    private String buyerWords;

    /**
     * 商家备注
     */
    private String sellerWords;

    /**
     * 插旗信息：0-灰 1-紫 2-青 3-绿 4-橙 5-红
     */
    private Integer sellerRemarkStars;

    /**
     * 取消原因
     */
    private String cancelReason;

    /**
     * 支付渠道的流水号
     */
    private String channelPaymentNo;

    /**
     * 下单时间，时间戳，秒
     */
    private Integer createTime;

    /**
     * 支付时间，时间戳，秒
     */
    private Integer payTime;

    /**
     * 订单更新时间，时间戳，秒
     */
    private Integer updateTime;

    /**
     * 订单完成时间，时间戳，秒
     */
    private Integer finishTime;

    /**
     * 订单过期时间，时间戳，秒
     */
    private Integer orderExpireTime;

    /**
     * 用户唯一id
     */
    private String doudianOpenId;

    /**
     * 收件人姓名
     */
    private String encryptPostReceiver;

    /**
     * 收件人电话
     */
    private String encryptPostTel;

    /**
     * 收件地址
     */
    private String encryptPostAddress;

    /**
     * 预计发货时间，时间戳，秒
     */
    private Integer expShipTime;

    /**
     * 物流信息JSON
     */
    private String logisticsInfo;

    /**
     * 主流程状态，1 待确认/待支付（订单创建完毕）103 部分支付105 已支付2 备货中101 部分发货3 已发货（全部发货）4 已取消5 已完成（已收货）21 发货前退款完结22 发货后退款完结39 收货后退款完结
     */
    private Integer mainStatus;

    /**
     * 主流程状态描述
     */
    private String mainStatusDesc;

    /**
     * 收件人姓名（脱敏后）
     */
    private String maskPostReceiver;

    /**
     * 收件人电话（脱敏后）
     */
    private String maskPostTel;

    /**
     * 收件人地址（脱敏后）
     */
    private String maskPostAddress;

    /**
     * 省
     */
    private String provinceName;

    /**
     * 
     */
    private Integer provinceId;

    /**
     * 
     */
    private String cityName;

    /**
     * 
     */
    private Integer cityId;

    /**
     * 
     */
    private String townName;

    /**
     * 
     */
    private Integer townId;

    /**
     * 
     */
    private String streetName;

    /**
     * 
     */
    private Integer streetId;

    /**
     * 标识收件人地址的id，可用于合单
     */
    private String openAddressId;

    /**
     * 改价金额变化量（单位：分）
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
     * 7=无需支付（0元单）；8=DOU分期（信用支付）；9=新卡支付；12=先用后付；16=收银台支付
     */
    private Integer payType;

    /**
     * 快递费（单位：分）
     */
    private Integer postAmount;

    /**
     * 运费险金额（单位：分）
     */
    private Integer postInsuranceAmount;

    /**
     * 运费原价（单位：分），post_origin_amount = post_amount + post_promotion_amount
     */
    private Integer postOriginAmount;

    /**
     * 运费优惠金额（单位：分）
     */
    private Integer postPromotionAmount;

    /**
     * 订单优惠总金额（单位：分） = 店铺优惠金额 + 平台优惠金额 + 达人优惠金额
     */
    private Integer promotionAmount;

    /**
     * 支付优惠金额（单位：分），支付渠道上的优惠金额
     */
    private Integer promotionPayAmount;

    /**
     * 平台优惠金额（单位：分），属于平台的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionPlatformAmount;

    /**
     * 红包优惠金额（单位：分）
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
     * 店铺优惠金额（单位：分），属于店铺的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionShopAmount;

    /**
     * 达人优惠金额（单位：分），属于达人的优惠活动、优惠券、红包的总优惠金额
     */
    private Integer promotionTalentAmount;

    /**
     * 发货时间，时间戳，秒
     */
    private Integer shipTime;

    /**
     * 商家承担金额（单位：分），订单参与活动和优惠中商家承担部分的总金额
     */
    private Integer shopCostAmount;

    /**
     * 平台承担金额（单位：分），订单参与活动和优惠中平台+作者（达人）承担部分的总金额,包含作者（达人）承担金额：platform_cost_amount = only_platform_cost_amount + author_cost_amount
     */
    private Integer platformCostAmount;

    /**
     * 店铺id，抖店平台生成，平台下唯一；
     */
    private Long shopId;

    /**
     * 商户名称
     */
    private String shopName;

    /**
     * 总优惠金额（单位：分），total_promotion_amount = promotion_amount + post_promotion_amount
     */
    private Integer totalPromotionAmount;

    /**
     * 用户特征标签；JSON
     */
    private String userTagUi;

    /**
     * 系统店铺id
     */
    private Integer sShopId;

    /**
     * 第一次拉取时间
     */
    private Date pullTime;

    /**
     * 最后一次拉取时间
     */
    private Date lastPullTime;

    /**
     * 0待确认，1已确认2已拦截-9未拉取
     */
    private Integer auditStatus;

    /**
     * 审核时间
     */
    private Date auditTime;

    private static final long serialVersionUID = 1L;
}