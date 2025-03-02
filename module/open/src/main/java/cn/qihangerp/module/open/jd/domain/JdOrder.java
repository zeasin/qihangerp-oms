package cn.qihangerp.module.open.jd.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 京东订单表
 * @TableName jd_order
 */
@TableName("oms_jd_order")
public class JdOrder implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 订单id
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
    @TableField(exist = false)
    private List<JdOrderItem> items;

    @TableField(exist = false)
    private List<JdOrderCoupon> coupons;

    private static final long serialVersionUID = 1L;

    public List<JdOrderCoupon> getCoupons() {
        return coupons;
    }

    public void setCoupons(List<JdOrderCoupon> coupons) {
        this.coupons = coupons;
    }

    public List<JdOrderItem> getItems() {
        return items;
    }

    public void setItems(List<JdOrderItem> items) {
        this.items = items;
    }

    /**
     * 
     */
    public String getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 店铺id
     */
    public Long getShopId() {
        return shopId;
    }

    /**
     * 店铺id
     */
    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    /**
     * 订单id
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 订单id
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 商家id
     */
    public String getVenderId() {
        return venderId;
    }

    /**
     * 商家id
     */
    public void setVenderId(String venderId) {
        this.venderId = venderId;
    }

    /**
     * 	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getOrderType() {
        return orderType;
    }

    /**
     * 	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    /**
     * 支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）
     */
    public String getPayType() {
        return payType;
    }

    /**
     * 支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）
     */
    public void setPayType(String payType) {
        this.payType = payType;
    }

    /**
     * 订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）
     */
    public String getOrderTotalPrice() {
        return orderTotalPrice;
    }

    /**
     * 订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）
     */
    public void setOrderTotalPrice(String orderTotalPrice) {
        this.orderTotalPrice = orderTotalPrice;
    }

    /**
     * 订单货款金额（订单总金额-商家优惠金额）
     */
    public String getOrderSellerPrice() {
        return orderSellerPrice;
    }

    /**
     * 订单货款金额（订单总金额-商家优惠金额）
     */
    public void setOrderSellerPrice(String orderSellerPrice) {
        this.orderSellerPrice = orderSellerPrice;
    }

    /**
     * 用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。
     */
    public String getOrderPayment() {
        return orderPayment;
    }

    /**
     * 用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。
     */
    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment;
    }

    /**
     * 商品的运费
     */
    public String getFreightPrice() {
        return freightPrice;
    }

    /**
     * 商品的运费
     */
    public void setFreightPrice(String freightPrice) {
        this.freightPrice = freightPrice;
    }

    /**
     * 商家优惠金额
     */
    public String getSellerDiscount() {
        return sellerDiscount;
    }

    /**
     * 商家优惠金额
     */
    public void setSellerDiscount(String sellerDiscount) {
        this.sellerDiscount = sellerDiscount;
    }

    /**
     * 	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为'等待境内发货'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码
     */
    public String getOrderState() {
        return orderState;
    }

    /**
     * 	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为'等待境内发货'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码
     */
    public void setOrderState(String orderState) {
        this.orderState = orderState;
    }

    /**
     * 订单状态说明（中文）
     */
    public String getOrderStateRemark() {
        return orderStateRemark;
    }

    /**
     * 订单状态说明（中文）
     */
    public void setOrderStateRemark(String orderStateRemark) {
        this.orderStateRemark = orderStateRemark;
    }

    /**
     * 送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）
     */
    public String getDeliveryType() {
        return deliveryType;
    }

    /**
     * 送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）
     */
    public void setDeliveryType(String deliveryType) {
        this.deliveryType = deliveryType;
    }

    /**
     * 发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）
     */
    public String getInvoiceInfo() {
        return invoiceInfo;
    }

    /**
     * 发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）
     */
    public void setInvoiceInfo(String invoiceInfo) {
        this.invoiceInfo = invoiceInfo;
    }

    /**
     * 普通发票纳税人识别码
     */
    public String getInvoiceCode() {
        return invoiceCode;
    }

    /**
     * 普通发票纳税人识别码
     */
    public void setInvoiceCode(String invoiceCode) {
        this.invoiceCode = invoiceCode;
    }

    /**
     * 买家下单时订单备注
     */
    public String getOrderRemark() {
        return orderRemark;
    }

    /**
     * 买家下单时订单备注
     */
    public void setOrderRemark(String orderRemark) {
        this.orderRemark = orderRemark;
    }

    /**
     * 下单时间
     */
    public String getOrderStartTime() {
        return orderStartTime;
    }

    /**
     * 下单时间
     */
    public void setOrderStartTime(String orderStartTime) {
        this.orderStartTime = orderStartTime;
    }

    /**
     * 结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。
     */
    public String getOrderEndTime() {
        return orderEndTime;
    }

    /**
     * 结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。
     */
    public void setOrderEndTime(String orderEndTime) {
        this.orderEndTime = orderEndTime;
    }

    /**
     * 姓名
     */
    public String getFullname() {
        return fullname;
    }

    /**
     * 姓名
     */
    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    /**
     * 固定电话
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * 固定电话
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * 手机
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 手机
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 地址
     */
    public String getFullAddress() {
        return fullAddress;
    }

    /**
     * 地址
     */
    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress;
    }

    /**
     * 
     */
    public String getProvince() {
        return province;
    }

    /**
     * 
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * 
     */
    public String getCity() {
        return city;
    }

    /**
     * 
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 
     */
    public String getCounty() {
        return county;
    }

    /**
     * 
     */
    public void setCounty(String county) {
        this.county = county;
    }

    /**
     * 
     */
    public String getTown() {
        return town;
    }

    /**
     * 
     */
    public void setTown(String town) {
        this.town = town;
    }

    /**
     * 
     */
    public String getProvinceId() {
        return provinceId;
    }

    /**
     * 
     */
    public void setProvinceId(String provinceId) {
        this.provinceId = provinceId;
    }

    /**
     * 
     */
    public String getCityId() {
        return cityId;
    }

    /**
     * 
     */
    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    /**
     * 
     */
    public String getCountyId() {
        return countyId;
    }

    /**
     * 
     */
    public void setCountyId(String countyId) {
        this.countyId = countyId;
    }

    /**
     * 
     */
    public String getTownId() {
        return townId;
    }

    /**
     * 
     */
    public void setTownId(String townId) {
        this.townId = townId;
    }

    /**
     * 商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getVenderRemark() {
        return venderRemark;
    }

    /**
     * 商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setVenderRemark(String venderRemark) {
        this.venderRemark = venderRemark;
    }

    /**
     * 余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getBalanceUsed() {
        return balanceUsed;
    }

    /**
     * 余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setBalanceUsed(String balanceUsed) {
        this.balanceUsed = balanceUsed;
    }

    /**
     * 买家的账号信息
     */
    public String getPin() {
        return pin;
    }

    /**
     * 买家的账号信息
     */
    public void setPin(String pin) {
        this.pin = pin;
    }

    /**
     * 售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getReturnOrder() {
        return returnOrder;
    }

    /**
     * 售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setReturnOrder(String returnOrder) {
        this.returnOrder = returnOrder;
    }

    /**
     * 付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getPaymentConfirmTime() {
        return paymentConfirmTime;
    }

    /**
     * 付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setPaymentConfirmTime(String paymentConfirmTime) {
        this.paymentConfirmTime = paymentConfirmTime;
    }

    /**
     * 运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getWaybill() {
        return waybill;
    }

    /**
     * 运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setWaybill(String waybill) {
        this.waybill = waybill;
    }

    /**
     * 物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getLogisticsId() {
        return logisticsId;
    }

    /**
     * 物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setLogisticsId(String logisticsId) {
        this.logisticsId = logisticsId;
    }

    /**
     * 订单更新时间
     */
    public String getModified() {
        return modified;
    }

    /**
     * 订单更新时间
     */
    public void setModified(String modified) {
        this.modified = modified;
    }

    /**
     * 	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getDirectParentOrderId() {
        return directParentOrderId;
    }

    /**
     * 	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setDirectParentOrderId(String directParentOrderId) {
        this.directParentOrderId = directParentOrderId;
    }

    /**
     * 	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getParentOrderId() {
        return parentOrderId;
    }

    /**
     * 	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setParentOrderId(String parentOrderId) {
        this.parentOrderId = parentOrderId;
    }

    /**
     * 订单来源。如：移动端订单
     */
    public String getOrderSource() {
        return orderSource;
    }

    /**
     * 订单来源。如：移动端订单
     */
    public void setOrderSource(String orderSource) {
        this.orderSource = orderSource;
    }

    /**
     * 京仓订单/云仓订单/空“”
     */
    public String getStoreOrder() {
        return storeOrder;
    }

    /**
     * 京仓订单/云仓订单/空“”
     */
    public void setStoreOrder(String storeOrder) {
        this.storeOrder = storeOrder;
    }

    /**
     * 是否京配。68=京配，69=京配自提
     */
    public String getIdSopShipmenttype() {
        return idSopShipmenttype;
    }

    /**
     * 是否京配。68=京配，69=京配自提
     */
    public void setIdSopShipmenttype(String idSopShipmenttype) {
        this.idSopShipmenttype = idSopShipmenttype;
    }

    /**
     * 买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public String getRealPin() {
        return realPin;
    }

    /**
     * 买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回
     */
    public void setRealPin(String realPin) {
        this.realPin = realPin;
    }

    /**
     * 买家的账号信息 
     */
    public String getOpenId() {
        return openId;
    }

    /**
     * 买家的账号信息 
     */
    public void setOpenId(String openId) {
        this.openId = openId;
    }

    /**
     * 买家的账号信息(区分大小写) 可选字段
     */
    public String getOpenIdBuyer() {
        return openIdBuyer;
    }

    /**
     * 买家的账号信息(区分大小写) 可选字段
     */
    public void setOpenIdBuyer(String openIdBuyer) {
        this.openIdBuyer = openIdBuyer;
    }

    /**
     * 
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
        JdOrder other = (JdOrder) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getVenderId() == null ? other.getVenderId() == null : this.getVenderId().equals(other.getVenderId()))
            && (this.getOrderType() == null ? other.getOrderType() == null : this.getOrderType().equals(other.getOrderType()))
            && (this.getPayType() == null ? other.getPayType() == null : this.getPayType().equals(other.getPayType()))
            && (this.getOrderTotalPrice() == null ? other.getOrderTotalPrice() == null : this.getOrderTotalPrice().equals(other.getOrderTotalPrice()))
            && (this.getOrderSellerPrice() == null ? other.getOrderSellerPrice() == null : this.getOrderSellerPrice().equals(other.getOrderSellerPrice()))
            && (this.getOrderPayment() == null ? other.getOrderPayment() == null : this.getOrderPayment().equals(other.getOrderPayment()))
            && (this.getFreightPrice() == null ? other.getFreightPrice() == null : this.getFreightPrice().equals(other.getFreightPrice()))
            && (this.getSellerDiscount() == null ? other.getSellerDiscount() == null : this.getSellerDiscount().equals(other.getSellerDiscount()))
            && (this.getOrderState() == null ? other.getOrderState() == null : this.getOrderState().equals(other.getOrderState()))
            && (this.getOrderStateRemark() == null ? other.getOrderStateRemark() == null : this.getOrderStateRemark().equals(other.getOrderStateRemark()))
            && (this.getDeliveryType() == null ? other.getDeliveryType() == null : this.getDeliveryType().equals(other.getDeliveryType()))
            && (this.getInvoiceInfo() == null ? other.getInvoiceInfo() == null : this.getInvoiceInfo().equals(other.getInvoiceInfo()))
            && (this.getInvoiceCode() == null ? other.getInvoiceCode() == null : this.getInvoiceCode().equals(other.getInvoiceCode()))
            && (this.getOrderRemark() == null ? other.getOrderRemark() == null : this.getOrderRemark().equals(other.getOrderRemark()))
            && (this.getOrderStartTime() == null ? other.getOrderStartTime() == null : this.getOrderStartTime().equals(other.getOrderStartTime()))
            && (this.getOrderEndTime() == null ? other.getOrderEndTime() == null : this.getOrderEndTime().equals(other.getOrderEndTime()))
            && (this.getFullname() == null ? other.getFullname() == null : this.getFullname().equals(other.getFullname()))
            && (this.getTelephone() == null ? other.getTelephone() == null : this.getTelephone().equals(other.getTelephone()))
            && (this.getMobile() == null ? other.getMobile() == null : this.getMobile().equals(other.getMobile()))
            && (this.getFullAddress() == null ? other.getFullAddress() == null : this.getFullAddress().equals(other.getFullAddress()))
            && (this.getProvince() == null ? other.getProvince() == null : this.getProvince().equals(other.getProvince()))
            && (this.getCity() == null ? other.getCity() == null : this.getCity().equals(other.getCity()))
            && (this.getCounty() == null ? other.getCounty() == null : this.getCounty().equals(other.getCounty()))
            && (this.getTown() == null ? other.getTown() == null : this.getTown().equals(other.getTown()))
            && (this.getProvinceId() == null ? other.getProvinceId() == null : this.getProvinceId().equals(other.getProvinceId()))
            && (this.getCityId() == null ? other.getCityId() == null : this.getCityId().equals(other.getCityId()))
            && (this.getCountyId() == null ? other.getCountyId() == null : this.getCountyId().equals(other.getCountyId()))
            && (this.getTownId() == null ? other.getTownId() == null : this.getTownId().equals(other.getTownId()))
            && (this.getVenderRemark() == null ? other.getVenderRemark() == null : this.getVenderRemark().equals(other.getVenderRemark()))
            && (this.getBalanceUsed() == null ? other.getBalanceUsed() == null : this.getBalanceUsed().equals(other.getBalanceUsed()))
            && (this.getPin() == null ? other.getPin() == null : this.getPin().equals(other.getPin()))
            && (this.getReturnOrder() == null ? other.getReturnOrder() == null : this.getReturnOrder().equals(other.getReturnOrder()))
            && (this.getPaymentConfirmTime() == null ? other.getPaymentConfirmTime() == null : this.getPaymentConfirmTime().equals(other.getPaymentConfirmTime()))
            && (this.getWaybill() == null ? other.getWaybill() == null : this.getWaybill().equals(other.getWaybill()))
            && (this.getLogisticsId() == null ? other.getLogisticsId() == null : this.getLogisticsId().equals(other.getLogisticsId()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getDirectParentOrderId() == null ? other.getDirectParentOrderId() == null : this.getDirectParentOrderId().equals(other.getDirectParentOrderId()))
            && (this.getParentOrderId() == null ? other.getParentOrderId() == null : this.getParentOrderId().equals(other.getParentOrderId()))
            && (this.getOrderSource() == null ? other.getOrderSource() == null : this.getOrderSource().equals(other.getOrderSource()))
            && (this.getStoreOrder() == null ? other.getStoreOrder() == null : this.getStoreOrder().equals(other.getStoreOrder()))
            && (this.getIdSopShipmenttype() == null ? other.getIdSopShipmenttype() == null : this.getIdSopShipmenttype().equals(other.getIdSopShipmenttype()))
            && (this.getRealPin() == null ? other.getRealPin() == null : this.getRealPin().equals(other.getRealPin()))
            && (this.getOpenId() == null ? other.getOpenId() == null : this.getOpenId().equals(other.getOpenId()))
            && (this.getOpenIdBuyer() == null ? other.getOpenIdBuyer() == null : this.getOpenIdBuyer().equals(other.getOpenIdBuyer()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getVenderId() == null) ? 0 : getVenderId().hashCode());
        result = prime * result + ((getOrderType() == null) ? 0 : getOrderType().hashCode());
        result = prime * result + ((getPayType() == null) ? 0 : getPayType().hashCode());
        result = prime * result + ((getOrderTotalPrice() == null) ? 0 : getOrderTotalPrice().hashCode());
        result = prime * result + ((getOrderSellerPrice() == null) ? 0 : getOrderSellerPrice().hashCode());
        result = prime * result + ((getOrderPayment() == null) ? 0 : getOrderPayment().hashCode());
        result = prime * result + ((getFreightPrice() == null) ? 0 : getFreightPrice().hashCode());
        result = prime * result + ((getSellerDiscount() == null) ? 0 : getSellerDiscount().hashCode());
        result = prime * result + ((getOrderState() == null) ? 0 : getOrderState().hashCode());
        result = prime * result + ((getOrderStateRemark() == null) ? 0 : getOrderStateRemark().hashCode());
        result = prime * result + ((getDeliveryType() == null) ? 0 : getDeliveryType().hashCode());
        result = prime * result + ((getInvoiceInfo() == null) ? 0 : getInvoiceInfo().hashCode());
        result = prime * result + ((getInvoiceCode() == null) ? 0 : getInvoiceCode().hashCode());
        result = prime * result + ((getOrderRemark() == null) ? 0 : getOrderRemark().hashCode());
        result = prime * result + ((getOrderStartTime() == null) ? 0 : getOrderStartTime().hashCode());
        result = prime * result + ((getOrderEndTime() == null) ? 0 : getOrderEndTime().hashCode());
        result = prime * result + ((getFullname() == null) ? 0 : getFullname().hashCode());
        result = prime * result + ((getTelephone() == null) ? 0 : getTelephone().hashCode());
        result = prime * result + ((getMobile() == null) ? 0 : getMobile().hashCode());
        result = prime * result + ((getFullAddress() == null) ? 0 : getFullAddress().hashCode());
        result = prime * result + ((getProvince() == null) ? 0 : getProvince().hashCode());
        result = prime * result + ((getCity() == null) ? 0 : getCity().hashCode());
        result = prime * result + ((getCounty() == null) ? 0 : getCounty().hashCode());
        result = prime * result + ((getTown() == null) ? 0 : getTown().hashCode());
        result = prime * result + ((getProvinceId() == null) ? 0 : getProvinceId().hashCode());
        result = prime * result + ((getCityId() == null) ? 0 : getCityId().hashCode());
        result = prime * result + ((getCountyId() == null) ? 0 : getCountyId().hashCode());
        result = prime * result + ((getTownId() == null) ? 0 : getTownId().hashCode());
        result = prime * result + ((getVenderRemark() == null) ? 0 : getVenderRemark().hashCode());
        result = prime * result + ((getBalanceUsed() == null) ? 0 : getBalanceUsed().hashCode());
        result = prime * result + ((getPin() == null) ? 0 : getPin().hashCode());
        result = prime * result + ((getReturnOrder() == null) ? 0 : getReturnOrder().hashCode());
        result = prime * result + ((getPaymentConfirmTime() == null) ? 0 : getPaymentConfirmTime().hashCode());
        result = prime * result + ((getWaybill() == null) ? 0 : getWaybill().hashCode());
        result = prime * result + ((getLogisticsId() == null) ? 0 : getLogisticsId().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getDirectParentOrderId() == null) ? 0 : getDirectParentOrderId().hashCode());
        result = prime * result + ((getParentOrderId() == null) ? 0 : getParentOrderId().hashCode());
        result = prime * result + ((getOrderSource() == null) ? 0 : getOrderSource().hashCode());
        result = prime * result + ((getStoreOrder() == null) ? 0 : getStoreOrder().hashCode());
        result = prime * result + ((getIdSopShipmenttype() == null) ? 0 : getIdSopShipmenttype().hashCode());
        result = prime * result + ((getRealPin() == null) ? 0 : getRealPin().hashCode());
        result = prime * result + ((getOpenId() == null) ? 0 : getOpenId().hashCode());
        result = prime * result + ((getOpenIdBuyer() == null) ? 0 : getOpenIdBuyer().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
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
        sb.append(", orderId=").append(orderId);
        sb.append(", venderId=").append(venderId);
        sb.append(", orderType=").append(orderType);
        sb.append(", payType=").append(payType);
        sb.append(", orderTotalPrice=").append(orderTotalPrice);
        sb.append(", orderSellerPrice=").append(orderSellerPrice);
        sb.append(", orderPayment=").append(orderPayment);
        sb.append(", freightPrice=").append(freightPrice);
        sb.append(", sellerDiscount=").append(sellerDiscount);
        sb.append(", orderState=").append(orderState);
        sb.append(", orderStateRemark=").append(orderStateRemark);
        sb.append(", deliveryType=").append(deliveryType);
        sb.append(", invoiceInfo=").append(invoiceInfo);
        sb.append(", invoiceCode=").append(invoiceCode);
        sb.append(", orderRemark=").append(orderRemark);
        sb.append(", orderStartTime=").append(orderStartTime);
        sb.append(", orderEndTime=").append(orderEndTime);
        sb.append(", fullname=").append(fullname);
        sb.append(", telephone=").append(telephone);
        sb.append(", mobile=").append(mobile);
        sb.append(", fullAddress=").append(fullAddress);
        sb.append(", province=").append(province);
        sb.append(", city=").append(city);
        sb.append(", county=").append(county);
        sb.append(", town=").append(town);
        sb.append(", provinceId=").append(provinceId);
        sb.append(", cityId=").append(cityId);
        sb.append(", countyId=").append(countyId);
        sb.append(", townId=").append(townId);
        sb.append(", venderRemark=").append(venderRemark);
        sb.append(", balanceUsed=").append(balanceUsed);
        sb.append(", pin=").append(pin);
        sb.append(", returnOrder=").append(returnOrder);
        sb.append(", paymentConfirmTime=").append(paymentConfirmTime);
        sb.append(", waybill=").append(waybill);
        sb.append(", logisticsId=").append(logisticsId);
        sb.append(", modified=").append(modified);
        sb.append(", directParentOrderId=").append(directParentOrderId);
        sb.append(", parentOrderId=").append(parentOrderId);
        sb.append(", orderSource=").append(orderSource);
        sb.append(", storeOrder=").append(storeOrder);
        sb.append(", idSopShipmenttype=").append(idSopShipmenttype);
        sb.append(", realPin=").append(realPin);
        sb.append(", openId=").append(openId);
        sb.append(", openIdBuyer=").append(openIdBuyer);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}