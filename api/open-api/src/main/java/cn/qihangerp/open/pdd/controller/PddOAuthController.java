package cn.qihangerp.open.pdd.controller;



import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.enums.EnumShopType;
import cn.qihangerp.domain.OShopPlatform;
import cn.qihangerp.module.service.OShopPlatformService;
import cn.qihangerp.module.service.OShopService;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.pdd.PddTokenApiHelper;
import cn.qihangerp.open.pdd.TokenCreateBo;
import cn.qihangerp.open.pdd.model.Token;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URLEncoder;

@AllArgsConstructor
@RequestMapping("/pdd")
@RestController
public class PddOAuthController {
    private final OShopService shopService;
    private final OShopPlatformService platformService;
//    @Autowired
//    private IShopService shopService;
//    @Autowired
//    private ServerConfig serverConfig;
    private static Logger log = LoggerFactory.getLogger(PddOAuthController.class);

    @GetMapping("/getOauthUrl")
    public AjaxResult oauth(@RequestParam Integer shopId) {
//        String returnUrl = serverConfig.getUrl() + "/pdd_api/getToken&state="+req.getParameter("shopId");
//        var shop = shopService.selectShopById(reqData.getShopId());
        OShopPlatform platform = platformService.selectById(EnumShopType.PDD.getIndex());
        String appKey = platform.getAppKey();
        String appSercet = platform.getAppSecret();

        String url = "https://mms.pinduoduo.com/open.html?response_type=code&client_id=" + appKey + "&redirect_uri=" + URLEncoder.encode(platform.getRedirectUri());
        return AjaxResult.success("SUCCESS",url);
    }

    @PostMapping("/getToken")
    public AjaxResult getToken(@RequestBody TokenCreateBo bo) throws IOException, InterruptedException {
        log.info("/**********获取拼多多授权token*********/");
        var shop = shopService.selectShopById(bo.getShopId());
        OShopPlatform platform = platformService.selectById(EnumShopType.PDD.getIndex());
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
