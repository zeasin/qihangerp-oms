package cn.qihangerp.open.kwai.controller;

import cn.qihangerp.open.service.SShopPlatformService;
import cn.qihangerp.open.service.SShopService;
import com.kuaishou.merchant.open.api.KsMerchantApiException;
import com.kuaishou.merchant.open.api.client.oauth.OauthAccessTokenKsClient;
import com.kuaishou.merchant.open.api.response.KsAccessTokenResponse;
import cn.qihangerp.common.enums.EnumShopType;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

/**
 * 描述：
 * 阿里授权Controller
 *
 * @author qlp
 * @date 2019-09-12 14:13
 */
@AllArgsConstructor
@RequestMapping("/kwai")
@RestController
public class KwaiOAuthController {

    private final SShopPlatformService platformService;
    private final SShopService shopService;
    private static  String clientId="ks701717119425407331";
    private static  String clientSecret="0qBrIYOPrqGb8SM9ouVx9w";
    private static Logger log = LoggerFactory.getLogger(KwaiOAuthController.class);


    /**
     * 调取授权页面
     * @return
     * @throws IOException
     * @throws InterruptedException
     */
    @RequestMapping("/callback")
    public String aliOAuth(HttpServletRequest req) throws IOException, InterruptedException {
        String grantCode = req.getParameter("code");
        String shopId = req.getParameter("state");

        OauthAccessTokenKsClient oauthAccessTokenKsClient = new OauthAccessTokenKsClient(clientId, clientSecret);
        try {
            KsAccessTokenResponse response = oauthAccessTokenKsClient.getAccessToken(grantCode);
            Long expireIn=response.getExpiresIn();
            shopService.updateSessionKey(Long.parseLong(shopId),response.getAccessToken());
//                    shopService.updateAccessToken(Integer.parseInt(shopId), response.getAccessToken(), response.getRefreshToken(),expireIn);
        } catch (KsMerchantApiException e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    @RequestMapping("/oauth2")
    public String callback(@RequestParam Integer shopId) throws IOException, InterruptedException {

        var platform = platformService.getById(EnumShopType.KWAI.getIndex());
        String redirect_uri = platform.getRedirectUrl();
        String appId= platform.getAppKey();

        String url = "https://s.kwaixiaodian.com/oauth/authorize?response_type=code&app_id="+appId+"&scope=user_info,merchant_item,merchant_order,merchant_refund&redirect_uri="+redirect_uri+"&state="+shopId;

        return url;
    }
}
