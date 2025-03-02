package cn.qihangerp.module.domain.vo;

import java.util.List;

public class MenusDetailVo {
    private String title;
    private String icon;
    private Boolean hidden;
    private String[] roles;
//    private Boolean keepAlive;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Boolean getHidden() {
        return hidden;
    }

    public void setHidden(Boolean hidden) {
        this.hidden = hidden;
    }

    public String[] getRoles() {
        return roles;
    }

    public void setRoles(String[] roles) {
        this.roles = roles;
    }

//    public Boolean getKeepAlive() {
//        return keepAlive;
//    }
//
//    public void setKeepAlive(Boolean keepAlive) {
//        this.keepAlive = keepAlive;
//    }
}
