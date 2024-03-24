package com.qihang.oms.domain;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商品规格库存管理
 * @TableName o_goods_sku
 */
public class OGoodsSku implements Serializable {
    /**
     * 主键id
     */
    private Long id;
    private Long goodsId;

    /**
     * 商品id
     */
    private Long erpGoodsId;


    /**
     * skuId(唯一)
     */
    private Long erpSkuId;

    /**
     * 规格名
     */
    private String skuName;

    /**
     * 规格编码
     */
    private String skuNum;

    /**
     * 颜色id
     */
    private Integer colorId;

    /**
     * 颜色值
     */
    private String colorValue;

    /**
     * 颜色图片
     */
    private String colorImage;

    /**
     * 尺码id
     */
    private Integer sizeId;

    /**
     * 尺码值
     */
    private String sizeValue;

    /**
     * 款式id
     */
    private Integer styleId;

    /**
     * 款式值
     */
    private String styleValue;

    /**
     * 库存条形码
     */
    private String barCode;

    /**
     * 预计采购价
     */
    private BigDecimal purPrice;

    /**
     * 建议批发价
     */
    private BigDecimal wholePrice;

    /**
     * 建议零售价
     */
    private BigDecimal retailPrice;

    /**
     * 单位成本
     */
    private BigDecimal unitCost;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 最低库存（预警）
     */
    private Integer lowQty;

    /**
     * 最高库存（预警）
     */
    private Integer highQty;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    public Long getId() {
        return id;
    }

    /**
     * 主键id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 商品id
     */
    public Long getErpGoodsId() {
        return erpGoodsId;
    }

    /**
     * 商品id
     */
    public void setErpGoodsId(Long erpGoodsId) {
        this.erpGoodsId = erpGoodsId;
    }

    /**
     * skuId(唯一)
     */
    public Long getErpSkuId() {
        return erpSkuId;
    }

    /**
     * skuId(唯一)
     */
    public void setErpSkuId(Long erpSkuId) {
        this.erpSkuId = erpSkuId;
    }

    /**
     * 规格名
     */
    public String getSkuName() {
        return skuName;
    }

    /**
     * 规格名
     */
    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    /**
     * 规格编码
     */
    public String getSkuNum() {
        return skuNum;
    }

    /**
     * 规格编码
     */
    public void setSkuNum(String skuNum) {
        this.skuNum = skuNum;
    }

    /**
     * 颜色id
     */
    public Integer getColorId() {
        return colorId;
    }

    /**
     * 颜色id
     */
    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }

    /**
     * 颜色值
     */
    public String getColorValue() {
        return colorValue;
    }

    /**
     * 颜色值
     */
    public void setColorValue(String colorValue) {
        this.colorValue = colorValue;
    }

    /**
     * 颜色图片
     */
    public String getColorImage() {
        return colorImage;
    }

    /**
     * 颜色图片
     */
    public void setColorImage(String colorImage) {
        this.colorImage = colorImage;
    }

    /**
     * 尺码id
     */
    public Integer getSizeId() {
        return sizeId;
    }

    /**
     * 尺码id
     */
    public void setSizeId(Integer sizeId) {
        this.sizeId = sizeId;
    }

    /**
     * 尺码值
     */
    public String getSizeValue() {
        return sizeValue;
    }

    /**
     * 尺码值
     */
    public void setSizeValue(String sizeValue) {
        this.sizeValue = sizeValue;
    }

    /**
     * 款式id
     */
    public Integer getStyleId() {
        return styleId;
    }

    /**
     * 款式id
     */
    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    /**
     * 款式值
     */
    public String getStyleValue() {
        return styleValue;
    }

    /**
     * 款式值
     */
    public void setStyleValue(String styleValue) {
        this.styleValue = styleValue;
    }

    /**
     * 库存条形码
     */
    public String getBarCode() {
        return barCode;
    }

    /**
     * 库存条形码
     */
    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    /**
     * 预计采购价
     */
    public BigDecimal getPurPrice() {
        return purPrice;
    }

    /**
     * 预计采购价
     */
    public void setPurPrice(BigDecimal purPrice) {
        this.purPrice = purPrice;
    }

    /**
     * 建议批发价
     */
    public BigDecimal getWholePrice() {
        return wholePrice;
    }

    /**
     * 建议批发价
     */
    public void setWholePrice(BigDecimal wholePrice) {
        this.wholePrice = wholePrice;
    }

    /**
     * 建议零售价
     */
    public BigDecimal getRetailPrice() {
        return retailPrice;
    }

    /**
     * 建议零售价
     */
    public void setRetailPrice(BigDecimal retailPrice) {
        this.retailPrice = retailPrice;
    }

    /**
     * 单位成本
     */
    public BigDecimal getUnitCost() {
        return unitCost;
    }

    /**
     * 单位成本
     */
    public void setUnitCost(BigDecimal unitCost) {
        this.unitCost = unitCost;
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
     * 状态
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 最低库存（预警）
     */
    public Integer getLowQty() {
        return lowQty;
    }

    /**
     * 最低库存（预警）
     */
    public void setLowQty(Integer lowQty) {
        this.lowQty = lowQty;
    }

    /**
     * 最高库存（预警）
     */
    public Integer getHighQty() {
        return highQty;
    }

    /**
     * 最高库存（预警）
     */
    public void setHighQty(Integer highQty) {
        this.highQty = highQty;
    }

    /**
     * 0启用   1禁用
     */
    public Integer getDisable() {
        return disable;
    }

    /**
     * 0启用   1禁用
     */
    public void setDisable(Integer disable) {
        this.disable = disable;
    }

    public Long getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }
}