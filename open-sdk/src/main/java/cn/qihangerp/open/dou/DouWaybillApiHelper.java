package cn.qihangerp.open.dou;

import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.common.ApiResultVoEnum;
import cn.qihangerp.open.dou.model.WaybillCode;
import cn.qihangerp.open.dou.model.WaybillPrintData;
import cn.qihangerp.open.dou.request.WaybillApplyRequest;
import cn.qihangerp.open.dou.request.WaybillCodeRequest;
import cn.qihangerp.open.dou.utils.ExpressClient;
import cn.qihangerp.open.dou.utils.HttpUtil;
import cn.qihangerp.open.dou.utils.MD5Utils;
import com.alibaba.fastjson2.JSONObject;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

public class DouWaybillApiHelper {


    /**
     * 取号
     * @param appKey
     * @param appSercet
     * @param accessToken
     * @param request
     * @return
     */
    public static ApiResultVo<WaybillCode> getWaybillCode(String appKey, String appSercet, String accessToken, WaybillCodeRequest request)  {
        String method = "logistics.newCreateOrder";

        String paramJson = JSONObject.toJSONString(request);

        long timestamp = System.currentTimeMillis()/1000;
//        String timestamp = "2024-06-18 11:20:13";
        String signStr = "app_key"+appKey+"method"+method+"param_json"+paramJson+"timestamp"+timestamp+"v"+"2";
        signStr = appSercet+signStr+appSercet;
        String sign = MD5Utils.MD5Encode(signStr);

        String sendUrl = "https://openapi-fxg.jinritemai.com/logistics/newCreateOrder";

        Map<String, String> params = new HashMap<>();
        params.put("method", method);
        params.put("app_key", appKey);
        params.put("access_token", accessToken);
        params.put("timestamp", timestamp+"");
        params.put("param_json", paramJson);
        params.put("v", "2");
        params.put("sign", sign);

        try {
            String surl = sendUrl+ "?"+ HttpUtil.map2Url(params);
            HttpResponse<String> response = ExpressClient.doPost(surl, paramJson);
            if (response.statusCode() == 200) {
                String resultStr = response.body();

                JSONObject resultObj = JSONObject.parseObject(resultStr);
                if (resultObj.getInteger("code") == 10000) {
                    if(resultObj.getJSONObject("data").getJSONArray("err_infos") != null &&resultObj.getJSONObject("data").getJSONArray("err_infos").size()>0){
                        return ApiResultVo.error(ApiResultVoEnum.ApiException.getIndex(), resultObj.getJSONObject("data").getJSONArray("err_infos").getJSONObject(0).getString("err_msg"));
                    }
                    var list = resultObj.getJSONObject("data").getList("ebill_infos", WaybillCode.class);

                    return ApiResultVo.success(list.size(),list);
                }else{
                    return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "请求API错误："+resultObj.getString("sub_msg"));
                }
            }else{
                return  ApiResultVo.error(ApiResultVoEnum.NETWORK_ERROR.getIndex(), "网络请求错误");
            }
        } catch (Exception e) {
            return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "系统异常：" + e.getMessage());
        }
    }

    public static ApiResultVo<WaybillPrintData> pullWaybillPrintData(String appKey, String appSercet, String accessToken, WaybillApplyRequest request)  {
        String method = "logistics.waybillApply";

        String paramJson = JSONObject.toJSONString(request);

        long timestamp = System.currentTimeMillis()/1000;
//        String timestamp = "2024-06-18 11:20:13";
        String signStr = "app_key"+appKey+"method"+method+"param_json"+paramJson+"timestamp"+timestamp+"v"+"2";
        signStr = appSercet+signStr+appSercet;
        String sign = MD5Utils.MD5Encode(signStr);

        String sendUrl = "https://openapi-fxg.jinritemai.com/logistics/waybillApply";

        Map<String, String> params = new HashMap<>();
        params.put("method", method);
        params.put("app_key", appKey);
        params.put("access_token", accessToken);
        params.put("timestamp", timestamp+"");
        params.put("param_json", paramJson);
        params.put("v", "2");
        params.put("sign", sign);

        try {
            String surl = sendUrl+ "?"+ HttpUtil.map2Url(params);
            HttpResponse<String> response = ExpressClient.doPost(surl, paramJson);
            if (response.statusCode() == 200) {
                String resultStr = response.body();

                JSONObject resultObj = JSONObject.parseObject(resultStr);
                if (resultObj.getInteger("code") == 10000) {
                    if(resultObj.getJSONObject("data").getJSONArray("err_infos") != null &&resultObj.getJSONObject("data").getJSONArray("err_infos").size()>0){
                        return ApiResultVo.error(ApiResultVoEnum.ApiException.getIndex(), resultObj.getJSONObject("data").getJSONArray("err_infos").getJSONObject(0).getString("err_msg"));
                    }
                    var list = resultObj.getJSONObject("data").getList("waybill_infos", WaybillPrintData.class);

                    return ApiResultVo.success(list.size(),list);
                }else{
                    return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "请求API错误："+resultObj.getString("sub_msg"));
                }
            }else{
                return  ApiResultVo.error(ApiResultVoEnum.NETWORK_ERROR.getIndex(), "网络请求错误");
            }
        } catch (Exception e) {
            return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "系统异常：" + e.getMessage());
        }
    }

    /**
     * 取消取号（logistics.cancelOrder）
     * @param logisticsCode 平台物流公司编码
     * @param trackNo 快递单号
     */
    public static ApiResultVo<Void> waybillCancel(String appKey, String appSercet, String accessToken, String logisticsCode, String trackNo)  {
        String method = "logistics.cancelOrder";

        JSONObject paramObj = new JSONObject();
        paramObj.put("logistics_code", logisticsCode);
        paramObj.put("track_no", trackNo);
        String paramJson = paramObj.toJSONString();

        long timestamp = System.currentTimeMillis()/1000;
        String signStr = "app_key"+appKey+"method"+method+"param_json"+paramJson+"timestamp"+timestamp+"v"+"2";
        signStr = appSercet+signStr+appSercet;
        String sign = MD5Utils.MD5Encode(signStr);

        String sendUrl = "https://openapi-fxg.jinritemai.com/logistics/cancelOrder";

        Map<String, String> params = new HashMap<>();
        params.put("method", method);
        params.put("app_key", appKey);
        params.put("access_token", accessToken);
        params.put("timestamp", timestamp+"");
        params.put("param_json", paramJson);
        params.put("v", "2");
        params.put("sign", sign);

        try {
            String surl = sendUrl+ "?"+ HttpUtil.map2Url(params);
            HttpResponse<String> response = ExpressClient.doPost(surl, paramJson);
            if (response.statusCode() == 200) {
                String resultStr = response.body();

                JSONObject resultObj = JSONObject.parseObject(resultStr);
                if (resultObj.getInteger("code") == 10000) {
                    return ApiResultVo.success();
                }else{
                    return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "请求API错误："+resultObj.getString("sub_msg"));
                }
            }else{
                return  ApiResultVo.error(ApiResultVoEnum.NETWORK_ERROR.getIndex(), "网络请求错误");
            }
        } catch (Exception e) {
            return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "系统异常：" + e.getMessage());
        }
    }
}
