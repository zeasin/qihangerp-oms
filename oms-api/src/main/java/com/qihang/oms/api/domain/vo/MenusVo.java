package com.qihang.oms.api.domain.vo;

import java.util.List;

public class MenusVo {
    private String path;
    private String component;
    private String redirect;
    private String name;
    private MenusDetailVo meta;
    private List<MenusVo> children;

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getRedirect() {
        return redirect;
    }

    public void setRedirect(String redirect) {
        this.redirect = redirect;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MenusDetailVo getMeta() {
        return meta;
    }

    public void setMeta(MenusDetailVo meta) {
        this.meta = meta;
    }

    public List<MenusVo> getChildren() {
        return children;
    }

    public void setChildren(List<MenusVo> children) {
        this.children = children;
    }
}
