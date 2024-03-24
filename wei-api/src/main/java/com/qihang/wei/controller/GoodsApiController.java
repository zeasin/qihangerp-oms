package com.qihang.wei.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;
import com.qihang.wei.openApi.ApiCommon;
import com.qihang.wei.openApi.PullRequest;
import com.qihang.wei.openApi.bo.GoodsApiBo;
import com.qihang.wei.openApi.service.GoodsApiService;
import com.qihang.wei.openApi.vo.GoodsListVo;
import com.qihang.wei.utils.RemoteUtil;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsApiController {
    private final ApiCommon apiCommon;
    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public AjaxResult pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return AjaxResult.error(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        Date currDateTime = new Date();
        long startTime = System.currentTimeMillis();
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != ResultVoEnum.SUCCESS.getIndex()) {
            return AjaxResult.error(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
        GoodsApiService remoting = RemoteUtil.Remoting(serverUrl, GoodsApiService.class);
        GoodsApiBo apiBo = new GoodsApiBo();
        apiBo.setPage_size(10);
        GoodsListVo res = remoting.getGoodsList(accessToken, apiBo);


        return AjaxResult.success();
    }
}
