package cn.qihangerp.module.open.jd.service.impl;


import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.utils.StringUtils;
import cn.qihangerp.module.open.jd.domain.JdGoods;
import cn.qihangerp.module.open.jd.domain.JdGoodsSku;

import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import cn.qihangerp.module.open.jd.mapper.JdGoodsSkuMapper;

import cn.qihangerp.module.open.jd.service.JdGoodsService;
import cn.qihangerp.module.open.jd.mapper.JdGoodsMapper;
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
    public ResultVo<Integer> saveGoods(Long shopId, JdGoods goods) {
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
            skuMapper.delete(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getWareId,goods.getWareId()));
        }

        // 添加sku
        if(goods.getSkuList()!=null && !goods.getSkuList().isEmpty()){
            for (var item : goods.getSkuList()){
//                item.setGoodsId(goods.getId());
                // 根据OuterId查找ERP系统中的skuid
                if(StringUtils.isNotEmpty(item.getOuterId())) {
                    List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, item.getOuterId()));
                    if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                        item.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                        item.setOGoodsSkuId(Long.parseLong(oGoodsSkus.get(0).getId().toString()));
                    }
                }
                skuMapper.insert(item);
            }
        }
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveGoodsSku(Long shopId, JdGoodsSku goodsSku) {
        List<JdGoodsSku> jdGoodsSkus = skuMapper.selectList(new LambdaQueryWrapper<JdGoodsSku>().eq(JdGoodsSku::getSkuId, goodsSku.getSkuId()));
        if(jdGoodsSkus== null || jdGoodsSkus.isEmpty()){
            // 新增
            goodsSku.setShopId(shopId);
            // 根据OuterId查找ERP系统中的skuid
            if(StringUtils.isNotEmpty(goodsSku.getOuterId())) {
                List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, goodsSku.getOuterId()));
                if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                    goodsSku.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                    goodsSku.setOGoodsSkuId(Long.parseLong(oGoodsSkus.get(0).getId().toString()));
                }
            }
            skuMapper.insert(goodsSku);
        }else{
            // 修改
            goodsSku.setId(jdGoodsSkus.get(0).getId());
            // 根据OuterId查找ERP系统中的skuid
            if(StringUtils.isNotEmpty(goodsSku.getOuterId())) {
                List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, goodsSku.getOuterId()));
                if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                    goodsSku.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                    goodsSku.setOGoodsSkuId(Long.parseLong(oGoodsSkus.get(0).getId().toString()));
                }
            }
            goodsSku.setShopId(shopId);
            skuMapper.updateById(goodsSku);
        }
        return ResultVo.success();
    }
}




