package com.qihang.tao.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 淘宝退款订单表
 * @TableName tao_refund
 */
public class TaoRefund implements Serializable {
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
    private String desc;

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

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public Long getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 退款id
     */
    public String getRefundId() {
        return refundId;
    }

    /**
     * 退款id
     */
    public void setRefundId(String refundId) {
        this.refundId = refundId;
    }

    /**
     * 退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
     */
    public String getDisputeType() {
        return disputeType;
    }

    /**
     * 退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)
     */
    public void setDisputeType(String disputeType) {
        this.disputeType = disputeType;
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
     * 淘宝交易单号（订单号）
     */
    public Long getTid() {
        return tid;
    }

    /**
     * 淘宝交易单号（订单号）
     */
    public void setTid(Long tid) {
        this.tid = tid;
    }

    /**
     * 子订单号。如果是单笔交易oid会等于tid
     */
    public Long getOid() {
        return oid;
    }

    /**
     * 子订单号。如果是单笔交易oid会等于tid
     */
    public void setOid(Long oid) {
        this.oid = oid;
    }

    /**
     * 支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public Double getPayment() {
        return payment;
    }

    /**
     * 支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setPayment(Double payment) {
        this.payment = payment;
    }

    /**
     * 商品价格。
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 商品价格。
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public Double getTotalFee() {
        return totalFee;
    }

    /**
     * 交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setTotalFee(Double totalFee) {
        this.totalFee = totalFee;
    }

    /**
     * 退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public Double getRefundFee() {
        return refundFee;
    }

    /**
     * 退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setRefundFee(Double refundFee) {
        this.refundFee = refundFee;
    }

    /**
     * 	分账给卖家的钱
     */
    public Double getSplitSellerFee() {
        return splitSellerFee;
    }

    /**
     * 	分账给卖家的钱
     */
    public void setSplitSellerFee(Double splitSellerFee) {
        this.splitSellerFee = splitSellerFee;
    }

    /**
     * 分账给淘宝的钱
     */
    public Double getSplitTaobaoFee() {
        return splitTaobaoFee;
    }

    /**
     * 分账给淘宝的钱
     */
    public void setSplitTaobaoFee(Double splitTaobaoFee) {
        this.splitTaobaoFee = splitTaobaoFee;
    }

    /**
     * 退款申请时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getCreated() {
        return created;
    }

    /**
     * 退款申请时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setCreated(Date created) {
        this.created = created;
    }

    /**
     * 更新时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getModified() {
        return modified;
    }

    /**
     * 更新时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setModified(Date modified) {
        this.modified = modified;
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
     * 不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;
     */
    public String getCsStatus() {
        return csStatus;
    }

    /**
     * 不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;
     */
    public void setCsStatus(String csStatus) {
        this.csStatus = csStatus;
    }

    /**
     * 退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    public String getStatus() {
        return status;
    }

    /**
     * 退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81"
     */
    public String getOrderStatus() {
        return orderStatus;
    }

    /**
     * 退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81"
     */
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    /**
     * 卖家收货地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 卖家收货地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;
     */
    public String getAdvanceStatus() {
        return advanceStatus;
    }

    /**
     * 退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;
     */
    public void setAdvanceStatus(String advanceStatus) {
        this.advanceStatus = advanceStatus;
    }

    /**
     * 支付宝交易号
     */
    public String getAlipayNo() {
        return alipayNo;
    }

    /**
     * 支付宝交易号
     */
    public void setAlipayNo(String alipayNo) {
        this.alipayNo = alipayNo;
    }

    /**
     * 退货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getGoodReturnTime() {
        return goodReturnTime;
    }

    /**
     * 退货时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setGoodReturnTime(Date goodReturnTime) {
        this.goodReturnTime = goodReturnTime;
    }

    /**
     * 货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)
     */
    public String getGoodStatus() {
        return goodStatus;
    }

    /**
     * 货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)
     */
    public void setGoodStatus(String goodStatus) {
        this.goodStatus = goodStatus;
    }

    /**
     * 买家是否需要退货。可选值:true(是),false(否)
     */
    public Integer getHasGoodReturn() {
        return hasGoodReturn;
    }

    /**
     * 买家是否需要退货。可选值:true(是),false(否)
     */
    public void setHasGoodReturn(Integer hasGoodReturn) {
        this.hasGoodReturn = hasGoodReturn;
    }

    /**
     * 申请退款的商品数字编号
     */
    public Long getNumIid() {
        return numIid;
    }

    /**
     * 申请退款的商品数字编号
     */
    public void setNumIid(Long numIid) {
        this.numIid = numIid;
    }

    /**
     * 退货数量
     */
    public Long getNum() {
        return num;
    }

    /**
     * 退货数量
     */
    public void setNum(Long num) {
        this.num = num;
    }

    /**
     * 商品外部商家编码
     */
    public String getOuterId() {
        return outerId;
    }

    /**
     * 商品外部商家编码
     */
    public void setOuterId(String outerId) {
        this.outerId = outerId;
    }

    /**
     * 退款原因
     */
    public String getReason() {
        return reason;
    }

    /**
     * 退款原因
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * 退款阶段，可选值：onsale/aftersale
     */
    public String getRefundPhase() {
        return refundPhase;
    }

    /**
     * 退款阶段，可选值：onsale/aftersale
     */
    public void setRefundPhase(String refundPhase) {
        this.refundPhase = refundPhase;
    }

    /**
     * 物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).
     */
    public String getShippingType() {
        return shippingType;
    }

    /**
     * 物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).
     */
    public void setShippingType(String shippingType) {
        this.shippingType = shippingType;
    }

    /**
     * 退款说明
     */
    public String getDesc() {
        return desc;
    }

    /**
     * 退款说明
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * 物流公司
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * 物流公司
     */
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    /**
     * 退货运单号
     */
    public String getSid() {
        return sid;
    }

    /**
     * 退货运单号
     */
    public void setSid(String sid) {
        this.sid = sid;
    }

    /**
     * 买家发货时间
     */
    public String getSendTime() {
        return sendTime;
    }

    /**
     * 买家发货时间
     */
    public void setSendTime(String sendTime) {
        this.sendTime = sendTime;
    }

    /**
     * 	完结时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 	完结时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 商品标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 商品标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 商品SKU信息
     */
    public String getSku() {
        return sku;
    }

    /**
     * 商品SKU信息
     */
    public void setSku(String sku) {
        this.sku = sku;
    }

    /**
     * 买家openUid
     */
    public String getBuyerOpenUid() {
        return buyerOpenUid;
    }

    /**
     * 买家openUid
     */
    public void setBuyerOpenUid(String buyerOpenUid) {
        this.buyerOpenUid = buyerOpenUid;
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
     * 组合品信息
num_iid	String	2342344	商品数字编号
item_name	String	测试商品	商品标题
quantity	Number	123	数量
sku_id	String	123	sku_id
outer_iid	String	123	商家外部编码(可与商家外部系统对接)
outer_sku_id	String	123	123
     */
    public String getCombineItemInfo() {
        return combineItemInfo;
    }

    /**
     * 组合品信息
num_iid	String	2342344	商品数字编号
item_name	String	测试商品	商品标题
quantity	Number	123	数量
sku_id	String	123	sku_id
outer_iid	String	123	商家外部编码(可与商家外部系统对接)
outer_sku_id	String	123	123
     */
    public void setCombineItemInfo(String combineItemInfo) {
        this.combineItemInfo = combineItemInfo;
    }

    /**
     * 订单创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 订单创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 创建人
     */
    public String getCreateBy() {
        return createBy;
    }

    /**
     * 创建人
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 更新人
     */
    public String getUpdateBy() {
        return updateBy;
    }

    /**
     * 更新人
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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
        TaoRefund other = (TaoRefund) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getRefundId() == null ? other.getRefundId() == null : this.getRefundId().equals(other.getRefundId()))
            && (this.getDisputeType() == null ? other.getDisputeType() == null : this.getDisputeType().equals(other.getDisputeType()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getTid() == null ? other.getTid() == null : this.getTid().equals(other.getTid()))
            && (this.getOid() == null ? other.getOid() == null : this.getOid().equals(other.getOid()))
            && (this.getPayment() == null ? other.getPayment() == null : this.getPayment().equals(other.getPayment()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getTotalFee() == null ? other.getTotalFee() == null : this.getTotalFee().equals(other.getTotalFee()))
            && (this.getRefundFee() == null ? other.getRefundFee() == null : this.getRefundFee().equals(other.getRefundFee()))
            && (this.getSplitSellerFee() == null ? other.getSplitSellerFee() == null : this.getSplitSellerFee().equals(other.getSplitSellerFee()))
            && (this.getSplitTaobaoFee() == null ? other.getSplitTaobaoFee() == null : this.getSplitTaobaoFee().equals(other.getSplitTaobaoFee()))
            && (this.getCreated() == null ? other.getCreated() == null : this.getCreated().equals(other.getCreated()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getSellerNick() == null ? other.getSellerNick() == null : this.getSellerNick().equals(other.getSellerNick()))
            && (this.getCsStatus() == null ? other.getCsStatus() == null : this.getCsStatus().equals(other.getCsStatus()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getOrderStatus() == null ? other.getOrderStatus() == null : this.getOrderStatus().equals(other.getOrderStatus()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getAdvanceStatus() == null ? other.getAdvanceStatus() == null : this.getAdvanceStatus().equals(other.getAdvanceStatus()))
            && (this.getAlipayNo() == null ? other.getAlipayNo() == null : this.getAlipayNo().equals(other.getAlipayNo()))
            && (this.getGoodReturnTime() == null ? other.getGoodReturnTime() == null : this.getGoodReturnTime().equals(other.getGoodReturnTime()))
            && (this.getGoodStatus() == null ? other.getGoodStatus() == null : this.getGoodStatus().equals(other.getGoodStatus()))
            && (this.getHasGoodReturn() == null ? other.getHasGoodReturn() == null : this.getHasGoodReturn().equals(other.getHasGoodReturn()))
            && (this.getNumIid() == null ? other.getNumIid() == null : this.getNumIid().equals(other.getNumIid()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getOuterId() == null ? other.getOuterId() == null : this.getOuterId().equals(other.getOuterId()))
            && (this.getReason() == null ? other.getReason() == null : this.getReason().equals(other.getReason()))
            && (this.getRefundPhase() == null ? other.getRefundPhase() == null : this.getRefundPhase().equals(other.getRefundPhase()))
            && (this.getShippingType() == null ? other.getShippingType() == null : this.getShippingType().equals(other.getShippingType()))
            && (this.getDesc() == null ? other.getDesc() == null : this.getDesc().equals(other.getDesc()))
            && (this.getCompanyName() == null ? other.getCompanyName() == null : this.getCompanyName().equals(other.getCompanyName()))
            && (this.getSid() == null ? other.getSid() == null : this.getSid().equals(other.getSid()))
            && (this.getSendTime() == null ? other.getSendTime() == null : this.getSendTime().equals(other.getSendTime()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getSku() == null ? other.getSku() == null : this.getSku().equals(other.getSku()))
            && (this.getBuyerOpenUid() == null ? other.getBuyerOpenUid() == null : this.getBuyerOpenUid().equals(other.getBuyerOpenUid()))
            && (this.getBuyerNick() == null ? other.getBuyerNick() == null : this.getBuyerNick().equals(other.getBuyerNick()))
            && (this.getCombineItemInfo() == null ? other.getCombineItemInfo() == null : this.getCombineItemInfo().equals(other.getCombineItemInfo()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getRefundId() == null) ? 0 : getRefundId().hashCode());
        result = prime * result + ((getDisputeType() == null) ? 0 : getDisputeType().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getTid() == null) ? 0 : getTid().hashCode());
        result = prime * result + ((getOid() == null) ? 0 : getOid().hashCode());
        result = prime * result + ((getPayment() == null) ? 0 : getPayment().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getTotalFee() == null) ? 0 : getTotalFee().hashCode());
        result = prime * result + ((getRefundFee() == null) ? 0 : getRefundFee().hashCode());
        result = prime * result + ((getSplitSellerFee() == null) ? 0 : getSplitSellerFee().hashCode());
        result = prime * result + ((getSplitTaobaoFee() == null) ? 0 : getSplitTaobaoFee().hashCode());
        result = prime * result + ((getCreated() == null) ? 0 : getCreated().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getSellerNick() == null) ? 0 : getSellerNick().hashCode());
        result = prime * result + ((getCsStatus() == null) ? 0 : getCsStatus().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getOrderStatus() == null) ? 0 : getOrderStatus().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getAdvanceStatus() == null) ? 0 : getAdvanceStatus().hashCode());
        result = prime * result + ((getAlipayNo() == null) ? 0 : getAlipayNo().hashCode());
        result = prime * result + ((getGoodReturnTime() == null) ? 0 : getGoodReturnTime().hashCode());
        result = prime * result + ((getGoodStatus() == null) ? 0 : getGoodStatus().hashCode());
        result = prime * result + ((getHasGoodReturn() == null) ? 0 : getHasGoodReturn().hashCode());
        result = prime * result + ((getNumIid() == null) ? 0 : getNumIid().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getOuterId() == null) ? 0 : getOuterId().hashCode());
        result = prime * result + ((getReason() == null) ? 0 : getReason().hashCode());
        result = prime * result + ((getRefundPhase() == null) ? 0 : getRefundPhase().hashCode());
        result = prime * result + ((getShippingType() == null) ? 0 : getShippingType().hashCode());
        result = prime * result + ((getDesc() == null) ? 0 : getDesc().hashCode());
        result = prime * result + ((getCompanyName() == null) ? 0 : getCompanyName().hashCode());
        result = prime * result + ((getSid() == null) ? 0 : getSid().hashCode());
        result = prime * result + ((getSendTime() == null) ? 0 : getSendTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getSku() == null) ? 0 : getSku().hashCode());
        result = prime * result + ((getBuyerOpenUid() == null) ? 0 : getBuyerOpenUid().hashCode());
        result = prime * result + ((getBuyerNick() == null) ? 0 : getBuyerNick().hashCode());
        result = prime * result + ((getCombineItemInfo() == null) ? 0 : getCombineItemInfo().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", refundId=").append(refundId);
        sb.append(", disputeType=").append(disputeType);
        sb.append(", shopId=").append(shopId);
        sb.append(", tid=").append(tid);
        sb.append(", oid=").append(oid);
        sb.append(", payment=").append(payment);
        sb.append(", price=").append(price);
        sb.append(", totalFee=").append(totalFee);
        sb.append(", refundFee=").append(refundFee);
        sb.append(", splitSellerFee=").append(splitSellerFee);
        sb.append(", splitTaobaoFee=").append(splitTaobaoFee);
        sb.append(", created=").append(created);
        sb.append(", modified=").append(modified);
        sb.append(", sellerNick=").append(sellerNick);
        sb.append(", csStatus=").append(csStatus);
        sb.append(", status=").append(status);
        sb.append(", orderStatus=").append(orderStatus);
        sb.append(", address=").append(address);
        sb.append(", advanceStatus=").append(advanceStatus);
        sb.append(", alipayNo=").append(alipayNo);
        sb.append(", goodReturnTime=").append(goodReturnTime);
        sb.append(", goodStatus=").append(goodStatus);
        sb.append(", hasGoodReturn=").append(hasGoodReturn);
        sb.append(", numIid=").append(numIid);
        sb.append(", num=").append(num);
        sb.append(", outerId=").append(outerId);
        sb.append(", reason=").append(reason);
        sb.append(", refundPhase=").append(refundPhase);
        sb.append(", shippingType=").append(shippingType);
        sb.append(", desc=").append(desc);
        sb.append(", companyName=").append(companyName);
        sb.append(", sid=").append(sid);
        sb.append(", sendTime=").append(sendTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", title=").append(title);
        sb.append(", sku=").append(sku);
        sb.append(", buyerOpenUid=").append(buyerOpenUid);
        sb.append(", buyerNick=").append(buyerNick);
        sb.append(", combineItemInfo=").append(combineItemInfo);
        sb.append(", createTime=").append(createTime);
        sb.append(", createBy=").append(createBy);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}