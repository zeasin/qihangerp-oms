package cn.qihangerp.open.wei.service.impl;

import cn.qihangerp.open.wei.domain.OmsWeiGoodsSku;
import cn.qihangerp.open.wei.mapper.OmsWeiGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.open.wei.domain.OmsWeiGoods;
import cn.qihangerp.open.wei.mapper.OmsWeiGoodsMapper;
import cn.qihangerp.open.wei.service.OmsWeiGoodsService;
import cn.qihangerp.common.ResultVoEnum;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author TW
* @description 针对表【oms_wei_goods】的数据库操作Service实现
* @createDate 2024-06-03 16:51:29
*/
@AllArgsConstructor
@Service
public class OmsWeiGoodsServiceImpl extends ServiceImpl<OmsWeiGoodsMapper, OmsWeiGoods>
    implements OmsWeiGoodsService{
    private final OmsWeiGoodsMapper mapper;
    private final OmsWeiGoodsSkuMapper skuMapper;
    @Override
    public int saveAndUpdateGoods(Long shopId, OmsWeiGoods goods) {
        List<OmsWeiGoods> goodsList = mapper.selectList(new LambdaQueryWrapper<OmsWeiGoods>().eq(OmsWeiGoods::getProductId, goods.getProductId()));
        if (goodsList != null && goodsList.size() > 0) {
            // 更新
            // 存在，更新
            goods.setShopId(shopId);
            goods.setId(goodsList.get(0).getId());
            mapper.updateById(goods);

            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<OmsWeiGoodsSku>().eq(OmsWeiGoodsSku::getProductId,goods.getProductId()));
            // 重新插入sku
            if(goods.getSkus()!=null) {
                for (var sku : goods.getSkus()) {
//                    sku.setWeiGoodsId(Long.parseLong(goods.getId()));
                    // 根据OuterId查找ERP系统中的skuid
//                    if(StringUtils.isNotEmpty(sku.getSkuCode())) {
//                        List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuNum, sku.getSkuCode()));
//                        if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
//                            sku.setErpGoodsId(oGoodsSkus.get(0).getErpGoodsId());
//                            sku.setErpGoodsSkuId(oGoodsSkus.get(0).getErpSkuId());
//                        }
//                    }
                    skuMapper.insert(sku);
                }
            }

            return ResultVoEnum.DataExist.getIndex();
        } else {
            // 不存在，新增return 0;
            // 不存在，新增
            goods.setShopId(shopId);
            mapper.insert(goods);
            // 插入sku
            if(goods.getSkus()!=null) {
                for (var sku : goods.getSkus()) {
//                    sku.setWeiGoodsId(Long.parseLong(goods.getId()));
                    // 根据OuterId查找ERP系统中的skuid
//                    if(StringUtils.isNotEmpty(sku.getSkuCode())) {
//                        List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuNum, sku.getSkuCode()));
//                        if(oGoodsSkus!=null && !oGoodsSkus.isEmpty()){
//                            sku.setErpGoodsId(oGoodsSkus.get(0).getErpGoodsId());
//                            sku.setErpGoodsSkuId(oGoodsSkus.get(0).getErpSkuId());
//                        }
//                    }

                    skuMapper.insert(sku);
                }
            }
            return 0;
        }
    }
}




