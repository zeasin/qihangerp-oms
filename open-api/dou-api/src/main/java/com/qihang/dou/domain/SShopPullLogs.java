package com.qihang.dou.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 店铺更新日志表
 * @TableName s_shop_pull_logs
 */
@Data
public class SShopPullLogs implements Serializable {
    /**
     * 主键Id
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 平台id
     */
    private Integer shopType;

    /**
     * 类型（ORDER订单，GOODS商品，REFUND退款）
     */
    private Object pullType;

    /**
     * 拉取方式（主动拉取、定时任务）
     */
    private String pullWay;

    /**
     * 拉取参数
     */
    private String pullParams;

    /**
     * 拉取结果
     */
    private String pullResult;

    /**
     * 拉取时间
     */
    private Date pullTime;

    /**
     * 耗时（毫秒）
     */
    private Long duration;

    private static final long serialVersionUID = 1L;
}