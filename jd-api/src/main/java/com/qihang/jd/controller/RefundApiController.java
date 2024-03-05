package com.qihang.jd.controller;

import com.jd.open.api.sdk.DefaultJdClient;
import com.jd.open.api.sdk.JdClient;
import com.jd.open.api.sdk.request.refundapply.PopAfsRefundapplyQuerylistRequest;
import com.jd.open.api.sdk.response.refundapply.PopAfsRefundapplyQuerylistResponse;
import com.qihang.common.common.ApiResult;
import com.qihang.common.enums.HttpStatus;
import com.qihang.jd.common.ApiCommon;
import com.qihang.jd.common.PullRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/refund")
@RestController
@AllArgsConstructor
public class RefundApiController {
    private final ApiCommon apiCommon;
    @RequestMapping(value = "/pull_list", method = RequestMethod.POST)
    public Object pullList(@RequestBody PullRequest params) throws Exception {
        if (params.getShopId() == null || params.getShopId() <= 0) {
//            return ApiResul new ApiResult(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
            return ApiResult.build(HttpStatus.PARAMS_ERROR, "参数错误，没有店铺Id");
        }
        var checkResult = apiCommon.checkBefore(params.getShopId());
        if (checkResult.getCode() != HttpStatus.SUCCESS) {
            return ApiResult.build(checkResult.getCode(), checkResult.getMsg(), checkResult.getData());
        }
        String accessToken = checkResult.getData().getAccessToken();
        String serverUrl = checkResult.getData().getServerUrl();
        String appKey = checkResult.getData().getAppKey();
        String appSecret = checkResult.getData().getAppSecret();
//        String accessToken = "8abd974c62c34778935b34b5952e6f68izdk";
//        String appKey="FB4CC3688E6F9065D4FF510A53BB60FF";
//        String appSecret="40e8c8b2427f4e6db8f4a39af27d719e";

        JdClient client = new DefaultJdClient(serverUrl, accessToken, appKey, appSecret);
        //https://open.jd.com/home/home/#/doc/api?apiCateId=71&apiId=307&apiName=jingdong.pop.afs.refundapply.querylist
        PopAfsRefundapplyQuerylistRequest request2=new PopAfsRefundapplyQuerylistRequest();
//        request2.setStatus("1");
//        request2.setId("111");
//        request2.setOrderId("1234");
//        request2.setBuyerId("abc");
//        request2.setBuyerName("abc");
//        request2.setApplyTimeStart("2023-12-01 16:11:40");
//        request2.setApplyTimeEnd("2023-12-31 16:11:40");
//        request2.setCheckTimeStart("2023-12-01 16:11:40");
//        request2.setCheckTimeEnd("2023-12-31 16:11:40");
        request2.setPageIndex(1);
        request2.setPageSize(10);
        PopAfsRefundapplyQuerylistResponse response2=client.execute(request2);
        System.out.println(request2);
        return response2;
    }
}
