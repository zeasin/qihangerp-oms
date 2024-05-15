package com.qihang.sys.api.mapper;

import com.qihang.sys.api.domain.SysMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_menu(菜单权限表)】的数据库操作Mapper
* @createDate 2024-05-15 10:14:01
* @Entity com.qihang.sys.api.domain.SysMenu
*/
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    List<SysMenu> selectMenuTreeAll();
    List<SysMenu> selectMenuTreeByUserId(Long userId);

    List<String> selectMenuPermsByUserId(Long userId);
}




