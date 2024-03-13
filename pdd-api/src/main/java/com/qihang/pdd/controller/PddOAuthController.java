package com.qihang.pdd.controller;


import com.pdd.pop.sdk.http.PopAccessTokenClient;
import com.pdd.pop.sdk.http.token.AccessTokenResponse;
import com.qihang.erp.api.service.IShopService;
import com.zhijian.core.config.ServerConfig;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RequestMapping("/pdd_api2")
@Controller
public class PddOAuthController {
    @Autowired
    private IShopService shopService;
    @Autowired
    private ServerConfig serverConfig;
    private static Logger log = LoggerFactory.getLogger(PddOAuthController.class);

    @RequestMapping("/oauth")
    public String oauth(HttpServletRequest req) {
        String returnUrl = serverConfig.getUrl() + "/pdd_api/getToken&state="+req.getParameter("shopId");
        var shop = shopService.selectShopById(Long.parseLong(req.getParameter("shopId")));

        String appKey = shop.getAppkey();
        String appSercet = shop.getAppSercet();

        String url = "https://mms.pinduoduo.com/open.html?response_type=code&client_id=" + appKey + "&redirect_uri=" + returnUrl;
        return "redirect:" + url;
    }

    @RequestMapping("/getToken")
    public String getToken(HttpServletRequest req) throws IOException, InterruptedException {
        log.info("/**********获取拼多多授权token*********/");
        String code = req.getParameter("code");

        Long shopId =Long.parseLong(req.getParameter("state"));
        var shop = shopService.selectShopById(shopId);
        String appKey = shop.getAppkey();
        String appSercet = shop.getAppSercet();
        PopAccessTokenClient accessTokenClient = new PopAccessTokenClient(appKey, appSercet);

        // 生成AccessToken
        try {
            AccessTokenResponse response = accessTokenClient.generate(code);
            if(response.getErrorResponse()!=null){
                log.info("/***************获取拼多多授权token错误："+response.getErrorResponse().getErrorMsg()+"**************/");
            }else{
                //保存accessToken
                System.out.println(shopId +"--token:" + response.getAccessToken()+",thirdId:"+response.getOwnerId()+",shopId:"+shopId);

                shopService.updateSessionKey(shopId,Long.parseLong(response.getOwnerId()),response.getAccessToken());

//                thirdSettingService.updateEntity(shopId, response.getAccessToken(), response.getRefreshToken(), response.getExpiresIn(),response.getOwnerId());
                return "redirect:/pdd/getTokenSuccess?mallId="+response.getOwnerId();
/*                String state = req.getParameter("state");
                if (state.equalsIgnoreCase("GETORDERLIST")) {
                    //获取订单list
                    return "redirect:/shop/shop_list";
                } else if (state.equalsIgnoreCase("DCGOODSLIST")) {
                    //商品list
                    return "redirect:/goods/pdd_list";
                }*/
            }
        } catch (Exception e) {

            e.printStackTrace();

        }
        return "redirect:/";
    }

    /**
     * 获取授权成功
     * @param req
     * @param model
     * @return
     */
    @RequestMapping("/getTokenSuccess")
    public String getTokeSuccess(HttpServletRequest req, @RequestParam Long mallId, Model model){
        var shop = shopService.selectShopById(mallId);
        model.addAttribute("shop",shop);
        model.addAttribute("shopId",shop.getId());
        return "get_token_success";
    }



}
