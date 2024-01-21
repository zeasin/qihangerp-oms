package com.qihang.oms.api.security;

import com.qihang.oms.api.domain.SysUser;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.HashSet;
import java.util.Set;

@Component
public class SecurityUserDetailsService implements UserDetailsService {
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        SysUser user = new SysUser();
        user.setUserName("admin");
        Set<String> p = new HashSet<>();
        p.add("all");
        UserDetails u = new LoginUser(1L,1L,user,p);
        return u;
    }
}
