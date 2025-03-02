package cn.qihangerp.open.wei;


import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.api.ShopApiParams;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.common.enums.HttpStatus;
import cn.qihangerp.domain.OShop;
import cn.qihangerp.module.service.OShopService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.wei.response.WeiTokenResponse;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Component
public class WeiApiCommon {
    private final OShopService shopService;
    /**
     * 更新前的检查
     *
     * @param shopId
     * @return
     * @throws
     */
    public ResultVo<ShopApiParams> checkBefore(Long shopId) {
        OShop shop = shopService.getById(shopId);
        if (shop == null) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR,"参数错误，没有找到店铺");
        }
        if (shop.getType() != EnumShopType.WEI.getIndex()) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "参数错误，店铺不是微信小店店铺");
        }
        if(!StringUtils.hasText(shop.getAppKey())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "店铺参数配置错误，没有找到AppKey");
        }
        if(!StringUtils.hasText(shop.getAppSercet())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "店铺参数配置错误，没有找到AppSercet");
        }
        if(!StringUtils.hasText(shop.getApiRequestUrl())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "店铺参数配置错误，没有找到ApiRequestUrl");
        }

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(shop.getAppKey());
        params.setAppSecret(shop.getAppSercet());
        params.setAccessToken(shop.getAccessToken());
        params.setServerUrl(shop.getApiRequestUrl());
        params.setSellerId(shop.getSellerId());


        if (!StringUtils.hasText(params.getAccessToken())) {
            ApiResultVo<WeiTokenResponse> token1 = WeiTokenApiHelper.getToken(params.getAppKey(), params.getAppSecret());
            if(token1.getCode()==0){
                params.setAccessToken(token1.getData().getAccess_token());
                shopService.updateSessionKey(shopId, params.getAccessToken());
                return ResultVo.success(params);
            }else{
                return ResultVo.error(HttpStatus.PARAMS_ERROR, token1.getMsg());
            }
        }else {
            // 调用 店铺基本信息接口 验证Token
            ApiResultVo<WeiTokenResponse> tokenApiResultVo = WeiTokenApiHelper.checkToken(params.getAppKey(), params.getAppSecret(), params.getAccessToken());
            if(tokenApiResultVo.getCode()==0){
//                params.setAccessToken(tokenApiResultVo.getData().getAccess_token());
//                skuService.updateShopSessionByShopId(shopId, params.getAccessToken());
                return ResultVo.success(params);
            }else {
//                ApiResultVo<Token> token2 = TokenApiHelper.getToken(params.getAppKey(), params.getAppSecret());
                ApiResultVo<WeiTokenResponse> token2 = WeiTokenApiHelper.getToken(params.getAppKey(), params.getAppSecret());
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
