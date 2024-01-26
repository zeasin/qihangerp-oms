package com.qihang.oms.api.controller;

import com.alibaba.fastjson2.JSONArray;
import com.qihang.oms.api.common.AjaxResult;
import com.qihang.oms.api.domain.LoginUser;
import com.qihang.oms.api.domain.vo.MenusDetailVo;
import com.qihang.oms.api.domain.vo.MenusVo;
import com.qihang.oms.api.service.TokenService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RequestMapping("/menus")
@RestController
public class MenusController {
    private final TokenService tokenService;

    public MenusController(TokenService tokenService) {
        this.tokenService = tokenService;
    }

    @GetMapping(value = "/routes")
    public AjaxResult list(HttpServletRequest request) {
        LoginUser loginUser = tokenService.getLoginUser(request);
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
//        meta11.setKeepAlive(true);
        m1ch1.setMeta(meta11);
        m1Ch.add(m1ch1);


        m1.setChildren(m1Ch);
        vo.add(m1);
        JSONArray jsonArray = JSONArray.parseArray("[{\n" +
                "    \"path\": \"/system\",\n" +
                "    \"component\": \"Layout\",\n" +
                "    \"redirect\": \"/system/user\",\n" +
                "    \"name\": \"/system\",\n" +
                "    \"meta\": {\n" +
                "        \"title\": \"系统管理\",\n" +
                "        \"icon\": \"system\",\n" +
                "        \"hidden\": false,\n" +
                "        \"roles\": [\n" +
                "            \"GUEST\",\n" +
                "            \"ADMIN\",\n" +
                "            \"ADMIN6\"\n" +
                "        ]\n" +
                "    },\n" +
                "    \"children\": [\n" +
                "        {\n" +
                "            \"path\": \"user\",\n" +
                "            \"component\": \"system/user/index\",\n" +
                "            \"name\": \"User\",\n" +
                "            \"meta\": {\n" +
                "                \"title\": \"用户管理\",\n" +
                "                \"icon\": \"user\",\n" +
                "                \"hidden\": false,\n" +
                "                \"roles\": [\n" +
                "                    \"ADMIN\",\n" +
                "                    \"GUEST\"\n" +
                "                ],\n" +
                "                \"keepAlive\": true\n" +
                "            }\n" +
                "        },\n" +
                "        {\n" +
                "            \"path\": \"role\",\n" +
                "            \"component\": \"system/role/index\",\n" +
                "            \"name\": \"Role\",\n" +
                "            \"meta\": {\n" +
                "                \"title\": \"角色管理\",\n" +
                "                \"icon\": \"role\",\n" +
                "                \"hidden\": false,\n" +
                "                \"roles\": [\n" +
                "                    \"ADMIN\",\n" +
                "                    \"ADMIN6\",\n" +
                "                    \"GUEST\"\n" +
                "                ],\n" +
                "                \"keepAlive\": true\n" +
                "            }\n" +
                "        },\n" +
                "        {\n" +
                "            \"path\": \"menu\",\n" +
                "            \"component\": \"system/menu/index\",\n" +
                "            \"name\": \"Menu\",\n" +
                "            \"meta\": {\n" +
                "                \"title\": \"菜单管理\",\n" +
                "                \"icon\": \"menu\",\n" +
                "                \"hidden\": false,\n" +
                "                \"roles\": [\n" +
                "                    \"ADMIN\"\n" +
                "                ],\n" +
                "                \"keepAlive\": true\n" +
                "            }\n" +
                "        },\n" +
                "        {\n" +
                "            \"path\": \"dept\",\n" +
                "            \"component\": \"system/dept/index\",\n" +
                "            \"name\": \"Dept\",\n" +
                "            \"meta\": {\n" +
                "                \"title\": \"部门管理\",\n" +
                "                \"icon\": \"tree\",\n" +
                "                \"hidden\": false,\n" +
                "                \"roles\": [\n" +
                "                    \"ADMIN\"\n" +
                "                ],\n" +
                "                \"keepAlive\": true\n" +
                "            }\n" +
                "        },\n" +
                "        {\n" +
                "            \"path\": \"dict\",\n" +
                "            \"component\": \"system/dict/index\",\n" +
                "            \"name\": \"Dict\",\n" +
                "            \"meta\": {\n" +
                "                \"title\": \"字典管理\",\n" +
                "                \"icon\": \"dict\",\n" +
                "                \"hidden\": false,\n" +
                "                \"roles\": [\n" +
                "                    \"ADMIN\"\n" +
                "                ],\n" +
                "                \"keepAlive\": true\n" +
                "            }\n" +
                "        }\n" +
                "    ]\n" +
                "}]");
        return AjaxResult.success(jsonArray);
    }
}
