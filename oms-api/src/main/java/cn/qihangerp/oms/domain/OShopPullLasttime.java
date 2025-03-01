package cn.qihangerp.oms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * 店铺更新最后时间记录
 * @TableName sys_shop_pull_lasttime
 */
@Data
public class OShopPullLasttime implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private String id;

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
    public OShopPullLasttime(){

    }

    public OShopPullLasttime(Long shopId, Object pullType, LocalDateTime lasttime, Date createTime, Date updateTime) {
        this.shopId = shopId;
        this.pullType = pullType;
        this.lasttime = lasttime;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
}