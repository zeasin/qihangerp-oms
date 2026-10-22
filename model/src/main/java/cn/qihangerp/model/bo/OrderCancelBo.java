package cn.qihangerp.model.bo;

import lombok.Data;

/**
 * 订单处理工作台-取消订单请求（主订单级，单张取消）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderCancelBo {
    /** 主订单ID */
    private Long orderId;
    /** 取消原因（可选） */
    private String reason;
}
