package com.qihang.tao.controller;

import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.tao.common.ServerConfig;
import com.qihang.tao.common.TaoRequest;
import com.qihang.tao.domain.SysLogisticsCompany;
import com.qihang.tao.domain.SysPlatform;
import com.qihang.tao.openApi.ApiCommon;
import com.qihang.tao.service.SysLogisticsCompanyService;
import com.qihang.tao.service.SysPlatformService;
import com.qihang.tao.service.SysShopService;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.LogisticsCompaniesGetRequest;
import com.taobao.api.response.LogisticsCompaniesGetResponse;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Log
@RequestMapping("/shopApi")
@RestController
@AllArgsConstructor
public class ShopApiController {
    private final ApiCommon apiCommon;
    private final SysPlatformService platformService;
    private final SysShopService shopService;
    private final SysLogisticsCompanyService logisticsCompanyService;

    @RequestMapping(value = "/pull_logistics_companies", method = RequestMethod.POST)
    public AjaxResult pullLogisticsList(@RequestBody TaoRequest taoRequest) throws Exception {
        SysPlatform platform = platformService.selectById(EnumShopType.TAO.getIndex());

        if(!StringUtils.hasText(platform.getAppKey())) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "平台配置错误，没有找到AppKey");
        }
        if(!StringUtils.hasText(platform.getAppSecret())) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到AppSercet");
        }
        if(!StringUtils.hasText(platform.getServerUrl())) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "第三方平台配置错误，没有找到ServerUrl");
        }
//        ShopApiParams shopApiParams = checkResult.getData();
//        String sessionKey = shopApiParams.getAccessToken();
//        String url = shopApiParams.getApiRequestUrl();
//        String appKey = shopApiParams.getAppKey();
//        String appSecret = shopApiParams.getAppSecret();

        TaobaoClient client = new DefaultTaobaoClient(platform.getServerUrl(), platform.getAppKey(), platform.getAppSecret());
        LogisticsCompaniesGetRequest req = new LogisticsCompaniesGetRequest();
        req.setFields("id,code,name,reg_mail_no");
        req.setIsRecommended(true);
        req.setOrderMode("offline");
        LogisticsCompaniesGetResponse rsp = client.execute(req);
        if(rsp.isSuccess()){
            if(rsp.getLogisticsCompanies()!=null){
                for (var item:rsp.getLogisticsCompanies()) {
                    SysLogisticsCompany lc = new SysLogisticsCompany();
                    lc.setPlatformId(EnumShopType.TAO.getIndex());
                    lc.setCode(item.getCode());
                    lc.setName(item.getName());
                    lc.setLogisticsId(item.getId());
                    logisticsCompanyService.insert(lc);
                    log.info("=====添加快递公司TAO=====");
                }
            }
        }else {
            AjaxResult.error(rsp.getMsg());
        }
        return AjaxResult.success();
    }
}
