package com.qihang.jd.openApi;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;

import com.qihang.jd.domain.SysPlatform;
import com.qihang.jd.service.SysPlatformService;
import com.qihang.jd.service.SysShopService;
//import com.qihang.tao.common.ServerConfig;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Component
public class ApiCommon {
    private final SysShopService shopService;
    private final SysPlatformService platformService;
//    private final ServerConfig serverConfig;
    /**
     * 更新前的检查
     *
     * @param shopId
     * @return
     * @throws
     */
    public ApiResult<ShopApiParams> checkBefore(Integer shopId) {
        var shop = shopService.selectShopById(shopId);
        if (shop == null) {
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有找到店铺");
            return ApiResult.build(HttpStatus.PARAMS_ERROR,"参数错误，没有找到店铺");
        }

        if (shop.getType() != EnumShopType.JD.getIndex()) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，店铺不是JD店铺");
        }
        SysPlatform platform = platformService.selectById(EnumShopType.JD.getIndex());

        if(!StringUtils.hasText(platform.getAppKey())) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "平台配置错误，没有找到AppKey");
        }
        if(!StringUtils.hasText(platform.getAppSecret())) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到AppSercet");
        }
        if(!StringUtils.hasText(platform.getRedirectUri())) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到RedirectUri");
        }
        if(!StringUtils.hasText(platform.getServerUrl())) {
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到ServerUrl");
        }

//        if(shop.getSellerId() == null || shop.getSellerId() <= 0) {
//            return com.qihang.tao.common.ApiResult.build(HttpStatus.PARAMS_ERROR,  "第三方平台配置错误，没有找到SellerUserId");
//        }

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(platform.getAppKey());
        params.setAppSecret(platform.getAppSecret());
        params.setAccessToken(shop.getAccessToken());
        params.setTokenRequestUrl(platform.getRedirectUri());
        params.setApiRequestUrl(shop.getApiRequestUrl());
        params.setServerUrl(platform.getServerUrl());
        params.setSellerId(shop.getSellerId().toString());
        if (!StringUtils.hasText(shop.getAccessToken())) {

            return ApiResult.build(HttpStatus.UNAUTHORIZED, "Token已过期，请重新授权", params);
        }

        /****************先查询卖家对不对***************/
//        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//        UserSellerGetRequest reqSeller = new UserSellerGetRequest();
//        reqSeller.setFields("nick,user_id");
//        UserSellerGetResponse rsp = client.execute(reqSeller, sessionKey);
//        if(StringUtils.hasText(rsp.getErrorCode())){
//            if(rsp.getErrorCode().equals("27")){
//                return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "Token已过期，请重新授权",params);
//            }
//            else if(rsp.getErrorCode().equals("11")){
//                if(rsp.getSubCode().equals("isv.permission-api-package-limit"))
//                    return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "请检查淘宝用户API：taobao.user.seller.get是否具有访问权限",params);
//                return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), rsp.getSubCode(),params);
//            }
//            else if(rsp.getErrorCode().equals("25")){
//                return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "无效签名！请检查SessionKey、appKey、appSecret是否匹配",params);
//            } else
//                return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误！"+(StringUtils.hasText(rsp.getSubMsg()) ? rsp.getSubMsg(): rsp.getMsg()));
//        }
//        if(rsp.getUser() == null || rsp.getUser().getUserId() == null){
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误！请设置店铺SellerUserId值！",params);
//        }
//        else if (shop.getSellerUserId().longValue() != rsp.getUser().getUserId().longValue()) {
//            return new ApiResult<>(EnumResultVo.TokenFail.getIndex(), "当前用户是：" + rsp.getUser().getNick() + "，请重新授权",params);
//        }
        return ApiResult.build(HttpStatus.SUCCESS,"",params);
    }

}
