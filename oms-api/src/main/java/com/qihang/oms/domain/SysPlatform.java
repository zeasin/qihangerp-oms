package com.qihang.oms.domain;

import java.io.Serializable;

/**
 * 
 * @TableName sys_platform
 */
public class SysPlatform implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 平台名
     */
    private String name;

    /**
     * 平台编码
     */
    private String code;

    /**
     * 
     */
    private String appKey;

    /**
     * 
     */
    private String appSecret;

    /**
     * 平台回调uri
     */
    private String redirectUri;

    /**
     * 接口访问地址
     */
    private String serverUrl;

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
     * 平台名
     */
    public String getName() {
        return name;
    }

    /**
     * 平台名
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 平台编码
     */
    public String getCode() {
        return code;
    }

    /**
     * 平台编码
     */
    public void setCode(String code) {
        this.code = code;
    }

    /**
     * 
     */
    public String getAppKey() {
        return appKey;
    }

    /**
     * 
     */
    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    /**
     * 
     */
    public String getAppSecret() {
        return appSecret;
    }

    /**
     * 
     */
    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    /**
     * 平台回调uri
     */
    public String getRedirectUri() {
        return redirectUri;
    }

    /**
     * 平台回调uri
     */
    public void setRedirectUri(String redirectUri) {
        this.redirectUri = redirectUri;
    }

    /**
     * 接口访问地址
     */
    public String getServerUrl() {
        return serverUrl;
    }

    /**
     * 接口访问地址
     */
    public void setServerUrl(String serverUrl) {
        this.serverUrl = serverUrl;
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
        SysPlatform other = (SysPlatform) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
            && (this.getCode() == null ? other.getCode() == null : this.getCode().equals(other.getCode()))
            && (this.getAppKey() == null ? other.getAppKey() == null : this.getAppKey().equals(other.getAppKey()))
            && (this.getAppSecret() == null ? other.getAppSecret() == null : this.getAppSecret().equals(other.getAppSecret()))
            && (this.getRedirectUri() == null ? other.getRedirectUri() == null : this.getRedirectUri().equals(other.getRedirectUri()))
            && (this.getServerUrl() == null ? other.getServerUrl() == null : this.getServerUrl().equals(other.getServerUrl()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
        result = prime * result + ((getAppKey() == null) ? 0 : getAppKey().hashCode());
        result = prime * result + ((getAppSecret() == null) ? 0 : getAppSecret().hashCode());
        result = prime * result + ((getRedirectUri() == null) ? 0 : getRedirectUri().hashCode());
        result = prime * result + ((getServerUrl() == null) ? 0 : getServerUrl().hashCode());
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
        sb.append(", code=").append(code);
        sb.append(", appKey=").append(appKey);
        sb.append(", appSecret=").append(appSecret);
        sb.append(", redirectUri=").append(redirectUri);
        sb.append(", serverUrl=").append(serverUrl);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}