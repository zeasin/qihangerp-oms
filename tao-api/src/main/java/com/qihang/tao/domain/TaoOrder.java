package com.qihang.tao.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 淘宝订单表
 * @TableName tao_order
 */
public class TaoOrder implements Serializable {
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
    private Date receivingtime;

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
    private Double yfxFee;

    /**
     * 订单将在此时间前发出，主要用于预售订单
     */
    private String sendTime;

    /**
     * 是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false
     */
    private String isPartConsign;

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    public Long getId() {
        return id;
    }

    /**
     * 主键id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 店铺id
     */
    public Integer getShopId() {
        return shopId;
    }

    /**
     * 店铺id
     */
    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 交易编号 (父订单的交易编号)
     */
    public Long getTid() {
        return tid;
    }

    /**
     * 交易编号 (父订单的交易编号)
     */
    public void setTid(Long tid) {
        this.tid = tid;
    }

    /**
     * 交易标题，以店铺名作为此标题的值。
     */
    public String getTitle() {
        return title;
    }

    /**
     * 交易标题，以店铺名作为此标题的值。
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 交易类型列表，同时查询多种交易类型可用逗号分隔。
     */
    public String getType() {
        return type;
    }

    /**
     * 交易类型列表，同时查询多种交易类型可用逗号分隔。
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5
     */
    public String getSellerFlag() {
        return sellerFlag;
    }

    /**
     * 卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5
     */
    public void setSellerFlag(String sellerFlag) {
        this.sellerFlag = sellerFlag;
    }

    /**
     * 判断订单是否有买家留言，有买家留言返回true，否则返回false
     */
    public String getHasBuyerMessage() {
        return hasBuyerMessage;
    }

    /**
     * 判断订单是否有买家留言，有买家留言返回true，否则返回false
     */
    public void setHasBuyerMessage(String hasBuyerMessage) {
        this.hasBuyerMessage = hasBuyerMessage;
    }

    /**
     * 使用信用卡支付金额数
     */
    public String getCreditCardFee() {
        return creditCardFee;
    }

    /**
     * 使用信用卡支付金额数
     */
    public void setCreditCardFee(String creditCardFee) {
        this.creditCardFee = creditCardFee;
    }

    /**
     * 分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)
     */
    public String getStepTradeStatus() {
        return stepTradeStatus;
    }

    /**
     * 分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)
     */
    public void setStepTradeStatus(String stepTradeStatus) {
        this.stepTradeStatus = stepTradeStatus;
    }

    /**
     * 分阶段付款的已付金额（万人团订单已付金额）
     */
    public String getStepPaidFee() {
        return stepPaidFee;
    }

    /**
     * 分阶段付款的已付金额（万人团订单已付金额）
     */
    public void setStepPaidFee(String stepPaidFee) {
        this.stepPaidFee = stepPaidFee;
    }

    /**
     * 买家OpenUid
     */
    public String getBuyerOpenUid() {
        return buyerOpenUid;
    }

    /**
     * 买家OpenUid
     */
    public void setBuyerOpenUid(String buyerOpenUid) {
        this.buyerOpenUid = buyerOpenUid;
    }

    /**
     * 订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空
     */
    public String getMarkDesc() {
        return markDesc;
    }

    /**
     * 订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空
     */
    public void setMarkDesc(String markDesc) {
        this.markDesc = markDesc;
    }

    /**
     * 买家昵称
     */
    public String getBuyerNick() {
        return buyerNick;
    }

    /**
     * 买家昵称
     */
    public void setBuyerNick(String buyerNick) {
        this.buyerNick = buyerNick;
    }

    /**
     * 商品数字编号
     */
    public String getNumIid() {
        return numIid;
    }

    /**
     * 商品数字编号
     */
    public void setNumIid(String numIid) {
        this.numIid = numIid;
    }

    /**
     * 商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。
     */
    public Integer getNum() {
        return num;
    }

    /**
     * 商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * 商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public Double getTotalFee() {
        return totalFee;
    }

    /**
     * 商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

    /**
     * 卖家手工调整金额，精确到2位小数，单位：元。如：200.07
     */
    public Double getAdjustFee() {
        return adjustFee;
    }

    /**
     * 卖家手工调整金额，精确到2位小数，单位：元。如：200.07
     */
    public void setAdjustFee(Double adjustFee) {
        this.adjustFee = adjustFee;
    }

    /**
     * 邮费
     */
    public BigDecimal getPostFee() {
        return postFee;
    }

    /**
     * 邮费
     */
    public void setPostFee(BigDecimal postFee) {
        this.postFee = postFee;
    }

    /**
     * 优惠金额
     */
    public BigDecimal getDiscountFee() {
        return discountFee;
    }

