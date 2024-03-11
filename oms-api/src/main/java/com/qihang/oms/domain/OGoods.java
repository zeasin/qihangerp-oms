package com.qihang.oms.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 商品库存管理
 * @TableName o_goods
 */
public class OGoods implements Serializable {
    /**
     * 主键id
     */
    private Long id;

    /**
     * 商品名称
     */
    private String name;

    /**
     * 商品图片地址
     */
    private String image;

    /**
     * 商品唯一ID
     */
    private Long erpGoodsId;

    /**
     * 商品编号
     */
    private String goodsNum;

    /**
     * 单位名称
     */
    private String unitName;

    /**
     * 商品分类ID
     */
    private Integer categoryId;

    /**
     * 条码
     */
    private String barCode;

    /**
     * 备注
     */
    private String remark;

    /**
     * 状态1销售中2已下架
     */
    private Integer status;

    /**
     * 衣长/裙长/裤长
     */
    private Double length;

    /**
     * 高度/袖长
     */
    private Double height;

    /**
     * 宽度/胸阔(围)
     */
    private Double width;

    /**
     * 肩阔
     */
    private Double width1;

    /**
     * 腰阔
     */
    private Double width2;

    /**
     * 臀阔
     */
    private Double width3;

    /**
     * 重量
     */
    private Double weight;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    /**
     * 保质期
     */
    private String period;

    /**
     * 预计采购价格
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
     * 供应商id
     */
    private Integer supplierId;

    /**
     * 品牌id
     */
    private Integer brandId;

    /**
     * 属性1：季节
     */
    private String attr1;

    /**
     * 属性2：分类
     */
    private String attr2;

    /**
     * 属性3：风格
     */
    private String attr3;

    /**
     * 属性4：年份
     */
    private String attr4;

    /**
     * 属性5：面料
     */
    private String attr5;

    /**
     * 外链url
     */
    private String linkUrl;

    /**
     * 最低库存（预警）
     */
    private Integer lowQty;

    /**
     * 最高库存（预警）
     */
    private Integer highQty;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

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
     * 商品名称
     */
    public String getName() {
        return name;
    }

    /**
     * 商品名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 商品图片地址
     */
    public String getImage() {
        return image;
    }

    /**
     * 商品图片地址
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * 商品唯一ID
     */
    public Long getErpGoodsId() {
        return erpGoodsId;
    }

    /**
     * 商品唯一ID
     */
    public void setErpGoodsId(Long erpGoodsId) {
        this.erpGoodsId = erpGoodsId;
    }

    /**
     * 商品编号
     */
    public String getGoodsNum() {
        return goodsNum;
    }

    /**
     * 商品编号
     */
    public void setGoodsNum(String goodsNum) {
        this.goodsNum = goodsNum;
    }

    /**
     * 单位名称
     */
    public String getUnitName() {
        return unitName;
    }

    /**
     * 单位名称
     */
    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    /**
     * 商品分类ID
     */
    public Integer getCategoryId() {
        return categoryId;
    }

    /**
     * 商品分类ID
     */
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * 条码
     */
    public String getBarCode() {
        return barCode;
    }

