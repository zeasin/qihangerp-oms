package cn.qihangerp.open.pdd.controller;

import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.PddTokenApiHelper;
import cn.qihangerp.open.pdd.domain.bo.TokenCreateBo;
import cn.qihangerp.open.pdd.model.Token;
import cn.qihangerp.open.service.SShopPlatformService;
import cn.qihangerp.open.service.SShopService;
import cn.qihangerp.common.common.AjaxResult;
import cn.qihangerp.common.enums.EnumShopType;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;

@RequestMapping("/pdd")
@AllArgsConstructor
@RestController
public class PddOAuthController {

    private final SShopService shopService;
    private final SShopPlatformService platformService;
    private static Logger log = LoggerFactory.getLogger(PddOAuthController.class);

    @GetMapping("/getOauthUrl")
    public AjaxResult oauth(@RequestParam Integer shopId) {

        var platform = platformService.getById(EnumShopType.PDD.getIndex());
        if (platform == null) return AjaxResult.error("系统错误，没有找到第三方平台的配置信息");
        else if (StringUtils.isEmpty(platform.getAppKey()))
            return AjaxResult.error( "系统错误，第三方平台配置信息不完整，缺少appkey");
        else if (StringUtils.isEmpty(platform.getAppSecret()))
            return AjaxResult.error("系统错误，第三方平台配置信息不完整，缺少appSecret");
        else if (StringUtils.isEmpty(platform.getRedirectUrl()))
            return AjaxResult.error("系统错误，第三方平台配置信息不完整，缺少RedirectUrl");

        String appKey = platform.getAppKey();
        String appSercet = platform.getAppSecret();

        String url = "https://mms.pinduoduo.com/open.html?response_type=code&client_id=" + appKey + "&redirect_uri=" + URLEncoder.encode(platform.getRedirectUrl());
        return AjaxResult.success("SUCCESS",url);
    }

    @PostMapping("/getToken")
    public AjaxResult getToken(@RequestBody TokenCreateBo bo) throws IOException, InterruptedException {
        log.info("/**********获取拼多多授权token*********/");
        var shop = shopService.selectShopById(bo.getShopId());
        var platform = platformService.getById(EnumShopType.PDD.getIndex());
        String appKey = platform.getAppKey();
        String appSercet = platform.getAppSecret();
        ApiResultVo<Token> token = PddTokenApiHelper.getToken(appKey, appSercet, bo.getCode());
        if(token.getCode()==0){
            shopService.updateSessionKey(shop.getId(),token.getData().getAccess_token());
            return AjaxResult.success("SUCCESS");
        }else
            return AjaxResult.error(token.getMsg());
    }

//    /**
//     * 获取授权成功
//     * @param req
//     * @param model
//     * @return
//     */
//    @RequestMapping("/getTokenSuccess")
//    public String getTokeSuccess(HttpServletRequest req, @RequestParam Long mallId, Model model){
//        var shop = shopService.selectShopById(mallId);
//        model.addAttribute("shop",shop);
//        model.addAttribute("shopId",shop.getId());
//        return "get_token_success";
//    }



}
