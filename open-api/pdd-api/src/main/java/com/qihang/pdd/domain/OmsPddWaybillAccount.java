package com.qihang.pdd.domain;

import java.io.Serializable;
import lombok.Data;

/**
 * 拼多多电子面单账户信息表
 * @TableName oms_pdd_waybill_account
 */
@Data
public class OmsPddWaybillAccount implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 商家ID
     */
    private Long sellerId;

    /**
     * 物流服务商编码
     */
    private String cpCode;

    /**
     * 1是直营，2是加盟
     */
    private Integer cpType;

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

    /**
     * 网点名称
     */
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

    /**
     * 发货人
     */
    private String name;

    /**
     * 发货手机号
     */
    private String mobile;

    /**
     * 发货固定电话
     */
    private String phone;

    /**
     * 是否前台显示1显示0不显示
     */
    private Integer isShow;

    private static final long serialVersionUID = 1L;
}