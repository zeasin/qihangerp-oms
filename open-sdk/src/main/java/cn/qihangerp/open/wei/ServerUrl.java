package cn.qihangerp.open.wei;

public class ServerUrl {
    public static String serverApiUrl = "https://api.weixin.qq.com";
    public static String goodsListApiUrl = "/channels/ec/product/list/get";
    public static String goodsDetailApiUrl = "/channels/ec/product/get";
    public static String logisticsApiUrl = "/channels/ec/order/deliverycompanylist/new/get";
    public static String tokenApiUrl = "/cgi-bin/token";
    public static String shopBaseInfoApiUrl = "/channels/ec/basics/info/get";
    public static String orderListApiUrl = "/channels/ec/order/list/get";
    public static String orderDetailApiUrl = "/channels/ec/order/get";
    public static String refundListApiUrl = "/channels/ec/aftersale/getaftersalelist";
    public static String refundDetailApiUrl = "/channels/ec/aftersale/getaftersaleorder";
    /** 电子面单预取号 */
    public static String ewaybillOrderPreCreateApiUrl = "/channels/ec/logistics/ewaybill/biz/order/precreate";
    /** 电子面单正式取号 */
    public static String ewaybillOrderCreateApiUrl = "/channels/ec/logistics/ewaybill/biz/order/create";
}
