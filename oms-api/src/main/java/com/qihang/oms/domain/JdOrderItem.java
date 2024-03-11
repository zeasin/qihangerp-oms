package com.qihang.oms.domain;

import java.io.Serializable;

/**
 * 
 * @TableName jd_order_item
 */
public class JdOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 外键id（jd_order表id）
     */
    private Long orderId;

    /**
     * 京东内部SKU的ID
     */
    private String skuId;

    /**
     * SKU外部ID（极端情况下不保证返回，建议从商品接口获取
     */
    private String outerSkuId;

    /**
     * 商品的名称+SKU规格
     */
    private String skuName;

    /**
     * SKU的京东价
     */
    private String jdPrice;

    /**
     * 赠送积分
     */
    private String giftPoint;

    /**
     * 	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）
     */
    private String wareId;

    /**
     * 数量
     */
    private String itemTotal;

    /**
     * 
     */
    private String productNo;

    /**
     * 
     */
    private String serviceName;

    /**
     * 
     */
    private String newStoreId;

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
     * 外键id（jd_order表id）
     */
    public Long getOrderId() {
        return orderId;
    }

    /**
     * 外键id（jd_order表id）
     */
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    /**
     * 京东内部SKU的ID
     */
    public String getSkuId() {
        return skuId;
    }

    /**
     * 京东内部SKU的ID
     */
    public void setSkuId(String skuId) {
        this.skuId = skuId;
    }

    /**
     * SKU外部ID（极端情况下不保证返回，建议从商品接口获取
     */
    public String getOuterSkuId() {
        return outerSkuId;
    }

    /**
     * SKU外部ID（极端情况下不保证返回，建议从商品接口获取
     */
    public void setOuterSkuId(String outerSkuId) {
        this.outerSkuId = outerSkuId;
    }

    /**
     * 商品的名称+SKU规格
     */
    public String getSkuName() {
        return skuName;
    }

    /**
     * 商品的名称+SKU规格
     */
    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    /**
     * SKU的京东价
     */
    public String getJdPrice() {
        return jdPrice;
    }

    /**
     * SKU的京东价
     */
    public void setJdPrice(String jdPrice) {
        this.jdPrice = jdPrice;
    }

    /**
     * 赠送积分
     */
    public String getGiftPoint() {
        return giftPoint;
    }

    /**
     * 赠送积分
     */
    public void setGiftPoint(String giftPoint) {
        this.giftPoint = giftPoint;
    }

    /**
     * 	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）
     */
    public String getWareId() {
        return wareId;
    }

    /**
     * 	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）
     */
    public void setWareId(String wareId) {
        this.wareId = wareId;
    }

    /**
     * 数量
     */
    public String getItemTotal() {
        return itemTotal;
    }

    /**
     * 数量
     */
    public void setItemTotal(String itemTotal) {
        this.itemTotal = itemTotal;
    }

    /**
     * 
     */
    public String getProductNo() {
        return productNo;
    }

    /**
     * 
     */
    public void setProductNo(String productNo) {
        this.productNo = productNo;
    }

    /**
     * 
     */
    public String getServiceName() {
        return serviceName;
    }

    /**
     * 
     */
    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    /**
     * 
     */
    public String getNewStoreId() {
        return newStoreId;
    }

    /**
     * 
     */
    public void setNewStoreId(String newStoreId) {
        this.newStoreId = newStoreId;
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
        JdOrderItem other = (JdOrderItem) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getOuterSkuId() == null ? other.getOuterSkuId() == null : this.getOuterSkuId().equals(other.getOuterSkuId()))
            && (this.getSkuName() == null ? other.getSkuName() == null : this.getSkuName().equals(other.getSkuName()))
            && (this.getJdPrice() == null ? other.getJdPrice() == null : this.getJdPrice().equals(other.getJdPrice()))
            && (this.getGiftPoint() == null ? other.getGiftPoint() == null : this.getGiftPoint().equals(other.getGiftPoint()))
            && (this.getWareId() == null ? other.getWareId() == null : this.getWareId().equals(other.getWareId()))
            && (this.getItemTotal() == null ? other.getItemTotal() == null : this.getItemTotal().equals(other.getItemTotal()))
            && (this.getProductNo() == null ? other.getProductNo() == null : this.getProductNo().equals(other.getProductNo()))
            && (this.getServiceName() == null ? other.getServiceName() == null : this.getServiceName().equals(other.getServiceName()))
            && (this.getNewStoreId() == null ? other.getNewStoreId() == null : this.getNewStoreId().equals(other.getNewStoreId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getOuterSkuId() == null) ? 0 : getOuterSkuId().hashCode());
        result = prime * result + ((getSkuName() == null) ? 0 : getSkuName().hashCode());
        result = prime * result + ((getJdPrice() == null) ? 0 : getJdPrice().hashCode());
        result = prime * result + ((getGiftPoint() == null) ? 0 : getGiftPoint().hashCode());
        result = prime * result + ((getWareId() == null) ? 0 : getWareId().hashCode());
        result = prime * result + ((getItemTotal() == null) ? 0 : getItemTotal().hashCode());
        result = prime * result + ((getProductNo() == null) ? 0 : getProductNo().hashCode());
        result = prime * result + ((getServiceName() == null) ? 0 : getServiceName().hashCode());
        result = prime * result + ((getNewStoreId() == null) ? 0 : getNewStoreId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", orderId=").append(orderId);
        sb.append(", skuId=").append(skuId);
        sb.append(", outerSkuId=").append(outerSkuId);
        sb.append(", skuName=").append(skuName);
        sb.append(", jdPrice=").append(jdPrice);
        sb.append(", giftPoint=").append(giftPoint);
        sb.append(", wareId=").append(wareId);
        sb.append(", itemTotal=").append(itemTotal);
        sb.append(", productNo=").append(productNo);
        sb.append(", serviceName=").append(serviceName);
        sb.append(", newStoreId=").append(newStoreId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}