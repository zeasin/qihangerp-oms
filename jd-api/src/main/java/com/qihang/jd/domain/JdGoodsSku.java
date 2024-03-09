package com.qihang.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 
 * @TableName jd_goods_sku
 */
public class JdGoodsSku implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 外键（jd_goods表id）
     */
    private Long goodsId;

    /**
     * 
     */
    private Long wareId;

    /**
     * 
     */
    private Long skuId;

    /**
     * 
     */
    private Integer status;

    /**
     * 
     */
    private BigDecimal jdPrice;

    /**
     * 
     */
    private String outerId;

    /**
     * 
     */
    private String barCode;

    /**
     * 
     */
    private String logo;

    /**
     * 
     */
    private String saleAttrs;

    /**
     * 
     */
    private String skuName;

    /**
     * 
     */
    private Integer stockNum;

    /**
     * 
     */
    private Date modified;

    /**
     * 
     */
    private Date created;

    /**
     * 
     */
    private String currencySpuId;

    /**
     * erp商品id
     */
    private Long erpGoodsId;

    /**
     * erp商品sku id
     */
    private Long erpSkuId;

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
     * 外键（jd_goods表id）
     */
    public Long getGoodsId() {
        return goodsId;
    }

    /**
     * 外键（jd_goods表id）
     */
    public void setGoodsId(Long goodsId) {
        this.goodsId = goodsId;
    }

    /**
     * 
     */
    public Long getWareId() {
        return wareId;
    }

    /**
     * 
     */
    public void setWareId(Long wareId) {
        this.wareId = wareId;
    }

    /**
     * 
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * 
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 
     */
    public BigDecimal getJdPrice() {
        return jdPrice;
    }

    /**
     * 
     */
    public void setJdPrice(BigDecimal jdPrice) {
        this.jdPrice = jdPrice;
    }

    /**
     * 
     */
    public String getOuterId() {
        return outerId;
    }

    /**
     * 
     */
    public void setOuterId(String outerId) {
        this.outerId = outerId;
    }

    /**
     * 
     */
    public String getBarCode() {
        return barCode;
    }

    /**
     * 
     */
    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    /**
     * 
     */
    public String getLogo() {
        return logo;
    }

    /**
     * 
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }

    /**
     * 
     */
    public String getSaleAttrs() {
        return saleAttrs;
    }

    /**
     * 
     */
    public void setSaleAttrs(String saleAttrs) {
        this.saleAttrs = saleAttrs;
    }

    /**
     * 
     */
    public String getSkuName() {
        return skuName;
    }

    /**
     * 
     */
    public void setSkuName(String skuName) {
        this.skuName = skuName;
    }

    /**
     * 
     */
    public Integer getStockNum() {
        return stockNum;
    }

    /**
     * 
     */
    public void setStockNum(Integer stockNum) {
        this.stockNum = stockNum;
    }

    /**
     * 
     */
    public Date getModified() {
        return modified;
    }

    /**
     * 
     */
    public void setModified(Date modified) {
        this.modified = modified;
    }

    /**
     * 
     */
    public Date getCreated() {
        return created;
    }

    /**
     * 
     */
    public void setCreated(Date created) {
        this.created = created;
    }

    /**
     * 
     */
    public String getCurrencySpuId() {
        return currencySpuId;
    }

    /**
     * 
     */
    public void setCurrencySpuId(String currencySpuId) {
        this.currencySpuId = currencySpuId;
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
     * erp商品sku id
     */
    public Long getErpSkuId() {
        return erpSkuId;
    }

    /**
     * erp商品sku id
     */
    public void setErpSkuId(Long erpSkuId) {
        this.erpSkuId = erpSkuId;
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
        JdGoodsSku other = (JdGoodsSku) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getGoodsId() == null ? other.getGoodsId() == null : this.getGoodsId().equals(other.getGoodsId()))
            && (this.getWareId() == null ? other.getWareId() == null : this.getWareId().equals(other.getWareId()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getJdPrice() == null ? other.getJdPrice() == null : this.getJdPrice().equals(other.getJdPrice()))
            && (this.getOuterId() == null ? other.getOuterId() == null : this.getOuterId().equals(other.getOuterId()))
            && (this.getBarCode() == null ? other.getBarCode() == null : this.getBarCode().equals(other.getBarCode()))
            && (this.getLogo() == null ? other.getLogo() == null : this.getLogo().equals(other.getLogo()))
            && (this.getSaleAttrs() == null ? other.getSaleAttrs() == null : this.getSaleAttrs().equals(other.getSaleAttrs()))
            && (this.getSkuName() == null ? other.getSkuName() == null : this.getSkuName().equals(other.getSkuName()))
            && (this.getStockNum() == null ? other.getStockNum() == null : this.getStockNum().equals(other.getStockNum()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getCreated() == null ? other.getCreated() == null : this.getCreated().equals(other.getCreated()))
            && (this.getCurrencySpuId() == null ? other.getCurrencySpuId() == null : this.getCurrencySpuId().equals(other.getCurrencySpuId()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getErpSkuId() == null ? other.getErpSkuId() == null : this.getErpSkuId().equals(other.getErpSkuId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getGoodsId() == null) ? 0 : getGoodsId().hashCode());
        result = prime * result + ((getWareId() == null) ? 0 : getWareId().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getJdPrice() == null) ? 0 : getJdPrice().hashCode());
        result = prime * result + ((getOuterId() == null) ? 0 : getOuterId().hashCode());
        result = prime * result + ((getBarCode() == null) ? 0 : getBarCode().hashCode());
        result = prime * result + ((getLogo() == null) ? 0 : getLogo().hashCode());
        result = prime * result + ((getSaleAttrs() == null) ? 0 : getSaleAttrs().hashCode());
        result = prime * result + ((getSkuName() == null) ? 0 : getSkuName().hashCode());
        result = prime * result + ((getStockNum() == null) ? 0 : getStockNum().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getCreated() == null) ? 0 : getCreated().hashCode());
        result = prime * result + ((getCurrencySpuId() == null) ? 0 : getCurrencySpuId().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getErpSkuId() == null) ? 0 : getErpSkuId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", goodsId=").append(goodsId);
        sb.append(", wareId=").append(wareId);
        sb.append(", skuId=").append(skuId);
        sb.append(", status=").append(status);
        sb.append(", jdPrice=").append(jdPrice);
        sb.append(", outerId=").append(outerId);
        sb.append(", barCode=").append(barCode);
        sb.append(", logo=").append(logo);
        sb.append(", saleAttrs=").append(saleAttrs);
        sb.append(", skuName=").append(skuName);
        sb.append(", stockNum=").append(stockNum);
        sb.append(", modified=").append(modified);
        sb.append(", created=").append(created);
        sb.append(", currencySpuId=").append(currencySpuId);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", erpSkuId=").append(erpSkuId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}