    /**
     * 优惠金额
     */
    public void setDiscountFee(BigDecimal discountFee) {
        this.discountFee = discountFee;
    }

    /**
     * 实付金额
     */
    public BigDecimal getPayment() {
        return payment;
    }

    /**
     * 实付金额
     */
    public void setPayment(BigDecimal payment) {
        this.payment = payment;
    }

    /**
     * 卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public BigDecimal getReceivedPayment() {
        return receivedPayment;
    }

    /**
     * 卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setReceivedPayment(BigDecimal receivedPayment) {
        this.receivedPayment = receivedPayment;
    }

    /**
     * 交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分
     */
    public Double getAvailableConfirmFee() {
        return availableConfirmFee;
    }

    /**
     * 交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分
     */
    public void setAvailableConfirmFee(Double availableConfirmFee) {
        this.availableConfirmFee = availableConfirmFee;
    }

    /**
     * 货到付款服务费。
     */
    public Double getCodFee() {
        return codFee;
    }

    /**
     * 货到付款服务费。
     */
    public void setCodFee(Double codFee) {
        this.codFee = codFee;
    }

    /**
     * 货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED
     */
    public String getCodStatus() {
        return codStatus;
    }

    /**
     * 货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED
     */
    public void setCodStatus(String codStatus) {
        this.codStatus = codStatus;
    }

    /**
     * 买家货到付款服务费
     */
    public String getBuyerCodFee() {
        return buyerCodFee;
    }

    /**
     * 买家货到付款服务费
     */
    public void setBuyerCodFee(String buyerCodFee) {
        this.buyerCodFee = buyerCodFee;
    }

    /**
     * 卖家货到付款服务费
     */
    public String getSellerCodFee() {
        return sellerCodFee;
    }

    /**
     * 卖家货到付款服务费
     */
    public void setSellerCodFee(String sellerCodFee) {
        this.sellerCodFee = sellerCodFee;
    }

    /**
     * 快递代收款。
     */
    public String getExpressAgencyFee() {
        return expressAgencyFee;
    }

    /**
     * 快递代收款。
     */
    public void setExpressAgencyFee(String expressAgencyFee) {
        this.expressAgencyFee = expressAgencyFee;
    }

    /**
     * 交易佣金。
     */
    public Double getCommissionFee() {
        return commissionFee;
    }

    /**
     * 交易佣金。
     */
    public void setCommissionFee(Double commissionFee) {
        this.commissionFee = commissionFee;
    }

    /**
     * 创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。
     */
    public String getShippingType() {
        return shippingType;
    }

    /**
     * 创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。
     */
    public void setShippingType(String shippingType) {
        this.shippingType = shippingType;
    }

    /**
     * 交易创建时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getCreated() {
        return created;
    }

    /**
     * 交易创建时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setCreated(Date created) {
        this.created = created;
    }

    /**
     * 交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getModified() {
        return modified;
    }

    /**
     * 交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setModified(Date modified) {
        this.modified = modified;
    }

    /**
     * 付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。
     */
    public Date getPayTime() {
        return payTime;
    }

    /**
     * 付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。
     */
    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    /**
     * 卖家发货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getConsignTime() {
        return consignTime;
    }

    /**
     * 卖家发货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    /**
     * 交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 卖家备忘信息
     */
    public String getSellerMemo() {
        return sellerMemo;
    }

    /**
     * 卖家备忘信息
     */
    public void setSellerMemo(String sellerMemo) {
        this.sellerMemo = sellerMemo;
    }

    /**
     * 买家备注
     */
    public String getBuyerMemo() {
        return buyerMemo;
    }

    /**
     * 买家备注
     */
    public void setBuyerMemo(String buyerMemo) {
        this.buyerMemo = buyerMemo;
    }

    /**
     * 买家留言
     */
    public String getBuyerMessage() {
        return buyerMessage;
    }

    /**
     * 买家留言
     */
    public void setBuyerMessage(String buyerMessage) {
        this.buyerMessage = buyerMessage;
    }

    /**
     * 买家使用积分,下单时生成，且一直不变。格式:100;单位:个.
     */
    public String getPointFee() {
        return pointFee;
    }

    /**
     * 买家使用积分,下单时生成，且一直不变。格式:100;单位:个.
     */
    public void setPointFee(String pointFee) {
        this.pointFee = pointFee;
    }

    /**
     * 买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个
     */
    public String getRealPointFee() {
        return realPointFee;
    }

    /**
     * 买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个
     */
    public void setRealPointFee(String realPointFee) {
        this.realPointFee = realPointFee;
    }

