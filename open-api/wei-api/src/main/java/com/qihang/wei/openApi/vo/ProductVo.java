package com.qihang.wei.openApi.vo;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class ProductVo {
    private String product_id;
    private String out_product_id;
    private String title;
    private String sub_title;
    private JSONArray head_imgs;
    private JSONObject desc_info;
    private List<Map<String,String>> attrs;
    private Integer status;
    private Integer edit_status;
    private Integer min_price;
    private String spu_code;
    private List<ProductSkuVo> skus;
    private Integer product_type;
    private String edit_time;
}
