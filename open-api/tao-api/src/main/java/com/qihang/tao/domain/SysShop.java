package com.qihang.tao.domain;

import java.io.Serializable;

/**
 * 数据中心-店铺
 * @TableName sys_shop
 */
public class SysShop implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 店铺名
     */
    private String name;

    /**
     * 对应第三方平台Id
     */
    private Integer type;

    /**
     * 店铺url
     */
    private String url;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 状态（1正常2已删除）
     */
    private Integer status;

    /**
     * 更新时间
     */
    private Long modifyOn;

    /**
     * 描述
     */
    private String remark;

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    private Long sellerId;

    /**
     * Appkey
     */
    private String appKey;

    /**
     * Appsercet
     */
    private String appSercet;

    /**
     * 第三方平台sessionKey（access_token）
     */
    private String accessToken;

    /**
     * 到期
     */
    private Long expiresIn;

    /**
     * access_token开始时间
     */
    private Long accessTokenBegin;

    /**
     * 刷新token
     */
    private String refreshToken;

    /**
     * 刷新token过期时间
     */
    private Long refreshTokenTimeout;

    /**
     * 请求url
     */
//    private String apiRequestUrl;

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 店铺名
     */
    public String getName() {
        return name;
    }

    /**
     * 店铺名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 对应第三方平台Id
     */
    public Integer getType() {
        return type;
    }

    /**
     * 对应第三方平台Id
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 店铺url
     */
    public String getUrl() {
        return url;
    }

    /**
     * 店铺url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * 排序
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * 排序
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * 状态（1正常2已删除）
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 状态（1正常2已删除）
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 更新时间
     */
    public Long getModifyOn() {
        return modifyOn;
    }

    /**
     * 更新时间
     */
    public void setModifyOn(Long modifyOn) {
        this.modifyOn = modifyOn;
    }

    /**
     * 描述
     */
    public String getRemark() {
        return remark;
    }

    /**
     * 描述
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    public Long getSellerId() {
        return sellerId;
    }

    /**
     * 第三方平台店铺id，淘宝天猫开放平台使用
     */
    public void setSellerId(Long sellerId) {
        this.sellerId = sellerId;
    }

    /**
     * Appkey
     */
    public String getAppKey() {
        return appKey;
    }

    /**
     * Appkey
     */
    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    /**
     * Appsercet
     */
    public String getAppSercet() {
        return appSercet;
    }

    /**
     * Appsercet
     */
    public void setAppSercet(String appSercet) {
        this.appSercet = appSercet;
    }

    /**
     * 第三方平台sessionKey（access_token）
     */
    public String getAccessToken() {
        return accessToken;
    }

    /**
     * 第三方平台sessionKey（access_token）
     */
    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    /**
     * 到期
     */
    public Long getExpiresIn() {
        return expiresIn;
    }

    /**
     * 到期
     */
    public void setExpiresIn(Long expiresIn) {
        this.expiresIn = expiresIn;
    }

    /**
     * access_token开始时间
     */
    public Long getAccessTokenBegin() {
        return accessTokenBegin;
    }

    /**
     * access_token开始时间
     */
    public void setAccessTokenBegin(Long accessTokenBegin) {
        this.accessTokenBegin = accessTokenBegin;
    }

    /**
     * 刷新token
     */
    public String getRefreshToken() {
        return refreshToken;
    }

    /**
     * 刷新token
     */
    public void setRefreshToken(String refreshToken) {
        this.refreshToken = refreshToken;
    }

    /**
     * 刷新token过期时间
     */
    public Long getRefreshTokenTimeout() {
        return refreshTokenTimeout;
    }

    /**
     * 刷新token过期时间
     */
    public void setRefreshTokenTimeout(Long refreshTokenTimeout) {
        this.refreshTokenTimeout = refreshTokenTimeout;
    }

//    /**
//     * 请求url
//     */
//    public String getApiRequestUrl() {
//        return apiRequestUrl;
//    }
//
//    /**
//     * 请求url
//     */
//    public void setApiRequestUrl(String apiRequestUrl) {
//        this.apiRequestUrl = apiRequestUrl;
//    }

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
        SysShop other = (SysShop) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
            && (this.getUrl() == null ? other.getUrl() == null : this.getUrl().equals(other.getUrl()))
            && (this.getSort() == null ? other.getSort() == null : this.getSort().equals(other.getSort()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getModifyOn() == null ? other.getModifyOn() == null : this.getModifyOn().equals(other.getModifyOn()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getSellerId() == null ? other.getSellerId() == null : this.getSellerId().equals(other.getSellerId()))
            && (this.getAppKey() == null ? other.getAppKey() == null : this.getAppKey().equals(other.getAppKey()))
            && (this.getAppSercet() == null ? other.getAppSercet() == null : this.getAppSercet().equals(other.getAppSercet()))
            && (this.getAccessToken() == null ? other.getAccessToken() == null : this.getAccessToken().equals(other.getAccessToken()))
            && (this.getExpiresIn() == null ? other.getExpiresIn() == null : this.getExpiresIn().equals(other.getExpiresIn()))
            && (this.getAccessTokenBegin() == null ? other.getAccessTokenBegin() == null : this.getAccessTokenBegin().equals(other.getAccessTokenBegin()))
            && (this.getRefreshToken() == null ? other.getRefreshToken() == null : this.getRefreshToken().equals(other.getRefreshToken()))
            && (this.getRefreshTokenTimeout() == null ? other.getRefreshTokenTimeout() == null : this.getRefreshTokenTimeout().equals(other.getRefreshTokenTimeout()));
//            && (this.getApiRequestUrl() == null ? other.getApiRequestUrl() == null : this.getApiRequestUrl().equals(other.getApiRequestUrl()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getUrl() == null) ? 0 : getUrl().hashCode());
        result = prime * result + ((getSort() == null) ? 0 : getSort().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getModifyOn() == null) ? 0 : getModifyOn().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getSellerId() == null) ? 0 : getSellerId().hashCode());
        result = prime * result + ((getAppKey() == null) ? 0 : getAppKey().hashCode());
        result = prime * result + ((getAppSercet() == null) ? 0 : getAppSercet().hashCode());
        result = prime * result + ((getAccessToken() == null) ? 0 : getAccessToken().hashCode());
        result = prime * result + ((getExpiresIn() == null) ? 0 : getExpiresIn().hashCode());
        result = prime * result + ((getAccessTokenBegin() == null) ? 0 : getAccessTokenBegin().hashCode());
        result = prime * result + ((getRefreshToken() == null) ? 0 : getRefreshToken().hashCode());
        result = prime * result + ((getRefreshTokenTimeout() == null) ? 0 : getRefreshTokenTimeout().hashCode());
//        result = prime * result + ((getApiRequestUrl() == null) ? 0 : getApiRequestUrl().hashCode());
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
        sb.append(", type=").append(type);
        sb.append(", url=").append(url);
        sb.append(", sort=").append(sort);
        sb.append(", status=").append(status);
        sb.append(", modifyOn=").append(modifyOn);
        sb.append(", remark=").append(remark);
        sb.append(", sellerId=").append(sellerId);
        sb.append(", appKey=").append(appKey);
        sb.append(", appSercet=").append(appSercet);
        sb.append(", accessToken=").append(accessToken);
        sb.append(", expiresIn=").append(expiresIn);
        sb.append(", accessTokenBegin=").append(accessTokenBegin);
        sb.append(", refreshToken=").append(refreshToken);
        sb.append(", refreshTokenTimeout=").append(refreshTokenTimeout);
//        sb.append(", apiRequestUrl=").append(apiRequestUrl);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}