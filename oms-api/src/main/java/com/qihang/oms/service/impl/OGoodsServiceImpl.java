package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.OGoods;
import com.qihang.oms.service.OGoodsService;
import com.qihang.oms.mapper.OGoodsMapper;
import com.qihang.oms.vo.GoodsSpecListVo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

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
}




