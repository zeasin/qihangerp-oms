package cn.qihangerp.module.open.tao.service.impl;


import cn.qihangerp.module.open.tao.domain.TaoRefund;
import cn.qihangerp.module.open.tao.mapper.TaoGoodsSkuMapper;
import cn.qihangerp.module.open.tao.mapper.TaoRefundMapper;
import cn.qihangerp.module.open.tao.service.TaoRefundService;
import cn.qihangerp.module.open.tao.domain.TaoGoodsSku;
import cn.qihangerp.module.open.tao.domain.bo.TaoRefundBo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVoEnum;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【tao_refund(淘宝退款订单表)】的数据库操作Service实现
* @createDate 2024-02-29 19:01:45
*/
@AllArgsConstructor
@Service
public class TaoRefundServiceImpl extends ServiceImpl<TaoRefundMapper, TaoRefund>
    implements TaoRefundService {
    private final TaoGoodsSkuMapper goodsSkuMapper;
    private final TaoRefundMapper mapper;

    @Override
    public PageResult<TaoRefund> queryPageList(TaoRefundBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<TaoRefund> queryWrapper = new LambdaQueryWrapper<TaoRefund>()
                .eq(bo.getShopId()!=null,TaoRefund::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getRefundId()),TaoRefund::getRefundId,bo.getRefundId())
                .eq(StringUtils.hasText(bo.getTid()),TaoRefund::getTid,bo.getTid())
                .eq(StringUtils.hasText(bo.getDisputeType()),TaoRefund::getDisputeType,bo.getDisputeType())
                ;

        Page<TaoRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }

    @Override
    public int saveAndUpdateRefund(Long shopId, TaoRefund refund) {
        List<TaoRefund> taoRefunds = mapper.selectList(new LambdaQueryWrapper<TaoRefund>().eq(TaoRefund::getRefundId, refund.getRefundId()));
        if(taoRefunds!=null && taoRefunds.size()>0){
            // 存在，修改
            TaoRefund update = new TaoRefund();
            update.setId(taoRefunds.get(0).getId());
            if(refund.getSkuId()!=null){
                update.setSkuId(refund.getSkuId());
                List<TaoGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getSkuId, refund.getSkuId()));
                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                    update.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                    update.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                }
            }
            update.setOuterId(refund.getOuterId());
            update.setSku(refund.getSku());
            update.setTid(refund.getTid());
            update.setOid(refund.getOid());
            update.setModified(refund.getModified());
            update.setStatus(refund.getStatus());
            update.setEndTime(refund.getEndTime());
            update.setUpdateTime(new Date());
            mapper.updateById(update);
            return ResultVoEnum.DataExist.getIndex();
        }else{
            refund.setShopId(shopId);
            if(refund.getSkuId()!=null) {
                List<TaoGoodsSku> pddGoodsSku = goodsSkuMapper.selectList(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getSkuId, refund.getSkuId()));
                if (pddGoodsSku != null && !pddGoodsSku.isEmpty()) {
                    refund.setOGoodsId(pddGoodsSku.get(0).getOGoodsId());
                    refund.setOGoodsSkuId(pddGoodsSku.get(0).getOGoodsSkuId());
                }
            }
            refund.setCreateTime(new Date());
            mapper.insert(refund);
            return ResultVoEnum.SUCCESS.getIndex();
        }

    }
}




