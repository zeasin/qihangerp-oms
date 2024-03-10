package com.qihang.sys.api.domain;

import java.io.Serializable;

/**
 * 
 * @TableName jd_refund
 */
public class JdRefund implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 退款单id
     */
    private String refundId;

    /**
     * 客户帐号
     */
    private String buyerId;

    /**
     * 客户姓名
     */
    private String buyerName;

    /**
     * 审核日期
     */
    private String checkTime;

    /**
     * 申请时间
     */
    private String applyTime;

    /**
     * 退款金额
     */
    private String applyRefundSum;

    /**
     * 审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
     */
    private String status;

    /**
     * 审核人
     */
    private String checkUsername;

    /**
     * 订单号
     */
    private String orderId;

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
     * 退款单id
     */
    public String getRefundId() {
        return refundId;
    }

    /**
     * 退款单id
     */
    public void setRefundId(String refundId) {
        this.refundId = refundId;
    }

    /**
     * 客户帐号
     */
    public String getBuyerId() {
        return buyerId;
    }

    /**
     * 客户帐号
     */
    public void setBuyerId(String buyerId) {
        this.buyerId = buyerId;
    }

    /**
     * 客户姓名
     */
    public String getBuyerName() {
        return buyerName;
    }

    /**
     * 客户姓名
     */
    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    /**
     * 审核日期
     */
    public String getCheckTime() {
        return checkTime;
    }

    /**
     * 审核日期
     */
    public void setCheckTime(String checkTime) {
        this.checkTime = checkTime;
    }

    /**
     * 申请时间
     */
    public String getApplyTime() {
        return applyTime;
    }

    /**
     * 申请时间
     */
    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }

    /**
     * 退款金额
     */
    public String getApplyRefundSum() {
        return applyRefundSum;
    }

    /**
     * 退款金额
     */
    public void setApplyRefundSum(String applyRefundSum) {
        this.applyRefundSum = applyRefundSum;
    }

    /**
     * 审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
     */
    public String getStatus() {
        return status;
    }

    /**
     * 审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 审核人
     */
    public String getCheckUsername() {
        return checkUsername;
    }

    /**
     * 审核人
     */
    public void setCheckUsername(String checkUsername) {
        this.checkUsername = checkUsername;
    }

    /**
     * 订单号
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 订单号
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
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
        JdRefund other = (JdRefund) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getRefundId() == null ? other.getRefundId() == null : this.getRefundId().equals(other.getRefundId()))
            && (this.getBuyerId() == null ? other.getBuyerId() == null : this.getBuyerId().equals(other.getBuyerId()))
            && (this.getBuyerName() == null ? other.getBuyerName() == null : this.getBuyerName().equals(other.getBuyerName()))
            && (this.getCheckTime() == null ? other.getCheckTime() == null : this.getCheckTime().equals(other.getCheckTime()))
            && (this.getApplyTime() == null ? other.getApplyTime() == null : this.getApplyTime().equals(other.getApplyTime()))
            && (this.getApplyRefundSum() == null ? other.getApplyRefundSum() == null : this.getApplyRefundSum().equals(other.getApplyRefundSum()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getCheckUsername() == null ? other.getCheckUsername() == null : this.getCheckUsername().equals(other.getCheckUsername()))
            && (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getRefundId() == null) ? 0 : getRefundId().hashCode());
        result = prime * result + ((getBuyerId() == null) ? 0 : getBuyerId().hashCode());
        result = prime * result + ((getBuyerName() == null) ? 0 : getBuyerName().hashCode());
        result = prime * result + ((getCheckTime() == null) ? 0 : getCheckTime().hashCode());
        result = prime * result + ((getApplyTime() == null) ? 0 : getApplyTime().hashCode());
        result = prime * result + ((getApplyRefundSum() == null) ? 0 : getApplyRefundSum().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getCheckUsername() == null) ? 0 : getCheckUsername().hashCode());
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
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
        sb.append(", refundId=").append(refundId);
        sb.append(", buyerId=").append(buyerId);
        sb.append(", buyerName=").append(buyerName);
        sb.append(", checkTime=").append(checkTime);
        sb.append(", applyTime=").append(applyTime);
        sb.append(", applyRefundSum=").append(applyRefundSum);
        sb.append(", status=").append(status);
        sb.append(", checkUsername=").append(checkUsername);
        sb.append(", orderId=").append(orderId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}