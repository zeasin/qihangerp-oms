package cn.qihangerp.open.dou.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.io.Serializable;

/**
 * 抖店电子面单账户信息表
 * @TableName oms_dou_waybill_account
 */
@Data
public class OmsDouWaybillAccount implements Serializable {
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
     * 快递公司编码
     */
    private String company;

    /**
     * 物流服务商业务类型 1：直营 2：加盟 3：落地配 4：直营带网点
     */
    private Integer companyType;

    /**
     * 电子面单余额数量，-1表示没有额度限制
     */
    private Integer amount;

    /**
     * 已取单号数量，若业务本身无值，则传-1，前端可展示为“-”
     */
    private Integer allocatedQuantity;

    /**
     * 已取消单号数量，若业务本身无值，则传-1，前端可展示为“-”
     */
    private Integer cancelledQuantity;

    /**
     * 已回收单号数量，若业务本身无值，则传-1，前端可展示为“-”
     */
    private Integer recycledQuantity;

    /**
     * 网点Code
     */
    private String netsiteCode;

    /**
     * 网点名称
     */
    private String netsiteName;

    /**
     * 省名称（一级地址）
     */
    private String provinceName;

    /**
     * 市名称（二级地址）
     */
    private String cityName;

    /**
     * 
     */
    private String districtName;

    /**
     * 区名称（三级地址）
     */
    private String streetName;

    /**
     * 详细地址
     */
    private String detailAddress;

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