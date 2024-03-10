package com.qihang.sys.api.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 退换货表
 * @TableName o_refund
 */
public class ORefund implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 退货单号
     */
    private String refundNum;

    /**
     * 退货类型（1退货2换货）
     */
    private Integer refundType;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 店铺类型
     */
    private Integer shopType;

    /**
     * 源订单号
     */
    private String orderNum;

    /**
     * 子订单号或id
     */
    private String orderItemNum;

    /**
     * 源skuId
     */
    private Long skuId;

    /**
     * erp商品id
     */
    private Long erpGoodsId;

    /**
     * erp sku id
     */
    private Long erpSkuId;

    /**
     * sku编码
     */
    private String skuNum;

    /**
     * 商品名称
     */
    private String goodsName;

    /**
     * 商品sku
     */
    private String goodsSku;

    /**
     * 商品图片
     */
    private String goodsImage;

    /**
     * 退货数量
     */
    private Long quantity;

    /**
     * 退货物流公司
     */
    private String returnLogisticsCompany;

    /**
     * 退货物流单号
     */
    private String returnLogisticsCode;

    /**
     * 收货时间
     */
    private Date receiveTime;

    /**
     * 备注
     */
    private String remark;

    /**
     * 发货人
     */
    private String contactperson;

    /**
     * 发货人手机号
     */
    private String mobile;

    /**
     * 发货地址
     */
    private String address;

    /**
     * 状态（0待发货1待收货2已收货3已完成）
     */
    private Integer status;

    /**
     * 订单创建时间
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
     * 退货单号
     */
    public String getRefundNum() {
        return refundNum;
    }

    /**
     * 退货单号
     */
    public void setRefundNum(String refundNum) {
        this.refundNum = refundNum;
    }

    /**
     * 退货类型（1退货2换货）
     */
    public Integer getRefundType() {
        return refundType;
    }

    /**
     * 退货类型（1退货2换货）
     */
    public void setRefundType(Integer refundType) {
        this.refundType = refundType;
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
     * 源订单号
     */
    public String getOrderNum() {
        return orderNum;
    }

    /**
     * 源订单号
     */
    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * 子订单号或id
     */
    public String getOrderItemNum() {
        return orderItemNum;
    }

    /**
     * 子订单号或id
     */
    public void setOrderItemNum(String orderItemNum) {
        this.orderItemNum = orderItemNum;
    }

    /**
     * 源skuId
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 源skuId
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * erp商品id
     */
    public Long getErpGoodsId() {
        return erpGoodsId;
    }

    /**
     * erp商品id
     */
    public void setErpGoodsId(Long erpGoodsId) {
        this.erpGoodsId = erpGoodsId;
    }

    /**
     * erp sku id
     */
    public Long getErpSkuId() {
        return erpSkuId;
    }

    /**
     * erp sku id
     */
    public void setErpSkuId(Long erpSkuId) {
        this.erpSkuId = erpSkuId;
    }

    /**
     * sku编码
     */
    public String getSkuNum() {
        return skuNum;
    }

    /**
     * sku编码
     */
    public void setSkuNum(String skuNum) {
        this.skuNum = skuNum;
    }

    /**
     * 商品名称
     */
    public String getGoodsName() {
        return goodsName;
    }

    /**
     * 商品名称
     */
    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    /**
     * 商品sku
     */
    public String getGoodsSku() {
        return goodsSku;
    }

    /**
     * 商品sku
     */
    public void setGoodsSku(String goodsSku) {
        this.goodsSku = goodsSku;
    }

    /**
     * 商品图片
     */
    public String getGoodsImage() {
        return goodsImage;
    }

    /**
     * 商品图片
     */
    public void setGoodsImage(String goodsImage) {
        this.goodsImage = goodsImage;
    }

    /**
     * 退货数量
     */
    public Long getQuantity() {
        return quantity;
    }

    /**
     * 退货数量
     */
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    /**
     * 退货物流公司
     */
    public String getReturnLogisticsCompany() {
        return returnLogisticsCompany;
    }

    /**
     * 退货物流公司
     */
    public void setReturnLogisticsCompany(String returnLogisticsCompany) {
        this.returnLogisticsCompany = returnLogisticsCompany;
    }

    /**
     * 退货物流单号
     */
    public String getReturnLogisticsCode() {
        return returnLogisticsCode;
    }

    /**
     * 退货物流单号
     */
    public void setReturnLogisticsCode(String returnLogisticsCode) {
        this.returnLogisticsCode = returnLogisticsCode;
    }

    /**
     * 收货时间
     */
    public Date getReceiveTime() {
        return receiveTime;
    }

    /**
     * 收货时间
     */
    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    /**
     * 备注
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 发货人
     */
    public String getContactperson() {
        return contactperson;
    }

    /**
     * 发货人
     */
    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    /**
     * 发货人手机号
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * 发货人手机号
     */
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    /**
     * 发货地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 发货地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 状态（0待发货1待收货2已收货3已完成）
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态（0待发货1待收货2已收货3已完成）
     */
    public void setStatus(Integer status) {
        this.status = status;
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
        ORefund other = (ORefund) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getRefundNum() == null ? other.getRefundNum() == null : this.getRefundNum().equals(other.getRefundNum()))
            && (this.getRefundType() == null ? other.getRefundType() == null : this.getRefundType().equals(other.getRefundType()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getShopType() == null ? other.getShopType() == null : this.getShopType().equals(other.getShopType()))
            && (this.getOrderNum() == null ? other.getOrderNum() == null : this.getOrderNum().equals(other.getOrderNum()))
            && (this.getOrderItemNum() == null ? other.getOrderItemNum() == null : this.getOrderItemNum().equals(other.getOrderItemNum()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getErpSkuId() == null ? other.getErpSkuId() == null : this.getErpSkuId().equals(other.getErpSkuId()))
            && (this.getSkuNum() == null ? other.getSkuNum() == null : this.getSkuNum().equals(other.getSkuNum()))
            && (this.getGoodsName() == null ? other.getGoodsName() == null : this.getGoodsName().equals(other.getGoodsName()))
            && (this.getGoodsSku() == null ? other.getGoodsSku() == null : this.getGoodsSku().equals(other.getGoodsSku()))
            && (this.getGoodsImage() == null ? other.getGoodsImage() == null : this.getGoodsImage().equals(other.getGoodsImage()))
            && (this.getQuantity() == null ? other.getQuantity() == null : this.getQuantity().equals(other.getQuantity()))
            && (this.getReturnLogisticsCompany() == null ? other.getReturnLogisticsCompany() == null : this.getReturnLogisticsCompany().equals(other.getReturnLogisticsCompany()))
            && (this.getReturnLogisticsCode() == null ? other.getReturnLogisticsCode() == null : this.getReturnLogisticsCode().equals(other.getReturnLogisticsCode()))
            && (this.getReceiveTime() == null ? other.getReceiveTime() == null : this.getReceiveTime().equals(other.getReceiveTime()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getContactperson() == null ? other.getContactperson() == null : this.getContactperson().equals(other.getContactperson()))
            && (this.getMobile() == null ? other.getMobile() == null : this.getMobile().equals(other.getMobile()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
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
        result = prime * result + ((getRefundNum() == null) ? 0 : getRefundNum().hashCode());
        result = prime * result + ((getRefundType() == null) ? 0 : getRefundType().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getShopType() == null) ? 0 : getShopType().hashCode());
        result = prime * result + ((getOrderNum() == null) ? 0 : getOrderNum().hashCode());
        result = prime * result + ((getOrderItemNum() == null) ? 0 : getOrderItemNum().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getErpSkuId() == null) ? 0 : getErpSkuId().hashCode());
        result = prime * result + ((getSkuNum() == null) ? 0 : getSkuNum().hashCode());
        result = prime * result + ((getGoodsName() == null) ? 0 : getGoodsName().hashCode());
        result = prime * result + ((getGoodsSku() == null) ? 0 : getGoodsSku().hashCode());
        result = prime * result + ((getGoodsImage() == null) ? 0 : getGoodsImage().hashCode());
        result = prime * result + ((getQuantity() == null) ? 0 : getQuantity().hashCode());
        result = prime * result + ((getReturnLogisticsCompany() == null) ? 0 : getReturnLogisticsCompany().hashCode());
        result = prime * result + ((getReturnLogisticsCode() == null) ? 0 : getReturnLogisticsCode().hashCode());
        result = prime * result + ((getReceiveTime() == null) ? 0 : getReceiveTime().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getContactperson() == null) ? 0 : getContactperson().hashCode());
        result = prime * result + ((getMobile() == null) ? 0 : getMobile().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
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
        sb.append(", refundNum=").append(refundNum);
        sb.append(", refundType=").append(refundType);
        sb.append(", shopId=").append(shopId);
        sb.append(", shopType=").append(shopType);
        sb.append(", orderNum=").append(orderNum);
        sb.append(", orderItemNum=").append(orderItemNum);
        sb.append(", skuId=").append(skuId);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", erpSkuId=").append(erpSkuId);
        sb.append(", skuNum=").append(skuNum);
        sb.append(", goodsName=").append(goodsName);
        sb.append(", goodsSku=").append(goodsSku);
        sb.append(", goodsImage=").append(goodsImage);
        sb.append(", quantity=").append(quantity);
        sb.append(", returnLogisticsCompany=").append(returnLogisticsCompany);
        sb.append(", returnLogisticsCode=").append(returnLogisticsCode);
        sb.append(", receiveTime=").append(receiveTime);
        sb.append(", remark=").append(remark);
        sb.append(", contactperson=").append(contactperson);
        sb.append(", mobile=").append(mobile);
        sb.append(", address=").append(address);
        sb.append(", status=").append(status);
        sb.append(", createTime=").append(createTime);
        sb.append(", createBy=").append(createBy);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}