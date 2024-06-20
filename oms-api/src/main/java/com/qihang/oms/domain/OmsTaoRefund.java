package com.qihang.oms.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 淘宝退款表
 * @TableName oms_tao_refund
 */
@Data
public class OmsTaoRefund implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 退款id
     */
    private String refundId;

    /**
     * 退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
     */
    private String disputeType;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 淘宝交易单号（订单号）
     */
    private Long tid;

    /**
     * 子订单号。如果是单笔交易oid会等于tid
     */
    private Long oid;

    /**
     * 支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private Double payment;

    /**
     * 商品价格。
     */
    private Double price;

    /**
     * 交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private Double totalFee;

    /**
     * 退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private Double refundFee;

    /**
     * 	分账给卖家的钱
     */
    private Double splitSellerFee;

    /**
     * 分账给淘宝的钱
     */
    private Double splitTaobaoFee;

    /**
     * 退款申请时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date created;

    /**
     * 更新时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date modified;

    /**
     * 卖家昵称
     */
    private String sellerNick;

    /**
     * 不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;
     */
    private String csStatus;

    /**
     * 退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    private String status;

    /**
     * 退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81"
     */
    private String orderStatus;

    /**
     * 卖家收货地址
     */
    private String address;

    /**
     * 退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;
     */
    private String advanceStatus;

    /**
     * 支付宝交易号
     */
    private String alipayNo;

    /**
     * 退货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date goodReturnTime;

    /**
     * 货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)
     */
    private String goodStatus;

    /**
     * 买家是否需要退货。可选值:true(是),false(否)
     */
    private Integer hasGoodReturn;

    /**
     * 申请退款的商品数字编号
     */
    private Long numIid;

    /**
     * 退货数量
     */
    private Long num;

    /**
     * 商品外部商家编码
     */
    private String outerId;

    /**
     * 退款原因
     */
    private String reason;

    /**
     * 退款阶段，可选值：onsale/aftersale
     */
    private String refundPhase;

    /**
     * 物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).
     */
    private String shippingType;

    /**
     * 退款说明
     */
    private String desc1;

    /**
     * 物流公司
     */
    private String companyName;

    /**
     * 退货运单号
     */
    private String sid;

    /**
     * 买家发货时间
     */
    private String sendTime;

    /**
     * 	完结时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date endTime;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 商品SKU信息
     */
    private String sku;

    /**
     * 买家openUid
     */
    private String buyerOpenUid;

    /**
     * 买家昵称
     */
    private String buyerNick;

    /**
     * 组合品信息
num_iid	String	2342344	商品数字编号
item_name	String	测试商品	商品标题
quantity	Number	123	数量
sku_id	String	123	sku_id
outer_iid	String	123	商家外部编码(可与商家外部系统对接)
outer_sku_id	String	123	123
     */
    private String combineItemInfo;

    /**
     * 订单创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 推送状态（0未推送；1推送成功；2推送失败）
     */
    private Integer pullStatus;

    /**
     * 订单审核时间
     */
    private Date pullTime;

    private static final long serialVersionUID = 1L;
}