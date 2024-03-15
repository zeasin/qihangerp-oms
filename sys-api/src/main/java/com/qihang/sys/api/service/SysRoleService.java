package com.qihang.sys.api.service;

import com.qihang.sys.api.domain.SysRole;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.sys.api.mapper.SysRoleMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.Set;

/**
* @author TW
* @description 针对表【sys_role(角色信息表)】的数据库操作Service
* @createDate 2024-03-15 16:55:10
*/
public interface SysRoleService extends IService<SysRole> {
    Set<String> selectRolePermissionByUserId(Long userId);
}
