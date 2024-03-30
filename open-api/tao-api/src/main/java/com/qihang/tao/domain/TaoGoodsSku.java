package com.qihang.tao.domain;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

/**
 * 
 * @TableName tao_goods_sku
 */
public class TaoGoodsSku implements Serializable {
    /**
     * 主键id
     */
    private String id;

    /**
     * 外键id
     */
    private Long taoGoodsId;

    /**
     * sku所属商品数字id
     */
    private Long numIid;

    /**
     * sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)
     */
    private String iid;

    /**
     * 商品skuid，阿里
     */
    private Long skuId;

    /**
     * sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2
     */
    private String properties;

    /**
     * sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……
     */
    private String propertiesName;

    /**
     * 属于这个sku的商品的数量，
     */
    private Long quantity;

    /**
     * specId
     */
    private String spec;

    /**
     * 属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。
     */
    private Double price;

    /**
     * 商家设置的外部id。
     */
    private String outerId;

    /**
     * sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    private String created;

    /**
     * sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    private String modified;

    /**
     * sku状态。	normal
     */
    private String status;

    /**
     * 表示SKu上的产品规格信息
     */
    private String skuSpecId;

    /**
     * 商品级别的条形码
     */
    private String barcode;

    /**
     * erp商品SKUid
     */
    private Long erpGoodsSkuId;

    /**
     * erp商品id
     */
    private Long erpGoodsId;

    /**
     * 创建时间
     */
    private Date createTime;

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    public String getId() {
        return id;
    }

    /**
     * 主键id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 外键id
     */
    public Long getTaoGoodsId() {
        return taoGoodsId;
    }

    /**
     * 外键id
     */
    public void setTaoGoodsId(Long taoGoodsId) {
        this.taoGoodsId = taoGoodsId;
    }

    /**
     * sku所属商品数字id
     */
    public Long getNumIid() {
        return numIid;
    }

    /**
     * sku所属商品数字id
     */
    public void setNumIid(Long numIid) {
        this.numIid = numIid;
    }

    /**
     * sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)
     */
    public String getIid() {
        return iid;
    }

    /**
     * sku所属商品id(注意：iid近期即将废弃，请用num_iid参数)
     */
    public void setIid(String iid) {
        this.iid = iid;
    }

    /**
     * 商品skuid，阿里
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 商品skuid，阿里
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2
     */
    public String getProperties() {
        return properties;
    }

    /**
     * sku的销售属性组合字符串（颜色，大小，等等，可通过类目API获取某类目下的销售属性）,格式是p1:v1;p2:v2
     */
    public void setProperties(String properties) {
        this.properties = properties;
    }

    /**
     * sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……
     */
    public String getPropertiesName() {
        return propertiesName;
    }

    /**
     * sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……
     */
    public void setPropertiesName(String propertiesName) {
        this.propertiesName = propertiesName;
    }

    /**
     * 属于这个sku的商品的数量，
     */
    public Long getQuantity() {
        return quantity;
    }

    /**
     * 属于这个sku的商品的数量，
     */
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    /**
     * specId
     */
    public String getSpec() {
        return spec;
    }

    /**
     * specId
     */
    public void setSpec(String spec) {
        this.spec = spec;
    }

    /**
     * 属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。
     */
    public Double getPrice() {
        return price;
    }

    /**
     * 属于这个sku的商品的价格 取值范围:0-100000000;精确到2位小数;单位:元。如:200.07，表示:200元7分。
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 商家设置的外部id。
     */
    public String getOuterId() {
        return outerId;
    }

    /**
     * 商家设置的外部id。
     */
    public void setOuterId(String outerId) {
        this.outerId = outerId;
    }

    /**
     * sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    public String getCreated() {
        return created;
    }

    /**
     * sku创建日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    public void setCreated(String created) {
        this.created = created;
    }

    /**
     * sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    public String getModified() {
        return modified;
    }

    /**
     * sku最后修改日期 时间格式：yyyy-MM-dd HH:mm:ss
     */
    public void setModified(String modified) {
        this.modified = modified;
    }

    /**
     * sku状态。	normal
     */
    public String getStatus() {
        return status;
    }

    /**
     * sku状态。	normal
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 表示SKu上的产品规格信息
     */
    public String getSkuSpecId() {
        return skuSpecId;
    }

    /**
     * 表示SKu上的产品规格信息
     */
    public void setSkuSpecId(String skuSpecId) {
        this.skuSpecId = skuSpecId;
    }

