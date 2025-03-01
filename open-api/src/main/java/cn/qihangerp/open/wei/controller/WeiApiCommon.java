package cn.qihangerp.open.wei.controller;


import cn.qihangerp.open.service.SShopPlatformService;
import cn.qihangerp.open.service.SShopService;
import cn.qihangerp.open.wei.TokenApiHelper;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.vo.ShopApiParams;
import cn.qihangerp.open.wei.vo.Token;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Component
public class WeiApiCommon {
    private final SShopService shopService;
    private final SShopPlatformService platformService;
    /**
     * 更新前的检查
     *
     * @param shopId
     * @return
     * @throws
     */
    public ResultVo<ShopApiParams> checkBefore(Long shopId) {
        var shop = shopService.selectShopById(shopId);
        if (shop == null) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR,"参数错误，没有找到店铺");
        }
        if (shop.getPlatform() != EnumShopType.WEI.getIndex()) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "参数错误，店铺不是JD店铺");
        }
        if(!StringUtils.hasText(shop.getAppKey())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "平台配置错误，没有找到AppKey");
        }
        if(!StringUtils.hasText(shop.getAppSercet())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到AppSercet");
        }
        var platform =platformService.getById(EnumShopType.WEI.getIndex());
        if(!StringUtils.hasText(platform.getServerUrl())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到ServerUrl");
        }

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(shop.getAppKey());
        params.setAppSecret(shop.getAppSercet());
        params.setAccessToken(shop.getAccessToken());
        params.setServerUrl(platform.getServerUrl());
        params.setSellerId(shop.getSellerShopId().toString());


        if (!StringUtils.hasText(params.getAccessToken())) {
            ApiResultVo<Token> token1 = TokenApiHelper.getToken(params.getAppKey(), params.getAppSecret());
            if(token1.getCode()==0){
                params.setAccessToken(token1.getData().getAccess_token());
                shopService.updateSessionKey(shopId, params.getAccessToken());
                return ResultVo.success(params);
            }else{
                return ResultVo.error(HttpStatus.PARAMS_ERROR, token1.getMsg());
            }
        }else {
            // 调用 店铺基本信息接口 验证Token
            ApiResultVo<Token> tokenApiResultVo = TokenApiHelper.checkToken(params.getAppKey(), params.getAppSecret(), params.getAccessToken());
            if(tokenApiResultVo.getCode()==0){
//                params.setAccessToken(tokenApiResultVo.getData().getAccess_token());
//                skuService.updateShopSessionByShopId(shopId, params.getAccessToken());
                return ResultVo.success(params);
            }else {
                ApiResultVo<Token> token2 = TokenApiHelper.getToken(params.getAppKey(), params.getAppSecret());
                if (token2.getCode() == 0) {
                    params.setAccessToken(token2.getData().getAccess_token());
                    shopService.updateSessionKey(shopId, params.getAccessToken());
                    return ResultVo.success(params);
                } else {
                    return ResultVo.error(HttpStatus.PARAMS_ERROR, token2.getMsg());
                }
            }
        }
    }

}
