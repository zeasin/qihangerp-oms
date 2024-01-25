package com.qihang.oms.api.controller;

import com.qihang.oms.api.common.AjaxResult;
import com.qihang.oms.api.domain.vo.MenusDetailVo;
import com.qihang.oms.api.domain.vo.MenusVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/menus")
@RestController
public class MenusController {

    @GetMapping(value = "/routes")
    public AjaxResult list() {
        List<MenusVo> vo = new ArrayList<>();
        MenusVo m1 = new MenusVo();
        m1.setPath("/system");
        m1.setComponent("Layout");
        m1.setRedirect("/system/user");
        m1.setName("/system");
        MenusDetailVo meta1 = new MenusDetailVo();
        meta1.setTitle("系统管理");
        meta1.setIcon("system");
        meta1.setHidden(false);
        meta1.setRoles(new String[]{"ADMIN", "ADMIN6"});
        m1.setMeta(meta1);

        List<MenusVo> m1Ch = new ArrayList<>();
        MenusVo m1ch1 = new MenusVo();
        m1ch1.setPath("/user");
        m1ch1.setComponent("system/user/index");
        m1ch1.setName("User");
        MenusDetailVo meta11 = new MenusDetailVo();
        meta11.setTitle("用户管理");
        meta11.setIcon("user");
        meta11.setHidden(false);
        meta11.setRoles(new String[]{"ADMIN", "GUEST"});
        meta11.setKeepAlive(true);
        m1ch1.setMeta(meta11);
        m1Ch.add(m1ch1);
        m1.setChildren(m1Ch);
        vo.add(m1);
        return AjaxResult.success(vo);
    }
}
