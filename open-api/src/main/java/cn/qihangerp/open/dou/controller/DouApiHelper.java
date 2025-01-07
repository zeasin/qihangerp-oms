package cn.qihangerp.open.dou.controller;

import cn.qihangerp.open.dou.common.ApiResultVo;
import cn.qihangerp.open.service.SShopPlatformService;
import cn.qihangerp.open.service.SShopService;
import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.EnumShopType;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Log
@Component
public class DouApiHelper {
    private final SShopService shopService;
    private final SShopPlatformService platformService;

    public ApiResultVo<ShopApiParams> checkBefore(Long shopId) {
        log.info("/**************主动更新dou 参数检查****************/");
        var shop = shopService.selectShopById(shopId);

        if (shop == null) return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，没有找到店铺");

        if (shop.getPlatform() != EnumShopType.DOU.getIndex())
            return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "参数错误，店铺不是dou店铺");

       if(shop.getSellerShopId()==null || shop.getSellerShopId()<=0) return ApiResultVo.error(ResultVoEnum.ParamsError.getIndex(), "店铺配置错误，请配置店铺平台shop_id");

        var thirdConfig = platformService.getById(shop.getPlatform().longValue());
        if (thirdConfig == null) return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "系统错误，没有找到第三方平台的配置信息");
        else if (StringUtils.isEmpty(thirdConfig.getAppKey()))
            return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少appkey");
        else if (StringUtils.isEmpty(thirdConfig.getAppSecret()))
            return ApiResultVo.error(ResultVoEnum.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少appSecret");
//        else if (StringUtils.isEmpty(thirdConfig.getServerUrl()))
//            return new ApiResult<>(ResultVoEnum.SystemException.getIndex(), "系统错误，第三方平台配置信息不完整，缺少server_url");

        ShopApiParams params = new ShopApiParams();
        params.setAppKey(thirdConfig.getAppKey());
        params.setAppSecret(thirdConfig.getAppSecret());
        params.setAccessToken(shop.getAccessToken());
        params.setServerUrl(thirdConfig.getServerUrl());
        params.setRedirectUrl(thirdConfig.getRedirectUrl());
        params.setSellerShopId(shop.getSellerShopId());
        if (!StringUtils.hasText(shop.getAccessToken()))
            return ApiResultVo.error(ResultVoEnum.TokenFail.getIndex(), "Token已过期，请重新授权",params);

        return ApiResultVo.success(params);
    }
}
