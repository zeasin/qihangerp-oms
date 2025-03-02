package cn.qihangerp.module.order.domain.bo;

import lombok.Data;

@Data
public class RefundProcessingBo {
    private Long refundId;
    private Integer hasGoodsSend;
    private Integer type;
    private String orderNum;
    private String sendLogisticsCode;
    private String returnLogisticsCode;
    private String reissueLogisticsCode;
    private String remark;
    private String receiverName;
    private String receiverTel;
    private String receiverAddress;
}
