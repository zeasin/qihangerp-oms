package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 抖店退款表
 * @TableName oms_dou_refund
 */
@Data
public class OmsDouRefund implements Serializable {
    /**
     * 售后订单id，自增
     */
    private Long id;

    /**
     * 订单所属商户id
     */
    private Long shopId;

    /**
     * 售后id
     */
    private Long aftersaleId;

    /**
     * 售后订单类型，枚举为-1(历史订单),1(商品单),2(店铺单)
     */
    private Long aftersaleOrderType;

    /**
     * 售后类型；0-退货退款；1-已发货仅退款；2-未发货仅退款；3-换货；6-价保；7-补寄；8-维修
     */
    private Long aftersaleType;

    /**
     * 售后状态和请求参数standard_aftersale_status字段对应；3-换货待买家收货；6-待商家同意；7-待买家退货；8-待商家发货；11-待商家二次同意；12-售后成功；14-换货成功；27-商家一次拒绝；28-售后失败；29-商家二次拒绝；
     */
    private Long aftersaleStatus;

    /**
     * 售后完结时间，完结时间是平台根据商品的类型，售后状态等综合判断生成，当售后单有完结时间返回时售后单不可再做任何操作；未完结售后单的该字段值为0；Unix时间戳：秒
     */
    private Long aftersaleStatusToFinalTime;

    /**
     * 
关联的订单ID
     */
    private String relatedId;

    /**
     * 抖音子订单id
     */
    private String orderSkuOrderId;

    /**
     * 订单状态
     */
    private Long orderStatus;

    /**
     * 付款金额
     */
    private Long orderPayAmount;

    /**
     * 
付运费金额
     */
    private Long orderPostAmount;

    /**
     * 购买数量
     */
    private Long orderItemNum;

    /**
     * 商品名
     */
    private String orderProductName;

    /**
     * 商品图片
     */
    private String orderProductImage;

    /**
     * 商品id
     */
    private String orderProductId;

    /**
     * 商品规格JSON
     */
    private String orderSkuSpec;

    /**
     * 商家SKU编码
     */
    private String orderShopSkuCode;

    /**
     * 申请时间
     */
    private Long applyTime;

    /**
     * 最近更新时间
     */
    private Long updateTime;

    /**
     * 当前节点逾期时间
     */
    private Long statusDeadline;

    /**
     * 售后退款金额，单位为分
     */
    private Long refundAmount;

    /**
     * 售后退运费金额，单位为分
     */
    private Long refundPostAmount;

    /**
     * 
售后数量
     */
    private Long aftersaleNum;

    /**
     * 部分退类型
     */
    private Long partType;

    /**
     * 售后退款类型，枚举为-1(历史数据默认值),0(订单货款/原路退款),1(货到付款线下退款),2(备用金),3(保证金),4(无需退款),5(平台垫付)
     */
    private Long aftersaleRefundType;

    /**
     * 退款方式，枚举为1(极速退款助手)、2(售后小助手)、3(售后急速退)、4(闪电退货)
     */
    private Long refundType;

    /**
     * 仲裁状态，枚举为0(无仲裁记录),1(仲裁中),2(客服同意),3(客服拒绝),4(待商家举证),5(协商期),255(仲裁结束)
     */
    private Long arbitrateStatus;

    /**
     * 
售后单创建时间
     */
    private Long createTime;

    /**
     * 风控理由
     */
    private String riskDecisionReason;

    /**
     * 风控描述
     */
    private String riskDecisionDescription;

    /**
     * 退优惠金额
     */
    private Long returnPromotionAmount;

    /**
     * 退款状态；1-待退款;2-退款中;3-退款成功;4-退款失败;5-追缴成功;
     */
    private Long refundStatus;

    /**
     * 仲裁责任方 1:商家责任,2:买家责任,3:双方有责,4:平台责任,5:达人责任
     */
    private Long arbitrateBlame;

    /**
     * 退货物流单号
     */
    private String returnLogisticsCode;

    /**
     * 退货物流公司名称
     */
    private String returnLogisticsCompanyName;

    /**
     * 换货SKU信息JSON
     */
    private String exchangeSkuInfo;

    /**
     * 换货物流公司名称
     */
    private String exchangeLogisticsCompanyName;

    /**
     * 备注
     */
    private String remark;

    /**
     * 买家是否收到货物，0表示未收到，1表示收到
     */
    private Long gotPkg;

    /**
     * 是否拒签后退款（1：已同意拒签, 2：未同意拒签）
     */
    private Long isAgreeRefuseSign;

    /**
     * 商家首次发货的正向物流信息JSON
     */
    private String orderLogistics;

    /**
     * 售后标签（含时效延长、风险预警、豁免体验分等标签）标签在平台侧会有更新，标签仅做展示使用，请勿作为系统判断依赖。JSON
     */
    private String aftersaleTags;

    /**
     * 售后子类型；8001-以换代修。
     */
    private Long aftersaleSubType;

    /**
     * 自动审核方式：1-发货前极速退；2-小助手自动同意退款；3-发货后极速退；4-闪电退货；5-跨境零秒退；6-云仓拦截自动退；7-小助手自动同意退货；8-小助手自动同意拒签后退款；9-商家代客填写卡片发起售后；10-治理未发货自动同意退款；11-治理已发货自动同意退款；12-商家快递拦截成功自动退款；13-质检商品免审核；14-协商方案自动同意退款；15-平台卡券自动同意退款；16-三方卡券自动同意退款；17-治理一审自动同意退货退款
     */
    private String autoAuditBits;

    /**
     * 文案部分JSON
     */
    private String textPart;

    /**
     * 售后关联的订单信息JSON
     */
    private String relatedOrderInfo;

    /**
     * 第一次拉取时间
     */
    private Date pullTime;

    /**
     * 最后一次拉取时间
     */
    private Date pullLastTime;

    private static final long serialVersionUID = 1L;
}