package cn.qihangerp.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.entity.OrderSearchScheme;

import java.util.List;

/**
 * 订单处理工作台-组合条件方案服务
 * 方案按商户隔离（merchant_id=0 为总部公共方案）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public interface OrderWorkbenchSchemeService {

    PageResult<OrderSearchScheme> queryPageList(OrderSearchScheme bo, Long merchantId, PageQuery pageQuery);

    List<OrderSearchScheme> listEnabled(Long merchantId);

    OrderSearchScheme getInfo(Long id);

    ResultVo<Long> add(OrderSearchScheme bo, Long merchantId, String username);

    ResultVo<Void> edit(OrderSearchScheme bo, Long merchantId, String username);

    ResultVo<Void> remove(Long id, Long merchantId);

    ResultVo<Void> setStatus(Long id, Integer status, Long merchantId, String username);
}
