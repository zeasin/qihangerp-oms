package cn.qihangerp.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 店铺电子面单账号表
 * @TableName oms_shop_waybill_account
 */
@TableName(value ="oms_shop_waybill_account")
@Data
public class ShopWaybillAccount {
    /**
     * 自增ID
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    private String outerLogisticsId;//外部logistics_id（点三使用）
    /**
     * 商家物流网点信息的 唯一key， 商家物流新增/编辑时，只回传该字段即可指定网点
     */
    private String key1;
    /**
     * 类型：DIANSAN，PT
     */
    private String type;

    /**
     * 编码
     */
    private String code;

    /**
     * 网点名称
     */
    private String name;

    /**
     * 淘宝菜鸟-WB_TB,京东无界-WB_JD_ALPHA，仅用于电子面单场景，打印模板相关使用：WB_JD_YUN,京东快递-WB_JD_ETMS，仅用于电子面单场景，打印模板相关使用：WB_JD_YUN,拼多多-WB_PDD,抖音-WB_DY,唯品会-WB_VIP,快手-WB_KS,WB_JD_YUN仅用于打印模板的查询和返回值中。不能用于电子面单,小红书云打印-WB_XHS,微信视频号电子面单云打印-WB_WX_VS,线下普通-WB_OTHER，仅用于线下快递面单,得物云打印-WB_DW,WB_YZ有赞云打印,WB_MT美团云打印
     */
    private String waybillPlatformType;

    /**
     * 网点品牌编号,目前仅顺丰具有
     */
    private String brandCode;

    /**
     * 平台物流编码
     */
    private String refLogisticsCode;

    /**
     * 平台物流id
     */
    private Integer refLogisticsId;

    /**
     * 平台物流名称
     */
    private String refLogisticsName;

    /**
     * 平台物流类型：DIRECT-直营，JOIN-加盟，CONF-落地配，DIRECT_NETSITE-直营带网点
     */
    private String refLogisticsType;

    /**
     * 结算账户
     */
    private String settleAccount;

    /**
     * 源键
     */
    private String sourceKey;

    /**
     * 省份
     */
    private String province;

    /**
     * 城市
     */
    private String city;

    /**
     * 详细地址
     */
    private String detail;

    /**
     * 区县
     */
    private String district;

    /**
     * 电子面单余额数量
     */
    private Integer num;

    /**
     * 地址（详细）
     */
    private String addressAddress;

    /**
     * 城市 ID
     */
    private Integer cityId;

    /**
     * 城市名称
     */
    private String cityName;

    /**
     * 国家 ID
     */
    private Integer countryId;

    /**
     * 国家名称
     */
    private String countryName;

    /**
     * 乡镇 ID
     */
    private Integer countrysideId;

    /**
     * 乡镇名称
     */
    private String countrysideName;

    /**
     * 省份 ID
     */
    private Integer provinceId;

    /**
     * 省份名称
     */
    private String provinceName;

    /**
     * 金额
     */
    private Integer amount;

    /**
     * 分支编码
     */
    private String branchCode;

    /**
     * 分支名称
     */
    private String branchName;

    /**
     * 操作类型
     */
    private Integer operationType;

    /**
     * 提供者编码
     */
    private String providerCode;

    /**
     * 提供者 ID
     */
    private Long providerId;

    /**
     * 提供者名称
     */
    private String providerName;

    /**
     * 提供者类型
     */
    private Integer providerType;

    /**
     * 是否支持货到付款
     */
    private Integer supportCod;

    /**
     * 镇
     */
    private String town;
    private String deliverName;
    private String deliverMobile;
    private String deliverPhone;
    private Long templateId;
    private String templateUrl;

    private Long merchantId;
    private Long shopId;
    private Integer shopType;
    /**
     * 发货主体类型：200云仓 300供应商
     */
    private Integer shipperType;
    /**
     * 发货主体ID（云仓ID/供应商ID）
     */
    private Long shipperId;
    /**
     * 状态：0停用 1启用
     */
    private Integer status;
    private Integer supportOffline;//是否支持线下打单0不支持1支持
}