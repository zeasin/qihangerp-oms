package cn.qihangerp.model.bo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-拆单提交请求（一单一单真实拆单）
 * 部分拆模型：每批生成一个子单，原单保留剩余；所有明细累加拆出数量不得超过可发货数量
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class SplitSubmitBo {
    /** 被拆订单ID（主订单或子订单） */
    private Long orderId;

    /** 拆单分组列表（每组将生成一个子订单） */
    private List<SplitGroupBo> groups;

    @Data
    public static class SplitGroupBo {
        /** 分组名（仅界面标识，默认 分组1/2/N） */
        private String groupName;
        /** 发货方式：EnumShipType——0本地仓库发货 / 300供应商发货，可不填（后置到打单发货） */
        private Integer shipType;
        /** 仓库ID（shipType=0 时必填） */
        private Long warehouseId;
        /** 供应商ID（shipType=300 时必填） */
        private Long supplierId;
        /** 物流公司ID（erp_logistics_company.id，选填） */
        private Long logisticsId;
        /** 本组明细分配 */
        private List<SplitItemBo> items;
    }

    @Data
    public static class SplitItemBo {
        /** 来源商品行ID（o_order_item.id） */
        private Long sourceOrderItemId;
        /** 分配数量 */
        private Integer quantity;
    }
}
