//package cn.qihangerp.jd.domain;
//
//import java.io.Serializable;
//import java.math.BigDecimal;
//import java.util.Date;
//import java.util.List;
//
//import com.baomidou.mybatisplus.annotation.TableField;
//import lombok.Data;
//
///**
// * 京东自营采购订单表
// * @TableName jd_vc_purchase_order
// */
//@Data
//public class JdVcPurchaseOrder implements Serializable {
//    /**
//     *
//     */
//    private Long id;
//
//    /**
//     * 采购单号
//     */
//    private Long orderId;
//
//    /**
//     * 顾客单号（只有EPT采购单才有）
//     */
//    private Long customOrderId;
//
//    /**
//     * 订购时间
//     */
//    private Date createdDate;
//
//    /**
//     * 供应商简码
//     */
//    private String providerCode;
//
//    /**
//     * 供应商名称
//     */
//    private String providerName;
//
//    /**
//     * 采购总金额
//     */
//    private BigDecimal totalPrice;
//
//    /**
//     * 配送中心ID（订购城市ID）
//     */
//    private Integer deliverCenterId;
//
//    /**
//     * 配送中心名称（订购城市名称）
//     */
//    private String deliverCenterName;
//
//    /**
//     * 采购员姓名
//     */
//    private String purchaserName;
//
//    /**
//     * 采购员京东ERP账号
//     */
//    private String purchaserErpCode;
//
//    /**
//     * 删除状态ID:未删除
//     */
//    private Integer status;
//
//    /**
//     * 删除状态名称
//     */
//    private String statusName;
//
//    /**
//     * 是否EPT定制(true:是;false:不是)
//     */
//    private String isEptCustomized;
//
//    /**
//     * 订单状态3：订单完成
//     */
//    private Integer state;
//
//    /**
//     * 订单状态名称
//     */
//    private String stateName;
//
//    /**
//     * 完成日期（订单完成后取updateDate，否则为空）
//     */
//    private Date completeDate;
//
//    /**
//     * 更新时间
//     */
//    private Date updateDate;
//
//    /**
//     * 账期
//     */
//    private Integer accountPeriod;
//
//    /**
//     * 收货负责人
//     */
//    private String receiverName;
//
//    /**
//     * 收货电话
//     */
//    private String warehousePhone;
//
//    /**
//     * 详细地址
//     */
//    private String address;
//
//    /**
//     * 采购类型
//     */
//    private Integer orderType;
//
//    /**
//     * 采购类型名称
//     */
//    private String orderTypeName;
//
//    /**
//     * 订单属性
//     */
//    private Integer orderAttribute;
//
//    /**
//     * 订单属性名称
//     */
//    private String orderAttributeName;
//
//    /**
//     * 回告状态ID：回告成功
//     */
//    private Integer confirmState;
//
//    /**
//     * 回告状态名称
//     */
//    private String confirmStateName;
//
//    /**
//     * 品总数量（sku为维度）
//     */
//    private Integer wareVariety;
//
//    /**
//     * 预计到货时间
//     */
//    private Date deliveryTime;
//
//    /**
//     * 是否可回告（true:可回告;false:不可回告）
//     */
//    private Boolean isCanConfirm;
//
//    /**
//     * 是否有差异（0 表示存在差异 ）
//     */
//    private Integer isExistActualNumDif;
//
//    /**
//     * 是否已结算（true:是;false:否）
//     */
//    private Boolean balanceStatus;
//
//    /**
//     * 入库时间
//     */
//    private Date storageTime;
//
//    /**
//     * TC转运标识：0:否,1:是
//     */
//    private Integer tcFlag;
//
//    /**
//     * TC转运标识显示
//     */
//    private String tcFlagName;
//
//    /**
//     * 预约时间
//     */
//    private Date bookTime;
//
//    /**
//     * 店铺id
//     */
//    private Long shopId;
//
//    /**
//     * 系统创建时间
//     */
//    private Date createTime;
//
//    /**
//     * 系统更新时间
//     */
//    private Date updateTime;
//
//    @TableField(exist = false)
//    private List<JdVcPurchaseOrderItem> items;
//    private static final long serialVersionUID = 1L;
//}