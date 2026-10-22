package cn.qihangerp.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.bo.OrderAddressBo;
import cn.qihangerp.model.bo.OrderCancelBo;
import cn.qihangerp.model.bo.OrderExceptionBo;
import cn.qihangerp.model.bo.OrderMemoBo;
import cn.qihangerp.model.bo.OrderReleaseBo;
import cn.qihangerp.model.bo.OrderWithdrawBo;
import cn.qihangerp.model.vo.ExceptionTagCountVo;
import cn.qihangerp.model.vo.OrderPoolCountsVo;
import cn.qihangerp.model.vo.OrderPoolOrderVo;
import cn.qihangerp.model.vo.OrderReleaseResultVo;
import cn.qihangerp.request.OrderWorkbenchQuery;

import java.util.List;

/**
 * 订单处理工作台-订单域服务（状态池/批量流转/放行/取消/信息修改）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public interface OrderWorkbenchOrderService {

    /**
     * 状态池分页查询（主订单行与子订单行统一平铺，含 canRelease 计算）
     */
    PageResult<OrderPoolOrderVo> poolPage(OrderWorkbenchQuery query, PageQuery pageQuery);

    /**
     * 状态池计数（页签角标）
     */
    OrderPoolCountsVo poolCounts(OrderWorkbenchQuery query);

    /**
     * 批量转异常/转正常（audit_status 0↔2 流转，可逆；未放行订单才可流转）
     */
    ResultVo<String> toException(OrderExceptionBo bo, List<Long> merchantIds, String username);

    /**
     * 异常池分类计数（bind_pool=2 标签聚合 + 未分类兜底）
     */
    ExceptionTagCountVo exceptionTagCounts(OrderWorkbenchQuery query);

    /**
     * 批量审核放行（逐单校验，部分失败留池返回原因，成功不回滚）
     */
    ResultVo<OrderReleaseResultVo> release(OrderReleaseBo bo, List<Long> merchantIds, String username);

    /**
     * 已放行订单撤回异常池（audit_status 1→2，未发货前置守卫）
     */
    ResultVo<String> withdrawToException(OrderWithdrawBo bo, List<Long> merchantIds, String username);

    /**
     * 取消订单（主订单级单张；未发货前置；子订单联动作废）
     */
    ResultVo<Void> cancelOrder(OrderCancelBo bo, List<Long> merchantIds, String username);

    /**
     * 修改卖家备注（未发货前可改）
     */
    ResultVo<Void> updateMemo(OrderMemoBo bo, List<Long> merchantIds, String username);

    /**
     * 修改收货地址（未发货前可改；已取号需先取消取号；主单修改同步未取号子单）
     */
    ResultVo<Void> updateAddress(OrderAddressBo bo, List<Long> merchantIds, String username);
}
