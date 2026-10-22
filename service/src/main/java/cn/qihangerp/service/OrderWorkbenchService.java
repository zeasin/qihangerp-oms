package cn.qihangerp.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.vo.OrderWorkbenchItemVo;
import cn.qihangerp.model.vo.OrderWorkbenchOrderListVo;
import cn.qihangerp.model.vo.OrderWorkbenchOrderTreeVo;
import cn.qihangerp.request.OrderWorkbenchQuery;

import java.util.List;

/**
 * 订单处理工作台查询服务
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public interface OrderWorkbenchService {

    /**
     * 主订单分页查询（固定 parent_order_id=0，支持多订单号与商品关键词搜索）
     */
    PageResult<OrderWorkbenchOrderListVo> queryMasterOrderPage(OrderWorkbenchQuery query, PageQuery pageQuery);

    /**
     * 订单树查询：主订单 + 子订单 + 主订单原始商品行 + 子订单履约商品行
     */
    OrderWorkbenchOrderTreeVo queryOrderTree(Long orderId);

    /**
     * 订单商品行查询（主订单返回原始行，子订单返回履约行，按 sortNo 排序）
     */
    List<OrderWorkbenchItemVo> queryOrderItems(Long orderId);
}
