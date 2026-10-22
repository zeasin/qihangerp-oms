package cn.qihangerp.model.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-批量打标/撤标请求
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderTagApplyBo {
    /** 动作：1=打标（追加），0=撤标（移除） */
    private Integer action;
    /** 订单ID列表（o_order.id） */
    private List<String> orderIds;
    /** 标签ID列表（o_order_tag.id） */
    private List<Long> tagIds;
}
