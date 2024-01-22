package com.qihang.core.security;

import com.qihang.core.domain.entity.SysUser;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * TODO
 *
 * @Description
 * @Author
 * @Date
 **/
public class SecurityUser implements UserDetails {
    private SysUser userEntity;

    public SecurityUser(SysUser userEntity) {
        this.userEntity = userEntity;
    }

    public SysUser getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(SysUser userEntity) {
        this.userEntity = userEntity;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getPassword() {
        return userEntity.getPassword();
    }

    @Override
    public String getUsername() {
        return userEntity.getUserName();
    }

    @Override
    public boolean isAccountNonExpired() {
        // false 用户帐号已过期
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        // false 用户帐号已被锁定
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        // false 用户凭证已过期
        return true;
    }

    @Override
    public boolean isEnabled() {
        // false 用户已失效
        return true;
    }

}
