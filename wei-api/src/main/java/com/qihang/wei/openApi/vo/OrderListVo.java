package com.qihang.wei.openApi.vo;

import lombok.Data;

@Data
public class OrderListVo extends BaseResVo {

    private Long[] order_id_list;

    private boolean has_more;

}
