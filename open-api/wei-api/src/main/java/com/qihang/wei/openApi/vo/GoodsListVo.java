package com.qihang.wei.openApi.vo;

import lombok.Data;

@Data
public class GoodsListVo extends BaseResVo {

    private Long[] product_ids;

    private Integer total_num;

}
