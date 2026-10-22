package cn.qihangerp.model.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-已放行订单撤回异常池请求
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderWithdrawBo {
    /** 订单ID列表（待发货池发货单元行：未拆分主单或拆分子单） */
    private List<Long> orderIds;
}
