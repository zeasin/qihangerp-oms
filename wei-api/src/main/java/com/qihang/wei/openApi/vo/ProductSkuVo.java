package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class ProductSkuVo {
    private String sku_id;
    private String out_sku_id;
    private String thumb_img;
    private String sku_code;
    private JSONArray sku_attrs;
    private Integer sale_price;
    private Integer stock_num;
    private Integer status;
    private JSONObject sku_deliver_info;

}
