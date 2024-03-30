package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

@Data
public class OrderVoDeliverInfoAddress {

  private String  user_name	;//string	收货人姓名
  private String  postal_code;//	string	邮编
  private String  province_name;//	string	省份
  private String  city_name;//	string	城市
  private String  county_name;//	string	区
  private String  detail_info;//	string	详细地址
  private String  national_code;//	string	国家码，已废弃，请勿使用
  private String  tel_number;//	string	联系方式
  private String  house_number;//	string	门牌号码
  private String  virtual_order_tel_number;//	string	虚拟发货订单联系方式(deliver_method=1时返回)
  private JSONObject tel_number_ext_info;//	TelNumberExtInfo	额外的联系方式信息（虚拟号码相关）
  private Integer  use_tel_number;//	number	0：不使用虚拟号码，1：使用虚拟号码
  private String  hash_code;//	string	标识当前店铺下一个唯一的用户收货地址
}
