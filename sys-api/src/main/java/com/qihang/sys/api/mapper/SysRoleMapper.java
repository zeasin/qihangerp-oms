package com.qihang.sys.api.mapper;

import com.qihang.sys.api.domain.SysRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_role(角色信息表)】的数据库操作Mapper
* @createDate 2024-03-15 16:55:10
* @Entity com.qihang.sys.api.domain.SysRole
*/
public interface SysRoleMapper extends BaseMapper<SysRole> {
    List<SysRole> selectRolePermissionByUserId(Long userId);
}




