package cn.qihangerp.module.open.jd.domain.bo;

import lombok.Data;

@Data
public class JdVcRefundBo {
    private Integer shopId;
    private String id;
    private String customOrderId;
    private Integer customerExpect;//11仅退款10退货退款
}
