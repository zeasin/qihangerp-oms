//package cn.qihangerp.sys.service;
//
//import com.qihang.security.vo.RouterVo;
//import cn.qihangerp.sys.domain.SysMenu;
//import com.baomidou.mybatisplus.extension.service.IService;
//
//import java.util.List;
//import java.util.Set;
//
///**
//* @author TW
//* @description 针对表【sys_menu(菜单权限表)】的数据库操作Service
//* @createDate 2024-05-15 10:14:01
//*/
//public interface SysMenuService extends IService<SysMenu> {
//    Set<String> selectMenuPermsByUserId(Long userId);
//    List<SysMenu> selectMenuTreeByUserId(Long userId);
//    List<RouterVo> buildMenus(List<SysMenu> menus);
//
//    boolean checkMenuNameUnique(SysMenu menu);
//    /**
//     * 是否存在菜单子节点
//     *
//     * @param menuId 菜单ID
//     * @return 结果 true 存在 false 不存在
//     */
//    public boolean hasChildByMenuId(Long menuId);
//
//    /**
//     * 查询菜单是否存在角色
//     *
//     * @param menuId 菜单ID
//     * @return 结果 true 存在 false 不存在
//     */
//    public boolean checkMenuExistRole(Long menuId);
//}
