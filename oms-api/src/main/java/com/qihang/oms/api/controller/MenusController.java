package com.qihang.oms.api.controller;

import com.alibaba.fastjson2.JSONArray;
import com.qihang.oms.api.common.AjaxResult;
import com.qihang.oms.api.domain.LoginUser;
import com.qihang.oms.api.domain.SysMenu;
import com.qihang.oms.api.domain.vo.MenusDetailVo;
import com.qihang.oms.api.domain.vo.MenusVo;
import com.qihang.oms.api.service.ISysMenuService;
import com.qihang.oms.api.service.TokenService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RequestMapping("/menus")
@RestController
public class MenusController {
    private final TokenService tokenService;
    private final ISysMenuService sysMenuService;

    public MenusController(TokenService tokenService, ISysMenuService sysMenuService) {
        this.tokenService = tokenService;
        this.sysMenuService = sysMenuService;
    }

    @GetMapping(value = "/routes")
    public AjaxResult list(HttpServletRequest request) {
        LoginUser loginUser = tokenService.getLoginUser(request);

        List<SysMenu> sysMenuList = sysMenuService.selectMenuList(loginUser.getUserId());


//        Map<Long, List<MenusVo>> treeList = menusVos.stream().collect(Collectors.groupingBy(MenusVo::getParentId));
//        menusVos.forEach(menu -> menu.setChildren(treeList.getOrDefault(menu.getId(), null)));
//        List<MenusVo> result = menusVos.stream().filter(m -> m.getParentId() == 0).collect(Collectors.toList());
        Map<Long, List<SysMenu>> sysMenuMap = sysMenuList.stream().collect(Collectors.groupingBy(SysMenu::getParentId));
//        menuList.forEach(menu -> menu.setChildren(treeList.getOrDefault(menu.getMenuId(), new ArrayList<>())));
//        List<SysMenu> result = menuList.stream().filter(node -> node.getParentId() == 0).collect(Collectors.toList());

//        MenusDetailVo meta1 = new MenusDetailVo();
//        meta1.setTitle("系统管理");
//        meta1.setIcon("system");
//        meta1.setHidden(false);
//        meta1.setRoles(new String[]{"GUEST","ADMIN", "ADMIN6"});
//
//        menuList.forEach(menu -> {
//            menu.setChildren(treeList.getOrDefault(menu.getMenuId(), new ArrayList<>()));
//            menu.setComponent("/system/user");
//            MenusDetailVo m = new MenusDetailVo();
//            m.setTitle(menu.getMenuName());
//            m.setIcon(menu.getIcon());
//            m.setHidden(false);
//            m.setRoles(new String[]{"GUEST","ADMIN", "ADMIN6"});
//            menu.setMeta(m);
//            menu.setName(menu.getPath());
////            menu.setRedirect("/system/user");
//        });

//        List<SysMenu> result = menuList.stream().filter(node -> node.getParentId() == 0).collect(Collectors.toList());


        List<MenusVo> vo = new ArrayList<>();
        for (var entry : sysMenuMap.entrySet()) {
            Optional<SysMenu> first = sysMenuList.stream().filter(x -> Objects.equals(x.getMenuId(), entry.getKey())).findFirst();
//            SysMenu sysMenuStream = first.orElse(null);
            if(first.isPresent()) {
                MenusVo topMenu = new MenusVo();
                topMenu.setPath(first.get().getPath());
                topMenu.setComponent(first.get().getComponent());
//                topMenu.setRedirect("/system/user");
                topMenu.setName(first.get().getPath());
                MenusDetailVo meta = new MenusDetailVo();
                meta.setTitle(first.get().getMenuName());
                meta.setIcon(first.get().getIcon());
                meta.setHidden(false);
                meta.setRoles(new String[]{"ADMIN", "ADMIN6"});
                topMenu.setMeta(meta);
                var child = sysMenuMap.getOrDefault(entry.getKey(), null);
                if(child!=null){
                    List<MenusVo> children = new ArrayList<>();
                    for(var m : child) {
                        MenusVo m1ch1 = new MenusVo();
                        m1ch1.setPath(m.getPath());
                        m1ch1.setComponent(m.getComponent());
//                        m1ch1.setName(m.getPath().replace("/",""));
                        MenusDetailVo meta11 = new MenusDetailVo();
                        meta11.setTitle(m.getMenuName());
                        meta11.setIcon(m.getIcon());
                        meta11.setHidden(false);
                        meta11.setRoles(new String[]{"ADMIN", "GUEST"});
                        m1ch1.setMeta(meta11);
                        children.add(m1ch1);
                    }
                    topMenu.setChildren(children);
                }
                vo.add(topMenu);
//                MenusVo m1 = new MenusVo();
//                m1.setPath("/"+first.get().getPath());
//                m1.setComponent(first.get().getComponent());
//                m1.setRedirect("/system/user");
//                m1.setName("/system");
//                MenusDetailVo meta1 = new MenusDetailVo();
//                meta1.setTitle(first.get().getMenuName());
//                meta1.setIcon(first.get().getIcon());
//                meta1.setHidden(false);
//                meta1.setRoles(new String[]{"ADMIN", "ADMIN6"});
//                m1.setMeta(meta1);
//                vo.add(m1);
            }
            System.out.println(entry.getKey() + " : " + entry.getValue());
        }

//        vo = new ArrayList<>();
//        MenusVo m1 = new MenusVo();
//        m1.setPath("/system");
//        m1.setComponent("Layout");
//        m1.setRedirect("/system/user");
//        m1.setName("/system");
//        MenusDetailVo meta1 = new MenusDetailVo();
//        meta1.setTitle("系统管理");
//        meta1.setIcon("system");
//        meta1.setHidden(false);
//        meta1.setRoles(new String[]{"ADMIN", "ADMIN6"});
//        m1.setMeta(meta1);
//
//        List<MenusVo> m1Ch = new ArrayList<>();
//        MenusVo m1ch1 = new MenusVo();
//        m1ch1.setPath("/user");
//        m1ch1.setComponent("system/user/index");
//        m1ch1.setName("User");
//        MenusDetailVo meta11 = new MenusDetailVo();
//        meta11.setTitle("用户管理");
//        meta11.setIcon("user");
//        meta11.setHidden(false);
//        meta11.setRoles(new String[]{"ADMIN", "GUEST"});
////        meta11.setKeepAlive(true);
//        m1ch1.setMeta(meta11);
//        m1Ch.add(m1ch1);
//        m1Ch.add(m1ch1);
//
//
//        m1.setChildren(m1Ch);
//        vo.add(m1);



        return AjaxResult.success(JSONArray.from(vo));
//        return AjaxResult.success(JSONArray.from(result));
//        return AjaxResult.success(JSONArray.from(result));
//        JSONArray jsonArray = JSONArray.parseArray("[{\n" +
//                "    \"path\": \"/system\",\n" +
//                "    \"component\": \"Layout\",\n" +
//                "    \"redirect\": \"/system/user\",\n" +
//                "    \"name\": \"/system\",\n" +
//                "    \"meta\": {\n" +
//                "        \"title\": \"系统管理\",\n" +
//                "        \"icon\": \"system\",\n" +
//                "        \"hidden\": false,\n" +
//                "        \"roles\": [\n" +
//                "            \"GUEST\",\n" +
//                "            \"ADMIN\",\n" +
//                "            \"ADMIN6\"\n" +
//                "        ]\n" +
//                "    },\n" +
//                "    \"children\": [\n" +
//                "        {\n" +
//                "            \"path\": \"user\",\n" +
//                "            \"component\": \"system/user/index\",\n" +
//                "            \"name\": \"User\",\n" +
//                "            \"meta\": {\n" +
//                "                \"title\": \"用户管理\",\n" +
//                "                \"icon\": \"user\",\n" +
//                "                \"hidden\": false,\n" +
//                "                \"roles\": [\n" +
//                "                    \"ADMIN\",\n" +
//                "                    \"GUEST\"\n" +
//                "                ],\n" +
//                "                \"keepAlive\": true\n" +
//                "            }\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"path\": \"role\",\n" +
//                "            \"component\": \"system/role/index\",\n" +
//                "            \"name\": \"Role\",\n" +
//                "            \"meta\": {\n" +
//                "                \"title\": \"角色管理\",\n" +
//                "                \"icon\": \"role\",\n" +
//                "                \"hidden\": false,\n" +
//                "                \"roles\": [\n" +
//                "                    \"ADMIN\",\n" +
//                "                    \"ADMIN6\",\n" +
//                "                    \"GUEST\"\n" +
//                "                ],\n" +
//                "                \"keepAlive\": true\n" +
//                "            }\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"path\": \"menu\",\n" +
//                "            \"component\": \"system/menu/index\",\n" +
//                "            \"name\": \"Menu\",\n" +
//                "            \"meta\": {\n" +
//                "                \"title\": \"菜单管理\",\n" +
//                "                \"icon\": \"menu\",\n" +
//                "                \"hidden\": false,\n" +
//                "                \"roles\": [\n" +
//                "                    \"ADMIN\"\n" +
//                "                ],\n" +
//                "                \"keepAlive\": true\n" +
//                "            }\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"path\": \"dept\",\n" +
//                "            \"component\": \"system/dept/index\",\n" +
//                "            \"name\": \"Dept\",\n" +
//                "            \"meta\": {\n" +
//                "                \"title\": \"部门管理\",\n" +
//                "                \"icon\": \"tree\",\n" +
//                "                \"hidden\": false,\n" +
//                "                \"roles\": [\n" +
//                "                    \"ADMIN\"\n" +
//                "                ],\n" +
//                "                \"keepAlive\": true\n" +
//                "            }\n" +
//                "        },\n" +
//                "        {\n" +
//                "            \"path\": \"dict\",\n" +
//                "            \"component\": \"system/dict/index\",\n" +
//                "            \"name\": \"Dict\",\n" +
//                "            \"meta\": {\n" +
//                "                \"title\": \"字典管理\",\n" +
//                "                \"icon\": \"dict\",\n" +
//                "                \"hidden\": false,\n" +
//                "                \"roles\": [\n" +
//                "                    \"ADMIN\"\n" +
//                "                ],\n" +
//                "                \"keepAlive\": true\n" +
//                "            }\n" +
//                "        }\n" +
//                "    ]\n" +
//                "}]");

//        return AjaxResult.success(jsonArray);
    }
}