    /**
     * 条码
     */
    public void setBarCode(String barCode) {
        this.barCode = barCode;
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
     * 状态1销售中2已下架
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态1销售中2已下架
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 衣长/裙长/裤长
     */
    public Double getLength() {
        return length;
    }

    /**
     * 衣长/裙长/裤长
     */
    public void setLength(Double length) {
        this.length = length;
    }

    /**
     * 高度/袖长
     */
    public Double getHeight() {
        return height;
    }

    /**
     * 高度/袖长
     */
    public void setHeight(Double height) {
        this.height = height;
    }

    /**
     * 宽度/胸阔(围)
     */
    public Double getWidth() {
        return width;
    }

    /**
     * 宽度/胸阔(围)
     */
    public void setWidth(Double width) {
        this.width = width;
    }

    /**
     * 肩阔
     */
    public Double getWidth1() {
        return width1;
    }

    /**
     * 肩阔
     */
    public void setWidth1(Double width1) {
        this.width1 = width1;
    }

    /**
     * 腰阔
     */
    public Double getWidth2() {
        return width2;
    }

    /**
     * 腰阔
     */
    public void setWidth2(Double width2) {
        this.width2 = width2;
    }

    /**
     * 臀阔
     */
    public Double getWidth3() {
        return width3;
    }

    /**
     * 臀阔
     */
    public void setWidth3(Double width3) {
        this.width3 = width3;
    }

    /**
     * 重量
     */
    public Double getWeight() {
        return weight;
    }

    /**
     * 重量
     */
    public void setWeight(Double weight) {
        this.weight = weight;
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

    /**
     * 保质期
     */
    public String getPeriod() {
        return period;
    }

    /**
     * 保质期
     */
    public void setPeriod(String period) {
        this.period = period;
    }

    /**
     * 预计采购价格
     */
    public BigDecimal getPurPrice() {
        return purPrice;
    }

    /**
     * 预计采购价格
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
     * 供应商id
     */
    public Integer getSupplierId() {
        return supplierId;
    }

    /**
     * 供应商id
     */
    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    /**
     * 品牌id
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * 品牌id
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     * 属性1：季节
     */
    public String getAttr1() {
        return attr1;
    }

    /**
     * 属性1：季节
     */
    public void setAttr1(String attr1) {
        this.attr1 = attr1;
    }

    /**
     * 属性2：分类
     */
    public String getAttr2() {
        return attr2;
    }

    /**
     * 属性2：分类
     */
    public void setAttr2(String attr2) {
        this.attr2 = attr2;
    }

    /**
     * 属性3：风格
     */
    public String getAttr3() {
        return attr3;
    }

    /**
     * 属性3：风格
     */
    public void setAttr3(String attr3) {
        this.attr3 = attr3;
    }

    /**
     * 属性4：年份
     */
    public String getAttr4() {
        return attr4;
    }

    /**
     * 属性4：年份
     */
    public void setAttr4(String attr4) {
        this.attr4 = attr4;
    }

    /**
     * 属性5：面料
     */
    public String getAttr5() {
        return attr5;
    }

    /**
     * 属性5：面料
     */
    public void setAttr5(String attr5) {
        this.attr5 = attr5;
    }

    /**
     * 外链url
     */
    public String getLinkUrl() {
        return linkUrl;
    }

    /**
     * 外链url
     */
    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
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
        OGoods other = (OGoods) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getImage() == null ? other.getImage() == null : this.getImage().equals(other.getImage()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getGoodsNum() == null ? other.getGoodsNum() == null : this.getGoodsNum().equals(other.getGoodsNum()))
            && (this.getUnitName() == null ? other.getUnitName() == null : this.getUnitName().equals(other.getUnitName()))
            && (this.getCategoryId() == null ? other.getCategoryId() == null : this.getCategoryId().equals(other.getCategoryId()))
            && (this.getBarCode() == null ? other.getBarCode() == null : this.getBarCode().equals(other.getBarCode()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getLength() == null ? other.getLength() == null : this.getLength().equals(other.getLength()))
            && (this.getHeight() == null ? other.getHeight() == null : this.getHeight().equals(other.getHeight()))
            && (this.getWidth() == null ? other.getWidth() == null : this.getWidth().equals(other.getWidth()))
            && (this.getWidth1() == null ? other.getWidth1() == null : this.getWidth1().equals(other.getWidth1()))
            && (this.getWidth2() == null ? other.getWidth2() == null : this.getWidth2().equals(other.getWidth2()))
            && (this.getWidth3() == null ? other.getWidth3() == null : this.getWidth3().equals(other.getWidth3()))
            && (this.getWeight() == null ? other.getWeight() == null : this.getWeight().equals(other.getWeight()))
            && (this.getDisable() == null ? other.getDisable() == null : this.getDisable().equals(other.getDisable()))
            && (this.getPeriod() == null ? other.getPeriod() == null : this.getPeriod().equals(other.getPeriod()))
            && (this.getPurPrice() == null ? other.getPurPrice() == null : this.getPurPrice().equals(other.getPurPrice()))
            && (this.getWholePrice() == null ? other.getWholePrice() == null : this.getWholePrice().equals(other.getWholePrice()))
            && (this.getRetailPrice() == null ? other.getRetailPrice() == null : this.getRetailPrice().equals(other.getRetailPrice()))
            && (this.getUnitCost() == null ? other.getUnitCost() == null : this.getUnitCost().equals(other.getUnitCost()))
            && (this.getSupplierId() == null ? other.getSupplierId() == null : this.getSupplierId().equals(other.getSupplierId()))
            && (this.getBrandId() == null ? other.getBrandId() == null : this.getBrandId().equals(other.getBrandId()))
            && (this.getAttr1() == null ? other.getAttr1() == null : this.getAttr1().equals(other.getAttr1()))
            && (this.getAttr2() == null ? other.getAttr2() == null : this.getAttr2().equals(other.getAttr2()))
            && (this.getAttr3() == null ? other.getAttr3() == null : this.getAttr3().equals(other.getAttr3()))
            && (this.getAttr4() == null ? other.getAttr4() == null : this.getAttr4().equals(other.getAttr4()))
            && (this.getAttr5() == null ? other.getAttr5() == null : this.getAttr5().equals(other.getAttr5()))
            && (this.getLinkUrl() == null ? other.getLinkUrl() == null : this.getLinkUrl().equals(other.getLinkUrl()))
            && (this.getLowQty() == null ? other.getLowQty() == null : this.getLowQty().equals(other.getLowQty()))
            && (this.getHighQty() == null ? other.getHighQty() == null : this.getHighQty().equals(other.getHighQty()))
            && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getImage() == null) ? 0 : getImage().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getGoodsNum() == null) ? 0 : getGoodsNum().hashCode());
        result = prime * result + ((getUnitName() == null) ? 0 : getUnitName().hashCode());
        result = prime * result + ((getCategoryId() == null) ? 0 : getCategoryId().hashCode());
        result = prime * result + ((getBarCode() == null) ? 0 : getBarCode().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getLength() == null) ? 0 : getLength().hashCode());
        result = prime * result + ((getHeight() == null) ? 0 : getHeight().hashCode());
        result = prime * result + ((getWidth() == null) ? 0 : getWidth().hashCode());
        result = prime * result + ((getWidth1() == null) ? 0 : getWidth1().hashCode());
        result = prime * result + ((getWidth2() == null) ? 0 : getWidth2().hashCode());
        result = prime * result + ((getWidth3() == null) ? 0 : getWidth3().hashCode());
        result = prime * result + ((getWeight() == null) ? 0 : getWeight().hashCode());
        result = prime * result + ((getDisable() == null) ? 0 : getDisable().hashCode());
        result = prime * result + ((getPeriod() == null) ? 0 : getPeriod().hashCode());
        result = prime * result + ((getPurPrice() == null) ? 0 : getPurPrice().hashCode());
        result = prime * result + ((getWholePrice() == null) ? 0 : getWholePrice().hashCode());
        result = prime * result + ((getRetailPrice() == null) ? 0 : getRetailPrice().hashCode());
        result = prime * result + ((getUnitCost() == null) ? 0 : getUnitCost().hashCode());
        result = prime * result + ((getSupplierId() == null) ? 0 : getSupplierId().hashCode());
        result = prime * result + ((getBrandId() == null) ? 0 : getBrandId().hashCode());
        result = prime * result + ((getAttr1() == null) ? 0 : getAttr1().hashCode());
        result = prime * result + ((getAttr2() == null) ? 0 : getAttr2().hashCode());
        result = prime * result + ((getAttr3() == null) ? 0 : getAttr3().hashCode());
        result = prime * result + ((getAttr4() == null) ? 0 : getAttr4().hashCode());
        result = prime * result + ((getAttr5() == null) ? 0 : getAttr5().hashCode());
        result = prime * result + ((getLinkUrl() == null) ? 0 : getLinkUrl().hashCode());
        result = prime * result + ((getLowQty() == null) ? 0 : getLowQty().hashCode());
        result = prime * result + ((getHighQty() == null) ? 0 : getHighQty().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", image=").append(image);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", goodsNum=").append(goodsNum);
        sb.append(", unitName=").append(unitName);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", barCode=").append(barCode);
        sb.append(", remark=").append(remark);
        sb.append(", status=").append(status);
        sb.append(", length=").append(length);
        sb.append(", height=").append(height);
        sb.append(", width=").append(width);
        sb.append(", width1=").append(width1);
        sb.append(", width2=").append(width2);
        sb.append(", width3=").append(width3);
        sb.append(", weight=").append(weight);
        sb.append(", disable=").append(disable);
        sb.append(", period=").append(period);
        sb.append(", purPrice=").append(purPrice);
        sb.append(", wholePrice=").append(wholePrice);
        sb.append(", retailPrice=").append(retailPrice);
        sb.append(", unitCost=").append(unitCost);
        sb.append(", supplierId=").append(supplierId);
        sb.append(", brandId=").append(brandId);
        sb.append(", attr1=").append(attr1);
        sb.append(", attr2=").append(attr2);
        sb.append(", attr3=").append(attr3);
        sb.append(", attr4=").append(attr4);
        sb.append(", attr5=").append(attr5);
        sb.append(", linkUrl=").append(linkUrl);
        sb.append(", lowQty=").append(lowQty);
        sb.append(", highQty=").append(highQty);
        sb.append(", createBy=").append(createBy);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateBy=").append(updateBy);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}