package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.OGoods;
import com.qihang.oms.domain.OGoodsSku;
import com.qihang.oms.mapper.OGoodsSkuMapper;
import com.qihang.oms.service.OGoodsService;
import com.qihang.oms.mapper.OGoodsMapper;
import com.qihang.oms.vo.GoodsSpecListVo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.List;

/**
* @author TW
* @description 针对表【o_goods(商品库存管理)】的数据库操作Service实现
* @createDate 2024-03-11 14:24:49
*/
@AllArgsConstructor
@Service
public class OGoodsServiceImpl extends ServiceImpl<OGoodsMapper, OGoods>
    implements OGoodsService{
    private final OGoodsMapper goodsMapper;
    private final OGoodsSkuMapper skuMapper;

    @Override
    public PageResult<OGoodsSku> querySkuPageList(OGoodsSku bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OGoodsSku> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(bo.getErpSkuId()!=null,OGoodsSku::getErpSkuId,bo.getErpSkuId());
        queryWrapper.eq(bo.getErpGoodsId()!=null,OGoodsSku::getErpGoodsId,bo.getErpGoodsId());
        queryWrapper.eq(StringUtils.hasText(bo.getSkuNum()),OGoodsSku::getSkuNum,bo.getSkuNum());
        Page<OGoodsSku> pages = skuMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

    @Override
    public List<GoodsSpecListVo> searchGoodsSpec(String keyword) {
        return goodsMapper.searchGoodsSpec(keyword);
    }

    @Override
    public List<OGoods> selectGoodsList(OGoods goods) {
        List<OGoods> list = goodsMapper.selectList(new LambdaQueryWrapper<>());
        return list;
    }

    @Override
    public OGoods selectGoodsById(Long id) {
        return goodsMapper.selectById(id);
    }

    @Override
    public int insertGoods(OGoods goods) {
        return goodsMapper.insert(goods);
    }

    @Override
    public int updateGoods(OGoods goods) {
        return goodsMapper.updateById(goods);
    }

    @Override
    public int deleteGoodsByIds(Long[] ids) {
        return goodsMapper.deleteBatchIds(Arrays.stream(ids).toList());
    }

    @Override
    public int insertGoodsSku(OGoodsSku goodsSku) {
        // 是否存在
        List<OGoodsSku> oGoodsSkus = skuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getErpSkuId, goodsSku.getErpSkuId()).or().eq(OGoodsSku::getSkuNum, goodsSku.getSkuNum()));
        if(oGoodsSkus==null || oGoodsSkus.size() ==0) {
            // 查询goodsId外键
            if (goodsSku.getErpGoodsId() != null && goodsSku.getErpGoodsId() > 0) {
                List<OGoods> oGoods = goodsMapper.selectList(new LambdaQueryWrapper<OGoods>().eq(OGoods::getErpGoodsId, goodsSku.getGoodsId()));
                if (oGoods != null && oGoods.size() > 0) {
                    goodsSku.setGoodsId(oGoods.get(0).getId());
                } else {
                    goodsSku.setGoodsId(0L);
                }
            } else {
                goodsSku.setGoodsId(0L);
            }
            return skuMapper.insert(goodsSku);
        }
        return -1;
    }
}




