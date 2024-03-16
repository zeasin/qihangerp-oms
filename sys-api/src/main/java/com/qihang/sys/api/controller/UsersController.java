//package com.qihang.sys.api.controller;
//
//import com.qihang.common.common.AjaxResult;
//import com.qihang.sys.api.domain.vo.UserInfoVo;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@RequestMapping("/users")
//@RestController
//public class UsersController {
//
//    @GetMapping(value = "/me")
//    public AjaxResult me() {
//        UserInfoVo vo = new UserInfoVo();
//        vo.setUserId(2);
//        vo.setUsername("admin");
//        vo.setNickname("系统管理员");
//        vo.setAvatar("https://oss.youlai.tech/youlai-boot/2023/05/16/811270ef31f548af9cffc026dfc3777b.gif");
//        vo.setRoles(new String[]{"ADMIN"});
//        List<String> perms = new ArrayList<>();
//        perms.add("sys:menu:delete");
//        perms.add("sys:dept:edit");
//        perms.add("sys:dict_type:add");
//        perms.add("sys:dict:edit");
//        perms.add("sys:dict:delete");
//        perms.add("sys:dict_type:edit");
//        perms.add("sys:menu:add");
//        perms.add("sys:user:add");
//        perms.add("sys:role:edit");
//        perms.add("sys:dept:delete");
//        perms.add("sys:user:password_reset");
//        perms.add("sys:user:edit");
//        perms.add("sys:user:delete");
//        perms.add("sys:dept:add");
//        perms.add("sys:role:delete");
//        perms.add("sys:dict_type:delete");
//        perms.add("sys:menu:edit");
//        perms.add("sys:dict:add");
//        perms.add("sys:role:add");
//        vo.setPerms(perms);
//        return AjaxResult.success(vo);
//    }
//}
