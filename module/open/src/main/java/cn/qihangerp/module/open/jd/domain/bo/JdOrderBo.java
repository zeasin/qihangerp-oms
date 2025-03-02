package cn.qihangerp.module.open.jd.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class JdOrderBo implements Serializable {
    /**
     * 商品标题
     */
    private String orderId;
    private Integer shopId;
    private String orderState;
    private String startTime;
    private String endTime;
}
