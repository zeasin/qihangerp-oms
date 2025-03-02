//package cn.qihangerp.open.kwai.domain;
//
//import lombok.Data;
//
//import java.io.Serializable;
//
///**
// *
// * @TableName kwai_orders_item
// */
//@Data
//public class KwaiOrdersItem implements Serializable {
//    /**
//     * id，自增
//     */
//    private Long id;
//
//    /**
//     * 快手子订单id
//     */
//    private Long itemid;
//
//    /**
//     * 订单ID
//     */
//    private Long orderid;
//
//    /**
//     * erp系统商品id
//     */
//    private Integer erpgoodsid;
//
//    /**
//     * erp系统商品规格id
//     */
//    private Integer erpgoodsspecid;
//
//    /**
//     * 商品名称
//     */
//    private String itemtitle;
//
//    /**
//     * 商品图片
//     */
//    private String itempicurl;
//
//    /**
//     * 商品编码
//     */
//    private String goodsnum;
//
//    /**
//     * 商品规格
//     */
//    private String goodsspec;
//
//    /**
//     * 商品规格编码
//     */
//    private String skunick;
//
//    /**
//     * 商品单价
//     */
//    private Double price;
//
//    /**
//     * 商品数量
//     */
//    private Integer num;
//
//    /**
//     * 退货Id
//     */
//    private Long refundid;
//
//    /**
//     * 退货状态
//     */
//    private Integer refundstatus;
//
//    /**
//     *
//     */
//    private String remark;
//
//    /**
//     * 是否赠品0:否1:是
//     */
//    private Integer isgift;
//
//    private static final long serialVersionUID = 1L;
//}