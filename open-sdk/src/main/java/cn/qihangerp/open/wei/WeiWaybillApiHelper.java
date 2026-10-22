package cn.qihangerp.open.wei;

import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.common.ApiResultVoEnum;
import cn.qihangerp.open.common.OkHttpClientHelper;
import cn.qihangerp.open.wei.bo.ewaybill.WaybillRequest;
import cn.qihangerp.open.wei.response.WeiTokenResponse;
import cn.qihangerp.open.wei.vo.ewaybill.EwaybillOrderCreateVo;
import cn.qihangerp.open.wei.vo.ewaybill.EwaybillOrderPreCreateVo;
import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.lang3.StringUtils;

public class WeiWaybillApiHelper {

    public static ApiResultVo<EwaybillOrderCreateVo> getWaybillCode(String appId, String appSecret, String accessToken, WaybillRequest request){
        if(!StringUtils.isNotBlank(accessToken)) {
            ApiResultVo<WeiTokenResponse> token = WeiTokenApiHelper.getToken(appId, appSecret);
            if (token.getCode() != ApiResultVoEnum.SUCCESS.getIndex())
                return ApiResultVo.error(ApiResultVoEnum.ApiException, "获取Token失败");
            accessToken = token.getData().getAccess_token();
        }
        ApiResultVo<String> preCreateResult = ewaybillOrderPreCreate(appId, appSecret, accessToken, request);
        if (preCreateResult.getCode() != ApiResultVoEnum.SUCCESS.getIndex()){
            return ApiResultVo.error(preCreateResult.getCode(),preCreateResult.getMsg());
        }
        request.setEwaybill_order_id(preCreateResult.getData());
        request.setTemplate_id("single");
        return ewaybillOrderCreate(appId, appSecret, accessToken, request);
    }


    public static ApiResultVo<String> ewaybillOrderPreCreate(String appId, String appSecret, String accessToken,WaybillRequest request)  {
        if(!StringUtils.isNotBlank(accessToken)) {
            ApiResultVo<WeiTokenResponse> token = WeiTokenApiHelper.getToken(appId, appSecret);
            if (token.getCode() != ApiResultVoEnum.SUCCESS.getIndex())
                return ApiResultVo.error(ApiResultVoEnum.ApiException, "获取Token失败");
            accessToken = token.getData().getAccess_token();
        }

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String url = ServerUrl.serverApiUrl + ServerUrl.ewaybillOrderPreCreateApiUrl + "?access_token=" + accessToken;
            String result = OkHttpClientHelper.post(url, objectMapper.writeValueAsString(request));
            EwaybillOrderPreCreateVo res = JSONObject.parseObject(result, EwaybillOrderPreCreateVo.class);
            if (res == null || res.getErrcode() == null || res.getErrcode() != 0) {
                return ApiResultVo.error(ApiResultVoEnum.ApiException, res == null ? "接口请求错误" : res.getErrmsg());
            }
            //ewaybill_order_id -> 3486612324495114245
            return ApiResultVo.success(res.getEwaybill_order_id());
        }catch (Exception e){
            return ApiResultVo.error(ApiResultVoEnum.ApiException, e.getMessage());
        }
    }


    public static ApiResultVo<EwaybillOrderCreateVo> ewaybillOrderCreate(String appId, String appSecret, String accessToken,WaybillRequest request)  {
        if(!StringUtils.isNotBlank(accessToken)) {
            ApiResultVo<WeiTokenResponse> token = WeiTokenApiHelper.getToken(appId, appSecret);
            if (token.getCode() != ApiResultVoEnum.SUCCESS.getIndex())
                return ApiResultVo.error(ApiResultVoEnum.ApiException, "获取Token失败");
            accessToken = token.getData().getAccess_token();
        }

        try {
            ObjectMapper objectMapper = new ObjectMapper();
            String url = ServerUrl.serverApiUrl + ServerUrl.ewaybillOrderCreateApiUrl + "?access_token=" + accessToken;
            String result = OkHttpClientHelper.post(url, objectMapper.writeValueAsString(request));
            EwaybillOrderCreateVo res = JSONObject.parseObject(result, EwaybillOrderCreateVo.class);
            if (res == null || res.getErrcode() == null || res.getErrcode() != 0) {
                return ApiResultVo.error(ApiResultVoEnum.ApiException, res == null ? "接口请求错误" : res.getErrmsg());
            }
            return ApiResultVo.success(res);
        }catch (Exception e){
            return ApiResultVo.error(ApiResultVoEnum.ApiException, e.getMessage());
        }
    }


}
