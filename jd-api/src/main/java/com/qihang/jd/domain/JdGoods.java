package com.qihang.jd.domain;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 
 * @TableName jd_goods
 */
public class JdGoods implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 商品id
     */
    private Long wareId;

    /**
     * 商品名称
     */
    private String title;

    /**
     * 商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败
     */
    private Integer wareStatus;

    /**
     * 	商品外部ID,商家自行设置的ID（便于关联京东商品）
     */
    private String outerId;

    /**
     * 商品货号
     */
    private String itemNum;

    /**
     * 商品的条形码.UPC码,SN码,PLU码统称为条形码
     */
    private String barCode;

    /**
     * 商品最后一次修改时间
     */
    private Date modified;

    /**
     * 商品创建时间，只读属性
     */
    private Date created;

    /**
     * 最后下架时间
     */
    private Date offlineTime;

    /**
     * 最后上架时间
     */
    private Date onlineTime;

    /**
     * 发货地
     */
    private String delivery;

    /**
     * 包装清单
     */
    private String packListing;

    /**
     * 包装规格
     */
    private String wrap;

    /**
     * 
     */
    private Float weight;

    /**
     * 
     */
    private Integer width;

    /**
     * 
     */
    private Integer height;

    /**
     * 
     */
    private Integer length;

    /**
     * 
     */
    private String mobileDesc;

    /**
     * 
     */
    private String introduction;

    /**
     * 
     */
    private String afterSales;

    /**
     * 
     */
    private String logo;

    /**
     * 
     */
    private BigDecimal marketPrice;

    /**
     * 
     */
    private BigDecimal costPrice;

    /**
     * 
     */
    private BigDecimal jdPrice;

    /**
     * 
     */
    private String brandName;

    /**
     * 
     */
    private Integer stockNum;

    /**
     * 
     */
    private Integer shopId;

    /**
     * 
     */
    private String sellPoint;

    /**
     * 
     */
    private String afterSaleDesc;

    /**
     * 
     */
    private String spuId;
    @TableField(exist = false)
    private List<JdGoodsSku> skuList;

    public List<JdGoodsSku> getSkuList() {
        return skuList;
    }

    public void setSkuList(List<JdGoodsSku> skuList) {
        this.skuList = skuList;
    }

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
     * 商品id
     */
    public Long getWareId() {
        return wareId;
    }

    /**
     * 商品id
     */
    public void setWareId(Long wareId) {
        this.wareId = wareId;
    }

    /**
     * 商品名称
     */
    public String getTitle() {
        return title;
    }

    /**
     * 商品名称
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败
     */
    public Integer getWareStatus() {
        return wareStatus;
    }

    /**
     * 商品状态 -1：删除 1:从未上架 2:自主下架 4:系统下架 8:上架 513:从未上架待审 514:自主下架待审 516:系统下架待审 520:上架待审核 1028:系统下架审核失败
     */
    public void setWareStatus(Integer wareStatus) {
        this.wareStatus = wareStatus;
    }

    /**
     * 	商品外部ID,商家自行设置的ID（便于关联京东商品）
     */
    public String getOuterId() {
        return outerId;
    }

    /**
     * 	商品外部ID,商家自行设置的ID（便于关联京东商品）
     */
    public void setOuterId(String outerId) {
        this.outerId = outerId;
    }

    /**
     * 商品货号
     */
    public String getItemNum() {
        return itemNum;
    }

    /**
     * 商品货号
     */
    public void setItemNum(String itemNum) {
        this.itemNum = itemNum;
    }

    /**
     * 商品的条形码.UPC码,SN码,PLU码统称为条形码
     */
    public String getBarCode() {
        return barCode;
    }

    /**
     * 商品的条形码.UPC码,SN码,PLU码统称为条形码
     */
    public void setBarCode(String barCode) {
        this.barCode = barCode;
    }

    /**
     * 商品最后一次修改时间
     */
    public Date getModified() {
        return modified;
    }

    /**
     * 商品最后一次修改时间
     */
    public void setModified(Date modified) {
        this.modified = modified;
    }

    /**
     * 商品创建时间，只读属性
     */
    public Date getCreated() {
        return created;
    }

    /**
     * 商品创建时间，只读属性
     */
    public void setCreated(Date created) {
        this.created = created;
    }

    /**
     * 最后下架时间
     */
    public Date getOfflineTime() {
        return offlineTime;
    }

    /**
     * 最后下架时间
     */
    public void setOfflineTime(Date offlineTime) {
        this.offlineTime = offlineTime;
    }

    /**
     * 最后上架时间
     */
    public Date getOnlineTime() {
        return onlineTime;
    }

    /**
     * 最后上架时间
     */
    public void setOnlineTime(Date onlineTime) {
        this.onlineTime = onlineTime;
    }

    /**
     * 发货地
     */
    public String getDelivery() {
        return delivery;
    }

    /**
     * 发货地
     */
    public void setDelivery(String delivery) {
        this.delivery = delivery;
    }

    /**
     * 包装清单
     */
    public String getPackListing() {
        return packListing;
    }

    /**
     * 包装清单
     */
    public void setPackListing(String packListing) {
        this.packListing = packListing;
    }

    /**
     * 包装规格
     */
    public String getWrap() {
        return wrap;
    }

    /**
     * 包装规格
     */
    public void setWrap(String wrap) {
        this.wrap = wrap;
    }

    /**
     * 
     */
    public Float getWeight() {
        return weight;
    }

    /**
     * 
     */
    public void setWeight(Float weight) {
        this.weight = weight;
    }

    /**
     * 
     */
    public Integer getWidth() {
        return width;
    }

    /**
     * 
     */
    public void setWidth(Integer width) {
        this.width = width;
    }

    /**
     * 
     */
    public Integer getHeight() {
        return height;
    }

    /**
     * 
     */
    public void setHeight(Integer height) {
        this.height = height;
    }

    /**
     * 
     */
    public Integer getLength() {
        return length;
    }

    /**
     * 
     */
    public void setLength(Integer length) {
        this.length = length;
    }

    /**
     * 
     */
    public String getMobileDesc() {
        return mobileDesc;
    }

    /**
     * 
     */
    public void setMobileDesc(String mobileDesc) {
        this.mobileDesc = mobileDesc;
    }

    /**
     * 
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * 
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * 
     */
    public String getAfterSales() {
        return afterSales;
    }

    /**
     * 
     */
    public void setAfterSales(String afterSales) {
        this.afterSales = afterSales;
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
    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    /**
     * 
     */
    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    /**
     * 
     */
    public BigDecimal getCostPrice() {
        return costPrice;
    }

    /**
     * 
     */
    public void setCostPrice(BigDecimal costPrice) {
        this.costPrice = costPrice;
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
    public String getBrandName() {
        return brandName;
    }

    /**
     * 
     */
    public void setBrandName(String brandName) {
        this.brandName = brandName;
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
    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 
     */
    public String getSellPoint() {
        return sellPoint;
    }

    /**
     * 
     */
    public void setSellPoint(String sellPoint) {
        this.sellPoint = sellPoint;
    }

    /**
     * 
     */
    public String getAfterSaleDesc() {
        return afterSaleDesc;
    }

    /**
     * 
     */
    public void setAfterSaleDesc(String afterSaleDesc) {
        this.afterSaleDesc = afterSaleDesc;
    }

    /**
     * 
     */
    public String getSpuId() {
        return spuId;
    }

    /**
     * 
     */
    public void setSpuId(String spuId) {
        this.spuId = spuId;
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
        JdGoods other = (JdGoods) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getWareId() == null ? other.getWareId() == null : this.getWareId().equals(other.getWareId()))
            && (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
            && (this.getWareStatus() == null ? other.getWareStatus() == null : this.getWareStatus().equals(other.getWareStatus()))
            && (this.getOuterId() == null ? other.getOuterId() == null : this.getOuterId().equals(other.getOuterId()))
            && (this.getItemNum() == null ? other.getItemNum() == null : this.getItemNum().equals(other.getItemNum()))
            && (this.getBarCode() == null ? other.getBarCode() == null : this.getBarCode().equals(other.getBarCode()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getCreated() == null ? other.getCreated() == null : this.getCreated().equals(other.getCreated()))
            && (this.getOfflineTime() == null ? other.getOfflineTime() == null : this.getOfflineTime().equals(other.getOfflineTime()))
            && (this.getOnlineTime() == null ? other.getOnlineTime() == null : this.getOnlineTime().equals(other.getOnlineTime()))
            && (this.getDelivery() == null ? other.getDelivery() == null : this.getDelivery().equals(other.getDelivery()))
            && (this.getPackListing() == null ? other.getPackListing() == null : this.getPackListing().equals(other.getPackListing()))
            && (this.getWrap() == null ? other.getWrap() == null : this.getWrap().equals(other.getWrap()))
            && (this.getWeight() == null ? other.getWeight() == null : this.getWeight().equals(other.getWeight()))
            && (this.getWidth() == null ? other.getWidth() == null : this.getWidth().equals(other.getWidth()))
            && (this.getHeight() == null ? other.getHeight() == null : this.getHeight().equals(other.getHeight()))
            && (this.getLength() == null ? other.getLength() == null : this.getLength().equals(other.getLength()))
            && (this.getMobileDesc() == null ? other.getMobileDesc() == null : this.getMobileDesc().equals(other.getMobileDesc()))
            && (this.getIntroduction() == null ? other.getIntroduction() == null : this.getIntroduction().equals(other.getIntroduction()))
            && (this.getAfterSales() == null ? other.getAfterSales() == null : this.getAfterSales().equals(other.getAfterSales()))
            && (this.getLogo() == null ? other.getLogo() == null : this.getLogo().equals(other.getLogo()))
            && (this.getMarketPrice() == null ? other.getMarketPrice() == null : this.getMarketPrice().equals(other.getMarketPrice()))
            && (this.getCostPrice() == null ? other.getCostPrice() == null : this.getCostPrice().equals(other.getCostPrice()))
            && (this.getJdPrice() == null ? other.getJdPrice() == null : this.getJdPrice().equals(other.getJdPrice()))
            && (this.getBrandName() == null ? other.getBrandName() == null : this.getBrandName().equals(other.getBrandName()))
            && (this.getStockNum() == null ? other.getStockNum() == null : this.getStockNum().equals(other.getStockNum()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getSellPoint() == null ? other.getSellPoint() == null : this.getSellPoint().equals(other.getSellPoint()))
            && (this.getAfterSaleDesc() == null ? other.getAfterSaleDesc() == null : this.getAfterSaleDesc().equals(other.getAfterSaleDesc()))
            && (this.getSpuId() == null ? other.getSpuId() == null : this.getSpuId().equals(other.getSpuId()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getWareId() == null) ? 0 : getWareId().hashCode());
        result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
        result = prime * result + ((getWareStatus() == null) ? 0 : getWareStatus().hashCode());
        result = prime * result + ((getOuterId() == null) ? 0 : getOuterId().hashCode());
        result = prime * result + ((getItemNum() == null) ? 0 : getItemNum().hashCode());
        result = prime * result + ((getBarCode() == null) ? 0 : getBarCode().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getCreated() == null) ? 0 : getCreated().hashCode());
        result = prime * result + ((getOfflineTime() == null) ? 0 : getOfflineTime().hashCode());
        result = prime * result + ((getOnlineTime() == null) ? 0 : getOnlineTime().hashCode());
        result = prime * result + ((getDelivery() == null) ? 0 : getDelivery().hashCode());
        result = prime * result + ((getPackListing() == null) ? 0 : getPackListing().hashCode());
        result = prime * result + ((getWrap() == null) ? 0 : getWrap().hashCode());
        result = prime * result + ((getWeight() == null) ? 0 : getWeight().hashCode());
        result = prime * result + ((getWidth() == null) ? 0 : getWidth().hashCode());
        result = prime * result + ((getHeight() == null) ? 0 : getHeight().hashCode());
        result = prime * result + ((getLength() == null) ? 0 : getLength().hashCode());
        result = prime * result + ((getMobileDesc() == null) ? 0 : getMobileDesc().hashCode());
        result = prime * result + ((getIntroduction() == null) ? 0 : getIntroduction().hashCode());
        result = prime * result + ((getAfterSales() == null) ? 0 : getAfterSales().hashCode());
        result = prime * result + ((getLogo() == null) ? 0 : getLogo().hashCode());
        result = prime * result + ((getMarketPrice() == null) ? 0 : getMarketPrice().hashCode());
        result = prime * result + ((getCostPrice() == null) ? 0 : getCostPrice().hashCode());
        result = prime * result + ((getJdPrice() == null) ? 0 : getJdPrice().hashCode());
        result = prime * result + ((getBrandName() == null) ? 0 : getBrandName().hashCode());
        result = prime * result + ((getStockNum() == null) ? 0 : getStockNum().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getSellPoint() == null) ? 0 : getSellPoint().hashCode());
        result = prime * result + ((getAfterSaleDesc() == null) ? 0 : getAfterSaleDesc().hashCode());
        result = prime * result + ((getSpuId() == null) ? 0 : getSpuId().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", wareId=").append(wareId);
        sb.append(", title=").append(title);
        sb.append(", wareStatus=").append(wareStatus);
        sb.append(", outerId=").append(outerId);
        sb.append(", itemNum=").append(itemNum);
        sb.append(", barCode=").append(barCode);
        sb.append(", modified=").append(modified);
        sb.append(", created=").append(created);
        sb.append(", offlineTime=").append(offlineTime);
        sb.append(", onlineTime=").append(onlineTime);
        sb.append(", delivery=").append(delivery);
        sb.append(", packListing=").append(packListing);
        sb.append(", wrap=").append(wrap);
        sb.append(", weight=").append(weight);
        sb.append(", width=").append(width);
        sb.append(", height=").append(height);
        sb.append(", length=").append(length);
        sb.append(", mobileDesc=").append(mobileDesc);
        sb.append(", introduction=").append(introduction);
        sb.append(", afterSales=").append(afterSales);
        sb.append(", logo=").append(logo);
        sb.append(", marketPrice=").append(marketPrice);
        sb.append(", costPrice=").append(costPrice);
        sb.append(", jdPrice=").append(jdPrice);
        sb.append(", brandName=").append(brandName);
        sb.append(", stockNum=").append(stockNum);
        sb.append(", shopId=").append(shopId);
        sb.append(", sellPoint=").append(sellPoint);
        sb.append(", afterSaleDesc=").append(afterSaleDesc);
        sb.append(", spuId=").append(spuId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}