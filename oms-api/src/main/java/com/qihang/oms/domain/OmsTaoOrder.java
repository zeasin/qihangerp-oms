package com.qihang.oms.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * 淘宝订单表
 * @TableName oms_tao_order
 */
@Data
public class OmsTaoOrder implements Serializable {
    /**
     * 主键id
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 交易编号 (父订单的交易编号)
     */
    private Long tid;

    /**
     * 交易标题，以店铺名作为此标题的值。
     */
    private String title;

    /**
     * 交易类型列表，同时查询多种交易类型可用逗号分隔。
     */
    private String type;

    /**
     * 卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5
     */
    private String sellerFlag;

    /**
     * 判断订单是否有买家留言，有买家留言返回true，否则返回false
     */
    private String hasBuyerMessage;

    /**
     * 使用信用卡支付金额数
     */
    private String creditCardFee;

    /**
     * 分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)
     */
    private String stepTradeStatus;

    /**
     * 分阶段付款的已付金额（万人团订单已付金额）
     */
    private String stepPaidFee;

    /**
     * 买家OpenUid
     */
    private String buyerOpenUid;

    /**
     * 订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空
     */
    private String markDesc;

    /**
     * 买家昵称
     */
    private String buyerNick;

    /**
     * 商品数字编号
     */
    private String numIid;

    /**
     * 商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。
     */
    private Integer num;

    /**
     * 商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分
     */
    private Double price;

    /**
     * 商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private Double totalFee;

    /**
     * 卖家手工调整金额，精确到2位小数，单位：元。如：200.07
     */
    private Double adjustFee;

    /**
     * 邮费
     */
    private BigDecimal postFee;

    /**
     * 优惠金额
     */
    private BigDecimal discountFee;

    /**
     * 实付金额
     */
    private BigDecimal payment;

    /**
     * 卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private BigDecimal receivedPayment;

    /**
     * 交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分
     */
    private Double availableConfirmFee;

    /**
     * 货到付款服务费。
     */
    private Double codFee;

    /**
     * 货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED
     */
    private String codStatus;

    /**
     * 买家货到付款服务费
     */
    private String buyerCodFee;

    /**
     * 卖家货到付款服务费
     */
    private String sellerCodFee;

    /**
     * 快递代收款。
     */
    private String expressAgencyFee;

    /**
     * 交易佣金。
     */
    private Double commissionFee;

    /**
     * 创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。
     */
    private String shippingType;

    /**
     * 交易创建时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date created;

    /**
     * 交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date modified;

    /**
     * 付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。
     */
    private Date payTime;

    /**
     * 卖家发货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date consignTime;

    /**
     * 交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date endTime;

    /**
     * 卖家备忘信息
     */
    private String sellerMemo;

    /**
     * 买家备注
     */
    private String buyerMemo;

    /**
     * 买家留言
     */
    private String buyerMessage;

    /**
     * 买家使用积分,下单时生成，且一直不变。格式:100;单位:个.
     */
    private String pointFee;

    /**
     * 买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个
     */
    private String realPointFee;

    /**
     * 买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。
     */
    private String buyerObtainPointFee;

    /**
     * 收货时间，这里返回的是完全收货时间
     */
    private Date receivingTime;

    /**
     * 交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)
     */
    private String status;

    /**
     * 交易备注。
     */
    private String tradeMemo;

    /**
     * erp发货快递公司
     */
    private String erpSendCompany;

    /**
     * erp发货快递单号
     */
    private String erpSendCode;

    /**
     * erp发货状态
     */
    private Integer erpSendStatus;

    /**
     * 数据库创建时间
     */
    private Date createTime;

    /**
     * 数据库更新时间
     */
    private Date updateTime;

    /**
     * 数据库更新人
     */
    private String updateBy;

    /**
     * （收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid
     */
    private String oaid;

    /**
     * 地址aid字段
     */
    private String aid;

    /**
     * 收货人国籍
     */
    private String receiverCountry;

    /**
     * 收货人的所在省份
     */
    private String receiverState;

    /**
     * 收货人的所在城市
     */
    private String receiverCity;

    /**
     * 收货人的所在地区
     */
    private String receiverDistrict;

    /**
     * 收货人街道地址
     */
    private String receiverTown;

    /**
     * 收货人的详细地址
     */
    private String receiverAddress;

    /**
     * 收货人的邮编
     */
    private String receiverZip;

    /**
     * 收货人的姓名
     */
    private String receiverName;

    /**
     * 收货人的手机号码
     */
    private String receiverMobile;

    /**
     * 收货人的电话号码
     */
    private String receiverPhone;

    /**
     * 卖家是否已评价。可选值:true(已评价),false(未评价)
     */
    private String sellerRate;

    /**
     * 卖家昵称
     */
    private String sellerNick;

    /**
     * 买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false
     */
    private String buyerRate;

    /**
     * 买家下单的地区
     */
    private String buyerArea;

    /**
     * 支付宝交易号，如：2009112081173831
     */
    private String alipayNo;

    /**
     * 买家支付宝账号
     */
    private String buyerAlipayNo;

    /**
     * 买家邮件地址
     */
    private String buyerEmail;

    /**
     * 卖家支付宝账号
     */
    private String sellerAlipayNo;

    /**
     * 是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)
     */
    private String hasPostFee;

    /**
     * 超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同
     */
    private String timeoutActionTime;

    /**
     * 交易快照地址
     */
    private String snapshotUrl;

    /**
     * 交易促销详细信息
     */
    private String promotion;

    /**
     * 订单的运费险，单位为元
     */
    private String yfxFee;

    /**
     * 订单中是否包含运费险订单，如果包含运费险订单返回true，不包含运费险订单，返回false
     */
    private String hasYfx;

    /**
     * 订单将在此时间前发出，主要用于预售订单
     */
    private String sendTime;

    /**
     * 是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false
     */
    private String isPartConsign;

    /**
     * 物流运单号
     */
    private String sid;

    /**
     * 天猫商家使用，订单使用的红包信息
     */
    private Long tmallCouponFee;

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