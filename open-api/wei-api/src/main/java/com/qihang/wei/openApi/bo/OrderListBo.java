package com.qihang.wei.openApi.bo;

import lombok.Data;

@Data
public class OrderListBo {
    private CreateTimeRangeBo create_time_range;
    private Integer page_size;
    private String next_key;
}
