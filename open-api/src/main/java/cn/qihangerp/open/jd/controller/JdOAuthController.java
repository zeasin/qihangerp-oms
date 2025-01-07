package cn.qihangerp.open.jd.controller;

import cn.qihangerp.open.domain.SShopPlatform;
import cn.qihangerp.open.jd.domain.bo.JdTokenCreateBo;
import cn.qihangerp.open.service.SShopPlatformService;
import com.alibaba.fastjson2.JSONObject;
import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.EnumShopType;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@RequestMapping("/jd")
@AllArgsConstructor
@RestController
public class JdOAuthController {
    private final SShopPlatformService platformService;
    private static Logger log = LoggerFactory.getLogger(JdOAuthController.class);

    @GetMapping("/getOauthUrl")
    public AjaxResult OAuth(@RequestParam Integer shopId) throws IOException, InterruptedException {
        //查询配置信息
        SShopPlatform platform = platformService.getById(EnumShopType.JD.getIndex());
        if (!StringUtils.hasText(platform.getAppKey())) {
            return AjaxResult.error( "平台配置错误，没有找到AppKey");
        }
        if (!StringUtils.hasText(platform.getAppSecret())) {
            return AjaxResult.error( "第三方平台配置错误，没有找到AppSercet");
        }
        if (!StringUtils.hasText(platform.getRedirectUrl())) {
            return AjaxResult.error( "第三方平台配置错误，没有找到RedirectUrl");
        }
        String url = "https://open-oauth.jd.com/oauth2/to_login?app_key="+platform.getAppKey()+"&response_type=code&redirect_uri="
                + URLEncoder.encode(platform.getRedirectUrl())+"&state="+shopId+"&scope=snsapi_base";
       return AjaxResult.success("SUCCESS",url);
    }

    @PostMapping("/tokenCreate")
    public AjaxResult callback(@RequestBody JdTokenCreateBo bo) throws IOException, InterruptedException {
        log.info("京东授权返回code");
        if (!StringUtils.hasText(bo.getCode())) return AjaxResult.error("code不能为空");
        SShopPlatform platform = platformService.getById(EnumShopType.JD.getIndex());

        String url = "https://open-oauth.jd.com/oauth2/access_token?app_key=" + platform.getAppKey() + "&app_secret=" + platform.getAppSecret() + "&grant_type=authorization_code&code=" + bo.getCode();

        HttpClient client = HttpClient.newBuilder().build();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url)).header("Content-Type", "application/json").GET()
                .build();
        HttpResponse<String> result = client.send(request, HttpResponse.BodyHandlers.ofString());

        if(StringUtils.hasText("result.body()")){
            // 结果处理
            JSONObject jsonObject = JSONObject.parseObject(result.body());
            if(jsonObject.getInteger("code")>0){
                return AjaxResult.error(jsonObject.getString("msg"));
            }
//            platformService.updateShopSessionByShopId(bo.getShopId().longValue(),"aa");
        }
        /***
         *
         * {"access_token":"c9f997d0e44d4f118033c6e8e329f9e0zdbl","expires_in":31535999,"refresh_token":"c293b96a03a94013a471e50ebc3d2f9czi5m","scope":"snsapi_base","open_id":"PjmgY-ntsszAW81q9NRErnrUTVHhD-HC64HuspupG8Q","uid":"8474668550","time":1709518959147,"token_type":"bearer","code":0,"xid":"o*AASTnxHZ0sdNj9M3XhiMqYf0NTViY_IfFlQem3U6w1lv-neCalw"}
         *
         *
         * {
         * 	"access_token": "c9f997d0e44d4f118033c6e8e329f9e0zdbl",
         * 	"expires_in": 31535999,
         * 	"refresh_token": "c293b96a03a94013a471e50ebc3d2f9czi5m",
         * 	"scope": "snsapi_base",
         * 	"open_id": "PjmgY-ntsszAW81q9NRErnrUTVHhD-HC64HuspupG8Q",
         * 	"uid": "8474668550",
         * 	"time": 1709518959147,
         * 	"token_type": "bearer",
         * 	"code": 0,
         * 	"xid": "o*AASTnxHZ0sdNj9M3XhiMqYf0NTViY_IfFlQem3U6w1lv-neCalw"
         * }
         *
         *
         */


//        String sessionKey = request.getParameter("top_session");
//        String state = request.getParameter("state");
//        try {
//            Integer shopId = Integer.parseInt(state);
////            shopService.updateSessionKey(shopId, sessionKey);
//            return "redirect:/order/list?shopId=" + shopId;
//        } catch (Exception e) {
//            return "redirect:/?msg=callback_taobao_error";
//        }

        return AjaxResult.success("SUCCESS");
    }
}
