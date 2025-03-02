package cn.qihangerp.module.goods.domain;

import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName o_goods_supplier
 */
@Data
public class OGoodsSupplier implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 供应商名称
     */
    private String name;

    /**
     * 供应商编码
     */
    private String number;

    /**
     * 税率
     */
    private Double taxrate;

    /**
     * 期初应付款
     */
    private Double amount;

    /**
     * 期初预付款
     */
    private Double periodmoney;

    /**
     * 初期往来余额
     */
    private Double difmoney;

    /**
     * 余额日期
     */
    private Date begindate;

    /**
     * 备注
     */
    private String remark;

    /**
     * 职位
     */
    private String place;

    /**
     * 联系人
     */
    private String linkman;

    /**
     * 联系方式
     */
    private String contact;

    /**
     * 省
     */
    private String province;

    /**
     * 市
     */
    private String city;

    /**
     * 区县
     */
    private String county;

    /**
     * 收货地址详情
     */
    private String address;

    /**
     * 
     */
    private String pinyin;

    /**
     * 0启用   1禁用
     */
    private Integer disable;

    /**
     * 0正常 1删除
     */
    private Integer isdelete;

    /**
     * 分管采购员
     */
    private String purchasername;

    /**
     * 创建时间
     */
    private Date createtime;

    private static final long serialVersionUID = 1L;
}