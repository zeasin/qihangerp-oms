package cn.qihangerp.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 订单搜索方案表
 * @TableName o_order_search_scheme
 */
@TableName(value = "o_order_search_scheme")
@Data
public class OrderSearchScheme implements Serializable {
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 方案名称
     */
    private String name;

    /**
     * 查询条件（JSON）
     */
    private String conditions;

    /**
     * 商户ID（0=总部公共方案）
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
     * 状态：0停用 1启用
     */
    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    private static final long serialVersionUID = 1L;
}
