package cn.qihangerp.open.pdd.domain.bo;

import lombok.Data;

@Data
public class PddAfterSaleBo {
    private Integer shopId;
    private Integer customerExpect;
    private Long orderId;
    private String serviceId;
}
