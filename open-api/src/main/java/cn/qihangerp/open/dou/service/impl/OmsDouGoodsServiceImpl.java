package cn.qihangerp.open.dou.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.open.dou.domain.OmsDouGoods;
import cn.qihangerp.open.dou.domain.OmsDouGoodsSku;
import cn.qihangerp.open.dou.mapper.OmsDouGoodsMapper;
import cn.qihangerp.open.dou.mapper.OmsDouGoodsSkuMapper;
import cn.qihangerp.open.dou.service.OmsDouGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【oms_dou_goods(抖店商品表)】的数据库操作Service实现
* @createDate 2024-06-11 14:49:40
*/
@AllArgsConstructor
@Service
public class OmsDouGoodsServiceImpl extends ServiceImpl<OmsDouGoodsMapper, OmsDouGoods>
    implements OmsDouGoodsService{
    private final OmsDouGoodsMapper mapper;
    private final OmsDouGoodsSkuMapper skuMapper;
    @Override
    public PageResult<OmsDouGoods> queryPageList(OmsDouGoods bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OmsDouGoods> queryWrapper = new LambdaQueryWrapper<OmsDouGoods>()
                .eq(bo.getShopId()!=null,OmsDouGoods::getShopId,bo.getShopId());

        Page<OmsDouGoods> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(goodsPage);
    }

    @Override
    public int saveAndUpdateGoods(Long shopId, OmsDouGoods goods) {
        List<OmsDouGoods> goodsList = mapper.selectList(new LambdaQueryWrapper<OmsDouGoods>().eq(OmsDouGoods::getProductId, goods.getProductId()));
        if(goodsList!=null && goodsList.size()>0){
            // 存在，更新
            goods.setShopId(shopId);
            goods.setId(goodsList.get(0).getId());
            goods.setModifyTime(new Date());
            mapper.updateById(goods);

            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<OmsDouGoodsSku>().eq(OmsDouGoodsSku::getProductId,goods.getProductId()));

            // 重新插入sku
            if(goods.getSkuList()!=null) {
                for (var sku : goods.getSkuList()) {
                    sku.setShopId(shopId);
                    sku.setImg(goods.getImg());
                    sku.setName(goods.getName());
                    sku.setErpGoodsId(0L);
                    sku.setErpGoodsSkuId(0L);
                    // 根据OuterId查找ERP系统中的skuid
//                    if(StringUtils.isNotEmpty(sku.getCode())) {
//                        ErpGoodsSpecVo erpGoodsSpecVo = skuMapper.selectGoodsSpecBySpecNum(sku.getCode());
//                        if(erpGoodsSpecVo!=null ){
//                            sku.setErpGoodsId(erpGoodsSpecVo.getGoodsId());
//                            sku.setErpGoodsSkuId(erpGoodsSpecVo.getId());
////                            sku.setErpSupplierId(erpGoodsSpecVo.getSupplierId());
//                        }
//                    }
                    skuMapper.insert(sku);
                }
            }
            return ResultVoEnum.DataExist.getIndex();
        }else {
            // 不存在，新增
            goods.setShopId(shopId);
            goods.setPullTime(new Date());
            mapper.insert(goods);
            // 插入sku
            if(goods.getSkuList()!=null) {
                for (var sku : goods.getSkuList()) {
                    sku.setShopId(shopId);
                    sku.setImg(goods.getImg());
                    sku.setName(goods.getName());
                    sku.setErpGoodsId(0L);
                    sku.setErpGoodsSkuId(0L);
                    // 根据OuterId查找ERP系统中的skuid
//                    if(StringUtils.isNotEmpty(sku.getCode())) {
//                        ErpGoodsSpecVo erpGoodsSpecVo = skuMapper.selectGoodsSpecBySpecNum(sku.getCode());
//                        if(erpGoodsSpecVo!=null ){
//                            sku.setErpGoodsId(erpGoodsSpecVo.getGoodsId());
//                            sku.setErpGoodsSkuId(erpGoodsSpecVo.getId());
////                            sku.setErpSupplierId(erpGoodsSpecVo.getSupplierId());
//                        }
//                    }
                    skuMapper.insert(sku);
                }
            }
            return 0;
        }
    }
}




