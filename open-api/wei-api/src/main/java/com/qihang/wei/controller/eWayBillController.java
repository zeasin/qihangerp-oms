package com.qihang.wei.controller;

import cn.qihangerp.open.wei.EwaybillApiHelper;
import cn.qihangerp.open.wei.common.ApiResultVo;
import cn.qihangerp.open.wei.vo.ewaybill.DeliveryVo;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.enums.HttpStatus;
import com.qihang.wei.domain.WeiGoods;
import com.qihang.wei.domain.WeiGoodsSku;
import com.qihang.wei.openApi.ApiCommon;
import com.qihang.wei.openApi.PullRequest;
import com.qihang.wei.openApi.bo.GoodsDetailApiBo;
import com.qihang.wei.openApi.bo.GoodsListApiBo;
import com.qihang.wei.openApi.service.GoodsApiService;
import com.qihang.wei.openApi.vo.GoodsDetailVo;
import com.qihang.wei.openApi.vo.GoodsListVo;
import com.qihang.wei.utils.RemoteUtil;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("/ewaybill")
@RestController
@AllArgsConstructor
public class eWayBillController {
    private final ApiCommon apiCommon;
    @RequestMapping(value = "/get_deliver_list", method = RequestMethod.POST)
    public AjaxResult getDeliverList(@RequestBody PullRequest params) throws Exception {
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

        ApiResultVo<DeliveryVo> apiResultVo = EwaybillApiHelper.pullDeliveryList(appKey, appSecret, accessToken);


        return AjaxResult.success(apiResultVo.getList());
    }
}
