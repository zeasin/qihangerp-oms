package cn.qihangerp.open.jd.domain.bo;

import lombok.Data;

@Data
public class JdTokenCreateBo {
    private Integer shopId;
    private Integer platform;
    private String code;
}
