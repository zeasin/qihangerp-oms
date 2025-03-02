package cn.qihangerp.module.open.jd.service.impl;

import cn.qihangerp.module.open.jd.domain.JdVcGoods;
import cn.qihangerp.module.open.jd.domain.JdVcRefund;
import cn.qihangerp.module.open.jd.domain.bo.JdVcRefundBo;
import cn.qihangerp.module.open.jd.mapper.JdVcGoodsMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.module.open.jd.service.JdVcRefundService;
import cn.qihangerp.module.open.jd.mapper.JdVcRefundMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【jd_vc_refund(京东自营退款表)】的数据库操作Service实现
* @createDate 2024-05-31 15:25:05
*/
@AllArgsConstructor
@Service
public class JdVcRefundServiceImpl extends ServiceImpl<JdVcRefundMapper, JdVcRefund>
    implements JdVcRefundService{
    private final  JdVcRefundMapper mapper;
    private final JdVcGoodsMapper goodsMapper;
    @Override
    public PageResult<JdVcRefund> queryPageList(JdVcRefundBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<JdVcRefund> queryWrapper = new LambdaQueryWrapper<JdVcRefund>()
                .eq(bo.getShopId()!=null,JdVcRefund::getShopId,bo.getShopId())
                .eq(bo.getId()!=null,JdVcRefund::getId,bo.getId())
                .eq(bo.getCustomOrderId()!=null,JdVcRefund::getCustomOrderId,bo.getCustomOrderId())
                ;
        if(bo.getCustomerExpect()!=null){
            if(bo.getCustomerExpect()==11){
//                queryWrapper.and().eq(JdVcRefund::getOrderState,29).eq(JdVcRefund::getOperatorState,5)
                queryWrapper.and(x->x.eq(JdVcRefund::getOrderState,29).and(y->y.eq(JdVcRefund::getOperatorState,5).or().eq(JdVcRefund::getOperatorState,10)));
            } else if (bo.getCustomerExpect()==10) {
                queryWrapper.and(x->x.eq(JdVcRefund::getOrderState,29).eq(JdVcRefund::getOperatorState,16));
            }
        }

        Page<JdVcRefund> page = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(page);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveRefund(Long shopId, JdVcRefund jdVcRefund) {
        List<JdVcRefund> jdVcReturns = mapper.selectList(new LambdaQueryWrapper<JdVcRefund>().eq(JdVcRefund::getId, jdVcRefund.getId()));
        if(jdVcReturns== null||jdVcReturns.size()==0){
            // 不存在，新增
            List<JdVcGoods> jdGoodsSkus = goodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, jdVcRefund.getSkuId()));
            if(!jdGoodsSkus.isEmpty()){
                jdVcRefund.setOGoodsId(jdGoodsSkus.get(0).getOGoodsId());
                jdVcRefund.setOGoodsSkuId(jdGoodsSkus.get(0).getOGoodsSkuId());
            }
            jdVcRefund.setShopId(shopId);
            jdVcRefund.setCreateTime(new Date());
            mapper.insert(jdVcRefund);
            return ResultVo.success();

        }else {
            // 存在，修改
            JdVcRefund update= new JdVcRefund();
            update.setId(jdVcReturns.get(0).getId());
            List<JdVcGoods> jdGoodsSkus = goodsMapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, jdVcRefund.getSkuId()));
            if(!jdGoodsSkus.isEmpty()){
                update.setOGoodsId(jdGoodsSkus.get(0).getOGoodsId());
                update.setOGoodsSkuId(jdGoodsSkus.get(0).getOGoodsSkuId());
            }
            update.setModifiedDate(jdVcRefund.getModifiedDate());
            update.setApprovalState(jdVcRefund.getApprovalState());
            update.setOrderState(jdVcRefund.getOrderState());
            update.setOperatorState(jdVcRefund.getOperatorState());
            update.setApprovalSuggestion(jdVcRefund.getApprovalSuggestion());
            update.setUpdateTime(new Date());
            mapper.updateById(update);

            return ResultVo.error(ResultVoEnum.DataExist, "已经存在，更新");
        }

    }
}




