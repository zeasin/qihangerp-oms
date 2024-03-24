package com.qihang.oms.domain;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 订单表
 * @TableName o_order
 */
public class OOrder implements Serializable {
    /**
     * 订单id，自增
     */
    private String id;

    /**
     * 订单编号（第三方平台订单号）
     */
    private String orderNum;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 店铺ID
     */
    private Integer shopId;

    /**
     * 订单备注
     */
    private String remark;

    /**
     * 买家留言信息
     */
    private String buyerMemo;

    /**
     * 卖家留言信息
     */
    private String sellerMemo;

    /**
     * 标签
     */
    private String tag;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

    /**
     * 订单状态1：待发货，2：已发货，3：已完成
     */
    private Integer orderStatus;

    /**
     * 订单商品金额
     */
    private Double goodsAmount;

    /**
     * 订单实际金额
     */
    private Double amount;

    /**
     * 收件人姓名
     */
    private String receiverName;

    /**
     * 收件人手机号
     */
    private String receiverMobile;

    /**
     * 收件人地址
     */
    private String address;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区
     */
    private String town;

    /**
     * 订单时间
     */
    private Date orderTime;

    /**
     * 发货类型（0仓库发货；1供应商代发）
     */
    private Integer shipType;

    /**
     * 发货时间
     */
    private Date shippingTime;

    /**
     * 快递单号
     */
    private String shippingNumber;

    /**
     * 物流公司
     */
    private String shippingCompany;

    /**
     * 发货人
     */
    private String shippingMan;

    /**
     * 发货费用
     */
    private BigDecimal shippingCost;

    /**
     * 长
     */
    private Double length;

    /**
     * 宽
     */
    private Double width;

    /**
     * 高
     */
    private Double height;

    /**
     * 重量
     */
    private Double weight;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 更新人
     */
    private String updateBy;

    @TableField(exist = false)
    private List<OOrderItem> itemList;

    private static final long serialVersionUID = 1L;

