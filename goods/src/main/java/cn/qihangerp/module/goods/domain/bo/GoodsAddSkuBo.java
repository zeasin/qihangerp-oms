package cn.qihangerp.module.goods.domain.bo;

import java.math.BigDecimal;

public class GoodsAddSkuBo {
    private Long colorId;
    private String colorValue;
    private Long sizeId;
    private String sizeValue;
    private Long styleId;
    private String styleValue;

    private String specNum;

    private BigDecimal purPrice;

    //外部ERP商品Sku Id
    private String outerErpSkuId;

    public String getOuterErpSkuId() {
        return outerErpSkuId;
    }

    public void setOuterErpSkuId(String outerErpSkuId) {
        this.outerErpSkuId = outerErpSkuId;
    }

    public Long getColorId() {
        return colorId;
    }

    public void setColorId(Long colorId) {
        this.colorId = colorId;
    }

    public String getColorValue() {
        return colorValue;
    }

    public void setColorValue(String colorValue) {
        this.colorValue = colorValue;
    }

    public Long getSizeId() {
        return sizeId;
    }

    public void setSizeId(Long sizeId) {
        this.sizeId = sizeId;
    }

    public String getSizeValue() {
        return sizeValue;
    }

    public void setSizeValue(String sizeValue) {
        this.sizeValue = sizeValue;
    }

    public Long getStyleId() {
        return styleId;
    }

    public void setStyleId(Long styleId) {
        this.styleId = styleId;
    }

    public String getStyleValue() {
        return styleValue;
    }

    public void setStyleValue(String styleValue) {
        this.styleValue = styleValue;
    }

    public String getSpecNum() {
        return specNum;
    }

    public void setSpecNum(String specNum) {
        this.specNum = specNum;
    }

    public BigDecimal getPurPrice() {
        return purPrice;
    }

    public void setPurPrice(BigDecimal purPrice) {
        this.purPrice = purPrice;
    }
}
