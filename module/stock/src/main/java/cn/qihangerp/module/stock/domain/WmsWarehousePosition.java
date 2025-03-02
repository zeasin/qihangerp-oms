package cn.qihangerp.module.stock.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 仓库仓位表
 * @TableName wms_warehouse_position
 */
@Data
public class WmsWarehousePosition implements Serializable {
    /**
     * 
     */
    @TableId(value = "id",type = IdType.AUTO)
    private Integer id;

    /**
     * 仓库id
     */
    private Integer warehouseId;

    /**
     * 仓库/货架编号
     */
    private String number;

    /**
     * 仓位/货架名称
     */
    private String name;

    /**
     * 上级id
     */
    private Integer parentId;

    /**
     * 层级深度1级2级3级
     */
    private Integer depth;

    /**
     * 一级类目id
     */
    private Integer parentId1;

    /**
     * 二级类目id
     */
    private Integer parentId2;

    /**
     * 地址
     */
    private String address;

    /**
     * 备注
     */
    private String remark;

    /**
     * 0正常  1删除
     */
    private Integer isDelete;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;
}