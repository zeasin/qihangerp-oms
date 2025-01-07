package cn.qihangerp.open.jd.domain.bo;

import lombok.Data;

@Data
public class JdWaybillGetBo {
    private Long accountId;//电子面单账户id
    private String[] ids;
    private Long shopId;//店铺Id
}
