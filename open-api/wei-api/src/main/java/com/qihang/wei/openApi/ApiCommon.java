package com.qihang.wei.openApi;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;

import com.qihang.wei.openApi.service.ShopInfoApiService;
import com.qihang.wei.openApi.service.TokenApiService;
import com.qihang.wei.openApi.vo.ShopApiResultVo;
import com.qihang.wei.openApi.vo.Token;
import com.qihang.wei.service.SysPlatformService;
import com.qihang.wei.service.SysShopService;
import com.qihang.wei.utils.RemoteUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@AllArgsConstructor
@Component
public class ApiCommon {
    private final SysShopService shopService;
    private final SysPlatformService platformService;
    /**
     * 更新前的检查
     *
     * @param shopId
     * @return
     * @throws
     */
    public ResultVo<ShopApiParams> checkBefore(Integer shopId) {
        var shop = shopService.selectShopById(shopId);
        if (shop == null) {
            return ResultVo.error(HttpStatus.PARAMS_ERROR,"参数错误，没有找到店铺");
        }
        if (shop.getType() != EnumShopType.WEI.getIndex()) {
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
        params.setApiRequestUrl(shop.getApiRequestUrl());
        params.setServerUrl(platform.getServerUrl());
        params.setSellerId(shop.getSellerId().toString());
        if (!StringUtils.hasText(shop.getAccessToken())) {
//            String s = "/token?grant_type=client_credential&appid="+params.getAppKey()+"&secret="+params.getAppSecret();
            TokenApiService remoting = RemoteUtil.Remoting(params.getServerUrl(), TokenApiService.class);
            Token token = remoting.getToken("client_credential",params.getAppKey(),params.getAppSecret());
            params.setAccessToken(token.getAccess_token());
            shopService.updateSessionKey(shopId,token.getAccess_token());
        }else {
            // 调用 店铺基本信息接口 验证Token
            ShopInfoApiService remoting = RemoteUtil.Remoting(params.getServerUrl(), ShopInfoApiService.class);
            ShopApiResultVo shopInfo = remoting.getShopInfo(params.getAccessToken());
            if(shopInfo.getErrcode() == 42001){
                // Token过期
                TokenApiService remoting1 = RemoteUtil.Remoting(params.getServerUrl(), TokenApiService.class);
                Token token = remoting1.getToken("client_credential",params.getAppKey(),params.getAppSecret());
                if(token.getErrcode()==null) {
                    params.setAccessToken(token.getAccess_token());
                    shopService.updateSessionKey(shopId, token.getAccess_token());
                }else{
                    return ResultVo.error(HttpStatus.PARAMS_ERROR, token.getErrmsg());
                }
            }
        }
        return ResultVo.success(params);
    }

}
