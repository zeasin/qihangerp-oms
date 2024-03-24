package com.qihang.oms.domain;

import java.io.Serializable;

/**
 * 平台快递公司表
 * @TableName sys_logistics_company
 */
public class SysLogisticsCompany implements Serializable {
    /**
     * 主键ID
     */
    private Long id;

    /**
     * 平台id
     */
    private Integer platformId;

    /**
     * 店铺ID
     */
    private Integer shopId;

    /**
     * 物流公司id（值来自于平台返回）
     */
    private Long logisticsId;

    /**
     * 物流公司编码（值来自于平台返回）
     */
    private String code;

    /**
     * 物流公司名称（值来自于平台返回）
     */
    private String name;

    /**
     * 备注
     */
    private String remark;

    private static final long serialVersionUID = 1L;

    /**
     * 主键ID
     */
    public Long getId() {
        return id;
    }

    /**
     * 主键ID
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 平台id
     */
    public Integer getPlatformId() {
        return platformId;
    }

    /**
     * 平台id
     */
    public void setPlatformId(Integer platformId) {
        this.platformId = platformId;
    }

    /**
     * 店铺ID
     */
    public Integer getShopId() {
        return shopId;
    }

    /**
     * 店铺ID
     */
    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 物流公司id（值来自于平台返回）
     */
    public Long getLogisticsId() {
        return logisticsId;
    }

    /**
     * 物流公司id（值来自于平台返回）
     */
    public void setLogisticsId(Long logisticsId) {
        this.logisticsId = logisticsId;
    }

    /**
     * 物流公司编码（值来自于平台返回）
     */
    public String getCode() {
        return code;
    }

    /**
     * 物流公司编码（值来自于平台返回）
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 物流公司名称（值来自于平台返回）
     */
    public String getName() {
        return name;
    }

    /**
     * 物流公司名称（值来自于平台返回）
     */
    public void setName(String name) {
        this.name = name;
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
        SysLogisticsCompany other = (SysLogisticsCompany) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getPlatformId() == null ? other.getPlatformId() == null : this.getPlatformId().equals(other.getPlatformId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getLogisticsId() == null ? other.getLogisticsId() == null : this.getLogisticsId().equals(other.getLogisticsId()))
            && (this.getCode() == null ? other.getCode() == null : this.getCode().equals(other.getCode()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getPlatformId() == null) ? 0 : getPlatformId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getLogisticsId() == null) ? 0 : getLogisticsId().hashCode());
        result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", platformId=").append(platformId);
        sb.append(", shopId=").append(shopId);
        sb.append(", logisticsId=").append(logisticsId);
        sb.append(", code=").append(code);
        sb.append(", name=").append(name);
        sb.append(", remark=").append(remark);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}