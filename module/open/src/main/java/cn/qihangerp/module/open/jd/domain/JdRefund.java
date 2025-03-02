package cn.qihangerp.module.open.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * 京东退款与售后表
 * @TableName oms_jd_after_sale
 */
@TableName("oms_jd_refund")
@Data
public class JdRefund implements Serializable {
    /**
     * 
     */
    private String id;

    /**
     * 店铺id
     */
    private Long shopId;

    /**
     * 申请单号
     */
    private Long applyId;

    /**
     * 服务单号（退款单id）
     */
    private Long serviceId;

    /**
     * 退款单id
     */
    private Long refundId;

    /**
     * 订单号
     */
    private String orderId;

    /**
     * 申请时间
     */
    private String applyTime;

    /**
     * 退款金额(单位分)
     */
    private Double applyRefundSum;

    /**
     * 客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
     */
    private Integer customerExpect;

    /**
     * 客户期望名称
     */
    private String customerExpectName;

    /**
     * 服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
     */
    private Integer serviceStatus;

    /**
     * 服务单状态名称
     */
    private String serviceStatusName;

    /**
     * 客户账号
     */
    private String customerPin;

    /**
     * 客户姓名
     */
    private String customerName;

    /**
     * 用户电话
     */
    private String customerTel;

    /**
     * 取件地址
     */
    private String pickwareAddress;

    /**
     * 取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)
     */
    private Integer pickwareType;

    /**
     * 订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)
     */
    private Integer orderType;

    /**
     * 订单类型名称
     */
    private String orderTypeName;

    /**
     * 实付金额
     */
    private BigDecimal actualPayPrice;

    /**
     * 商品编号
     */
    private Long skuId;
    private Long wareId;

    /**
     * 售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)
     */
    private Integer wareType;

    /**
     * 商品类型名称
     */
    private String wareTypeName;

    /**
     * 商品名称
     */
    private String wareName;

    /**
     * 商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)
     */
    private Integer skuType;

    /**
     * skuType对应名称
     */
    private String skuTypeName;

    /**
     * 审核人账号
     */
    private String approvePin;

    /**
     * 审核人姓名
     */
    private String approveName;

    /**
     * 审核时间
     */
    private Date approveTime;

    /**
     * 审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)
     */
    private Integer approveResult;

    /**
     * 审核结果名称
     */
    private String approveResultName;

    /**
     * 处理人账号
     */
    private String processPin;

    /**
     * 处理人姓名
     */
    private String processName;

    /**
     * 处理时间
     */
    private Date processTime;

    /**
     * 处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)
     */
    private Integer processResult;

    /**
     * 处理结果名称
     */
    private String processResultName;

    /**
     * 平台来源
     */
    private Integer platformSrc;

    /**
     * 平台来源名称
     */
    private String platformSrcName;

    /**
     * 服务单售后数量
     */
    private Integer serviceCount;

    /**
     * 用户电话
     */
    private String desenCustomerTel;

    /**
     * 客户帐号
     */
    private String buyerId;

    /**
     * 客户姓名
     */
    private String buyerName;

    /**
     * 审核日期
     */
    private String refundCheckTime;

    /**
     * 退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过
     */
    private Integer refundStatus;

    /**
     * 审核人
     */
    private String refundCheckUsername;

    /**
     * 审核备注
     */
    private String refundCheckRemark;

    /**
     * 退款原因
     */
    private String refundReason;

    /**
     *  退款来源(10:客服; 11:网站; 12:配送拒收; 28:APP; 87:分拣中心,逆向物流; 98:微信手Q;)
     */
    private Integer refundSystemId;

    /**
     * 订单创建时间
     */
    private Date createTime;

    /**
     * 创建人
     */
    private String createBy;

    /**
     * 更新人
     */
    private String updateBy;

    /**
     * 更新时间
     */
    private Date updateTime;

    /**
     * 商品id(o_goods外键)
     */
    private String oGoodsId;

    /**
     * 商品skuid(o_goods_sku外键)
     */
    private Long oGoodsSkuId;

    /**
     * 商品明细列表JSON
     */
    private String skuList;
    private Integer skuCount;
    private Date refundCompleteTime;
    private String approveNotes;
    private String questionDesc;

    private static final long serialVersionUID = 1L;
}