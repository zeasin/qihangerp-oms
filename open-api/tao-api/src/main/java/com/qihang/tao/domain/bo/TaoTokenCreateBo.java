package com.qihang.tao.domain.bo;

import lombok.Data;

@Data
public class TaoTokenCreateBo {
    private Integer shopId;
    private Integer platform;
    private String code;
}
