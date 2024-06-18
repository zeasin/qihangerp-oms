package com.qihang.jd.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 京东电子面单账户信息表
 * @TableName oms_jd_waybill_account
 */
@Data
public class OmsJdWaybillAccount implements Serializable {
    /**
     * 
     */
    @TableId(value = "id", type = IdType.AUTO)
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
     * 承运商id
     */
    private Integer providerId;

    /**
     * 承运商编码
     */
    private String providerCode;

    /**
     * 承运商名称
     */
    private String providerName;

    /**
     * 承运商类型,1-快递公司 2-物流公司 3-安装公司 4-生鲜冷链公司
     */
    private Integer providerType;

    /**
     * 可用单数
     */
    private Integer amount;

    /**
     * 是否支持货到付款
     */
    private String supportCod;

    /**
     * 网点ID
     */
    private String branchCode;

    /**
     * 网点名称
     */
    private String branchName;

    /**
     * 财务结算编码
     */
    private String settlementCode;

    /**
     * 
     */
    private Integer provinceId;

    /**
     * 省名称（一级地址）
     */
    private String provinceName;

    /**
     * 
     */
    private Integer cityId;

    /**
     * 市名称（二级地址）
     */
    private String cityName;

    /**
     * 区名称（三级地址）
     */
    private Integer countryId;

    /**
     * 
     */
    private String countryName;

    /**
     * 
     */
    private Integer countrysideId;

    /**
     * 区名称（三级地址）
     */
    private String countrysideName;

    /**
     * 详细地址
     */
    private String address;

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