package cn.qihangerp.open.xhs.response;

import lombok.Data;

/**
 * 小红书批量取号（express.createEbillOrders）单条结果
 * 字段口径逐字对齐官方文档《新版小红书电子面单ISV对接改造》：
 * 只要有一单成功外层 success=true；wayBillList 内 success=true 或 waybillCode 不为空代表该订单取号成功；
 * 取号失败看 errorMsg；objectId 回填请求 tradeOrderInfoList 中的 objectId，批量场景据此匹配订单。
 */
@Data
public class EbillOrderInfo {

    /** 回填请求对象标识（对应 TradeOrderInfo.objectId） */
    private String objectId;

    /** 本单取号是否成功 */
    private Boolean success;

    /** 电子面单号 */
    private String waybillCode;

    /** 失败原因 */
    private String errorMsg;
}
