package com.qihang.jd.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 京东售后
 * @TableName jd_order_after
 */
public class JdOrderAfter implements Serializable {
    /**
     * 
     */
    private Long id;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 申请单号
     */
    private Long applyId;

    /**
     * 服务单号
     */
    private Long serviceId;

    /**
     * 申请时间
     */
    private Date applyTime;

    /**
     * 客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
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
     * 订单号
     */
    private Long orderId;

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

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public Long getId() {
        return id;
    }

    /**
     * 
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 店铺id
     */
    public Integer getShopId() {
        return shopId;
    }

    /**
     * 店铺id
     */
    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    /**
     * 申请单号
     */
    public Long getApplyId() {
        return applyId;
    }

    /**
     * 申请单号
     */
    public void setApplyId(Long applyId) {
        this.applyId = applyId;
    }

    /**
     * 服务单号
     */
    public Long getServiceId() {
        return serviceId;
    }

    /**
     * 服务单号
     */
    public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }

    /**
     * 申请时间
     */
    public Date getApplyTime() {
        return applyTime;
    }

    /**
     * 申请时间
     */
    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
    }

    /**
     * 客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
     */
    public Integer getCustomerExpect() {
        return customerExpect;
    }

    /**
     * 客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)
     */
    public void setCustomerExpect(Integer customerExpect) {
        this.customerExpect = customerExpect;
    }

    /**
     * 客户期望名称
     */
    public String getCustomerExpectName() {
        return customerExpectName;
    }

    /**
     * 客户期望名称
     */
    public void setCustomerExpectName(String customerExpectName) {
        this.customerExpectName = customerExpectName;
    }

    /**
     * 服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
     */
    public Integer getServiceStatus() {
        return serviceStatus;
    }

    /**
     * 服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）
     */
    public void setServiceStatus(Integer serviceStatus) {
        this.serviceStatus = serviceStatus;
    }

    /**
     * 服务单状态名称
     */
    public String getServiceStatusName() {
        return serviceStatusName;
    }

    /**
     * 服务单状态名称
     */
    public void setServiceStatusName(String serviceStatusName) {
        this.serviceStatusName = serviceStatusName;
    }

    /**
     * 客户账号
     */
    public String getCustomerPin() {
        return customerPin;
    }

    /**
     * 客户账号
     */
    public void setCustomerPin(String customerPin) {
        this.customerPin = customerPin;
    }

    /**
     * 客户姓名
     */
    public String getCustomerName() {
        return customerName;
    }

    /**
     * 客户姓名
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    /**
     * 用户电话
     */
    public String getCustomerTel() {
        return customerTel;
    }

    /**
     * 用户电话
     */
    public void setCustomerTel(String customerTel) {
        this.customerTel = customerTel;
    }

    /**
     * 取件地址
     */
    public String getPickwareAddress() {
        return pickwareAddress;
    }

    /**
     * 取件地址
     */
    public void setPickwareAddress(String pickwareAddress) {
        this.pickwareAddress = pickwareAddress;
    }

    /**
     * 取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)
     */
    public Integer getPickwareType() {
        return pickwareType;
    }

    /**
     * 取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)
     */
    public void setPickwareType(Integer pickwareType) {
        this.pickwareType = pickwareType;
    }

    /**
     * 订单号
     */
    public Long getOrderId() {
        return orderId;
    }

    /**
     * 订单号
     */
    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    /**
     * 订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)
     */
    public Integer getOrderType() {
        return orderType;
    }

    /**
     * 订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)
     */
    public void setOrderType(Integer orderType) {
        this.orderType = orderType;
    }

    /**
     * 订单类型名称
     */
    public String getOrderTypeName() {
        return orderTypeName;
    }

    /**
     * 订单类型名称
     */
    public void setOrderTypeName(String orderTypeName) {
        this.orderTypeName = orderTypeName;
    }

    /**
     * 实付金额
     */
    public BigDecimal getActualPayPrice() {
        return actualPayPrice;
    }

    /**
     * 实付金额
     */
    public void setActualPayPrice(BigDecimal actualPayPrice) {
        this.actualPayPrice = actualPayPrice;
    }

    /**
     * 商品编号
     */
    public Long getSkuId() {
        return skuId;
    }

    /**
     * 商品编号
     */
    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    /**
     * 售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)
     */
    public Integer getWareType() {
        return wareType;
    }

    /**
     * 售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)
     */
    public void setWareType(Integer wareType) {
        this.wareType = wareType;
    }

    /**
     * 商品类型名称
     */
    public String getWareTypeName() {
        return wareTypeName;
    }

    /**
     * 商品类型名称
     */
    public void setWareTypeName(String wareTypeName) {
        this.wareTypeName = wareTypeName;
    }

    /**
     * 商品名称
     */
    public String getWareName() {
        return wareName;
    }

    /**
     * 商品名称
     */
    public void setWareName(String wareName) {
        this.wareName = wareName;
    }

    /**
     * 商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)
     */
    public Integer getSkuType() {
        return skuType;
    }

    /**
     * 商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)
     */
    public void setSkuType(Integer skuType) {
        this.skuType = skuType;
    }

    /**
     * skuType对应名称
     */
    public String getSkuTypeName() {
        return skuTypeName;
    }

    /**
     * skuType对应名称
     */
    public void setSkuTypeName(String skuTypeName) {
        this.skuTypeName = skuTypeName;
    }

    /**
     * 审核人账号
     */
    public String getApprovePin() {
        return approvePin;
    }

    /**
     * 审核人账号
     */
    public void setApprovePin(String approvePin) {
        this.approvePin = approvePin;
    }

    /**
     * 审核人姓名
     */
    public String getApproveName() {
        return approveName;
    }

    /**
     * 审核人姓名
     */
    public void setApproveName(String approveName) {
        this.approveName = approveName;
    }

    /**
     * 审核时间
     */
    public Date getApproveTime() {
        return approveTime;
    }

    /**
     * 审核时间
     */
    public void setApproveTime(Date approveTime) {
        this.approveTime = approveTime;
    }

    /**
     * 审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)
     */
    public Integer getApproveResult() {
        return approveResult;
    }

    /**
     * 审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)
     */
    public void setApproveResult(Integer approveResult) {
        this.approveResult = approveResult;
    }

    /**
     * 审核结果名称
     */
    public String getApproveResultName() {
        return approveResultName;
    }

    /**
     * 审核结果名称
     */
    public void setApproveResultName(String approveResultName) {
        this.approveResultName = approveResultName;
    }

    /**
     * 处理人账号
     */
    public String getProcessPin() {
        return processPin;
    }

    /**
     * 处理人账号
     */
    public void setProcessPin(String processPin) {
        this.processPin = processPin;
    }

    /**
     * 处理人姓名
     */
    public String getProcessName() {
        return processName;
    }

    /**
     * 处理人姓名
     */
    public void setProcessName(String processName) {
        this.processName = processName;
    }

    /**
     * 处理时间
     */
    public Date getProcessTime() {
        return processTime;
    }

    /**
     * 处理时间
     */
    public void setProcessTime(Date processTime) {
        this.processTime = processTime;
    }

    /**
     * 处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)
     */
    public Integer getProcessResult() {
        return processResult;
    }

    /**
     * 处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)
     */
    public void setProcessResult(Integer processResult) {
        this.processResult = processResult;
    }

    /**
     * 处理结果名称
     */
    public String getProcessResultName() {
        return processResultName;
    }

    /**
     * 处理结果名称
     */
    public void setProcessResultName(String processResultName) {
        this.processResultName = processResultName;
    }

    /**
     * 平台来源
     */
    public Integer getPlatformSrc() {
        return platformSrc;
    }

    /**
     * 平台来源
     */
    public void setPlatformSrc(Integer platformSrc) {
        this.platformSrc = platformSrc;
    }

    /**
     * 平台来源名称
     */
    public String getPlatformSrcName() {
        return platformSrcName;
    }

    /**
     * 平台来源名称
     */
    public void setPlatformSrcName(String platformSrcName) {
        this.platformSrcName = platformSrcName;
    }

    /**
     * 服务单售后数量
     */
    public Integer getServiceCount() {
        return serviceCount;
    }

    /**
     * 服务单售后数量
     */
    public void setServiceCount(Integer serviceCount) {
        this.serviceCount = serviceCount;
    }

    /**
     * 用户电话
     */
    public String getDesenCustomerTel() {
        return desenCustomerTel;
    }

    /**
     * 用户电话
     */
    public void setDesenCustomerTel(String desenCustomerTel) {
        this.desenCustomerTel = desenCustomerTel;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        JdOrderAfter other = (JdOrderAfter) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getShopId() == null ? other.getShopId() == null : this.getShopId().equals(other.getShopId()))
            && (this.getApplyId() == null ? other.getApplyId() == null : this.getApplyId().equals(other.getApplyId()))
            && (this.getServiceId() == null ? other.getServiceId() == null : this.getServiceId().equals(other.getServiceId()))
            && (this.getApplyTime() == null ? other.getApplyTime() == null : this.getApplyTime().equals(other.getApplyTime()))
            && (this.getCustomerExpect() == null ? other.getCustomerExpect() == null : this.getCustomerExpect().equals(other.getCustomerExpect()))
            && (this.getCustomerExpectName() == null ? other.getCustomerExpectName() == null : this.getCustomerExpectName().equals(other.getCustomerExpectName()))
            && (this.getServiceStatus() == null ? other.getServiceStatus() == null : this.getServiceStatus().equals(other.getServiceStatus()))
            && (this.getServiceStatusName() == null ? other.getServiceStatusName() == null : this.getServiceStatusName().equals(other.getServiceStatusName()))
            && (this.getCustomerPin() == null ? other.getCustomerPin() == null : this.getCustomerPin().equals(other.getCustomerPin()))
            && (this.getCustomerName() == null ? other.getCustomerName() == null : this.getCustomerName().equals(other.getCustomerName()))
            && (this.getCustomerTel() == null ? other.getCustomerTel() == null : this.getCustomerTel().equals(other.getCustomerTel()))
            && (this.getPickwareAddress() == null ? other.getPickwareAddress() == null : this.getPickwareAddress().equals(other.getPickwareAddress()))
            && (this.getPickwareType() == null ? other.getPickwareType() == null : this.getPickwareType().equals(other.getPickwareType()))
            && (this.getOrderId() == null ? other.getOrderId() == null : this.getOrderId().equals(other.getOrderId()))
            && (this.getOrderType() == null ? other.getOrderType() == null : this.getOrderType().equals(other.getOrderType()))
            && (this.getOrderTypeName() == null ? other.getOrderTypeName() == null : this.getOrderTypeName().equals(other.getOrderTypeName()))
            && (this.getActualPayPrice() == null ? other.getActualPayPrice() == null : this.getActualPayPrice().equals(other.getActualPayPrice()))
            && (this.getSkuId() == null ? other.getSkuId() == null : this.getSkuId().equals(other.getSkuId()))
            && (this.getWareType() == null ? other.getWareType() == null : this.getWareType().equals(other.getWareType()))
            && (this.getWareTypeName() == null ? other.getWareTypeName() == null : this.getWareTypeName().equals(other.getWareTypeName()))
            && (this.getWareName() == null ? other.getWareName() == null : this.getWareName().equals(other.getWareName()))
            && (this.getSkuType() == null ? other.getSkuType() == null : this.getSkuType().equals(other.getSkuType()))
            && (this.getSkuTypeName() == null ? other.getSkuTypeName() == null : this.getSkuTypeName().equals(other.getSkuTypeName()))
            && (this.getApprovePin() == null ? other.getApprovePin() == null : this.getApprovePin().equals(other.getApprovePin()))
            && (this.getApproveName() == null ? other.getApproveName() == null : this.getApproveName().equals(other.getApproveName()))
            && (this.getApproveTime() == null ? other.getApproveTime() == null : this.getApproveTime().equals(other.getApproveTime()))
            && (this.getApproveResult() == null ? other.getApproveResult() == null : this.getApproveResult().equals(other.getApproveResult()))
            && (this.getApproveResultName() == null ? other.getApproveResultName() == null : this.getApproveResultName().equals(other.getApproveResultName()))
            && (this.getProcessPin() == null ? other.getProcessPin() == null : this.getProcessPin().equals(other.getProcessPin()))
            && (this.getProcessName() == null ? other.getProcessName() == null : this.getProcessName().equals(other.getProcessName()))
            && (this.getProcessTime() == null ? other.getProcessTime() == null : this.getProcessTime().equals(other.getProcessTime()))
            && (this.getProcessResult() == null ? other.getProcessResult() == null : this.getProcessResult().equals(other.getProcessResult()))
            && (this.getProcessResultName() == null ? other.getProcessResultName() == null : this.getProcessResultName().equals(other.getProcessResultName()))
            && (this.getPlatformSrc() == null ? other.getPlatformSrc() == null : this.getPlatformSrc().equals(other.getPlatformSrc()))
            && (this.getPlatformSrcName() == null ? other.getPlatformSrcName() == null : this.getPlatformSrcName().equals(other.getPlatformSrcName()))
            && (this.getServiceCount() == null ? other.getServiceCount() == null : this.getServiceCount().equals(other.getServiceCount()))
            && (this.getDesenCustomerTel() == null ? other.getDesenCustomerTel() == null : this.getDesenCustomerTel().equals(other.getDesenCustomerTel()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getShopId() == null) ? 0 : getShopId().hashCode());
        result = prime * result + ((getApplyId() == null) ? 0 : getApplyId().hashCode());
        result = prime * result + ((getServiceId() == null) ? 0 : getServiceId().hashCode());
        result = prime * result + ((getApplyTime() == null) ? 0 : getApplyTime().hashCode());
        result = prime * result + ((getCustomerExpect() == null) ? 0 : getCustomerExpect().hashCode());
        result = prime * result + ((getCustomerExpectName() == null) ? 0 : getCustomerExpectName().hashCode());
        result = prime * result + ((getServiceStatus() == null) ? 0 : getServiceStatus().hashCode());
        result = prime * result + ((getServiceStatusName() == null) ? 0 : getServiceStatusName().hashCode());
        result = prime * result + ((getCustomerPin() == null) ? 0 : getCustomerPin().hashCode());
        result = prime * result + ((getCustomerName() == null) ? 0 : getCustomerName().hashCode());
        result = prime * result + ((getCustomerTel() == null) ? 0 : getCustomerTel().hashCode());
        result = prime * result + ((getPickwareAddress() == null) ? 0 : getPickwareAddress().hashCode());
        result = prime * result + ((getPickwareType() == null) ? 0 : getPickwareType().hashCode());
        result = prime * result + ((getOrderId() == null) ? 0 : getOrderId().hashCode());
        result = prime * result + ((getOrderType() == null) ? 0 : getOrderType().hashCode());
        result = prime * result + ((getOrderTypeName() == null) ? 0 : getOrderTypeName().hashCode());
        result = prime * result + ((getActualPayPrice() == null) ? 0 : getActualPayPrice().hashCode());
        result = prime * result + ((getSkuId() == null) ? 0 : getSkuId().hashCode());
        result = prime * result + ((getWareType() == null) ? 0 : getWareType().hashCode());
        result = prime * result + ((getWareTypeName() == null) ? 0 : getWareTypeName().hashCode());
        result = prime * result + ((getWareName() == null) ? 0 : getWareName().hashCode());
        result = prime * result + ((getSkuType() == null) ? 0 : getSkuType().hashCode());
        result = prime * result + ((getSkuTypeName() == null) ? 0 : getSkuTypeName().hashCode());
        result = prime * result + ((getApprovePin() == null) ? 0 : getApprovePin().hashCode());
        result = prime * result + ((getApproveName() == null) ? 0 : getApproveName().hashCode());
        result = prime * result + ((getApproveTime() == null) ? 0 : getApproveTime().hashCode());
        result = prime * result + ((getApproveResult() == null) ? 0 : getApproveResult().hashCode());
        result = prime * result + ((getApproveResultName() == null) ? 0 : getApproveResultName().hashCode());
        result = prime * result + ((getProcessPin() == null) ? 0 : getProcessPin().hashCode());
        result = prime * result + ((getProcessName() == null) ? 0 : getProcessName().hashCode());
        result = prime * result + ((getProcessTime() == null) ? 0 : getProcessTime().hashCode());
        result = prime * result + ((getProcessResult() == null) ? 0 : getProcessResult().hashCode());
        result = prime * result + ((getProcessResultName() == null) ? 0 : getProcessResultName().hashCode());
        result = prime * result + ((getPlatformSrc() == null) ? 0 : getPlatformSrc().hashCode());
        result = prime * result + ((getPlatformSrcName() == null) ? 0 : getPlatformSrcName().hashCode());
        result = prime * result + ((getServiceCount() == null) ? 0 : getServiceCount().hashCode());
        result = prime * result + ((getDesenCustomerTel() == null) ? 0 : getDesenCustomerTel().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", shopId=").append(shopId);
        sb.append(", applyId=").append(applyId);
        sb.append(", serviceId=").append(serviceId);
        sb.append(", applyTime=").append(applyTime);
        sb.append(", customerExpect=").append(customerExpect);
        sb.append(", customerExpectName=").append(customerExpectName);
        sb.append(", serviceStatus=").append(serviceStatus);
        sb.append(", serviceStatusName=").append(serviceStatusName);
        sb.append(", customerPin=").append(customerPin);
        sb.append(", customerName=").append(customerName);
        sb.append(", customerTel=").append(customerTel);
        sb.append(", pickwareAddress=").append(pickwareAddress);
        sb.append(", pickwareType=").append(pickwareType);
        sb.append(", orderId=").append(orderId);
        sb.append(", orderType=").append(orderType);
        sb.append(", orderTypeName=").append(orderTypeName);
        sb.append(", actualPayPrice=").append(actualPayPrice);
        sb.append(", skuId=").append(skuId);
        sb.append(", wareType=").append(wareType);
        sb.append(", wareTypeName=").append(wareTypeName);
        sb.append(", wareName=").append(wareName);
        sb.append(", skuType=").append(skuType);
        sb.append(", skuTypeName=").append(skuTypeName);
        sb.append(", approvePin=").append(approvePin);
        sb.append(", approveName=").append(approveName);
        sb.append(", approveTime=").append(approveTime);
        sb.append(", approveResult=").append(approveResult);
        sb.append(", approveResultName=").append(approveResultName);
        sb.append(", processPin=").append(processPin);
        sb.append(", processName=").append(processName);
        sb.append(", processTime=").append(processTime);
        sb.append(", processResult=").append(processResult);
        sb.append(", processResultName=").append(processResultName);
        sb.append(", platformSrc=").append(platformSrc);
        sb.append(", platformSrcName=").append(platformSrcName);
        sb.append(", serviceCount=").append(serviceCount);
        sb.append(", desenCustomerTel=").append(desenCustomerTel);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}