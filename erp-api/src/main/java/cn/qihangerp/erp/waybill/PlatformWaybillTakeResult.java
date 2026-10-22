package cn.qihangerp.erp.waybill;

import lombok.Data;

import java.io.Serializable;

/**
 * 统一取号结果（平台返回，由发货队列服务负责落库）
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.7
 */
@Data
public class PlatformWaybillTakeResult implements Serializable {
    private static final long serialVersionUID = 1L;

    /** 快递单号 */
    private String waybillCode;
    /** 平台物流公司编码（取消取号时回传平台） */
    private String logisticsCode;
    /** 快递公司名称（展示用） */
    private String waybillCompany;
    /** 平台电子面单订单标识（视频号等平台使用） */
    private String waybillOrderId;
    /** 打印数据 */
    private String printData;
    /** 平台打印签名 */
    private String sign;
    /** 打印参数 */
    private String params;
    /** 打印模板地址 */
    private String templateUrl;
    /** 商品明细快照 */
    private String goodsDetail;
}
