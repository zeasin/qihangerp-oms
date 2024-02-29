package com.qihang.tao.controller;

public class ShopApiParams {
    private String appKey;
    private String appSecret;
    private String accessToken;
    private String apiRequestUrl;
    private String tokenRequestUrl;

    public String getTokenRequestUrl() {
        return tokenRequestUrl;
    }

    public void setTokenRequestUrl(String tokenRequestUrl) {
        this.tokenRequestUrl = tokenRequestUrl;
    }

    public String getAppKey() {
        return appKey;
    }

    public void setAppKey(String appKey) {
        this.appKey = appKey;
    }

    public String getAppSecret() {
        return appSecret;
    }

    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getApiRequestUrl() {
        return apiRequestUrl;
    }

    public void setApiRequestUrl(String apiRequestUrl) {
        this.apiRequestUrl = apiRequestUrl;
    }
}
