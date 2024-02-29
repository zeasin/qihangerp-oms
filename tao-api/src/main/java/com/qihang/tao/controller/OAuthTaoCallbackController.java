package com.qihang.tao.controller;

import com.qihang.tao.domain.SysPlatform;
import com.qihang.tao.service.SysPlatformService;
import com.qihang.tao.service.SysShopService;
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

/**
 * 淘宝回调地址
 */
@AllArgsConstructor
@Controller
public class OAuthTaoCallbackController {

    private final SysPlatformService platformService;
    private final SysShopService shopService;
    private static Logger log = LoggerFactory.getLogger(OAuthTaoCallbackController.class);
    /**
     * 淘宝授权url
     *
     * @param shopId
     * @return
     * @throws IOException
     * @throws InterruptedException
     */
    @GetMapping("/taoapi2/tao_oauth")
    public String aliOAuth(@RequestParam Integer shopId) throws IOException, InterruptedException {
        //查询店铺信息
        var shop = shopService.selectShopById(shopId);
        SysPlatform platform = platformService.selectById(shop.getType());


//        var entity = thirdSettingService.getEntity(shop.getType());
        String url = "http://container.open.taobao.com/container?appkey=" + platform.getAppKey() + "&state=" + shopId;
        //https://oauth.taobao.com/authorize?response_type=token&force_auth=true&from_site=fuwu&client_id=28181872
        return "redirect:" + url;
    }

    /**
     * 淘宝授权回调
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/taoapi2/callback")
    public String callback(Model model, HttpServletRequest request) {
        log.info("淘系店铺授权回调开始");
        String sessionKey = request.getParameter("top_session");
        String state = request.getParameter("state");
        try {
            Integer shopId = Integer.parseInt(state);
            shopService.updateSessionKey(shopId, sessionKey);
            return "redirect:/order/list?shopId=" + shopId;
        } catch (Exception e) {
            return "redirect:/?msg=callback_taobao_error";
        }
    }


}
