package com.qihang.sys.api.domain;


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
    * 订单ID（o_order外键）
    */
    private Long orderId;
    /**
    * 子订单号（第三方平台）
    */
    private String subOrderNum;
    /**
    * 第三方平台skuId
    */
    private String skuId;
    /**
    * erp系统商品id
    */
    private Long erpGoodsId;
    /**
    * erp系统商品规格id
    */
    private Long erpSkuId;
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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public String getSubOrderNum() {
        return subOrderNum;
    }

    public void setSubOrderNum(String subOrderNum) {
        this.subOrderNum = subOrderNum;
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId;
    }

    public Long getErpGoodsId() {
        return erpGoodsId;
    }

    public void setErpGoodsId(Long erpGoodsId) {
        this.erpGoodsId = erpGoodsId;
    }

    public Long getErpSkuId() {
        return erpSkuId;
    }

    public void setErpSkuId(Long erpSkuId) {
        this.erpSkuId = erpSkuId;
    }

    public String getGoodsTitle() {
        return goodsTitle;
    }

    public void setGoodsTitle(String goodsTitle) {
        this.goodsTitle = goodsTitle;
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg;
    }

    public String getGoodsNum() {
        return goodsNum;
    }

    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    public String getGoodsSpec() {
        return goodsSpec;
    }

    public void setGoodsSpec(String goodsSpec) {
        this.goodsSpec = goodsSpec;
    }

    public String getSkuNum() {
        return skuNum;
    }

    public void setSkuNum(String skuNum) {
        this.skuNum = skuNum;
    }

    public Double getGoodsPrice() {
        return goodsPrice;
    }

    public void setGoodsPrice(Double goodsPrice) {
        this.goodsPrice = goodsPrice;
    }

    public Double getItemAmount() {
        return itemAmount;
    }

    public void setItemAmount(Double itemAmount) {
        this.itemAmount = itemAmount;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getRefundCount() {
        return refundCount;
    }

    public void setRefundCount(Integer refundCount) {
        this.refundCount = refundCount;
    }

    public Integer getRefundStatus() {
        return refundStatus;
    }

    public void setRefundStatus(Integer refundStatus) {
        this.refundStatus = refundStatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }
}
