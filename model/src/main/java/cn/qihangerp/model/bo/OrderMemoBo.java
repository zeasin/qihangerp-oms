package cn.qihangerp.model.bo;

import lombok.Data;

/**
 * 订单处理工作台-修改卖家备注请求
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderMemoBo {
    /** 订单ID */
    private Long orderId;
    /** 卖家备注内容 */
    private String sellerMemo;
}
