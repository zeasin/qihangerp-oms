package cn.qihangerp.module.open.jd.domain.bo;

import lombok.Data;

@Data
public class JdTokenCreateBo {
    private Long shopId;
    private Integer shopType;
    private String code;
}
