package cn.qihangerp.module.open.pdd.service.impl;


import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import cn.qihangerp.module.open.pdd.domain.PddGoods;
import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.bo.PddGoodsBo;
import cn.qihangerp.module.open.pdd.mapper.PddGoodsMapper;
import cn.qihangerp.module.open.pdd.mapper.PddGoodsSkuMapper;
import cn.qihangerp.module.open.pdd.service.PddGoodsService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.utils.StringUtils;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【pdd_goods(pdd商品表)】的数据库操作Service实现
* @createDate 2024-06-04 17:11:49
*/
@AllArgsConstructor
@Service
public class PddGoodsServiceImpl extends ServiceImpl<PddGoodsMapper, PddGoods>
    implements PddGoodsService {
    private final PddGoodsMapper mapper;
    private final PddGoodsSkuMapper skuMapper;
    private final OGoodsSkuMapper goodsSkuMapper;
    @Override
    public PageResult<PddGoods> queryPageList(PddGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<PddGoods> queryWrapper = new LambdaQueryWrapper<PddGoods>()
                .eq(bo.getShopId()!=null,PddGoods::getShopId,bo.getShopId());

        Page<PddGoods> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(goodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveGoods(Long shopId, PddGoods goods) {
        List<PddGoods> jdGoods = mapper.selectList(new LambdaQueryWrapper<PddGoods>().eq(PddGoods::getGoodsId, goods.getGoodsId()));
        if(jdGoods== null || jdGoods.isEmpty()){
            // 新增
            goods.setShopId(shopId);
            goods.setCreateTime(new Date());
            mapper.insert(goods);
        }else{
            // 修改
            goods.setId(jdGoods.get(0).getId());
//            goods.setShopId(shopId);
            goods.setUpdateTime(new Date());
            mapper.updateById(goods);
            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<PddGoodsSku>().eq(PddGoodsSku::getGoodsId,goods.getGoodsId()));
        }

        // 添加sku
        if(goods.getSkuList()!=null && !goods.getSkuList().isEmpty()){
            for (var item : goods.getSkuList()){
                item.setGoodsId(goods.getGoodsId());
                item.setGoodsName(goods.getGoodsName());
                item.setThumbUrl(goods.getThumbUrl());
                item.setShopId(shopId);
                item.setCreateTime(new Date());
                // 根据OuterId查找ERP系统中的skuid
                if(StringUtils.isNotEmpty(item.getOuterId())) {
                    List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, item.getOuterId()));
                    if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                        item.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                        item.setOGoodsSkuId(oGoodsSkus.get(0).getId().toString());
                    }
                }
                skuMapper.insert(item);
            }
        }
        return ResultVo.success();
    }
}




