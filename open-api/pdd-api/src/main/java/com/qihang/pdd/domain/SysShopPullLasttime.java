package com.qihang.pdd.domain;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 店铺更新最后时间记录
 * @TableName sys_shop_pull_lasttime
 */
@Data
public class SysShopPullLasttime implements Serializable {
    /**
     * 
     */
    private Integer id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 类型（ORDER:订单，REFUND:退款）
     */
    private Object pullType;

    /**
     * 最后更新时间
     */
    private LocalDateTime lasttime;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;

}