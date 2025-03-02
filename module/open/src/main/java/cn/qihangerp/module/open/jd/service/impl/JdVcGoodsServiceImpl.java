package cn.qihangerp.module.open.jd.service.impl;

import cn.qihangerp.module.open.jd.domain.JdVcGoods;
import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import cn.qihangerp.module.open.jd.mapper.JdVcGoodsMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.open.jd.service.JdVcGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【jd_vc_goods】的数据库操作Service实现
* @createDate 2024-05-25 15:31:46
*/
@AllArgsConstructor
@Service
public class JdVcGoodsServiceImpl extends ServiceImpl<JdVcGoodsMapper, JdVcGoods>
    implements JdVcGoodsService{
    private final  JdVcGoodsMapper mapper;

    @Override
    public PageResult<JdVcGoods> queryPageList(JdGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<JdVcGoods> queryWrapper = new LambdaQueryWrapper<JdVcGoods>()
                .eq(bo.getWareId() != null, JdVcGoods::getWareId, bo.getWareId())
                .eq(bo.getShopId() != null, JdVcGoods::getShopId, bo.getShopId())
                .eq(bo.getSaleState() != null, JdVcGoods::getSaleState, bo.getSaleState())
                .eq(bo.getHasLink() != null && bo.getHasLink() == 0, JdVcGoods::getOGoodsSkuId, 0)
                .gt(bo.getHasLink() != null && bo.getHasLink() == 1, JdVcGoods::getOGoodsSkuId, 0);

        Page<JdVcGoods> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(goodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveGoods(Long shopId, JdVcGoods goods) {
        List<JdVcGoods> jdVcGoods = mapper.selectList(new LambdaQueryWrapper<JdVcGoods>().eq(JdVcGoods::getWareId, goods.getWareId()));
        if(jdVcGoods== null || jdVcGoods.size()==0){
            // 新增
            goods.setShopId(shopId);
            goods.setOGoodsId("0");
            goods.setOGoodsSkuId("0");
            goods.setCreateTime(new Date());
            mapper.insert(goods);
        }else{
            // 修改
            goods.setId(jdVcGoods.get(0).getId());
            goods.setUpdateTime(new Date());
            mapper.updateById(goods);
        }
        return ResultVo.success();
    }
}




