package cn.qihangerp.open.wei.bo;

import lombok.Data;

@Data
public class WeiWaybillGetBo {
    private Long accountId;//电子面单账户id
    private String[] ids;
    private Long shopId;//店铺Id
}
