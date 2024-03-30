package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

import java.util.List;

@Data
public class OrderVo {
   private Integer create_time;//秒级时间戳
   private Integer update_time;//秒级时间戳
   private String order_id	;//订单号
   private Integer status	;//订单状态，枚举值见OrderStatus
   private String openid	;//买家身份标识
   private String unionid	;//买家在开放平台的唯一标识符，若当前视频号小店已绑定到微信开放平台账号下，绑定成功后产生的订单会返回，详见UnionID 机制说明
   private OrderVoDetail order_detail	;// OrderDetail	订单详细数据信息
   private JSONObject aftersale_detail	;// AfterSaleDetail	售后信息

}
