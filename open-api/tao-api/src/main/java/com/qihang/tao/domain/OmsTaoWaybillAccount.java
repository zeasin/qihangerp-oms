package com.qihang.tao.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 淘宝电子面单账户信息表
 * @TableName oms_tao_waybill_account
 */
@Data
public class OmsTaoWaybillAccount implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    private Long shopId;

    /**
     * 物流服务商编码
     */
    private String cpCode;

    /**
     * 1是直营，2是加盟
     */
    private Integer cpType;

    /**
     * 商家ID
     */
    private Long sellerId;

    /**
     * 可用单数
     */
    private Integer quantity;

    /**
     * 已用单数
     */
    private Integer allocatedQuantity;

    /**
     * 网点ID
     */
    private String branchCode;
    private String branchName;

    /**
     * 已经打印的面单总数
     */
    private Integer printQuantity;

    /**
     * 取消的面对总数
     */
    private Integer cancelQuantity;

    /**
     * waybill 地址记录ID(非地址库ID)
     */
    private Long waybillAddressId;

    /**
     * 省名称（一级地址）
     */
    private String province;

    /**
     * 市名称（二级地址）
     */
    private String city;

    /**
     * 区名称（三级地址）
     */
    private String area;

    /**
     * 详细地址
     */
    private String addressDetail;
    private String name;
    private String mobile;
    private String phone;

    /**
     * 是否前台显示1显示0不显示
     */
    private Integer isShow;

    private static final long serialVersionUID = 1L;

}