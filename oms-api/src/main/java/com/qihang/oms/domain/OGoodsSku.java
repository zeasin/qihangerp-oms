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
        OGoodsSku other = (OGoodsSku) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getErpSkuId() == null ? other.getErpSkuId() == null : this.getErpSkuId().equals(other.getErpSkuId()))
            && (this.getSkuName() == null ? other.getSkuName() == null : this.getSkuName().equals(other.getSkuName()))
            && (this.getSkuNum() == null ? other.getSkuNum() == null : this.getSkuNum().equals(other.getSkuNum()))
            && (this.getColorId() == null ? other.getColorId() == null : this.getColorId().equals(other.getColorId()))
            && (this.getColorValue() == null ? other.getColorValue() == null : this.getColorValue().equals(other.getColorValue()))
            && (this.getColorImage() == null ? other.getColorImage() == null : this.getColorImage().equals(other.getColorImage()))
            && (this.getSizeId() == null ? other.getSizeId() == null : this.getSizeId().equals(other.getSizeId()))
            && (this.getSizeValue() == null ? other.getSizeValue() == null : this.getSizeValue().equals(other.getSizeValue()))
            && (this.getStyleId() == null ? other.getStyleId() == null : this.getStyleId().equals(other.getStyleId()))
            && (this.getStyleValue() == null ? other.getStyleValue() == null : this.getStyleValue().equals(other.getStyleValue()))
            && (this.getBarCode() == null ? other.getBarCode() == null : this.getBarCode().equals(other.getBarCode()))
            && (this.getPurPrice() == null ? other.getPurPrice() == null : this.getPurPrice().equals(other.getPurPrice()))
            && (this.getWholePrice() == null ? other.getWholePrice() == null : this.getWholePrice().equals(other.getWholePrice()))
            && (this.getRetailPrice() == null ? other.getRetailPrice() == null : this.getRetailPrice().equals(other.getRetailPrice()))
            && (this.getUnitCost() == null ? other.getUnitCost() == null : this.getUnitCost().equals(other.getUnitCost()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getLowQty() == null ? other.getLowQty() == null : this.getLowQty().equals(other.getLowQty()))
            && (this.getHighQty() == null ? other.getHighQty() == null : this.getHighQty().equals(other.getHighQty()))
            && (this.getDisable() == null ? other.getDisable() == null : this.getDisable().equals(other.getDisable()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getErpSkuId() == null) ? 0 : getErpSkuId().hashCode());
        result = prime * result + ((getSkuName() == null) ? 0 : getSkuName().hashCode());
        result = prime * result + ((getSkuNum() == null) ? 0 : getSkuNum().hashCode());
        result = prime * result + ((getColorId() == null) ? 0 : getColorId().hashCode());
        result = prime * result + ((getColorValue() == null) ? 0 : getColorValue().hashCode());
        result = prime * result + ((getColorImage() == null) ? 0 : getColorImage().hashCode());
        result = prime * result + ((getSizeId() == null) ? 0 : getSizeId().hashCode());
        result = prime * result + ((getSizeValue() == null) ? 0 : getSizeValue().hashCode());
        result = prime * result + ((getStyleId() == null) ? 0 : getStyleId().hashCode());
        result = prime * result + ((getStyleValue() == null) ? 0 : getStyleValue().hashCode());
        result = prime * result + ((getBarCode() == null) ? 0 : getBarCode().hashCode());
        result = prime * result + ((getPurPrice() == null) ? 0 : getPurPrice().hashCode());
        result = prime * result + ((getWholePrice() == null) ? 0 : getWholePrice().hashCode());
        result = prime * result + ((getRetailPrice() == null) ? 0 : getRetailPrice().hashCode());
        result = prime * result + ((getUnitCost() == null) ? 0 : getUnitCost().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getLowQty() == null) ? 0 : getLowQty().hashCode());
        result = prime * result + ((getHighQty() == null) ? 0 : getHighQty().hashCode());
        result = prime * result + ((getDisable() == null) ? 0 : getDisable().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", erpSkuId=").append(erpSkuId);
        sb.append(", skuName=").append(skuName);
        sb.append(", skuNum=").append(skuNum);
        sb.append(", colorId=").append(colorId);
        sb.append(", colorValue=").append(colorValue);
        sb.append(", colorImage=").append(colorImage);
        sb.append(", sizeId=").append(sizeId);
        sb.append(", sizeValue=").append(sizeValue);
        sb.append(", styleId=").append(styleId);
        sb.append(", styleValue=").append(styleValue);
        sb.append(", barCode=").append(barCode);
        sb.append(", purPrice=").append(purPrice);
        sb.append(", wholePrice=").append(wholePrice);
        sb.append(", retailPrice=").append(retailPrice);
        sb.append(", unitCost=").append(unitCost);
        sb.append(", remark=").append(remark);
        sb.append(", status=").append(status);
        sb.append(", lowQty=").append(lowQty);
        sb.append(", highQty=").append(highQty);
        sb.append(", disable=").append(disable);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}