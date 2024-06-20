package com.qihang.dou.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.dou.domain.OmsDouRefund;
import com.qihang.dou.domain.bo.DouRefundBo;
import com.qihang.dou.service.OmsDouRefundService;
import com.qihang.dou.mapper.OmsDouRefundMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【oms_dou_refund(抖店退款表)】的数据库操作Service实现
* @createDate 2024-06-20 16:59:03
*/
@AllArgsConstructor
@Service
public class OmsDouRefundServiceImpl extends ServiceImpl<OmsDouRefundMapper, OmsDouRefund>
    implements OmsDouRefundService{
    private final OmsDouRefundMapper mapper;

    @Override
    public PageResult<OmsDouRefund> queryPageList(DouRefundBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsDouRefund> queryWrapper = new LambdaQueryWrapper<OmsDouRefund>()
                .eq(bo.getShopId()!=null,OmsDouRefund::getShopId,bo.getShopId())
//                .eq(bo.getCustomerExpect()!=null,OmsJdAfterSale::getCustomerExpect,bo.getCustomerExpect())
//                .eq(bo.getOrderId()!=null,OmsJdAfterSale::getOrderId,bo.getOrderId())
//                .eq(StringUtils.hasText(bo.getServiceId()),OmsJdAfterSale::getServiceId,bo.getServiceId())
                ;

        Page<OmsDouRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveRefund(Long shopId, OmsDouRefund refund){
        List<OmsDouRefund> origin = mapper.selectList(new LambdaQueryWrapper<OmsDouRefund>().eq(OmsDouRefund::getAftersaleId,refund.getAftersaleId()));
        if(origin!=null&&origin.size()>0){
            // 存在，修改
            OmsDouRefund update = new OmsDouRefund();
            update.setId(origin.get(0).getId());
            update.setAftersaleOrderType(refund.getAftersaleOrderType());
            update.setAftersaleType(refund.getAftersaleType());
            update.setAftersaleStatus(refund.getAftersaleStatus());
            update.setAftersaleStatusToFinalTime(refund.getAftersaleStatusToFinalTime());
            update.setOrderStatus(refund.getOrderStatus());
            update.setUpdateTime(refund.getUpdateTime());
            update.setStatusDeadline(refund.getStatusDeadline());
            update.setRefundAmount(refund.getRefundAmount());
            update.setRefundPostAmount(refund.getRefundPostAmount());
            update.setAftersaleNum(refund.getAftersaleNum());
            update.setPartType(refund.getPartType());
            update.setAftersaleRefundType(refund.getAftersaleRefundType());
            update.setRefundType(refund.getRefundType());
            update.setArbitrateStatus(refund.getArbitrateStatus());
            update.setRefundStatus(refund.getRefundStatus());
            update.setRiskDecisionReason(refund.getRiskDecisionReason());
            update.setRiskDecisionDescription(refund.getRiskDecisionDescription());
            update.setArbitrateBlame(refund.getArbitrateBlame());
            update.setReturnLogisticsCode(refund.getReturnLogisticsCode());
            update.setReturnLogisticsCompanyName(refund.getReturnLogisticsCompanyName());
            update.setExchangeSkuInfo(refund.getExchangeSkuInfo());
            update.setExchangeLogisticsCompanyName(refund.getExchangeLogisticsCompanyName());
            update.setRemark(refund.getRemark());
            update.setGotPkg(refund.getGotPkg());
            update.setIsAgreeRefuseSign(refund.getIsAgreeRefuseSign());
            update.setOrderLogistics(refund.getOrderLogistics());
            update.setAftersaleTags(refund.getAftersaleTags());
            update.setAftersaleSubType(refund.getAftersaleSubType());
            update.setAutoAuditBits(refund.getAutoAuditBits());
            update.setTextPart(refund.getTextPart());
            update.setRelatedOrderInfo(refund.getRelatedOrderInfo());
            update.setPullLastTime(new Date());
            mapper.updateById(update);
            return ResultVo.error(ResultVoEnum.DataExist, "退款已经存在，更新成功");

        }else{
            refund.setShopId(shopId);
            refund.setPullTime(new Date());
            mapper.insert(refund);
            return ResultVo.success();
        }

    }
}




