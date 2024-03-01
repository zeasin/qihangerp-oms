package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.EnumResultVo;
import com.qihang.tao.common.PageQuery;
import com.qihang.tao.common.PageResult;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.TaoGoodsSku;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.mapper.TaoGoodsSkuMapper;
import com.qihang.tao.service.TaoGoodsService;
import com.qihang.tao.mapper.TaoGoodsMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【tao_goods】的数据库操作Service实现
* @createDate 2024-02-29 09:28:38
*/
@AllArgsConstructor
@Service
public class TaoGoodsServiceImpl extends ServiceImpl<TaoGoodsMapper, TaoGoods>
    implements TaoGoodsService {

    private final TaoGoodsMapper mapper;
    private final TaoGoodsSkuMapper skuMapper;

    @Override
    public PageResult<TaoGoods> queryPageList(TaoGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<TaoGoods> queryWrapper = new LambdaQueryWrapper<>();
        Page<TaoGoods> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(taoGoodsPage);
    }

    @Transactional
    @Override
    public int saveAndUpdateGoods(Integer shopId, TaoGoods goods) {
        List<TaoGoods> goodsList = mapper.selectList(new LambdaQueryWrapper<TaoGoods>().eq(TaoGoods::getNumIid, goods.getNumIid()));
        if(goodsList!=null && goodsList.size()>0){
            // 存在，更新
            goods.setShopId(shopId);
            goods.setId(goodsList.get(0).getId());
            mapper.updateById(goods);

            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<TaoGoodsSku>().eq(TaoGoodsSku::getTaoGoodsId,goods.getId()));

            // 重新插入sku
            if(goods.getSkus()!=null) {
                for (var sku : goods.getSkus()) {
                    sku.setTaoGoodsId(goods.getId());
                    skuMapper.insert(sku);
                }
            }
            return EnumResultVo.DataExist.getIndex();
        }else {
            // 不存在，新增
            goods.setShopId(shopId);
            goods.setCreateTime(new Date());
            mapper.insert(goods);
            // 插入sku
            if(goods.getSkus()!=null) {
                for (var sku : goods.getSkus()) {
                    sku.setTaoGoodsId(goods.getId());
                    skuMapper.insert(sku);
                }
            }
            return 0;
        }
    }
}




