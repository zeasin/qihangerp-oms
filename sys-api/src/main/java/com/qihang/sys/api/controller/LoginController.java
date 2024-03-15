package com.qihang.sys.api.controller;

import com.qihang.common.common.AjaxResult;
import com.qihang.sys.api.domain.LoginBody;
import com.qihang.security.service.ISysUserService;
import com.qihang.security.service.SysLoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class LoginController {
    @Autowired
    private SysLoginService loginService;
    @Autowired
    private ISysUserService userService;
//    @PostMapping(value = "/login")
//    public AjaxResult login(@RequestBody LoginBody loginBody){
////        AjaxResult ajax =
////        SysUser user = userService.selectUserByUserName(loginBody.getUsername());
//        // 生成令牌
//        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
//                loginBody.getUuid());
////        ajax.put(Constants.TOKEN, token);
//        Map<String, String> map = new HashMap<>();
//        map.put("accessToken", token);
//        map.put("tokenType","Bearer");
//        return AjaxResult.success(map);
//    }

    //logout

}
