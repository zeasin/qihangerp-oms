package com.qihang.jd.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单明细表
 * @TableName o_order_item
 */
public class OOrderItem implements Serializable {
    /**
     * id，自增
     */
    private Long id;

    /**
     * 订单ID
     */
    private Long orderId;

    /**
     * erp系统商品id
     */
    private Long goodsId;

    /**
     * erp系统商品规格id
     */
    private Long skuId;

    /**
     * 商品标题
     */
    private String goodsTitle;

    /**
     * 商品图片
     */
    private String goodsImg;

    /**
     * 商品编码
     */
    private String goodsNum;

    /**
     * 商品规格
     */
    private String goodsSpec;

    /**
     * 商品规格编码
     */
    private String skuNum;

    /**
     * 商品单价
     */
    private Double goodsPrice;

    /**
     * 子订单金额
     */
    private Double itemAmount;

    /**
     * 商品数量
     */
    private Integer quantity;

    /**
     * 备注
     */
    private String remark;

    /**
     * 已退货数量
     */
    private Integer refundCount;

    /**
     * 售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 
     */
    private Integer refundStatus;

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

    private static final long serialVersionUID = 1L;

    /**
     * id，自增
     */
    public Long getId() {
        return id;
    }

    /**
     * id，自增
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 订单ID
     */
    public Long getOrderId() {
        return orderId;
    }

    /**
     * 订单ID
     */
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    /**
     * erp系统商品id
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * erp系统商品id
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * erp系统商品规格id
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * erp系统商品规格id
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * 商品标题
     */
    public String getGoodsTitle() {
        return goodsTitle;
    }

    /**
     * 商品标题
     */
    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    /**
     * 商品图片
     */
    public String getGoodsImg() {
        return goodsImg;
    }

    /**
     * 商品图片
     */
    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    /**
     * 商品编码
     */
    public String getGoodsNum() {
        return goodsNum;
    }

    /**
     * 商品编码
     */
    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    /**
     * 商品规格
     */
    public String getGoodsSpec() {
        return goodsSpec;
    }

    /**
     * 商品规格
     */
    public void setGoodsSpec(String goodsSpec) {
        this.goodsSpec = goodsSpec;
    }

    /**
     * 商品规格编码
     */
    public String getSkuNum() {
        return skuNum;
    }

    /**
     * 商品规格编码
     */
    public void setSkuNum(String skuNum) {
        this.skuNum = skuNum;
    }

    /**
     * 商品单价
     */
    public Double getGoodsPrice() {
        return goodsPrice;
    }

    /**
     * 商品单价
     */
    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    /**
     * 子订单金额
     */
    public Double getItemAmount() {
        return itemAmount;
    }

    /**
     * 子订单金额
     */
    public void setItemAmount(Double itemAmount) {
        this.itemAmount = itemAmount;
    }

    /**
     * 商品数量
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * 商品数量
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
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
     * 已退货数量
     */
    public Integer getRefundCount() {
        return refundCount;
    }

    /**
     * 已退货数量
     */
    public void setRefundCount(Integer refundCount) {
        this.refundCount = refundCount;
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
        OOrderItem other = (OOrderItem) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getGoodsId() == null ? other.getGoodsId() == null : this.getGoodsId().equals(other.getGoodsId()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getGoodsTitle() == null ? other.getGoodsTitle() == null : this.getGoodsTitle().equals(other.getGoodsTitle()))
            && (this.getGoodsImg() == null ? other.getGoodsImg() == null : this.getGoodsImg().equals(other.getGoodsImg()))
            && (this.getGoodsNum() == null ? other.getGoodsNum() == null : this.getGoodsNum().equals(other.getGoodsNum()))
            && (this.getGoodsSpec() == null ? other.getGoodsSpec() == null : this.getGoodsSpec().equals(other.getGoodsSpec()))
            && (this.getSkuNum() == null ? other.getSkuNum() == null : this.getSkuNum().equals(other.getSkuNum()))
            && (this.getGoodsPrice() == null ? other.getGoodsPrice() == null : this.getGoodsPrice().equals(other.getGoodsPrice()))
            && (this.getItemAmount() == null ? other.getItemAmount() == null : this.getItemAmount().equals(other.getItemAmount()))
            && (this.getQuantity() == null ? other.getQuantity() == null : this.getQuantity().equals(other.getQuantity()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getRefundCount() == null ? other.getRefundCount() == null : this.getRefundCount().equals(other.getRefundCount()))
            && (this.getRefundStatus() == null ? other.getRefundStatus() == null : this.getRefundStatus().equals(other.getRefundStatus()))
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
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getGoodsTitle() == null) ? 0 : getGoodsTitle().hashCode());
        result = prime * result + ((getGoodsImg() == null) ? 0 : getGoodsImg().hashCode());
        result = prime * result + ((getGoodsNum() == null) ? 0 : getGoodsNum().hashCode());
        result = prime * result + ((getGoodsSpec() == null) ? 0 : getGoodsSpec().hashCode());
        result = prime * result + ((getSkuNum() == null) ? 0 : getSkuNum().hashCode());
        result = prime * result + ((getGoodsPrice() == null) ? 0 : getGoodsPrice().hashCode());
        result = prime * result + ((getItemAmount() == null) ? 0 : getItemAmount().hashCode());
        result = prime * result + ((getQuantity() == null) ? 0 : getQuantity().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getRefundCount() == null) ? 0 : getRefundCount().hashCode());
        result = prime * result + ((getRefundStatus() == null) ? 0 : getRefundStatus().hashCode());
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
        sb.append(", orderId=").append(orderId);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", skuId=").append(skuId);
        sb.append(", goodsTitle=").append(goodsTitle);
        sb.append(", goodsImg=").append(goodsImg);
        sb.append(", goodsNum=").append(goodsNum);
        sb.append(", goodsSpec=").append(goodsSpec);
        sb.append(", skuNum=").append(skuNum);
        sb.append(", goodsPrice=").append(goodsPrice);
        sb.append(", itemAmount=").append(itemAmount);
        sb.append(", quantity=").append(quantity);
        sb.append(", remark=").append(remark);
        sb.append(", refundCount=").append(refundCount);
        sb.append(", refundStatus=").append(refundStatus);
        sb.append(", createTime=").append(createTime);
        sb.append(", createBy=").append(createBy);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}