    /**
     * 买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。
     */
    public String getBuyerObtainPointFee() {
        return buyerObtainPointFee;
    }

    /**
     * 买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。
     */
    public void setBuyerObtainPointFee(String buyerObtainPointFee) {
        this.buyerObtainPointFee = buyerObtainPointFee;
    }

    /**
     * 收货时间，这里返回的是完全收货时间
     */
    public Date getReceivingtime() {
        return receivingtime;
    }

    /**
     * 收货时间，这里返回的是完全收货时间
     */
    public void setReceivingtime(Date receivingtime) {
        this.receivingtime = receivingtime;
    }

    /**
     * 交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)
     */
    public String getStatus() {
        return status;
    }

    /**
     * 交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 交易备注。
     */
    public String getTradeMemo() {
        return tradeMemo;
    }

    /**
     * 交易备注。
     */
    public void setTradeMemo(String tradeMemo) {
        this.tradeMemo = tradeMemo;
    }

    /**
     * erp发货快递公司
     */
    public String getErpSendCompany() {
        return erpSendCompany;
    }

    /**
     * erp发货快递公司
     */
    public void setErpSendCompany(String erpSendCompany) {
        this.erpSendCompany = erpSendCompany;
    }

    /**
     * erp发货快递单号
     */
    public String getErpSendCode() {
        return erpSendCode;
    }

    /**
     * erp发货快递单号
     */
    public void setErpSendCode(String erpSendCode) {
        this.erpSendCode = erpSendCode;
    }

    /**
     * erp发货状态
     */
    public Integer getErpSendStatus() {
        return erpSendStatus;
    }

    /**
     * erp发货状态
     */
    public void setErpSendStatus(Integer erpSendStatus) {
        this.erpSendStatus = erpSendStatus;
    }

    /**
     * 数据库创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 数据库创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 数据库更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 数据库更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 数据库更新人
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 数据库更新人
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * （收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid
     */
    public String getOaid() {
        return oaid;
    }

    /**
     * （收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid
     */
    public void setOaid(String oaid) {
        this.oaid = oaid;
    }

    /**
     * 地址aid字段
     */
    public String getAid() {
        return aid;
    }

    /**
     * 地址aid字段
     */
    public void setAid(String aid) {
        this.aid = aid;
    }

    /**
     * 收货人国籍
     */
    public String getReceiverCountry() {
        return receiverCountry;
    }

    /**
     * 收货人国籍
     */
    public void setReceiverCountry(String receiverCountry) {
        this.receiverCountry = receiverCountry;
    }

    /**
     * 收货人的所在省份
     */
    public String getReceiverState() {
        return receiverState;
    }

    /**
     * 收货人的所在省份
     */
    public void setReceiverState(String receiverState) {
        this.receiverState = receiverState;
    }

    /**
     * 收货人的所在城市
     */
    public String getReceiverCity() {
        return receiverCity;
    }

    /**
     * 收货人的所在城市
     */
    public void setReceiverCity(String receiverCity) {
        this.receiverCity = receiverCity;
    }

    /**
     * 收货人的所在地区
     */
    public String getReceiverDistrict() {
        return receiverDistrict;
    }

    /**
     * 收货人的所在地区
     */
    public void setReceiverDistrict(String receiverDistrict) {
        this.receiverDistrict = receiverDistrict;
    }

    /**
     * 收货人街道地址
     */
    public String getReceiverTown() {
        return receiverTown;
    }

    /**
     * 收货人街道地址
     */
    public void setReceiverTown(String receiverTown) {
        this.receiverTown = receiverTown;
    }

    /**
     * 收货人的详细地址
     */
    public String getReceiverAddress() {
        return receiverAddress;
    }

    /**
     * 收货人的详细地址
     */
    public void setReceiverAddress(String receiverAddress) {
        this.receiverAddress = receiverAddress;
    }

    /**
     * 收货人的邮编
     */
    public String getReceiverZip() {
        return receiverZip;
    }

    /**
     * 收货人的邮编
     */
    public void setReceiverZip(String receiverZip) {
        this.receiverZip = receiverZip;
    }

    /**
     * 收货人的姓名
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * 收货人的姓名
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * 收货人的手机号码
     */
    public String getReceiverMobile() {
        return receiverMobile;
    }

