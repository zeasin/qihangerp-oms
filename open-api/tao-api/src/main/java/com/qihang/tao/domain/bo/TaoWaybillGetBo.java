package com.qihang.tao.domain.bo;

import lombok.Data;

@Data
public class TaoWaybillGetBo {
    private Long accountId;//电子面单账户id
    private String[] ids;
    private Long shopId;//店铺Id
}
