package cn.qihangerp.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 订单标签表
 * @TableName o_order_tag
 */
@TableName(value = "o_order_tag")
@Data
public class OrderTag implements Serializable {
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 标签名称
     */
    private String name;

    /**
     * 标签颜色
     */
    private String color;

    /**
     * 商户ID（0=总部公共标签）
     */
    private Long merchantId;

    /**
     * 操作人
     */
    private String opBy;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 绑定状态池：1待审核 2异常池
     */
    private Integer bindPool;

    /**
     * 状态：0停用 1启用
     */
    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private static final long serialVersionUID = 1L;
}