    /**
     * 收货人的手机号码
     */
    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile;
    }

    /**
     * 收货人的电话号码
     */
    public String getReceiverPhone() {
        return receiverPhone;
    }

    /**
     * 收货人的电话号码
     */
    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    /**
     * 卖家是否已评价。可选值:true(已评价),false(未评价)
     */
    public String getSellerRate() {
        return sellerRate;
    }

    /**
     * 卖家是否已评价。可选值:true(已评价),false(未评价)
     */
    public void setSellerRate(String sellerRate) {
        this.sellerRate = sellerRate;
    }

    /**
     * 卖家昵称
     */
    public String getSellerNick() {
        return sellerNick;
    }

    /**
     * 卖家昵称
     */
    public void setSellerNick(String sellerNick) {
        this.sellerNick = sellerNick;
    }

    /**
     * 买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false
     */
    public String getBuyerRate() {
        return buyerRate;
    }

    /**
     * 买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false
     */
    public void setBuyerRate(String buyerRate) {
        this.buyerRate = buyerRate;
    }

    /**
     * 买家下单的地区
     */
    public String getBuyerArea() {
        return buyerArea;
    }

    /**
     * 买家下单的地区
     */
    public void setBuyerArea(String buyerArea) {
        this.buyerArea = buyerArea;
    }

    /**
     * 支付宝交易号，如：2009112081173831
     */
    public String getAlipayNo() {
        return alipayNo;
    }

    /**
     * 支付宝交易号，如：2009112081173831
     */
    public void setAlipayNo(String alipayNo) {
        this.alipayNo = alipayNo;
    }

    /**
     * 买家支付宝账号
     */
    public String getBuyerAlipayNo() {
        return buyerAlipayNo;
    }

    /**
     * 买家支付宝账号
     */
    public void setBuyerAlipayNo(String buyerAlipayNo) {
        this.buyerAlipayNo = buyerAlipayNo;
    }

    /**
     * 买家邮件地址
     */
    public String getBuyerEmail() {
        return buyerEmail;
    }

    /**
     * 买家邮件地址
     */
    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    /**
     * 卖家支付宝账号
     */
    public String getSellerAlipayNo() {
        return sellerAlipayNo;
    }

    /**
     * 卖家支付宝账号
     */
    public void setSellerAlipayNo(String sellerAlipayNo) {
        this.sellerAlipayNo = sellerAlipayNo;
    }

    /**
     * 是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)
     */
    public String getHasPostFee() {
        return hasPostFee;
    }

    /**
     * 是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)
     */
    public void setHasPostFee(String hasPostFee) {
        this.hasPostFee = hasPostFee;
    }

    /**
     * 超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同
     */
    public String getTimeoutActionTime() {
        return timeoutActionTime;
    }

    /**
     * 超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同
     */
    public void setTimeoutActionTime(String timeoutActionTime) {
        this.timeoutActionTime = timeoutActionTime;
    }

    /**
     * 交易快照地址
     */
    public String getSnapshotUrl() {
        return snapshotUrl;
    }

    /**
     * 交易快照地址
     */
    public void setSnapshotUrl(String snapshotUrl) {
        this.snapshotUrl = snapshotUrl;
    }

    /**
     * 交易促销详细信息
     */
    public String getPromotion() {
        return promotion;
    }

    /**
     * 交易促销详细信息
     */
    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    /**
     * 订单的运费险，单位为元
     */
    public Double getYfxFee() {
        return yfxFee;
    }

    /**
     * 订单的运费险，单位为元
     */
    public void setYfxFee(Double yfxFee) {
        this.yfxFee = yfxFee;
    }

    /**
     * 订单将在此时间前发出，主要用于预售订单
     */
    public String getSendTime() {
        return sendTime;
    }

    /**
     * 订单将在此时间前发出，主要用于预售订单
     */
    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    /**
     * 是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false
     */
    public String getIsPartConsign() {
        return isPartConsign;
    }

    /**
     * 是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false
     */
    public void setIsPartConsign(String isPartConsign) {
        this.isPartConsign = isPartConsign;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        TaoOrder other = (TaoOrder) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getTid() == null ? other.getTid() == null : this.getTid().equals(other.getTid()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getSellerFlag() == null ? other.getSellerFlag() == null : this.getSellerFlag().equals(other.getSellerFlag()))
            && (this.getHasBuyerMessage() == null ? other.getHasBuyerMessage() == null : this.getHasBuyerMessage().equals(other.getHasBuyerMessage()))
            && (this.getCreditCardFee() == null ? other.getCreditCardFee() == null : this.getCreditCardFee().equals(other.getCreditCardFee()))
            && (this.getStepTradeStatus() == null ? other.getStepTradeStatus() == null : this.getStepTradeStatus().equals(other.getStepTradeStatus()))
            && (this.getStepPaidFee() == null ? other.getStepPaidFee() == null : this.getStepPaidFee().equals(other.getStepPaidFee()))
            && (this.getBuyerOpenUid() == null ? other.getBuyerOpenUid() == null : this.getBuyerOpenUid().equals(other.getBuyerOpenUid()))
            && (this.getMarkDesc() == null ? other.getMarkDesc() == null : this.getMarkDesc().equals(other.getMarkDesc()))
            && (this.getBuyerNick() == null ? other.getBuyerNick() == null : this.getBuyerNick().equals(other.getBuyerNick()))
            && (this.getNumIid() == null ? other.getNumIid() == null : this.getNumIid().equals(other.getNumIid()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getTotalFee() == null ? other.getTotalFee() == null : this.getTotalFee().equals(other.getTotalFee()))
            && (this.getAdjustFee() == null ? other.getAdjustFee() == null : this.getAdjustFee().equals(other.getAdjustFee()))
            && (this.getPostFee() == null ? other.getPostFee() == null : this.getPostFee().equals(other.getPostFee()))
            && (this.getDiscountFee() == null ? other.getDiscountFee() == null : this.getDiscountFee().equals(other.getDiscountFee()))
            && (this.getPayment() == null ? other.getPayment() == null : this.getPayment().equals(other.getPayment()))
            && (this.getReceivedPayment() == null ? other.getReceivedPayment() == null : this.getReceivedPayment().equals(other.getReceivedPayment()))
            && (this.getAvailableConfirmFee() == null ? other.getAvailableConfirmFee() == null : this.getAvailableConfirmFee().equals(other.getAvailableConfirmFee()))
            && (this.getCodFee() == null ? other.getCodFee() == null : this.getCodFee().equals(other.getCodFee()))
            && (this.getCodStatus() == null ? other.getCodStatus() == null : this.getCodStatus().equals(other.getCodStatus()))
            && (this.getBuyerCodFee() == null ? other.getBuyerCodFee() == null : this.getBuyerCodFee().equals(other.getBuyerCodFee()))
            && (this.getSellerCodFee() == null ? other.getSellerCodFee() == null : this.getSellerCodFee().equals(other.getSellerCodFee()))
            && (this.getExpressAgencyFee() == null ? other.getExpressAgencyFee() == null : this.getExpressAgencyFee().equals(other.getExpressAgencyFee()))
            && (this.getCommissionFee() == null ? other.getCommissionFee() == null : this.getCommissionFee().equals(other.getCommissionFee()))
            && (this.getShippingType() == null ? other.getShippingType() == null : this.getShippingType().equals(other.getShippingType()))
            && (this.getCreated() == null ? other.getCreated() == null : this.getCreated().equals(other.getCreated()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getPayTime() == null ? other.getPayTime() == null : this.getPayTime().equals(other.getPayTime()))
            && (this.getConsignTime() == null ? other.getConsignTime() == null : this.getConsignTime().equals(other.getConsignTime()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
            && (this.getSellerMemo() == null ? other.getSellerMemo() == null : this.getSellerMemo().equals(other.getSellerMemo()))
            && (this.getBuyerMemo() == null ? other.getBuyerMemo() == null : this.getBuyerMemo().equals(other.getBuyerMemo()))
            && (this.getBuyerMessage() == null ? other.getBuyerMessage() == null : this.getBuyerMessage().equals(other.getBuyerMessage()))
            && (this.getPointFee() == null ? other.getPointFee() == null : this.getPointFee().equals(other.getPointFee()))
            && (this.getRealPointFee() == null ? other.getRealPointFee() == null : this.getRealPointFee().equals(other.getRealPointFee()))
            && (this.getBuyerObtainPointFee() == null ? other.getBuyerObtainPointFee() == null : this.getBuyerObtainPointFee().equals(other.getBuyerObtainPointFee()))
            && (this.getReceivingtime() == null ? other.getReceivingtime() == null : this.getReceivingtime().equals(other.getReceivingtime()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getTradeMemo() == null ? other.getTradeMemo() == null : this.getTradeMemo().equals(other.getTradeMemo()))
            && (this.getErpSendCompany() == null ? other.getErpSendCompany() == null : this.getErpSendCompany().equals(other.getErpSendCompany()))
            && (this.getErpSendCode() == null ? other.getErpSendCode() == null : this.getErpSendCode().equals(other.getErpSendCode()))
            && (this.getErpSendStatus() == null ? other.getErpSendStatus() == null : this.getErpSendStatus().equals(other.getErpSendStatus()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
            && (this.getOaid() == null ? other.getOaid() == null : this.getOaid().equals(other.getOaid()))
            && (this.getAid() == null ? other.getAid() == null : this.getAid().equals(other.getAid()))
            && (this.getReceiverCountry() == null ? other.getReceiverCountry() == null : this.getReceiverCountry().equals(other.getReceiverCountry()))
            && (this.getReceiverState() == null ? other.getReceiverState() == null : this.getReceiverState().equals(other.getReceiverState()))
            && (this.getReceiverCity() == null ? other.getReceiverCity() == null : this.getReceiverCity().equals(other.getReceiverCity()))
            && (this.getReceiverDistrict() == null ? other.getReceiverDistrict() == null : this.getReceiverDistrict().equals(other.getReceiverDistrict()))
            && (this.getReceiverTown() == null ? other.getReceiverTown() == null : this.getReceiverTown().equals(other.getReceiverTown()))
            && (this.getReceiverAddress() == null ? other.getReceiverAddress() == null : this.getReceiverAddress().equals(other.getReceiverAddress()))
            && (this.getReceiverZip() == null ? other.getReceiverZip() == null : this.getReceiverZip().equals(other.getReceiverZip()))
            && (this.getReceiverName() == null ? other.getReceiverName() == null : this.getReceiverName().equals(other.getReceiverName()))
            && (this.getReceiverMobile() == null ? other.getReceiverMobile() == null : this.getReceiverMobile().equals(other.getReceiverMobile()))
            && (this.getReceiverPhone() == null ? other.getReceiverPhone() == null : this.getReceiverPhone().equals(other.getReceiverPhone()))
            && (this.getSellerRate() == null ? other.getSellerRate() == null : this.getSellerRate().equals(other.getSellerRate()))
            && (this.getSellerNick() == null ? other.getSellerNick() == null : this.getSellerNick().equals(other.getSellerNick()))
            && (this.getBuyerRate() == null ? other.getBuyerRate() == null : this.getBuyerRate().equals(other.getBuyerRate()))
            && (this.getBuyerArea() == null ? other.getBuyerArea() == null : this.getBuyerArea().equals(other.getBuyerArea()))
            && (this.getAlipayNo() == null ? other.getAlipayNo() == null : this.getAlipayNo().equals(other.getAlipayNo()))
            && (this.getBuyerAlipayNo() == null ? other.getBuyerAlipayNo() == null : this.getBuyerAlipayNo().equals(other.getBuyerAlipayNo()))
            && (this.getBuyerEmail() == null ? other.getBuyerEmail() == null : this.getBuyerEmail().equals(other.getBuyerEmail()))
            && (this.getSellerAlipayNo() == null ? other.getSellerAlipayNo() == null : this.getSellerAlipayNo().equals(other.getSellerAlipayNo()))
            && (this.getHasPostFee() == null ? other.getHasPostFee() == null : this.getHasPostFee().equals(other.getHasPostFee()))
            && (this.getTimeoutActionTime() == null ? other.getTimeoutActionTime() == null : this.getTimeoutActionTime().equals(other.getTimeoutActionTime()))
            && (this.getSnapshotUrl() == null ? other.getSnapshotUrl() == null : this.getSnapshotUrl().equals(other.getSnapshotUrl()))
            && (this.getPromotion() == null ? other.getPromotion() == null : this.getPromotion().equals(other.getPromotion()))
            && (this.getYfxFee() == null ? other.getYfxFee() == null : this.getYfxFee().equals(other.getYfxFee()))
            && (this.getSendTime() == null ? other.getSendTime() == null : this.getSendTime().equals(other.getSendTime()))
            && (this.getIsPartConsign() == null ? other.getIsPartConsign() == null : this.getIsPartConsign().equals(other.getIsPartConsign()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getTid() == null) ? 0 : getTid().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getSellerFlag() == null) ? 0 : getSellerFlag().hashCode());
        result = prime * result + ((getHasBuyerMessage() == null) ? 0 : getHasBuyerMessage().hashCode());
        result = prime * result + ((getCreditCardFee() == null) ? 0 : getCreditCardFee().hashCode());
        result = prime * result + ((getStepTradeStatus() == null) ? 0 : getStepTradeStatus().hashCode());
        result = prime * result + ((getStepPaidFee() == null) ? 0 : getStepPaidFee().hashCode());
        result = prime * result + ((getBuyerOpenUid() == null) ? 0 : getBuyerOpenUid().hashCode());
        result = prime * result + ((getMarkDesc() == null) ? 0 : getMarkDesc().hashCode());
        result = prime * result + ((getBuyerNick() == null) ? 0 : getBuyerNick().hashCode());
        result = prime * result + ((getNumIid() == null) ? 0 : getNumIid().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getTotalFee() == null) ? 0 : getTotalFee().hashCode());
        result = prime * result + ((getAdjustFee() == null) ? 0 : getAdjustFee().hashCode());
        result = prime * result + ((getPostFee() == null) ? 0 : getPostFee().hashCode());
        result = prime * result + ((getDiscountFee() == null) ? 0 : getDiscountFee().hashCode());
        result = prime * result + ((getPayment() == null) ? 0 : getPayment().hashCode());
        result = prime * result + ((getReceivedPayment() == null) ? 0 : getReceivedPayment().hashCode());
        result = prime * result + ((getAvailableConfirmFee() == null) ? 0 : getAvailableConfirmFee().hashCode());
        result = prime * result + ((getCodFee() == null) ? 0 : getCodFee().hashCode());
        result = prime * result + ((getCodStatus() == null) ? 0 : getCodStatus().hashCode());
        result = prime * result + ((getBuyerCodFee() == null) ? 0 : getBuyerCodFee().hashCode());
        result = prime * result + ((getSellerCodFee() == null) ? 0 : getSellerCodFee().hashCode());
        result = prime * result + ((getExpressAgencyFee() == null) ? 0 : getExpressAgencyFee().hashCode());
        result = prime * result + ((getCommissionFee() == null) ? 0 : getCommissionFee().hashCode());
        result = prime * result + ((getShippingType() == null) ? 0 : getShippingType().hashCode());
        result = prime * result + ((getCreated() == null) ? 0 : getCreated().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getPayTime() == null) ? 0 : getPayTime().hashCode());
        result = prime * result + ((getConsignTime() == null) ? 0 : getConsignTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        result = prime * result + ((getSellerMemo() == null) ? 0 : getSellerMemo().hashCode());
        result = prime * result + ((getBuyerMemo() == null) ? 0 : getBuyerMemo().hashCode());
        result = prime * result + ((getBuyerMessage() == null) ? 0 : getBuyerMessage().hashCode());
        result = prime * result + ((getPointFee() == null) ? 0 : getPointFee().hashCode());
        result = prime * result + ((getRealPointFee() == null) ? 0 : getRealPointFee().hashCode());
        result = prime * result + ((getBuyerObtainPointFee() == null) ? 0 : getBuyerObtainPointFee().hashCode());
        result = prime * result + ((getReceivingtime() == null) ? 0 : getReceivingtime().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getTradeMemo() == null) ? 0 : getTradeMemo().hashCode());
        result = prime * result + ((getErpSendCompany() == null) ? 0 : getErpSendCompany().hashCode());
        result = prime * result + ((getErpSendCode() == null) ? 0 : getErpSendCode().hashCode());
        result = prime * result + ((getErpSendStatus() == null) ? 0 : getErpSendStatus().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getOaid() == null) ? 0 : getOaid().hashCode());
        result = prime * result + ((getAid() == null) ? 0 : getAid().hashCode());
        result = prime * result + ((getReceiverCountry() == null) ? 0 : getReceiverCountry().hashCode());
        result = prime * result + ((getReceiverState() == null) ? 0 : getReceiverState().hashCode());
        result = prime * result + ((getReceiverCity() == null) ? 0 : getReceiverCity().hashCode());
        result = prime * result + ((getReceiverDistrict() == null) ? 0 : getReceiverDistrict().hashCode());
        result = prime * result + ((getReceiverTown() == null) ? 0 : getReceiverTown().hashCode());
        result = prime * result + ((getReceiverAddress() == null) ? 0 : getReceiverAddress().hashCode());
        result = prime * result + ((getReceiverZip() == null) ? 0 : getReceiverZip().hashCode());
        result = prime * result + ((getReceiverName() == null) ? 0 : getReceiverName().hashCode());
        result = prime * result + ((getReceiverMobile() == null) ? 0 : getReceiverMobile().hashCode());
        result = prime * result + ((getReceiverPhone() == null) ? 0 : getReceiverPhone().hashCode());
        result = prime * result + ((getSellerRate() == null) ? 0 : getSellerRate().hashCode());
        result = prime * result + ((getSellerNick() == null) ? 0 : getSellerNick().hashCode());
        result = prime * result + ((getBuyerRate() == null) ? 0 : getBuyerRate().hashCode());
        result = prime * result + ((getBuyerArea() == null) ? 0 : getBuyerArea().hashCode());
        result = prime * result + ((getAlipayNo() == null) ? 0 : getAlipayNo().hashCode());
        result = prime * result + ((getBuyerAlipayNo() == null) ? 0 : getBuyerAlipayNo().hashCode());
        result = prime * result + ((getBuyerEmail() == null) ? 0 : getBuyerEmail().hashCode());
        result = prime * result + ((getSellerAlipayNo() == null) ? 0 : getSellerAlipayNo().hashCode());
        result = prime * result + ((getHasPostFee() == null) ? 0 : getHasPostFee().hashCode());
        result = prime * result + ((getTimeoutActionTime() == null) ? 0 : getTimeoutActionTime().hashCode());
        result = prime * result + ((getSnapshotUrl() == null) ? 0 : getSnapshotUrl().hashCode());
        result = prime * result + ((getPromotion() == null) ? 0 : getPromotion().hashCode());
        result = prime * result + ((getYfxFee() == null) ? 0 : getYfxFee().hashCode());
        result = prime * result + ((getSendTime() == null) ? 0 : getSendTime().hashCode());
        result = prime * result + ((getIsPartConsign() == null) ? 0 : getIsPartConsign().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", shopId=").append(shopId);
        sb.append(", tid=").append(tid);
        sb.append(", title=").append(title);
        sb.append(", type=").append(type);
        sb.append(", sellerFlag=").append(sellerFlag);
        sb.append(", hasBuyerMessage=").append(hasBuyerMessage);
        sb.append(", creditCardFee=").append(creditCardFee);
        sb.append(", stepTradeStatus=").append(stepTradeStatus);
        sb.append(", stepPaidFee=").append(stepPaidFee);
        sb.append(", buyerOpenUid=").append(buyerOpenUid);
        sb.append(", markDesc=").append(markDesc);
        sb.append(", buyerNick=").append(buyerNick);
        sb.append(", numIid=").append(numIid);
        sb.append(", num=").append(num);
        sb.append(", price=").append(price);
        sb.append(", totalFee=").append(totalFee);
        sb.append(", adjustFee=").append(adjustFee);
        sb.append(", postFee=").append(postFee);
        sb.append(", discountFee=").append(discountFee);
        sb.append(", payment=").append(payment);
        sb.append(", receivedPayment=").append(receivedPayment);
        sb.append(", availableConfirmFee=").append(availableConfirmFee);
        sb.append(", codFee=").append(codFee);
        sb.append(", codStatus=").append(codStatus);
        sb.append(", buyerCodFee=").append(buyerCodFee);
        sb.append(", sellerCodFee=").append(sellerCodFee);
        sb.append(", expressAgencyFee=").append(expressAgencyFee);
        sb.append(", commissionFee=").append(commissionFee);
        sb.append(", shippingType=").append(shippingType);
        sb.append(", created=").append(created);
        sb.append(", modified=").append(modified);
        sb.append(", payTime=").append(payTime);
        sb.append(", consignTime=").append(consignTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", sellerMemo=").append(sellerMemo);
        sb.append(", buyerMemo=").append(buyerMemo);
        sb.append(", buyerMessage=").append(buyerMessage);
        sb.append(", pointFee=").append(pointFee);
        sb.append(", realPointFee=").append(realPointFee);
        sb.append(", buyerObtainPointFee=").append(buyerObtainPointFee);
        sb.append(", receivingtime=").append(receivingtime);
        sb.append(", status=").append(status);
        sb.append(", tradeMemo=").append(tradeMemo);
        sb.append(", erpSendCompany=").append(erpSendCompany);
        sb.append(", erpSendCode=").append(erpSendCode);
        sb.append(", erpSendStatus=").append(erpSendStatus);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", oaid=").append(oaid);
        sb.append(", aid=").append(aid);
        sb.append(", receiverCountry=").append(receiverCountry);
        sb.append(", receiverState=").append(receiverState);
        sb.append(", receiverCity=").append(receiverCity);
        sb.append(", receiverDistrict=").append(receiverDistrict);
        sb.append(", receiverTown=").append(receiverTown);
        sb.append(", receiverAddress=").append(receiverAddress);
        sb.append(", receiverZip=").append(receiverZip);
        sb.append(", receiverName=").append(receiverName);
        sb.append(", receiverMobile=").append(receiverMobile);
        sb.append(", receiverPhone=").append(receiverPhone);
        sb.append(", sellerRate=").append(sellerRate);
        sb.append(", sellerNick=").append(sellerNick);
        sb.append(", buyerRate=").append(buyerRate);
        sb.append(", buyerArea=").append(buyerArea);
        sb.append(", alipayNo=").append(alipayNo);
        sb.append(", buyerAlipayNo=").append(buyerAlipayNo);
        sb.append(", buyerEmail=").append(buyerEmail);
        sb.append(", sellerAlipayNo=").append(sellerAlipayNo);
        sb.append(", hasPostFee=").append(hasPostFee);
        sb.append(", timeoutActionTime=").append(timeoutActionTime);
        sb.append(", snapshotUrl=").append(snapshotUrl);
        sb.append(", promotion=").append(promotion);
        sb.append(", yfxFee=").append(yfxFee);
        sb.append(", sendTime=").append(sendTime);
        sb.append(", isPartConsign=").append(isPartConsign);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}