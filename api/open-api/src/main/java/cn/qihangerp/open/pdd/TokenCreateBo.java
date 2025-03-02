package cn.qihangerp.open.pdd;

import lombok.Data;

@Data
public class TokenCreateBo {
    private Long shopId;
    private Integer shopType;
    private String code;
}
