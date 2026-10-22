package cn.qihangerp.model.vo;

import lombok.Data;

/**
 * 订单处理工作台-状态池计数VO（页签角标）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderPoolCountsVo {
    /** 待审核 */
    private Long pending;
    /** 异常池 */
    private Long exception;
    /** 待发货（已放行未发完） */
    private Long released;
    /** 已发货 */
    private Long shipped;
}
