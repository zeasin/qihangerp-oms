package com.qihang.jd.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class JdOrderBo implements Serializable {
    private String orderId;
    private Integer shopId;
    private String orderState;
}
