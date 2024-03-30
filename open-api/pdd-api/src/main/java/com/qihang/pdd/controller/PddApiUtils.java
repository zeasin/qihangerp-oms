package com.qihang.pdd.controller;


import com.pdd.pop.sdk.http.PopClient;
import com.pdd.pop.sdk.http.PopHttpClient;
import com.pdd.pop.sdk.http.api.pop.request.PddMallInfoGetRequest;
import com.pdd.pop.sdk.http.api.pop.response.PddMallInfoGetResponse;
import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.HttpStatus;

public class PddApiUtils {
    /**
     * 获取店铺信息（原则上所有api调用之前都需要调用一下该方法）
     * @param clientId
     * @param clientSecret
     * @param accessToken
     * @return
     * @throws Exception
     */
    public static ResultVo<PddMallInfoGetResponse.MallInfoGetResponse> getShopInfo(String clientId, String clientSecret, String accessToken) throws Exception {

        PopClient client = new PopHttpClient(clientId, clientSecret);

        PddMallInfoGetRequest request = new PddMallInfoGetRequest();
        PddMallInfoGetResponse response = client.syncInvoke(request, accessToken);
        if (response.getErrorResponse() == null) {
            // 刷新一下token

            return ResultVo.success( response.getMallInfoGetResponse());
        } else if (response.getErrorResponse().getErrorCode().intValue() == 10019) {
            return ResultVo.error(HttpStatus.UNAUTHORIZED, "Token过期");
        }else
            return ResultVo.error(HttpStatus.ERROR, "接口调用失败："+response.getErrorResponse().getErrorMsg());

    }
}
