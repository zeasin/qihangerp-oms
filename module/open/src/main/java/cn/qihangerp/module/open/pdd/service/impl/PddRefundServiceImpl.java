package cn.qihangerp.module.open.pdd.service.impl;


import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.PddRefund;
import cn.qihangerp.module.open.pdd.domain.bo.PddRefundBo;
import cn.qihangerp.module.open.pdd.mapper.PddGoodsSkuMapper;
import cn.qihangerp.module.open.pdd.mapper.PddRefundMapper;
import cn.qihangerp.module.open.pdd.service.PddRefundService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【pdd_refund(拼多多订单退款表)】的数据库操作Service实现
* @createDate 2024-06-06 09:48:28
*/
@AllArgsConstructor
@Service
public class PddRefundServiceImpl extends ServiceImpl<PddRefundMapper, PddRefund>
    implements PddRefundService {
    private final PddRefundMapper mapper;
    private final PddGoodsSkuMapper goodsSkuMapper;
    @Override
    public PageResult<PddRefund> queryPageList(PddRefundBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<PddRefund> queryWrapper = new LambdaQueryWrapper<PddRefund>()
                .eq(bo.getShopId()!=null,PddRefund::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getRefundId()),PddRefund::getId,bo.getRefundId())
                .eq(StringUtils.hasText(bo.getOrderSn()),PddRefund::getOrderSn,bo.getOrderSn())
                .eq(StringUtils.hasText(bo.getAfterSalesType()),PddRefund::getAfterSalesType,bo.getAfterSalesType())
                ;

        Page<PddRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }
    @Override
    public ResultVo<Integer>  saveRefund(Long shopId, PddRefund refund){
        PddRefund origin = mapper.selectById(refund.getId());
        if(origin!=null){
            // 存在，修改
            PddRefund update = new PddRefund();
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
            List<PddGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, refund.getSkuId()));
            if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                refund.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                refund.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
            }
            return ResultVo.error(ResultVoEnum.DataExist, "退款已经存在，更新成功");

        }else{
            List<PddGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getSkuId, refund.getSkuId()));
            if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                refund.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                refund.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
            }
            refund.setShopId(shopId);
            refund.setCreateTime(new Date());
            mapper.insert(refund);
            return ResultVo.success();
        }

    }
}




