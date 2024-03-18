//package com.qihang.oms.common;
//
//import com.qihang.common.common.AjaxResult;
//import com.qihang.common.common.PageResult;
//import com.qihang.common.common.TableDataInfo;
//import com.qihang.common.enums.HttpStatus;
//import com.qihang.common.utils.StringUtils;
//import com.qihang.oms.domain.OOrder;
//import com.qihang.security.LoginUser;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//
//import java.util.List;
//
///**
// * web层通用数据处理
// *
// * @author qihang
// */
//public class BaseController
//{
//    protected final Logger logger = LoggerFactory.getLogger(this.getClass());
//
//
//
//    /**
//     * 返回成功
//     */
//    public AjaxResult success()
//    {
//        return AjaxResult.success();
//    }
//
//    /**
//     * 返回失败消息
//     */
//    public AjaxResult error()
//    {
//        return AjaxResult.error();
//    }
//
//    /**
//     * 返回成功消息
//     */
//    public AjaxResult success(String message)
//    {
//        return AjaxResult.success(message);
//    }
//
//    /**
//     * 返回成功消息
//     */
//    public AjaxResult success(Object data)
//    {
//        return AjaxResult.success(data);
//    }
//
//    /**
//     * 返回失败消息
//     */
//    public AjaxResult error(String message)
//    {
//        return AjaxResult.error(message);
//    }
//
//    /**
//     * 返回警告消息
//     */
//    public AjaxResult warn(String message)
//    {
//        return AjaxResult.warn(message);
//    }
//
//    /**
//     * 响应返回结果
//     *
//     * @param rows 影响行数
//     * @return 操作结果
//     */
//    protected AjaxResult toAjax(int rows)
//    {
//        return rows > 0 ? AjaxResult.success() : AjaxResult.error();
//    }
//
//    /**
//     * 响应返回结果
//     *
//     * @param result 结果
//     * @return 操作结果
//     */
//    protected AjaxResult toAjax(boolean result)
//    {
//        return result ? success() : error();
//    }
//
//    /**
//     * 页面跳转
//     */
//    public String redirect(String url)
//    {
//        return StringUtils.format("redirect:{}", url);
//    }
//
//    /**
//     * 获取用户缓存信息
//     */
//    public LoginUser getLoginUser()
//    {
//        return SecurityUtils.getLoginUser();
//    }
//
//    /**
//     * 获取登录用户id
//     */
//    public Long getUserId()
//    {
//        return getLoginUser().getUserId();
//    }
//
//    /**
//     * 获取登录部门id
//     */
//    public Long getDeptId()
//    {
//        return getLoginUser().getDeptId();
//    }
//
//    /**
//     * 获取登录用户名
//     */
//    public String getUsername()
//    {
//        return getLoginUser().getUsername();
//    }
//
//    /**
//     * 响应请求分页数据
//     */
//    @SuppressWarnings({ "rawtypes", "unchecked" })
//    protected TableDataInfo getDataTable(List<?> list)
//    {
//        TableDataInfo rspData = new TableDataInfo();
//        rspData.setCode(HttpStatus.SUCCESS);
//        rspData.setMsg("查询成功");
//        rspData.setRows(list);
////        rspData.setTotal(new PageInfo(list).getTotal());
//        rspData.setTotal(list.size());
//        return rspData;
//    }
//    protected TableDataInfo getDataTable(PageResult<?> pageResult)
//    {
//        TableDataInfo rspData = new TableDataInfo();
//        rspData.setCode(HttpStatus.SUCCESS);
//        rspData.setMsg("查询成功");
//        rspData.setRows(pageResult.getRecords());
////        rspData.setTotal(new PageInfo(list).getTotal());
//        rspData.setTotal(pageResult.getTotal());
//        return rspData;
//    }
//
//
//}
