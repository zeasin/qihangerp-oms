package cn.qihangerp.model.vo;

import lombok.Data;

import java.util.List;

/**
 * 订单处理工作台-订单树VO：主订单 + 子订单 + 原始商品行 + 履约商品行
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Data
public class OrderWorkbenchOrderTreeVo {
    private OrderWorkbenchOrderListVo master;
    private List<OrderWorkbenchOrderListVo> children;
    /** 主订单原始商品行（itemRole=0） */
    private List<OrderWorkbenchItemVo> masterItems;
    /** 子订单履约商品行（itemRole=1） */
    private List<OrderWorkbenchItemVo> childItems;
}
