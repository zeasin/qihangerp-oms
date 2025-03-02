package cn.qihangerp.module.open.tao.service.impl;


import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import cn.qihangerp.module.open.tao.domain.bo.TaoGoodsBo;
import cn.qihangerp.module.open.tao.mapper.TaoGoodsMapper;
import cn.qihangerp.module.open.tao.mapper.TaoGoodsSkuMapper;
import cn.qihangerp.module.open.tao.service.TaoGoodsService;
import cn.qihangerp.module.open.tao.domain.TaoGoods;
import cn.qihangerp.module.open.tao.domain.TaoGoodsSku;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.utils.StringUtils;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;


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
    private final OGoodsSkuMapper goodsSkuMapper;

    @Override
    public PageResult<TaoGoods> queryPageList(TaoGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<TaoGoods> queryWrapper = new LambdaQueryWrapper<TaoGoods>()
                .eq(bo.getShopId()!=null,TaoGoods::getShopId,bo.getShopId());

        Page<TaoGoods> taoGoodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(taoGoodsPage);
    }

    @Transactional
    @Override
    public int saveAndUpdateGoods(Long shopId, TaoGoods goods) {
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
                    // 根据OuterId查找ERP系统中的skuid
                    if(StringUtils.isNotEmpty(sku.getOuterId())) {
                        List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, sku.getOuterId()));
                        if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                            sku.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                            sku.setOGoodsSkuId(oGoodsSkus.get(0).getId().toString());
                        }
                    }
                    skuMapper.insert(sku);
                }
            }
            return ResultVoEnum.DataExist.getIndex();
        }else {
            // 不存在，新增
            goods.setShopId(shopId);
            goods.setCreateTime(new Date());
            mapper.insert(goods);
            // 插入sku
            if(goods.getSkus()!=null) {
                for (var sku : goods.getSkus()) {
                    sku.setTaoGoodsId(goods.getId());
                    // 根据OuterId查找ERP系统中的skuid
                    if(StringUtils.isNotEmpty(sku.getOuterId())) {
                        List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, sku.getOuterId()));
                        if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
                            sku.setOGoodsId(oGoodsSkus.get(0).getGoodsId().toString());
                            sku.setOGoodsSkuId(oGoodsSkus.get(0).getId().toString());
                        }
                    }

                    skuMapper.insert(sku);
                }
            }
            return 0;
        }
    }
}




