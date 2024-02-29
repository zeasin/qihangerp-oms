package com.qihang.tao.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 淘宝订单明细表
 * @TableName tao_order_item
 */
public class TaoOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 订单id
     */
    private Long tid;

    /**
     * 子订单编号
     */
    private Long oid;

    /**
     * 应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private BigDecimal totalFee;

    /**
     * 子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    private BigDecimal discountFee;

    /**
     * 手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.
     */
    private BigDecimal adjustFee;

    /**
     * 分摊之后的实付金额
     */
    private Double divideOrderFee;

    /**
     * 优惠分摊
     */
    private Double partMjzDiscount;

    /**
     * 子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。
     */
    private Double payment;

    /**
     * 商品标题
     */
    private String title;

    /**
     * 商品主图
     */
    private String picPath;

    /**
     * 商品价格
     */
    private BigDecimal price;

    /**
     * 商品数字ID
     */
    private Long numIid;

    /**
     * 商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID
     */
    private Long skuId;

    /**
     * 商家外部编码(可与商家外部系统对接)。
     */
    private String outerIid;

    /**
     * 外部网店自己定义的Sku编号
     */
    private String outerSkuId;

    /**
     * SKU的值。如：机身颜色:黑色;手机套餐:官方标配
     */
    private String skuPropertiesName;

    /**
     * 套餐ID
     */
    private String itemMealId;

    /**
     * 套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋
     */
    private String itemMealName;

    /**
     * 数量
     */
    private Integer num;

    /**
     * 订单快照URL
     */
    private String snapshotUrl;

    /**
     * 订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss
     */
    private Date timeoutActionTime;

    /**
     * 商品备注
     */
    private String itemMemo;

    /**
     * 买家是否已评价。可选值：true(已评价)，false(未评价)
     */
    private String buyerRate;

    /**
     * 卖家是否已评价。可选值：true(已评价)，false(未评价)
     */
    private String sellerRate;

    /**
     * 卖家类型，可选值为：B（商城商家），C（普通卖家）
     */
    private String sellerType;

    /**
     * 交易商品对应的类目ID
     */
    private Long cid;

    /**
     * 	是否超卖
     */
    private String isOversold;

    /**
     * 子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断
     */
    private Date endTime;

    /**
     * 子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)
     */
    private String orderFrom;

    /**
     * 是否是服务订单，是返回true，否返回false。
     */
    private String isServiceOrder;

    /**
     * 子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）
     */
    private Date consignTime;

    /**
     * 子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）
     */
    private String shippingType;

    /**
     * 子订单发货的快递公司名称
     */
    private String logisticsCompany;

    /**
     * 子订单所在包裹的运单号
     */
    private String invoiceNo;

    /**
     * 捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货
     */
    private String bindOid;

    /**
     * 订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:
TRADE_NO_CREATE_PAY(没有创建支付宝交易)
WAIT_BUYER_PAY(等待买家付款)
WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)
WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)
TRADE_BUYER_SIGNED(买家已签收,货到付款专用)
TRADE_FINISHED(交易成功)
TRADE_CLOSED(付款以后用户退款成功，交易自动关闭)
TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)
PAY_PENDING(国际信用卡支付付款确认中)
     */
    private String status;

    /**
     * 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    private String refundStatus;

    /**
     * 最近退款ID
     */
    private String refundId;

    /**
     * 
     */
    private String remark;

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
     * 订单id
     */
    public Long getTid() {
        return tid;
    }

    /**
     * 订单id
     */
    public void setTid(Long tid) {
        this.tid = tid;
    }

    /**
     * 子订单编号
     */
    public Long getOid() {
        return oid;
    }

    /**
     * 子订单编号
     */
    public void setOid(Long oid) {
        this.oid = oid;
    }

    /**
     * 应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public BigDecimal getTotalFee() {
        return totalFee;
    }

    /**
     * 应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setTotalFee(BigDecimal totalFee) {
        this.totalFee = totalFee;
    }

    /**
     * 子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public BigDecimal getDiscountFee() {
        return discountFee;
    }

    /**
     * 子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     */
    public void setDiscountFee(BigDecimal discountFee) {
        this.discountFee = discountFee;
    }

    /**
     * 手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.
     */
    public BigDecimal getAdjustFee() {
        return adjustFee;
    }

    /**
     * 手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.
     */
    public void setAdjustFee(BigDecimal adjustFee) {
        this.adjustFee = adjustFee;
    }

    /**
     * 分摊之后的实付金额
     */
    public Double getDivideOrderFee() {
        return divideOrderFee;
    }

    /**
     * 分摊之后的实付金额
     */
    public void setDivideOrderFee(Double divideOrderFee) {
        this.divideOrderFee = divideOrderFee;
    }

    /**
     * 优惠分摊
     */
    public Double getPartMjzDiscount() {
        return partMjzDiscount;
    }

    /**
     * 优惠分摊
     */
    public void setPartMjzDiscount(Double partMjzDiscount) {
        this.partMjzDiscount = partMjzDiscount;
    }

    /**
     * 子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。
     */
    public Double getPayment() {
        return payment;
    }

    /**
     * 子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。
     */
    public void setPayment(Double payment) {
        this.payment = payment;
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
     * 商品主图
     */
    public String getPicPath() {
        return picPath;
    }

    /**
     * 商品主图
     */
    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    /**
     * 商品价格
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * 商品价格
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * 商品数字ID
     */
    public Long getNumIid() {
        return numIid;
    }

    /**
     * 商品数字ID
     */
    public void setNumIid(Long numIid) {
        this.numIid = numIid;
    }

    /**
     * 商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * 商家外部编码(可与商家外部系统对接)。
     */
    public String getOuterIid() {
        return outerIid;
    }

    /**
     * 商家外部编码(可与商家外部系统对接)。
     */
    public void setOuterIid(String outerIid) {
        this.outerIid = outerIid;
    }

    /**
     * 外部网店自己定义的Sku编号
     */
    public String getOuterSkuId() {
        return outerSkuId;
    }

    /**
     * 外部网店自己定义的Sku编号
     */
    public void setOuterSkuId(String outerSkuId) {
        this.outerSkuId = outerSkuId;
    }

    /**
     * SKU的值。如：机身颜色:黑色;手机套餐:官方标配
     */
    public String getSkuPropertiesName() {
        return skuPropertiesName;
    }

    /**
     * SKU的值。如：机身颜色:黑色;手机套餐:官方标配
     */
    public void setSkuPropertiesName(String skuPropertiesName) {
        this.skuPropertiesName = skuPropertiesName;
    }

    /**
     * 套餐ID
     */
    public String getItemMealId() {
        return itemMealId;
    }

    /**
     * 套餐ID
     */
    public void setItemMealId(String itemMealId) {
        this.itemMealId = itemMealId;
    }

    /**
     * 套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋
     */
    public String getItemMealName() {
        return itemMealName;
    }

    /**
     * 套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋
     */
    public void setItemMealName(String itemMealName) {
        this.itemMealName = itemMealName;
    }

    /**
     * 数量
     */
    public Integer getNum() {
        return num;
    }

    /**
     * 数量
     */
    public void setNum(Integer num) {
        this.num = num;
    }

    /**
     * 订单快照URL
     */
    public String getSnapshotUrl() {
        return snapshotUrl;
    }

    /**
     * 订单快照URL
     */
    public void setSnapshotUrl(String snapshotUrl) {
        this.snapshotUrl = snapshotUrl;
    }

    /**
     * 订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public Date getTimeoutActionTime() {
        return timeoutActionTime;
    }

    /**
     * 订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss
     */
    public void setTimeoutActionTime(Date timeoutActionTime) {
        this.timeoutActionTime = timeoutActionTime;
    }

    /**
     * 商品备注
     */
    public String getItemMemo() {
        return itemMemo;
    }

    /**
     * 商品备注
     */
    public void setItemMemo(String itemMemo) {
        this.itemMemo = itemMemo;
    }

    /**
     * 买家是否已评价。可选值：true(已评价)，false(未评价)
     */
    public String getBuyerRate() {
        return buyerRate;
    }

    /**
     * 买家是否已评价。可选值：true(已评价)，false(未评价)
     */
    public void setBuyerRate(String buyerRate) {
        this.buyerRate = buyerRate;
    }

    /**
     * 卖家是否已评价。可选值：true(已评价)，false(未评价)
     */
    public String getSellerRate() {
        return sellerRate;
    }

    /**
     * 卖家是否已评价。可选值：true(已评价)，false(未评价)
     */
    public void setSellerRate(String sellerRate) {
        this.sellerRate = sellerRate;
    }

    /**
     * 卖家类型，可选值为：B（商城商家），C（普通卖家）
     */
    public String getSellerType() {
        return sellerType;
    }

    /**
     * 卖家类型，可选值为：B（商城商家），C（普通卖家）
     */
    public void setSellerType(String sellerType) {
        this.sellerType = sellerType;
    }

    /**
     * 交易商品对应的类目ID
     */
    public Long getCid() {
        return cid;
    }

    /**
     * 交易商品对应的类目ID
     */
    public void setCid(Long cid) {
        this.cid = cid;
    }

    /**
     * 	是否超卖
     */
    public String getIsOversold() {
        return isOversold;
    }

    /**
     * 	是否超卖
     */
    public void setIsOversold(String isOversold) {
        this.isOversold = isOversold;
    }

    /**
     * 子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断
     */
    public Date getEndTime() {
        return endTime;
    }

    /**
     * 子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断
     */
    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    /**
     * 子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)
     */
    public String getOrderFrom() {
        return orderFrom;
    }

    /**
     * 子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)
     */
    public void setOrderFrom(String orderFrom) {
        this.orderFrom = orderFrom;
    }

    /**
     * 是否是服务订单，是返回true，否返回false。
     */
    public String getIsServiceOrder() {
        return isServiceOrder;
    }

    /**
     * 是否是服务订单，是返回true，否返回false。
     */
    public void setIsServiceOrder(String isServiceOrder) {
        this.isServiceOrder = isServiceOrder;
    }

    /**
     * 子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）
     */
    public Date getConsignTime() {
        return consignTime;
    }

    /**
     * 子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）
     */
    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
    }

    /**
     * 子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）
     */
    public String getShippingType() {
        return shippingType;
    }

    /**
     * 子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）
     */
    public void setShippingType(String shippingType) {
        this.shippingType = shippingType;
    }

    /**
     * 子订单发货的快递公司名称
     */
    public String getLogisticsCompany() {
        return logisticsCompany;
    }

    /**
     * 子订单发货的快递公司名称
     */
    public void setLogisticsCompany(String logisticsCompany) {
        this.logisticsCompany = logisticsCompany;
    }

    /**
     * 子订单所在包裹的运单号
     */
    public String getInvoiceNo() {
        return invoiceNo;
    }

    /**
     * 子订单所在包裹的运单号
     */
    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    /**
     * 捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货
     */
    public String getBindOid() {
        return bindOid;
    }

    /**
     * 捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货
     */
    public void setBindOid(String bindOid) {
        this.bindOid = bindOid;
    }

    /**
     * 订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:
TRADE_NO_CREATE_PAY(没有创建支付宝交易)
WAIT_BUYER_PAY(等待买家付款)
WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)
WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)
TRADE_BUYER_SIGNED(买家已签收,货到付款专用)
TRADE_FINISHED(交易成功)
TRADE_CLOSED(付款以后用户退款成功，交易自动关闭)
TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)
PAY_PENDING(国际信用卡支付付款确认中)
     */
    public String getStatus() {
        return status;
    }

    /**
     * 订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:
TRADE_NO_CREATE_PAY(没有创建支付宝交易)
WAIT_BUYER_PAY(等待买家付款)
WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)
WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)
TRADE_BUYER_SIGNED(买家已签收,货到付款专用)
TRADE_FINISHED(交易成功)
TRADE_CLOSED(付款以后用户退款成功，交易自动关闭)
TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)
PAY_PENDING(国际信用卡支付付款确认中)
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    public String getRefundStatus() {
        return refundStatus;
    }

    /**
     * 退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)
     */
    public void setRefundStatus(String refundStatus) {
        this.refundStatus = refundStatus;
    }

    /**
     * 最近退款ID
     */
    public String getRefundId() {
        return refundId;
    }

    /**
     * 最近退款ID
     */
    public void setRefundId(String refundId) {
        this.refundId = refundId;
    }

    /**
     * 
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 
     */
    public void setRemark(String remark) {
        this.remark = remark;
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
        TaoOrderItem other = (TaoOrderItem) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getTid() == null ? other.getTid() == null : this.getTid().equals(other.getTid()))
            && (this.getOid() == null ? other.getOid() == null : this.getOid().equals(other.getOid()))
            && (this.getTotalFee() == null ? other.getTotalFee() == null : this.getTotalFee().equals(other.getTotalFee()))
            && (this.getDiscountFee() == null ? other.getDiscountFee() == null : this.getDiscountFee().equals(other.getDiscountFee()))
            && (this.getAdjustFee() == null ? other.getAdjustFee() == null : this.getAdjustFee().equals(other.getAdjustFee()))
            && (this.getDivideOrderFee() == null ? other.getDivideOrderFee() == null : this.getDivideOrderFee().equals(other.getDivideOrderFee()))
            && (this.getPartMjzDiscount() == null ? other.getPartMjzDiscount() == null : this.getPartMjzDiscount().equals(other.getPartMjzDiscount()))
            && (this.getPayment() == null ? other.getPayment() == null : this.getPayment().equals(other.getPayment()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getPicPath() == null ? other.getPicPath() == null : this.getPicPath().equals(other.getPicPath()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getNumIid() == null ? other.getNumIid() == null : this.getNumIid().equals(other.getNumIid()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getOuterIid() == null ? other.getOuterIid() == null : this.getOuterIid().equals(other.getOuterIid()))
            && (this.getOuterSkuId() == null ? other.getOuterSkuId() == null : this.getOuterSkuId().equals(other.getOuterSkuId()))
            && (this.getSkuPropertiesName() == null ? other.getSkuPropertiesName() == null : this.getSkuPropertiesName().equals(other.getSkuPropertiesName()))
            && (this.getItemMealId() == null ? other.getItemMealId() == null : this.getItemMealId().equals(other.getItemMealId()))
            && (this.getItemMealName() == null ? other.getItemMealName() == null : this.getItemMealName().equals(other.getItemMealName()))
            && (this.getNum() == null ? other.getNum() == null : this.getNum().equals(other.getNum()))
            && (this.getSnapshotUrl() == null ? other.getSnapshotUrl() == null : this.getSnapshotUrl().equals(other.getSnapshotUrl()))
            && (this.getTimeoutActionTime() == null ? other.getTimeoutActionTime() == null : this.getTimeoutActionTime().equals(other.getTimeoutActionTime()))
            && (this.getItemMemo() == null ? other.getItemMemo() == null : this.getItemMemo().equals(other.getItemMemo()))
            && (this.getBuyerRate() == null ? other.getBuyerRate() == null : this.getBuyerRate().equals(other.getBuyerRate()))
            && (this.getSellerRate() == null ? other.getSellerRate() == null : this.getSellerRate().equals(other.getSellerRate()))
            && (this.getSellerType() == null ? other.getSellerType() == null : this.getSellerType().equals(other.getSellerType()))
            && (this.getCid() == null ? other.getCid() == null : this.getCid().equals(other.getCid()))
            && (this.getIsOversold() == null ? other.getIsOversold() == null : this.getIsOversold().equals(other.getIsOversold()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
            && (this.getOrderFrom() == null ? other.getOrderFrom() == null : this.getOrderFrom().equals(other.getOrderFrom()))
            && (this.getIsServiceOrder() == null ? other.getIsServiceOrder() == null : this.getIsServiceOrder().equals(other.getIsServiceOrder()))
            && (this.getConsignTime() == null ? other.getConsignTime() == null : this.getConsignTime().equals(other.getConsignTime()))
            && (this.getShippingType() == null ? other.getShippingType() == null : this.getShippingType().equals(other.getShippingType()))
            && (this.getLogisticsCompany() == null ? other.getLogisticsCompany() == null : this.getLogisticsCompany().equals(other.getLogisticsCompany()))
            && (this.getInvoiceNo() == null ? other.getInvoiceNo() == null : this.getInvoiceNo().equals(other.getInvoiceNo()))
            && (this.getBindOid() == null ? other.getBindOid() == null : this.getBindOid().equals(other.getBindOid()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getRefundStatus() == null ? other.getRefundStatus() == null : this.getRefundStatus().equals(other.getRefundStatus()))
            && (this.getRefundId() == null ? other.getRefundId() == null : this.getRefundId().equals(other.getRefundId()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTid() == null) ? 0 : getTid().hashCode());
        result = prime * result + ((getOid() == null) ? 0 : getOid().hashCode());
        result = prime * result + ((getTotalFee() == null) ? 0 : getTotalFee().hashCode());
        result = prime * result + ((getDiscountFee() == null) ? 0 : getDiscountFee().hashCode());
        result = prime * result + ((getAdjustFee() == null) ? 0 : getAdjustFee().hashCode());
        result = prime * result + ((getDivideOrderFee() == null) ? 0 : getDivideOrderFee().hashCode());
        result = prime * result + ((getPartMjzDiscount() == null) ? 0 : getPartMjzDiscount().hashCode());
        result = prime * result + ((getPayment() == null) ? 0 : getPayment().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getPicPath() == null) ? 0 : getPicPath().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getNumIid() == null) ? 0 : getNumIid().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getOuterIid() == null) ? 0 : getOuterIid().hashCode());
        result = prime * result + ((getOuterSkuId() == null) ? 0 : getOuterSkuId().hashCode());
        result = prime * result + ((getSkuPropertiesName() == null) ? 0 : getSkuPropertiesName().hashCode());
        result = prime * result + ((getItemMealId() == null) ? 0 : getItemMealId().hashCode());
        result = prime * result + ((getItemMealName() == null) ? 0 : getItemMealName().hashCode());
        result = prime * result + ((getNum() == null) ? 0 : getNum().hashCode());
        result = prime * result + ((getSnapshotUrl() == null) ? 0 : getSnapshotUrl().hashCode());
        result = prime * result + ((getTimeoutActionTime() == null) ? 0 : getTimeoutActionTime().hashCode());
        result = prime * result + ((getItemMemo() == null) ? 0 : getItemMemo().hashCode());
        result = prime * result + ((getBuyerRate() == null) ? 0 : getBuyerRate().hashCode());
        result = prime * result + ((getSellerRate() == null) ? 0 : getSellerRate().hashCode());
        result = prime * result + ((getSellerType() == null) ? 0 : getSellerType().hashCode());
        result = prime * result + ((getCid() == null) ? 0 : getCid().hashCode());
        result = prime * result + ((getIsOversold() == null) ? 0 : getIsOversold().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        result = prime * result + ((getOrderFrom() == null) ? 0 : getOrderFrom().hashCode());
        result = prime * result + ((getIsServiceOrder() == null) ? 0 : getIsServiceOrder().hashCode());
        result = prime * result + ((getConsignTime() == null) ? 0 : getConsignTime().hashCode());
        result = prime * result + ((getShippingType() == null) ? 0 : getShippingType().hashCode());
        result = prime * result + ((getLogisticsCompany() == null) ? 0 : getLogisticsCompany().hashCode());
        result = prime * result + ((getInvoiceNo() == null) ? 0 : getInvoiceNo().hashCode());
        result = prime * result + ((getBindOid() == null) ? 0 : getBindOid().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getRefundStatus() == null) ? 0 : getRefundStatus().hashCode());
        result = prime * result + ((getRefundId() == null) ? 0 : getRefundId().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", tid=").append(tid);
        sb.append(", oid=").append(oid);
        sb.append(", totalFee=").append(totalFee);
        sb.append(", discountFee=").append(discountFee);
        sb.append(", adjustFee=").append(adjustFee);
        sb.append(", divideOrderFee=").append(divideOrderFee);
        sb.append(", partMjzDiscount=").append(partMjzDiscount);
        sb.append(", payment=").append(payment);
        sb.append(", title=").append(title);
        sb.append(", picPath=").append(picPath);
        sb.append(", price=").append(price);
        sb.append(", numIid=").append(numIid);
        sb.append(", skuId=").append(skuId);
        sb.append(", outerIid=").append(outerIid);
        sb.append(", outerSkuId=").append(outerSkuId);
        sb.append(", skuPropertiesName=").append(skuPropertiesName);
        sb.append(", itemMealId=").append(itemMealId);
        sb.append(", itemMealName=").append(itemMealName);
        sb.append(", num=").append(num);
        sb.append(", snapshotUrl=").append(snapshotUrl);
        sb.append(", timeoutActionTime=").append(timeoutActionTime);
        sb.append(", itemMemo=").append(itemMemo);
        sb.append(", buyerRate=").append(buyerRate);
        sb.append(", sellerRate=").append(sellerRate);
        sb.append(", sellerType=").append(sellerType);
        sb.append(", cid=").append(cid);
        sb.append(", isOversold=").append(isOversold);
        sb.append(", endTime=").append(endTime);
        sb.append(", orderFrom=").append(orderFrom);
        sb.append(", isServiceOrder=").append(isServiceOrder);
        sb.append(", consignTime=").append(consignTime);
        sb.append(", shippingType=").append(shippingType);
        sb.append(", logisticsCompany=").append(logisticsCompany);
        sb.append(", invoiceNo=").append(invoiceNo);
        sb.append(", bindOid=").append(bindOid);
        sb.append(", status=").append(status);
        sb.append(", refundStatus=").append(refundStatus);
        sb.append(", refundId=").append(refundId);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}