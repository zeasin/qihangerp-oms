package com.qihang.common.api;

import lombok.Data;

@Data
public class ShopApiParams {
    private String appKey;
    private String appSecret;
    private String accessToken;
    private String redirectUrl;
    private String serverUrl;
    private Long sellerShopId;

}
