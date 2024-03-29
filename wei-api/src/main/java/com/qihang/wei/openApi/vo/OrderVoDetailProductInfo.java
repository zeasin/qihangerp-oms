package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

@Data
public class OrderVoDetailProductInfo {

  private String product_id	;//商品spuid
  private String sku_id	;//	商品skuid
  private String thumb_img	;//	sku小图
  private Integer sku_cnt	;//	sku数量
  private Integer sale_price	;//	售卖单价（单位：分）
  private String title	;//	商品标题
  private Integer on_aftersale_sku_cnt	;//	正在售后/退款流程中的 sku 数量
  private Integer finish_aftersale_sku_cnt	;//	完成售后/退款的 sku 数量
  private String sku_code	;//	商品编码
  private Integer market_price	;//	市场单价（单位：分）
  private JSONArray sku_attrs	;//	sku属性
  private Integer real_price	;//	sku实付总价，取estimate_price和change_price中较小值
  private String out_product_id	;//	商品外部spuid
  private String out_sku_id	;//	商品外部skuid
  private Boolean is_discounted	;//	是否有优惠金额，非必填，默认为false
  private Integer estimate_price	;//	优惠后sku总价，非必填，is_discounted为true时有值
  private Boolean is_change_price;//	bool	是否修改过价格，非必填，默认为false
  private Integer change_price;//	number	改价后sku总价，非必填，is_change_price为true时有值
  private String out_warehouse_id;//	string	区域库存id
  private JSONObject sku_deliver_info;//	SkuDeliverInfo	商品发货信息
  private JSONObject extra_service;//	ProductExtraService	商品额外服务信息
  private Boolean use_deduction;//	bool	是否使用了会员积分抵扣
  private Integer deduction_price;//	number	会员积分抵扣金额，单位为分
  private JSONArray order_product_coupon_info_list;//	array OrderProductCouponInfo	商品优惠券信息，逐步替换 order.order_detail.coupon_info

}
