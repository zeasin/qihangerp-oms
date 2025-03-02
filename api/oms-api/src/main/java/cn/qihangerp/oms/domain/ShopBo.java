package cn.qihangerp.oms.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 数据中心-店铺
 * @TableName sys_shop
 */
@Data
public class ShopBo implements Serializable {


    /**
     * 店铺名
     */
    private String name;

    /**
     * 对应第三方平台Id
     */
    private Integer platform;



    /**
     * 状态（1正常2已删除）
     */
    private Integer status;



    private static final long serialVersionUID = 1L;


}