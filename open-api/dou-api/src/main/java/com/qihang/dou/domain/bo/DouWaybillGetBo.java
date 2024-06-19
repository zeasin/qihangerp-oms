package com.qihang.pdd.domain.bo;

import lombok.Data;

@Data
public class PddWaybillGetBo {
    private Long accountId;//电子面单账户id
    private String[] ids;
    private Long shopId;//店铺Id
}
