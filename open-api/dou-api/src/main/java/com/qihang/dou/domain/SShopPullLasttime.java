package com.qihang.dou.domain;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 店铺更新最后时间记录
 * @TableName s_shop_pull_lasttime
 */
@Data
public class SShopPullLasttime implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 店铺id
     */
    private Long shopId;

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