    /**
     * 商品级别的条形码
     */
    public String getBarcode() {
        return barcode;
    }

    /**
     * 商品级别的条形码
     */
    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    /**
     * erp商品SKUid
     */
    public Long getErpGoodsSkuId() {
        return erpGoodsSkuId;
    }

    /**
     * erp商品SKUid
     */
    public void setErpGoodsSkuId(Long erpGoodsSkuId) {
        this.erpGoodsSkuId = erpGoodsSkuId;
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
        TaoGoodsSku other = (TaoGoodsSku) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getTaoGoodsId() == null ? other.getTaoGoodsId() == null : this.getTaoGoodsId().equals(other.getTaoGoodsId()))
            && (this.getNumIid() == null ? other.getNumIid() == null : this.getNumIid().equals(other.getNumIid()))
            && (this.getIid() == null ? other.getIid() == null : this.getIid().equals(other.getIid()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getProperties() == null ? other.getProperties() == null : this.getProperties().equals(other.getProperties()))
            && (this.getPropertiesName() == null ? other.getPropertiesName() == null : this.getPropertiesName().equals(other.getPropertiesName()))
            && (this.getQuantity() == null ? other.getQuantity() == null : this.getQuantity().equals(other.getQuantity()))
            && (this.getSpec() == null ? other.getSpec() == null : this.getSpec().equals(other.getSpec()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getOuterId() == null ? other.getOuterId() == null : this.getOuterId().equals(other.getOuterId()))
            && (this.getCreated() == null ? other.getCreated() == null : this.getCreated().equals(other.getCreated()))
            && (this.getModified() == null ? other.getModified() == null : this.getModified().equals(other.getModified()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getSkuSpecId() == null ? other.getSkuSpecId() == null : this.getSkuSpecId().equals(other.getSkuSpecId()))
            && (this.getBarcode() == null ? other.getBarcode() == null : this.getBarcode().equals(other.getBarcode()))
            && (this.getErpGoodsSkuId() == null ? other.getErpGoodsSkuId() == null : this.getErpGoodsSkuId().equals(other.getErpGoodsSkuId()))
            && (this.getErpGoodsId() == null ? other.getErpGoodsId() == null : this.getErpGoodsId().equals(other.getErpGoodsId()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getTaoGoodsId() == null) ? 0 : getTaoGoodsId().hashCode());
        result = prime * result + ((getNumIid() == null) ? 0 : getNumIid().hashCode());
        result = prime * result + ((getIid() == null) ? 0 : getIid().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getProperties() == null) ? 0 : getProperties().hashCode());
        result = prime * result + ((getPropertiesName() == null) ? 0 : getPropertiesName().hashCode());
        result = prime * result + ((getQuantity() == null) ? 0 : getQuantity().hashCode());
        result = prime * result + ((getSpec() == null) ? 0 : getSpec().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getOuterId() == null) ? 0 : getOuterId().hashCode());
        result = prime * result + ((getCreated() == null) ? 0 : getCreated().hashCode());
        result = prime * result + ((getModified() == null) ? 0 : getModified().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getSkuSpecId() == null) ? 0 : getSkuSpecId().hashCode());
        result = prime * result + ((getBarcode() == null) ? 0 : getBarcode().hashCode());
        result = prime * result + ((getErpGoodsSkuId() == null) ? 0 : getErpGoodsSkuId().hashCode());
        result = prime * result + ((getErpGoodsId() == null) ? 0 : getErpGoodsId().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", taoGoodsId=").append(taoGoodsId);
        sb.append(", numIid=").append(numIid);
        sb.append(", iid=").append(iid);
        sb.append(", skuId=").append(skuId);
        sb.append(", properties=").append(properties);
        sb.append(", propertiesName=").append(propertiesName);
        sb.append(", quantity=").append(quantity);
        sb.append(", spec=").append(spec);
        sb.append(", price=").append(price);
        sb.append(", outerId=").append(outerId);
        sb.append(", created=").append(created);
        sb.append(", modified=").append(modified);
        sb.append(", status=").append(status);
        sb.append(", skuSpecId=").append(skuSpecId);
        sb.append(", barcode=").append(barcode);
        sb.append(", erpGoodsSkuId=").append(erpGoodsSkuId);
        sb.append(", erpGoodsId=").append(erpGoodsId);
        sb.append(", createTime=").append(createTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}