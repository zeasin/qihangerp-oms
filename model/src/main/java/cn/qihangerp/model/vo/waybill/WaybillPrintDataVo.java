package cn.qihangerp.model.vo.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 打单队列-打印数据行VO
 * 取号时落库的 o_order_ship_waybill 打印载荷，前端打印组件按平台协议消费。
 */
@Data
public class WaybillPrintDataVo implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 订单ID（o_order.id） */
    private Long orderId;
    /** 平台订单号 */
    private String orderNum;
    /** 店铺类型（平台，决定打印组件通道） */
    private Integer shopType;
    /** 快递单号 */
    private String waybillCode;
    /** 快递公司编码 */
    private String logisticsCode;
    /** 打印模板URL */
    private String templateUrl;
    /** 平台加密打印数据 */
    private String printData;
    /** 打印数据签名 */
    private String sign;
    /** 打印附加参数（菜鸟授权体等） */
    private String params;
    /** 商品明细副联数据 */
    private String goodsDetail;
}
