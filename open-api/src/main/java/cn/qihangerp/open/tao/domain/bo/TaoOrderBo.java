package cn.qihangerp.open.tao.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class TaoOrderBo implements Serializable {
    private String tid;
    private Long skuId;
    private Long erpGoodsSkuId;
    private Long shopId;
    private String status;
    private Integer erpSendStatus;
}
