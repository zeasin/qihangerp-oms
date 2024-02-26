//package com.qihang.oms.api.domain;
//
//
//import java.util.Date;
//
///**
// * 用户对象 sys_user
// *
// * @author qihang
// */
//public class SysUser extends BaseEntity
//{
//    private static final long serialVersionUID = 1L;
//
//    /** 用户ID */
//    private Long userId;
//
//    /** 部门ID */
//    private Long deptId;
//
//    /** 用户账号 */
//
//    private String userName;
//
//    /** 用户昵称 */
//    private String nickName;
//
//    /** 用户邮箱 */
//    private String email;
//
//    /** 手机号码 */
//    private String phonenumber;
//
//    /** 用户性别 */
//    private String sex;
//
//    /** 用户头像 */
//    private String avatar;
//
//    /** 密码 */
//    private String password;
//
//    /** 帐号状态（0正常 1停用） */
//    private String status;
//
//    /** 删除标志（0代表存在 2代表删除） */
//    private String delFlag;
//
//    /** 最后登录IP */
//    private String loginIp;
//
//    /** 最后登录时间 */
//    private Date loginDate;
//
//    /** 角色组 */
//    private Long[] roleIds;
//
//    /** 岗位组 */
//    private Long[] postIds;
//
//    /** 角色ID */
//    private Long roleId;
//
//    public SysUser()
//    {
//
//    }
//
//    public SysUser(Long userId)
//    {
//        this.userId = userId;
//    }
//
//    public Long getUserId()
//    {
//        return userId;
//    }
//
//    public void setUserId(Long userId)
//    {
//        this.userId = userId;
//    }
//
//    public boolean isAdmin()
//    {
//        return isAdmin(this.userId);
//    }
//
//    public static boolean isAdmin(Long userId)
//    {
//        return userId != null && 1L == userId;
//    }
//
//    public Long getDeptId()
//    {
//        return deptId;
//    }
//
//    public void setDeptId(Long deptId)
//    {
//        this.deptId = deptId;
//    }
//
//
//    public String getNickName()
//    {
//        return nickName;
//    }
//
//    public void setNickName(String nickName)
//    {
//        this.nickName = nickName;
//    }
//
//
//    public String getUserName()
//    {
//        return userName;
//    }
//
//    public void setUserName(String userName)
//    {
//        this.userName = userName;
//    }
//
//
//    public String getEmail()
//    {
//        return email;
//    }
//
//    public void setEmail(String email)
//    {
//        this.email = email;
//    }
//
//
//    public String getPhonenumber()
//    {
//        return phonenumber;
//    }
//
//    public void setPhonenumber(String phonenumber)
//    {
//        this.phonenumber = phonenumber;
//    }
//
//    public String getSex()
//    {
//        return sex;
//    }
//
//    public void setSex(String sex)
//    {
//        this.sex = sex;
//    }
//
//    public String getAvatar()
//    {
//        return avatar;
//    }
//
//    public void setAvatar(String avatar)
//    {
//        this.avatar = avatar;
//    }
//
//    public String getPassword()
//    {
//        return password;
//    }
//
//    public void setPassword(String password)
//    {
//        this.password = password;
//    }
//
//    public String getStatus()
//    {
//        return status;
//    }
//
//    public void setStatus(String status)
//    {
//        this.status = status;
//    }
//
//    public String getDelFlag()
//    {
//        return delFlag;
//    }
//
//    public void setDelFlag(String delFlag)
//    {
//        this.delFlag = delFlag;
//    }
//
//    public String getLoginIp()
//    {
//        return loginIp;
//    }
//
//    public void setLoginIp(String loginIp)
//    {
//        this.loginIp = loginIp;
//    }
//
//    public Date getLoginDate()
//    {
//        return loginDate;
//    }
//
//    public void setLoginDate(Date loginDate)
//    {
//        this.loginDate = loginDate;
//    }
//
//
//    public Long[] getRoleIds()
//    {
//        return roleIds;
//    }
//
//    public void setRoleIds(Long[] roleIds)
//    {
//        this.roleIds = roleIds;
//    }
//
//    public Long[] getPostIds()
//    {
//        return postIds;
//    }
//
//    public void setPostIds(Long[] postIds)
//    {
//        this.postIds = postIds;
//    }
//
//    public Long getRoleId()
//    {
//        return roleId;
//    }
//
//    public void setRoleId(Long roleId)
//    {
//        this.roleId = roleId;
//    }
//
//}
