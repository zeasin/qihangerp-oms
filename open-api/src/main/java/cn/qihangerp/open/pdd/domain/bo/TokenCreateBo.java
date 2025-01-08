package cn.qihangerp.open.pdd.domain.bo;

import lombok.Data;

@Data
public class TokenCreateBo {
    private Long shopId;
    private Integer platform;
    private String code;
}
