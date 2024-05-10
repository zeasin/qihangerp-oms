package com.qihang.oms.domain;

import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * 更新日志表
 * @TableName sys_shop_pull_logs
 */
@TableName("s_shop_pull_logs")
public class SysShopPullLogs implements Serializable {
    /**
     * 主键Id
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 平台id
     */
    private Integer shopType;

    /**
     * 类型（ORDER订单，GOODS商品，REFUND退款）
     */
    private String pullType;

    /**
     * 拉取方式（主动拉取、定时任务）
     */
    private String pullWay;

    /**
     * 拉取参数
     */
    private String pullParams;

    /**
     * 拉取结果
     */
    private String pullResult;

    /**
     * 拉取时间
     */
    private Date pullTime;

    /**
     * 耗时（毫秒）
     */
    private Long duration;

    private static final long serialVersionUID = 1L;

    /**
     * 主键Id
     */
    public Long getId() {
        return id;
    }

    /**
     * 主键Id
     */
    public void setId(Long id) {
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
     * 平台id
     */
    public Integer getShopType() {
        return shopType;
    }

    /**
     * 平台id
     */
    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    /**
     * 类型（ORDER订单，GOODS商品，REFUND退款）
     */
    public String getPullType() {
        return pullType;
    }

    /**
     * 类型（ORDER订单，GOODS商品，REFUND退款）
     */
    public void setPullType(String pullType) {
        this.pullType = pullType;
    }

    /**
     * 拉取方式（主动拉取、定时任务）
     */
    public String getPullWay() {
        return pullWay;
    }

    /**
     * 拉取方式（主动拉取、定时任务）
     */
    public void setPullWay(String pullWay) {
        this.pullWay = pullWay;
    }

    /**
     * 拉取参数
     */
    public String getPullParams() {
        return pullParams;
    }

    /**
     * 拉取参数
     */
    public void setPullParams(String pullParams) {
        this.pullParams = pullParams;
    }

    /**
     * 拉取结果
     */
    public String getPullResult() {
        return pullResult;
    }

    /**
     * 拉取结果
     */
    public void setPullResult(String pullResult) {
        this.pullResult = pullResult;
    }

    /**
     * 拉取时间
     */
    public Date getPullTime() {
        return pullTime;
    }

    /**
     * 拉取时间
     */
    public void setPullTime(Date pullTime) {
        this.pullTime = pullTime;
    }

    /**
     * 耗时（毫秒）
     */
    public Long getDuration() {
        return duration;
    }

    /**
     * 耗时（毫秒）
     */
    public void setDuration(Long duration) {
        this.duration = duration;
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
        SysShopPullLogs other = (SysShopPullLogs) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getShopType() == null ? other.getShopType() == null : this.getShopType().equals(other.getShopType()))
            && (this.getPullType() == null ? other.getPullType() == null : this.getPullType().equals(other.getPullType()))
            && (this.getPullWay() == null ? other.getPullWay() == null : this.getPullWay().equals(other.getPullWay()))
            && (this.getPullParams() == null ? other.getPullParams() == null : this.getPullParams().equals(other.getPullParams()))
            && (this.getPullResult() == null ? other.getPullResult() == null : this.getPullResult().equals(other.getPullResult()))
            && (this.getPullTime() == null ? other.getPullTime() == null : this.getPullTime().equals(other.getPullTime()))
            && (this.getDuration() == null ? other.getDuration() == null : this.getDuration().equals(other.getDuration()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getShopType() == null) ? 0 : getShopType().hashCode());
        result = prime * result + ((getPullType() == null) ? 0 : getPullType().hashCode());
        result = prime * result + ((getPullWay() == null) ? 0 : getPullWay().hashCode());
        result = prime * result + ((getPullParams() == null) ? 0 : getPullParams().hashCode());
        result = prime * result + ((getPullResult() == null) ? 0 : getPullResult().hashCode());
        result = prime * result + ((getPullTime() == null) ? 0 : getPullTime().hashCode());
        result = prime * result + ((getDuration() == null) ? 0 : getDuration().hashCode());
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
        sb.append(", shopType=").append(shopType);
        sb.append(", pullType=").append(pullType);
        sb.append(", pullWay=").append(pullWay);
        sb.append(", pullParams=").append(pullParams);
        sb.append(", pullResult=").append(pullResult);
        sb.append(", pullTime=").append(pullTime);
        sb.append(", duration=").append(duration);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}