package cn.qihangerp.open.service;//package com.qihang.tao.service;
//
//
//
//import com.qihang.tao.domain.SysUser;
//
//import java.util.List;
//
///**
// * 用户 业务层
// *
// * @author qihang
// */
//public interface ISysUserService
//{
//    /**
//     * 根据条件分页查询用户列表
//     *
//     * @param user 用户信息
//     * @return 用户信息集合信息
//     */
//    public List<SysUser> selectUserList(SysUser user);
//
//    /**
//     * 根据条件分页查询已分配用户角色列表
//     *
//     * @param user 用户信息
//     * @return 用户信息集合信息
//     */
//    public List<SysUser> selectAllocatedList(SysUser user);
//
//    /**
//     * 根据条件分页查询未分配用户角色列表
//     *
//     * @param user 用户信息
//     * @return 用户信息集合信息
//     */
//    public List<SysUser> selectUnallocatedList(SysUser user);
//
//    /**
//     * 通过用户名查询用户
//     *
//     * @param userName 用户名
//     * @return 用户对象信息
//     */
//    public SysUser selectUserByUserName(String userName);
//
//    /**
//     * 通过用户ID查询用户
//     *
//     * @param userId 用户ID
//     * @return 用户对象信息
//     */
//    public SysUser selectUserById(Long userId);
//
//
//
//
//}
