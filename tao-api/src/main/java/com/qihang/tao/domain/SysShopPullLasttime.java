package com.qihang.tao.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 店铺更新最后时间记录
 * @TableName sys_shop_pull_lasttime
 */
public class SysShopPullLasttime implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 类型（ORDER:订单，REFUND:退款）
     */
    private Object pullType;

    /**
     * 最后更新时间
     */
    private LocalDateTime lasttime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public Integer getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 店铺id
     */
    public Integer getShopId() {
        return shopId;
    }

    /**
     * 店铺id
     */
    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 类型（ORDER:订单，REFUND:退款）
     */
    public Object getPullType() {
        return pullType;
    }

    /**
     * 类型（ORDER:订单，REFUND:退款）
     */
    public void setPullType(Object pullType) {
        this.pullType = pullType;
    }

    /**
     * 最后更新时间
     */
    public LocalDateTime getLasttime() {
        return lasttime;
    }

    /**
     * 最后更新时间
     */
    public void setLasttime(LocalDateTime lasttime) {
        this.lasttime = lasttime;
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
        SysShopPullLasttime other = (SysShopPullLasttime) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getPullType() == null ? other.getPullType() == null : this.getPullType().equals(other.getPullType()))
            && (this.getLasttime() == null ? other.getLasttime() == null : this.getLasttime().equals(other.getLasttime()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getPullType() == null) ? 0 : getPullType().hashCode());
        result = prime * result + ((getLasttime() == null) ? 0 : getLasttime().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
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
        sb.append(", shopId=").append(shopId);
        sb.append(", pullType=").append(pullType);
        sb.append(", lasttime=").append(lasttime);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}