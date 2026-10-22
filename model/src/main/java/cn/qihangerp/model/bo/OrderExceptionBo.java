package cn.qihangerp.model.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-批量转异常/转正常请求（audit_status 0↔2 流转）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderExceptionBo {
    /** 订单ID列表（主订单或子订单） */
    private List<Long> orderIds;
    /** 目标审核状态：0=转正常，2=转异常 */
    private Integer target;
    /** 异常分类标签ID（target=2 时必填，须为 bind_pool=2 的启用标签） */
    private Long tagId;
}
