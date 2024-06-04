package com.qihang.tao.controller;


import com.qihang.common.common.AjaxResult;
import com.qihang.common.enums.EnumShopType;
import com.qihang.tao.domain.bo.TaoTokenCreateBo;
import com.qihang.tao.service.SShopPlatformService;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * 淘宝回调地址
 */
@AllArgsConstructor
@RestController
public class OAuthController {

    private final SShopPlatformService platformService;
    private static Logger log = LoggerFactory.getLogger(OAuthController.class);
    /**
     * 淘宝授权url
     *
     * @param
     * @param shopId
     * @return
     * @throws IOException
     * @throws InterruptedException
     */
    @GetMapping("/getOauthUrl")
    public AjaxResult aliOAuth(@RequestParam Long shopId) throws IOException, InterruptedException {
        //查询店铺信息
//        var shop = taoOrderService.selectShopById(shopId);
        var thirdConfig = platformService.getById(EnumShopType.TAO.getIndex());
        if (!StringUtils.hasText(thirdConfig.getAppKey())) {
            return AjaxResult.error( "平台配置错误，没有找到AppKey");
        }
        if (!StringUtils.hasText(thirdConfig.getAppSecret())) {
            return AjaxResult.error( "第三方平台配置错误，没有找到AppSercet");
        }
//        if (!StringUtils.hasText(thirdConfig.getRedirectUrl())) {
//            return AjaxResult.error( "第三方平台配置错误，没有找到RedirectUrl");
//        }

        String url = "http://container.open.taobao.com/container?appkey=" + thirdConfig.getAppKey() + "&state=" + shopId;
        //https://oauth.taobao.com/authorize?response_type=token&force_auth=true&from_site=fuwu&client_id=28181872

        return AjaxResult.success("SUCCESS",url);
    }

    /**
     * 淘宝授权回调
     * @param
     * @param
     * @return
     */
    @PostMapping("/tokenCreate")
    public AjaxResult callback(@RequestBody TaoTokenCreateBo bo) {
        log.info("tao授权返回code");
        if (!StringUtils.hasText(bo.getCode())) return AjaxResult.error("code不能为空");
//        log.info("淘系店铺授权回调开始");
//        String sessionKey = request.getParameter("top_session");
//        String state = request.getParameter("state");
//        try {
//            Long shopId = Long.parseLong(state);
//            taoOrderService.updateShopSessionByShopId(shopId, sessionKey);
//            return "redirect:/order/list?shopId=" + shopId;
//        } catch (Exception e) {
//            return "redirect:/?msg=callback_taobao_error";
//        }
        return AjaxResult.success("SUCCESS");
    }


}
