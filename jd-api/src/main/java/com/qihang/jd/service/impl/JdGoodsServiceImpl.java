package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.common.utils.StringUtils;
import com.qihang.jd.domain.JdGoods;
import com.qihang.jd.domain.JdGoodsSku;
import com.qihang.jd.domain.OGoodsSku;
import com.qihang.jd.domain.bo.JdGoodsBo;
import com.qihang.jd.mapper.JdGoodsSkuMapper;
import com.qihang.jd.mapper.OGoodsSkuMapper;
import com.qihang.jd.service.JdGoodsService;
import com.qihang.jd.mapper.JdGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author qilip
* @description 针对表【jd_goods】的数据库操作Service实现
* @createDate 2024-03-09 11:29:59
*/
@AllArgsConstructor
@Service
public class JdGoodsServiceImpl extends ServiceImpl<JdGoodsMapper, JdGoods>
    implements JdGoodsService{
    private final JdGoodsMapper mapper;
    private final JdGoodsSkuMapper skuMapper;
    private final OGoodsSkuMapper goodsSkuMapper;

    @Override
    public PageResult<JdGoods> queryPageList(JdGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<JdGoods> queryWrapper = new LambdaQueryWrapper<JdGoods>()
                .eq(bo.getShopId()!=null,JdGoods::getShopId,bo.getShopId());

        Page<JdGoods> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(goodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveGoods(Integer shopId, JdGoods goods) {
        List<JdGoods> jdGoods = mapper.selectList(new LambdaQueryWrapper<JdGoods>().eq(JdGoods::getWareId, goods.getWareId()));
        if(jdGoods== null || jdGoods.isEmpty()){
            // 新增
            goods.setShopId(shopId);
            mapper.insert(goods);
        }else{
            // 修改
            goods.setId(jdGoods.get(0).getId());
            goods.setShopId(shopId);
            mapper.updateById(goods);
            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getGoodsId,goods.getId()));
        }

        // 添加sku
        if(goods.getSkuList()!=null && !goods.getSkuList().isEmpty()){
            for (var item : goods.getSkuList()){
                item.setGoodsId(goods.getId());
                // 根据OuterId查找ERP系统中的skuid
                if(StringUtils.isNotEmpty(item.getOuterId())) {
                    List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuNum, item.getOuterId()));
                    if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                        item.setErpGoodsId(oGoodsSkus.get(0).getErpGoodsId());
                        item.setErpSkuId(oGoodsSkus.get(0).getErpSkuId());
                    }
                }
                skuMapper.insert(item);
            }
        }
        return ResultVo.success();
    }
}




