package cn.qihangerp.module.open.jd.domain;

import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 * 
 * @TableName jd_order_item
 */
@TableName("oms_jd_order_item")
public class JdOrderItem implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     *
     */
    private String orderId;

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

    /**
     * erp商品id
     */
    private String oGoodsId;

    /**
     * erp商品sku id
     */
    private Long oGoodsSkuId;

    private static final long serialVersionUID = 1L;

    public String getoGoodsId() {
        return oGoodsId;
    }

    public void setoGoodsId(String oGoodsId) {
        this.oGoodsId = oGoodsId;
    }

    public Long getoGoodsSkuId() {
        return oGoodsSkuId;
    }

    public void setoGoodsSkuId(Long oGoodsSkuId) {
        this.oGoodsSkuId = oGoodsSkuId;
    }

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
     *
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * 外键id（jd_order表id）
     */
    public void setOrderId(String orderId) {
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

}