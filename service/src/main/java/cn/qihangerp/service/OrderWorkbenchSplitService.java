package cn.qihangerp.service;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.model.bo.SplitSubmitBo;
import cn.qihangerp.model.vo.SplitPreviewVo;

import java.util.List;

/**
 * 订单处理工作台-拆单服务（一单一单真实拆单）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public interface OrderWorkbenchSplitService {

    /**
     * 拆单预览：被拆订单可分配明细（含剩余可分配数量）
     */
    SplitPreviewVo preview(Long orderId, List<Long> merchantIds);

    /**
     * 提交拆单：累计分配强校验 → 事务内生成子订单
     */
    ResultVo<String> submit(SplitSubmitBo bo, List<Long> merchantIds, String username);
}
