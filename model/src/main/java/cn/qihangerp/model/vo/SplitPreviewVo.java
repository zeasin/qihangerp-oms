package cn.qihangerp.model.vo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-拆单预览VO
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class SplitPreviewVo {
    /** 被拆订单ID */
    private Long orderId;
    /** 平台订单号 */
    private String orderNum;
    /** 审核状态（0待审核 2已转异常） */
    private Integer auditStatus;
    /** 商品行（含剩余可拆数量） */
    private List<Item> items;

    @Data
    public static class Item {
        private Long itemId;
        private String goodsTitle;
        private String goodsImg;
        private String skuNum;
        private String goodsSpec;
        private String barcode;
        /** 原始数量 */
        private Integer quantity;
        /** 已退款数量 */
        private Integer refundCount;
        /** 可发货数量（quantity - refundCount） */
        private Integer available;
        /** 已拆出数量 */
        private Integer splitOut;
    }
}
