package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

@Data
public class OrderVoDeliveryInfo {

    private OrderVoDeliverInfoAddress address_info;
    private JSONArray delivery_product_info;//	array DeliveryProductInfo	发货物流信息
    private Integer ship_done_time;//	number	发货完成时间，秒级时间戳
    private Integer deliver_method;//	number	订单发货方式，0：普通物流，1：虚拟发货，由商品的同名字段决定
    private JSONObject address_under_review;//	object AddressInfo	用户下单后申请修改收货地址，商家同意后该字段会覆盖订单地址信息
    private Integer address_apply_time;//	number	修改地址申请时间，秒级时间戳
    private String ewaybill_order_code;//	string	电子面单代发时的订单密文
    private Integer quality_inspect_type;//	number	订单是否需要走新质检流程，1：需要，0：不需要， 本字段不存在时表示不需要
    private JSONObject quality_inspect_info;//	object QualityInsepctInfo	质检信息，quality_inspect_type为1时返回

}
