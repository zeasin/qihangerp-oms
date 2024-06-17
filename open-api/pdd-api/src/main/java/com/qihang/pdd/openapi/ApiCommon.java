package com.qihang.pdd.openapi;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.pdd.domain.SShopPlatform;
import com.qihang.pdd.service.SShopPlatformService;
import com.qihang.pdd.service.SShopService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Component
public class ApiCommon {
    private final SShopService shopService;
    private final SShopPlatformService platformService;
//    private final ServerConfig serverConfig;
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
//            return new ApiResult<>(EnumResultVo.ParamsError.getIndex(), "参数错误，没有找到店铺");
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "参数错误，没有找到店铺");
        }

        if (shop.getPlatform() != EnumShopType.PDD.getIndex()) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "参数错误，店铺不是PDD店铺");
        }
        SShopPlatform platform = platformService.getById(EnumShopType.PDD.getIndex());

        if (!StringUtils.hasText(platform.getAppKey())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "平台配置错误，没有找到AppKey");
        }
        if (!StringUtils.hasText(platform.getAppSecret())) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到AppSecret");
        }
//        if (!StringUtils.hasText(platform.getRedirectUri())) {
//            return ResultVo.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到RedirectUri");
//        }
//        if (!StringUtils.hasText(platform.getServerUrl())) {
//            return ResultVo.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到ServerUrl");
//        }

        if(shop.getSellerShopId() == null || shop.getSellerShopId() <= 0) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR,  "店铺配置错误，没有找到SellerShopId");
        }

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(platform.getAppKey());
        params.setAppSecret(platform.getAppSecret());
        params.setAccessToken(shop.getAccessToken());
        params.setRedirectUrl(platform.getRedirectUrl());
        params.setServerUrl(platform.getServerUrl());
        params.setSellerShopId(shop.getSellerShopId());
        if (!StringUtils.hasText(shop.getAccessToken())) {

            return ResultVo.error(HttpStatus.UNAUTHORIZED1, "Token已过期，请重新授权", params);
        }
        return ResultVo.success(HttpStatus.SUCCESS, params);
    }

}
