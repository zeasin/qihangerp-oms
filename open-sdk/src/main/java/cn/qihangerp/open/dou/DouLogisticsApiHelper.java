package cn.qihangerp.open.dou;

import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.common.ApiResultVoEnum;
import cn.qihangerp.open.dou.model.DouLogisticsCompany;
import cn.qihangerp.open.dou.model.after.AfterSale;
import cn.qihangerp.open.dou.utils.ExpressClient;
import cn.qihangerp.open.dou.utils.HttpUtil;
import cn.qihangerp.open.dou.utils.MD5Utils;
import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DouLogisticsApiHelper {
    private static Logger log = LoggerFactory.getLogger(DouLogisticsApiHelper.class);

    /**
     *
     * @param
     * @return
     */

    public static ApiResultVo<DouLogisticsCompany> getLogisticsCompanyList(String appKey, String appSecret, String accessToken){
        String method = "order.logisticsCompanyList";


        String paramJson = "{}";

        long timestamp = System.currentTimeMillis() / 1000 ;

//        String signStr = "app_key"+appKey+"method"+method+"param_json"+paramJson+"timestamp"+timestamp+"v"+"1";
//        signStr = appSecret+signStr+appSecret;
//
//        String sign = MD5Utils.MD5Encode(signStr);
        String signStr = "app_key" + appKey + "method" + method + "param_json" + paramJson + "timestamp" + timestamp + "v" + "2";
        signStr = appSecret + signStr + appSecret;

        String sign = MD5Utils.MD5Encode(signStr);

        String sendUrl = "https://openapi-fxg.jinritemai.com/order/logisticsCompanyList";

        Map<String, String> params = new HashMap<>();
        params.put("app_key", appKey);
        params.put("access_token", accessToken);
        params.put("method", method);
        params.put("param_json",paramJson);
        params.put("timestamp", timestamp+"");
        params.put("v", "2");
        params.put("sign", sign);

        try {
            String surl = sendUrl + "?" + HttpUtil.map2Url(params);
            HttpResponse<String> response = ExpressClient.doPost(surl, paramJson);
//            HttpResponse<String> response = ExpressClient.doPost(sendUrl+"/afterSale/orderList", HttpUtil.map2Url(params));
            if (response.statusCode() == 200) {
//                JSONObject obj = JSONObject.parseObject(response.body()).getJSONObject("data");
                JSONObject resultObj = JSONObject.parseObject(response.body());
                if (resultObj.getInteger("code") == 10000) {

                    List<DouLogisticsCompany> list = resultObj.getList("data", DouLogisticsCompany.class);
                    return ApiResultVo.success(list);
                } else {
                    return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "请求API错误：" + resultObj.getString("sub_msg"));
                }

            }else{
                return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "接口服务器连接异常");
            }

        } catch (Exception e) {
            return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "系统异常：" + e.getMessage());
        }
    }

    /**
     * 整单发货回传（order.logisticsAdd）
     * @param orderId 平台订单号
     * @param companyCode 快递公司编码
     * @param logisticsCode 快递单号
     */
    public static ApiResultVo<Void> logisticsAdd(String appKey, String appSecret, String accessToken, String orderId, String companyCode, String logisticsCode){
        String method = "order.logisticsAdd";

        JSONObject paramObj = new JSONObject();
        paramObj.put("order_id", orderId);
        paramObj.put("company_code", companyCode);
        paramObj.put("logistics_code", logisticsCode);
        String paramJson = paramObj.toJSONString();

        long timestamp = System.currentTimeMillis() / 1000 ;

        String signStr = "app_key" + appKey + "method" + method + "param_json" + paramJson + "timestamp" + timestamp + "v" + "2";
        signStr = appSecret + signStr + appSecret;

        String sign = MD5Utils.MD5Encode(signStr);

        String sendUrl = "https://openapi-fxg.jinritemai.com/order/logisticsAdd";

        Map<String, String> params = new HashMap<>();
        params.put("app_key", appKey);
        params.put("access_token", accessToken);
        params.put("method", method);
        params.put("param_json",paramJson);
        params.put("timestamp", timestamp+"");
        params.put("v", "2");
        params.put("sign", sign);

        try {
            String surl = sendUrl + "?" + HttpUtil.map2Url(params);
            HttpResponse<String> response = ExpressClient.doPost(surl, paramJson);
            if (response.statusCode() == 200) {
                JSONObject resultObj = JSONObject.parseObject(response.body());
                if (resultObj.getInteger("code") == 10000) {
                    return ApiResultVo.success();
                } else {
                    return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "请求API错误：" + resultObj.getString("sub_msg"));
                }
            }else{
                return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "接口服务器连接异常");
            }
        } catch (Exception e) {
            return ApiResultVo.error(ApiResultVoEnum.Fail.getIndex(), "系统异常：" + e.getMessage());
        }
    }


}
