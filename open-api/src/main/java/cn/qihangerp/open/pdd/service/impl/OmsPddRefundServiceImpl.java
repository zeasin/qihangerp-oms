package cn.qihangerp.open.pdd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import cn.qihangerp.open.pdd.domain.OmsPddRefund;
import cn.qihangerp.open.pdd.domain.bo.PddAfterSaleBo;
import cn.qihangerp.open.pdd.mapper.OmsPddOrderItemMapper;
import cn.qihangerp.open.pdd.mapper.OmsPddOrderMapper;
import cn.qihangerp.open.pdd.mapper.OmsPddRefundMapper;
import cn.qihangerp.open.pdd.service.OmsPddRefundService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
* @author TW
* @description 针对表【oms_pdd_refund(拼多多订单退款表)】的数据库操作Service实现
* @createDate 2024-06-20 16:33:28
*/
@AllArgsConstructor
@Service
public class OmsPddRefundServiceImpl extends ServiceImpl<OmsPddRefundMapper, OmsPddRefund>
    implements OmsPddRefundService{
    private final OmsPddRefundMapper mapper;
    private final OmsPddOrderMapper orderMapper;
    private final OmsPddOrderItemMapper orderItemMapper;

    @Override
    public PageResult<OmsPddRefund> queryPageList(PddAfterSaleBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsPddRefund> queryWrapper = new LambdaQueryWrapper<OmsPddRefund>()
                .eq(bo.getShopId()!=null,OmsPddRefund::getShopId,bo.getShopId())
//                .eq(bo.getCustomerExpect()!=null,OmsJdAfterSale::getCustomerExpect,bo.getCustomerExpect())
//                .eq(bo.getOrderId()!=null,OmsJdAfterSale::getOrderId,bo.getOrderId())
//                .eq(StringUtils.hasText(bo.getServiceId()),OmsJdAfterSale::getServiceId,bo.getServiceId())
                ;

        Page<OmsPddRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveRefund(Long shopId, OmsPddRefund refund){
        OmsPddRefund origin = mapper.selectById(refund.getId());
        if(origin!=null){
            // 存在，修改
            OmsPddRefund update = new OmsPddRefund();
            update.setId(origin.getId());
            update.setOrderSn(refund.getOrderSn());
            update.setAfterSalesStatus(refund.getAfterSalesStatus());
            update.setDisputeRefundStatus(refund.getDisputeRefundStatus());
            update.setRefundAmount(refund.getRefundAmount());
            update.setRefundOperatorRole(refund.getRefundOperatorRole());
            update.setShippingName(refund.getShippingName());
            update.setTrackingNumber(refund.getTrackingNumber());
            update.setSpeedRefundFlag(refund.getSpeedRefundFlag());
            update.setSpeedRefundStatus(refund.getSpeedRefundStatus());
            update.setUpdatedTime(refund.getUpdatedTime());
            update.setUpdateTime(new Date());
            mapper.updateById(update);
            return ResultVo.error(ResultVoEnum.DataExist, "退款已经存在，更新成功");

        }else{
            refund.setShopId(shopId);
            refund.setCreateTime(new Date());
            mapper.insert(refund);
            return ResultVo.success();
        }

    }
}




