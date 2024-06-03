package com.qihang.wei.bo;

import lombok.Data;

@Data
public class WeiOrderConfirmBo {
    private String id;
    /**
     * 收货人的姓名
     */
    private String userName;

    /**
     * 收货人的手机号码
     */
    private String telNumber;

    /**
     * 收货人的电话号码
     */
    private String detailInfo;

    /**
     * 数据库更新人
     */
    private String updateBy;

}