    public List<OOrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OOrderItem> itemList) {
        this.itemList = itemList;
    }

    /**
     * 订单id，自增
     */
    public String getId() {
        return id;
    }

    /**
     * 订单id，自增
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 订单编号（第三方平台订单号）
     */
    public String getOrderNum() {
        return orderNum;
    }

    /**
     * 订单编号（第三方平台订单号）
     */
    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * 店铺类型
     */
    public Integer getShopType() {
        return shopType;
    }

    /**
     * 店铺类型
     */
    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    /**
     * 店铺ID
     */
    public Integer getShopId() {
        return shopId;
    }

    /**
     * 店铺ID
     */
    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 订单备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 订单备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 买家留言信息
     */
    public String getBuyerMemo() {
        return buyerMemo;
    }

    /**
     * 买家留言信息
     */
    public void setBuyerMemo(String buyerMemo) {
        this.buyerMemo = buyerMemo;
    }

    /**
     * 卖家留言信息
     */
    public String getSellerMemo() {
        return sellerMemo;
    }

    /**
     * 卖家留言信息
     */
    public void setSellerMemo(String sellerMemo) {
        this.sellerMemo = sellerMemo;
    }

    /**
     * 标签
     */
    public String getTag() {
        return tag;
    }

    /**
     * 标签
     */
    public void setTag(String tag) {
        this.tag = tag;
    }

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    public Integer getRefundStatus() {
        return refundStatus;
    }

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    public void setRefundStatus(Integer refundStatus) {
        this.refundStatus = refundStatus;
    }

    /**
     * 订单状态1：待发货，2：已发货，3：已完成
     */
    public Integer getOrderStatus() {
        return orderStatus;
    }

    /**
     * 订单状态1：待发货，2：已发货，3：已完成
     */
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    /**
     * 订单商品金额
     */
    public Double getGoodsAmount() {
        return goodsAmount;
    }

    /**
     * 订单商品金额
     */
    public void setGoodsAmount(Double goodsAmount) {
        this.goodsAmount = goodsAmount;
    }

    /**
     * 订单实际金额
     */
    public Double getAmount() {
        return amount;
    }

    /**
     * 订单实际金额
     */
    public void setAmount(Double amount) {
        this.amount = amount;
    }

    /**
     * 收件人姓名
     */
    public String getReceiverName() {
        return receiverName;
    }

    /**
     * 收件人姓名
     */
    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    /**
     * 收件人手机号
     */
    public String getReceiverMobile() {
        return receiverMobile;
    }

    /**
     * 收件人手机号
     */
    public void setReceiverMobile(String receiverMobile) {
        this.receiverMobile = receiverMobile;
    }

    /**
     * 收件人地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 收件人地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 省
     */
    public String getProvince() {
        return province;
    }

    /**
     * 省
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * 市
     */
    public String getCity() {
        return city;
    }

    /**
     * 市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 区
     */
    public String getTown() {
        return town;
    }

    /**
     * 区
     */
    public void setTown(String town) {
        this.town = town;
    }

    /**
     * 订单时间
     */
    public Date getOrderTime() {
        return orderTime;
    }

    /**
     * 订单时间
     */
    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    /**
     * 发货类型（0仓库发货；1供应商代发）
     */
    public Integer getShipType() {
        return shipType;
    }

    /**
     * 发货类型（0仓库发货；1供应商代发）
     */
    public void setShipType(Integer shipType) {
        this.shipType = shipType;
    }

    /**
     * 发货时间
     */
    public Date getShippingTime() {
        return shippingTime;
    }

    /**
     * 发货时间
     */
    public void setShippingTime(Date shippingTime) {
        this.shippingTime = shippingTime;
    }

    /**
     * 快递单号
     */
    public String getShippingNumber() {
        return shippingNumber;
    }

    /**
     * 快递单号
     */
    public void setShippingNumber(String shippingNumber) {
        this.shippingNumber = shippingNumber;
    }

    /**
     * 物流公司
     */
    public String getShippingCompany() {
        return shippingCompany;
    }

    /**
     * 物流公司
     */
    public void setShippingCompany(String shippingCompany) {
        this.shippingCompany = shippingCompany;
    }

    /**
     * 发货人
     */
    public String getShippingMan() {
        return shippingMan;
    }

    /**
     * 发货人
     */
    public void setShippingMan(String shippingMan) {
        this.shippingMan = shippingMan;
    }

    /**
     * 发货费用
     */
    public BigDecimal getShippingCost() {
        return shippingCost;
    }

    /**
     * 发货费用
     */
    public void setShippingCost(BigDecimal shippingCost) {
        this.shippingCost = shippingCost;
    }

    /**
     * 长
     */
    public Double getLength() {
        return length;
    }

    /**
     * 长
     */
    public void setLength(Double length) {
        this.length = length;
    }

    /**
     * 宽
     */
    public Double getWidth() {
        return width;
    }

    /**
     * 宽
     */
    public void setWidth(Double width) {
        this.width = width;
    }

    /**
     * 高
     */
    public Double getHeight() {
        return height;
    }

    /**
     * 高
     */
    public void setHeight(Double height) {
        this.height = height;
    }

    /**
     * 重量
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * 重量
     */
    public void setWeight(Double weight) {
        this.weight = weight;
    }

    /**
     * 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 创建时间
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
        OOrder other = (OOrder) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getOrderNum() == null ? other.getOrderNum() == null : this.getOrderNum().equals(other.getOrderNum()))
            && (this.getShopType() == null ? other.getShopType() == null : this.getShopType().equals(other.getShopType()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getBuyerMemo() == null ? other.getBuyerMemo() == null : this.getBuyerMemo().equals(other.getBuyerMemo()))
            && (this.getSellerMemo() == null ? other.getSellerMemo() == null : this.getSellerMemo().equals(other.getSellerMemo()))
            && (this.getTag() == null ? other.getTag() == null : this.getTag().equals(other.getTag()))
            && (this.getRefundStatus() == null ? other.getRefundStatus() == null : this.getRefundStatus().equals(other.getRefundStatus()))
            && (this.getOrderStatus() == null ? other.getOrderStatus() == null : this.getOrderStatus().equals(other.getOrderStatus()))
            && (this.getGoodsAmount() == null ? other.getGoodsAmount() == null : this.getGoodsAmount().equals(other.getGoodsAmount()))
            && (this.getAmount() == null ? other.getAmount() == null : this.getAmount().equals(other.getAmount()))
            && (this.getReceiverName() == null ? other.getReceiverName() == null : this.getReceiverName().equals(other.getReceiverName()))
            && (this.getReceiverMobile() == null ? other.getReceiverMobile() == null : this.getReceiverMobile().equals(other.getReceiverMobile()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getProvince() == null ? other.getProvince() == null : this.getProvince().equals(other.getProvince()))
            && (this.getCity() == null ? other.getCity() == null : this.getCity().equals(other.getCity()))
            && (this.getTown() == null ? other.getTown() == null : this.getTown().equals(other.getTown()))
            && (this.getOrderTime() == null ? other.getOrderTime() == null : this.getOrderTime().equals(other.getOrderTime()))
            && (this.getShipType() == null ? other.getShipType() == null : this.getShipType().equals(other.getShipType()))
            && (this.getShippingTime() == null ? other.getShippingTime() == null : this.getShippingTime().equals(other.getShippingTime()))
            && (this.getShippingNumber() == null ? other.getShippingNumber() == null : this.getShippingNumber().equals(other.getShippingNumber()))
            && (this.getShippingCompany() == null ? other.getShippingCompany() == null : this.getShippingCompany().equals(other.getShippingCompany()))
            && (this.getShippingMan() == null ? other.getShippingMan() == null : this.getShippingMan().equals(other.getShippingMan()))
            && (this.getShippingCost() == null ? other.getShippingCost() == null : this.getShippingCost().equals(other.getShippingCost()))
            && (this.getLength() == null ? other.getLength() == null : this.getLength().equals(other.getLength()))
            && (this.getWidth() == null ? other.getWidth() == null : this.getWidth().equals(other.getWidth()))
            && (this.getHeight() == null ? other.getHeight() == null : this.getHeight().equals(other.getHeight()))
            && (this.getWeight() == null ? other.getWeight() == null : this.getWeight().equals(other.getWeight()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrderNum() == null) ? 0 : getOrderNum().hashCode());
        result = prime * result + ((getShopType() == null) ? 0 : getShopType().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getBuyerMemo() == null) ? 0 : getBuyerMemo().hashCode());
        result = prime * result + ((getSellerMemo() == null) ? 0 : getSellerMemo().hashCode());
        result = prime * result + ((getTag() == null) ? 0 : getTag().hashCode());
        result = prime * result + ((getRefundStatus() == null) ? 0 : getRefundStatus().hashCode());
        result = prime * result + ((getOrderStatus() == null) ? 0 : getOrderStatus().hashCode());
        result = prime * result + ((getGoodsAmount() == null) ? 0 : getGoodsAmount().hashCode());
        result = prime * result + ((getAmount() == null) ? 0 : getAmount().hashCode());
        result = prime * result + ((getReceiverName() == null) ? 0 : getReceiverName().hashCode());
        result = prime * result + ((getReceiverMobile() == null) ? 0 : getReceiverMobile().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getProvince() == null) ? 0 : getProvince().hashCode());
        result = prime * result + ((getCity() == null) ? 0 : getCity().hashCode());
        result = prime * result + ((getTown() == null) ? 0 : getTown().hashCode());
        result = prime * result + ((getOrderTime() == null) ? 0 : getOrderTime().hashCode());
        result = prime * result + ((getShipType() == null) ? 0 : getShipType().hashCode());
        result = prime * result + ((getShippingTime() == null) ? 0 : getShippingTime().hashCode());
        result = prime * result + ((getShippingNumber() == null) ? 0 : getShippingNumber().hashCode());
        result = prime * result + ((getShippingCompany() == null) ? 0 : getShippingCompany().hashCode());
        result = prime * result + ((getShippingMan() == null) ? 0 : getShippingMan().hashCode());
        result = prime * result + ((getShippingCost() == null) ? 0 : getShippingCost().hashCode());
        result = prime * result + ((getLength() == null) ? 0 : getLength().hashCode());
        result = prime * result + ((getWidth() == null) ? 0 : getWidth().hashCode());
        result = prime * result + ((getHeight() == null) ? 0 : getHeight().hashCode());
        result = prime * result + ((getWeight() == null) ? 0 : getWeight().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orderNum=").append(orderNum);
        sb.append(", shopType=").append(shopType);
        sb.append(", shopId=").append(shopId);
        sb.append(", remark=").append(remark);
        sb.append(", buyerMemo=").append(buyerMemo);
        sb.append(", sellerMemo=").append(sellerMemo);
        sb.append(", tag=").append(tag);
        sb.append(", refundStatus=").append(refundStatus);
        sb.append(", orderStatus=").append(orderStatus);
        sb.append(", goodsAmount=").append(goodsAmount);
        sb.append(", amount=").append(amount);
        sb.append(", receiverName=").append(receiverName);
        sb.append(", receiverMobile=").append(receiverMobile);
        sb.append(", address=").append(address);
        sb.append(", province=").append(province);
        sb.append(", city=").append(city);
        sb.append(", town=").append(town);
        sb.append(", orderTime=").append(orderTime);
        sb.append(", shipType=").append(shipType);
        sb.append(", shippingTime=").append(shippingTime);
        sb.append(", shippingNumber=").append(shippingNumber);
        sb.append(", shippingCompany=").append(shippingCompany);
        sb.append(", shippingMan=").append(shippingMan);
        sb.append(", shippingCost=").append(shippingCost);
        sb.append(", length=").append(length);
        sb.append(", width=").append(width);
        sb.append(", height=").append(height);
        sb.append(", weight=").append(weight);
        sb.append(", createTime=").append(createTime);
        sb.append(", createBy=").append(createBy);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}