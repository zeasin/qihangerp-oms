package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.delivery.GetVenderAllDeliveryCompanyRequest;
import com.jd.open.api.sdk.response.delivery.GetVenderAllDeliveryCompanyResponse;
import com.qihang.common.api.ShopApiParams;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.EnumShopType;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.domain.SysLogisticsCompany;
import com.qihang.jd.openApi.ApiCommon;
import com.qihang.jd.openApi.PullRequest;
import com.qihang.jd.service.SysLogisticsCompanyService;
import com.qihang.jd.service.SysPlatformService;
import com.qihang.jd.service.SysShopService;
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
    public AjaxResult pullLogisticsList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg());
        }

        ShopApiParams shopApiParams = checkResult.getData();
        String accessToken = shopApiParams.getAccessToken();
        String url = shopApiParams.getServerUrl();
        String appKey = shopApiParams.getAppKey();
        String appSecret = shopApiParams.getAppSecret();
        JdClient client=new DefaultJdClient(url,accessToken,appKey,appSecret);
        GetVenderAllDeliveryCompanyRequest request=new GetVenderAllDeliveryCompanyRequest();
        request.setFields("id,name,description");
        GetVenderAllDeliveryCompanyResponse response=client.execute(request);

        if(response.getDeliveryList() !=null) {
            for (var item : response.getDeliveryList()) {
                SysLogisticsCompany lc = new SysLogisticsCompany();
                lc.setPlatformId(EnumShopType.JD.getIndex());
                lc.setShopId(params.getShopId());
                lc.setCode(item.getId() + "");
                lc.setName(item.getName());
                lc.setLogisticsId(item.getId());
                lc.setRemark(item.getDescription());
                logisticsCompanyService.insert(lc);
                log.info("=====添加快递公司JD=====");
            }

        }else{
            AjaxResult.error(response.getMsg());
        }
//        System.out.println(rsp.getBody());
        return AjaxResult.success();
    }
}
