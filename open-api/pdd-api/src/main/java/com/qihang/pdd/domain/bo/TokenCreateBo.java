package com.qihang.pdd.domain.bo;

import lombok.Data;

@Data
public class TokenCreateBo {
    private Integer shopId;
    private Integer platform;
    private String code;
}
