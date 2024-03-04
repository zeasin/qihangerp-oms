package com.qihang.jd.controller;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@AllArgsConstructor
@Controller
public class OAuthController {
    //    private final SysPlatformService platformService;
//    private final SysShopService shopService;
    private static Logger log = LoggerFactory.getLogger(OAuthController.class);

    @GetMapping("/jd-api/oauth")
    public String aliOAuth(@RequestParam Integer shopId) throws IOException, InterruptedException {
        //查询店铺信息
//        var shop = shopService.selectShopById(shopId);
//        SysPlatform platform = platformService.selectById(shop.getType());
//        String url = "http://container.open.taobao.com/container?appkey=" + platform.getAppKey() + "&state=" + shopId;
        String url = "https://open-oauth.jd.com/oauth2/to_login?app_key=FB4CC3688E6F9065D4FF510A53BB60FF&response_type=code&redirect_uri=http%3A%2F%2Fwww.qumei.com&state=2&scope=snsapi_base";
        return "redirect:" + url;
    }

    @RequestMapping("/jd-api/code_callback")
    public String callback(Model model, HttpServletRequest request) {
        log.info("京东授权返回code");
        String code = request.getParameter("code");//6RZ71G

        //https://open-oauth.jd.com/oauth2/access_token?app_key=FB4CC3688E6F9065D4FF510A53BB60FF&app_secret=40e8c8b2427f4e6db8f4a39af27d719e&grant_type=authorization_code&code=6RZ71G

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





        String sessionKey = request.getParameter("top_session");
        String state = request.getParameter("state");
        try {
            Integer shopId = Integer.parseInt(state);
//            shopService.updateSessionKey(shopId, sessionKey);
            return "redirect:/order/list?shopId=" + shopId;
        } catch (Exception e) {
            return "redirect:/?msg=callback_taobao_error";
        }
    }
}
