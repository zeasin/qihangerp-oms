package cn.qihangerp.module.goods.service.impl;

import cn.qihangerp.module.goods.domain.OGoodsInventory;
import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.domain.bo.GoodsSkuAddBo;
import cn.qihangerp.module.goods.domain.vo.GoodsSpecListVo;
import cn.qihangerp.module.goods.mapper.OGoodsInventoryMapper;
import cn.qihangerp.module.goods.mapper.OGoodsMapper;
import cn.qihangerp.module.goods.mapper.OGoodsSkuAttrMapper;


import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.goods.domain.OGoods;

import cn.qihangerp.module.goods.domain.OGoodsSkuAttr;
import cn.qihangerp.module.goods.domain.bo.GoodsAddBo;
import cn.qihangerp.module.goods.domain.bo.GoodsAddSkuBo;
import cn.qihangerp.module.goods.service.OGoodsService;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
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
    private final OGoodsSkuAttrMapper skuAttrMapper;
    private final OGoodsInventoryMapper inventoryMapper;
//    private final OOrderItemMapper orderItemMapper;

    @Override
    public PageResult<OGoodsSku> querySkuPageList(OGoodsSku bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OGoodsSku> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(bo.getStatus()!=null, OGoodsSku::getStatus,bo.getStatus());
        queryWrapper.eq(bo.getOuterErpSkuId()!=null,OGoodsSku::getOuterErpSkuId,bo.getOuterErpSkuId());
        queryWrapper.eq(bo.getOuterErpGoodsId()!=null,OGoodsSku::getOuterErpGoodsId,bo.getOuterErpGoodsId());
        queryWrapper.eq(StringUtils.hasText(bo.getSkuCode()),OGoodsSku::getSkuCode,bo.getSkuCode());
        Page<OGoodsSku> pages = skuMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

    @Override
    public PageResult<OGoods> queryPageList(OGoods bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OGoods> queryWrapper = new LambdaQueryWrapper<OGoods>();
        queryWrapper.eq(bo.getStatus()!=null, OGoods::getStatus,bo.getStatus());
        queryWrapper.eq(bo.getCategoryId()!=null,OGoods::getCategoryId,bo.getCategoryId());
        queryWrapper.eq(bo.getSupplierId()!=null,OGoods::getSupplierId,bo.getSupplierId());
        queryWrapper.eq(StringUtils.hasText(bo.getGoodsNum()),OGoods::getGoodsNum,bo.getGoodsNum());
        queryWrapper.like(StringUtils.hasText(bo.getName()),OGoods::getName,bo.getName());
        Page<OGoods> pages = goodsMapper.selectPage(pageQuery.build(), queryWrapper);
        if(pages.getRecords()!=null){
            for(OGoods g:pages.getRecords()){
                g.setSkuList(skuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getGoodsId,g.getId())));
            }
        }
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

    @Transactional
    @Override
    public ResultVo<Long> insertGoods(String userName , GoodsAddBo bo)
    {
        if(StringUtils.isEmpty(bo.getNumber())) return ResultVo.error(500,"商品编码不能为空");
        // 查询编码是否存在
        List<OGoods> goodsList = goodsMapper.selectList(new LambdaQueryWrapper<OGoods>().eq(OGoods::getGoodsNum,bo.getNumber()));
        if(goodsList!=null && goodsList.size()>0) return ResultVo.error(-1,"商品编码已存在");// return -1;

        OGoods goods = new OGoods();
        goods.setGoodsNum(bo.getNumber());
        goods.setName(bo.getName());
        goods.setImage(bo.getImage());
        goods.setOuterErpGoodsId(bo.getOuterErpGoodsId());
        goods.setUnitName(bo.getUnitName());
        goods.setCategoryId(bo.getCategoryId());
        goods.setBarCode(bo.getBarCode());
        goods.setStatus(1);
        goods.setLength(0.0);
        goods.setHeight(0.0);
        goods.setWidth(0.0);
        goods.setWidth1(0.0);
        goods.setWidth2(0.0);
        goods.setWidth3(0.0);
        goods.setWeight(0.0);
        goods.setDisable(0);
        goods.setPeriod(bo.getPeriod());
        goods.setPurPrice(bo.getPurPrice());
        goods.setWholePrice(bo.getWholePrice());
        goods.setRetailPrice(bo.getRetailPrice());
        goods.setUnitCost(bo.getUnitCost());
        goods.setSupplierId(bo.getSupplierId());
        goods.setBrandId(bo.getBrandId());
        goods.setLinkUrl(bo.getLinkUrl());
        goods.setLowQty(0);
        goods.setHighQty(0);
        goods.setCreateBy(userName);
        goods.setCreateTime(new Date());
        goods.setProvince(bo.getProvince());
        goods.setCity(bo.getCity());
        goods.setTown(bo.getTown());

        // 1、添加主表o_goods
        goodsMapper.insert(goods);

        // 2、添加规格表erp_goods_spec
        for (GoodsAddSkuBo skuBo:bo.getSpecList()) {
            OGoodsSku spec = new OGoodsSku();
            spec.setGoodsId(goods.getId());
            spec.setOuterErpGoodsId(bo.getOuterErpGoodsId());
            spec.setOuterErpSkuId(skuBo.getOuterErpSkuId());
            spec.setGoodsName(bo.getName());
            String skuName ="";
            if(StringUtils.hasText(skuBo.getColorValue()))
                skuName+= skuBo.getColorValue();
            if(StringUtils.hasText(skuBo.getSizeValue()))
                skuName+= " "+ skuBo.getSizeValue();
            if(StringUtils.hasText(skuBo.getStyleValue()))
                skuName+= " "+ skuBo.getStyleValue();

            spec.setSkuName(skuName);
            spec.setSkuCode(skuBo.getSpecNum());
            spec.setColorId(skuBo.getColorId());
            spec.setColorValue(skuBo.getColorValue());
            if(bo.getColorImages()!=null && StringUtils.hasText(bo.getColorImages().get(skuBo.getColorId()))){
                spec.setColorImage(bo.getColorImages().get(skuBo.getColorId()));
            }else {
                spec.setColorImage(goods.getImage());
            }
            spec.setSizeId(skuBo.getSizeId());
            spec.setSizeValue(skuBo.getSizeValue());
            spec.setStyleId(skuBo.getStyleId());
            spec.setStyleValue(skuBo.getStyleValue());
            if(bo.getPurPrice() == null){
                spec.setPurPrice(goods.getPurPrice());
            }else spec.setPurPrice(bo.getPurPrice());
            spec.setStatus(1);

            skuMapper.insert(spec);

            // 添加商品库存表
            OGoodsInventory inventory = new OGoodsInventory();
            inventory.setSkuId(spec.getId());
            inventory.setGoodsId(goods.getId());
            inventory.setGoodsNum(bo.getNumber());
            inventory.setSkuCode(skuBo.getSpecNum());
            inventory.setQuantity(0L);
            inventory.setIsDelete(0);
            inventory.setCreateTime(new Date());
            inventory.setCreateBy("添加商品");
            inventoryMapper.insert(inventory);
        }

        // 3、添加规格属性表erp_goods_spec_attr
        if(bo.getColorValues()!=null) {
            for (Long val:bo.getColorValues()) {
                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
                specAttr.setGoodsId(goods.getId());
                specAttr.setType("color");
                specAttr.setK("颜色");
                specAttr.setKid(114L);
                specAttr.setVid(val);
                skuAttrMapper.insert(specAttr);
            }

        }
        if(bo.getSizeValues()!=null) {
            for (Long val:bo.getSizeValues()) {
                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
                specAttr.setGoodsId(goods.getId());
                specAttr.setType("size");
                specAttr.setK("尺码");
                specAttr.setKid(115L);
                specAttr.setVid(val);
                skuAttrMapper.insert(specAttr);
            }

        }
        if(bo.getColorValues()!=null) {
            for (Long val:bo.getColorValues()) {
                OGoodsSkuAttr specAttr = new OGoodsSkuAttr();
                specAttr.setGoodsId(goods.getId());
                specAttr.setType("style");
                specAttr.setK("款式");
                specAttr.setKid(116L);
                specAttr.setVid(val);
                skuAttrMapper.insert(specAttr);
            }

        }
//        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        return ResultVo.success(Long.parseLong(goods.getId()));
    }

    @Override
    public int updateGoods(OGoods goods) {
        return goodsMapper.updateById(goods);
    }

    @Transactional
    @Override
    public int deleteGoodsByIds(Long[] ids) {
        // 有业务关联的商品
//        for (Long id:ids){
//            List<OOrderItem> oOrderItems = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>().eq(OOrderItem::getGoodsId, id));
//            if(oOrderItems.isEmpty()){
//                // 删除库存
//                inventoryMapper.delete(new LambdaQueryWrapper<OGoodsInventory>().eq(OGoodsInventory::getGoodsId,id));
//                // 删除skuAttr
//                skuAttrMapper.delete(new LambdaQueryWrapper<OGoodsSkuAttr>().eq(OGoodsSkuAttr::getGoodsId,id));
//                // 删除sku
//                skuMapper.delete(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getGoodsId,id));
//                // 删除商品
//                goodsMapper.deleteById(id);
//            }else{
//                return -100;//有关联的订单，不能删除
//            }
//        }
        return 0;
    }

    @Override
    public int insertGoodsSku(OGoodsSku goodsSku) {
        // 是否存在
        List<OGoodsSku> oGoodsSkus = skuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getOuterErpSkuId, goodsSku.getOuterErpSkuId()).or().eq(OGoodsSku::getSkuCode, goodsSku.getSkuCode()));
        if(oGoodsSkus==null || oGoodsSkus.size() ==0) {
            // 查询goodsId外键
            if (StringUtils.hasText(goodsSku.getOuterErpGoodsId())) {
                List<OGoods> oGoods = goodsMapper.selectList(new LambdaQueryWrapper<OGoods>().eq(OGoods::getOuterErpGoodsId, goodsSku.getOuterErpGoodsId()));
                if (oGoods != null && oGoods.size() > 0) {
                    goodsSku.setGoodsId(oGoods.get(0).getId());
                } else {
                    goodsSku.setGoodsId("0");
                }
            } else {
                goodsSku.setGoodsId("0");
            }
            return skuMapper.insert(goodsSku);
        }
        return -1;
    }

//    @Override
//    public int saveGoodsSku(GoodsSkuAddBo addBo) {
//        // 是否存在
//        List<OGoodsSku> oGoodsSkus = skuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getOuterErpSkuId, addBo.getErpSkuId()));
//        if(oGoodsSkus==null || oGoodsSkus.size() ==0) {
//            //不存在，新增
//            OGoodsSku insert = new OGoodsSku();
//            insert.setGoodsId(addBo.getGoodsk);
//            insert.setOuterErpGoodsId("0");
//            insert.setOuterErpSkuId(addBo.getErpSkuId());
//            insert.setSkuName(addBo.getProductSpec());
//            insert.setSkuCode(addBo.getErpSkuCode());
//            insert.setGoodsName(addBo.getErpSkuName());
//            insert.setRetailPrice(addBo.getSalePrice());
//            insert.setColorValue(addBo.getProductColor());
//            insert.setColorImage(addBo.getProductPicture1());
//            insert.setSizeValue(addBo.getMaterialKind());
//            insert.setVolume(addBo.getProductVolume());
//            insert.setStatus(addBo.getProductIsUse());
//            skuMapper.insert(insert);
//        }else{
//            // 存在，修改
//            OGoodsSku update = new OGoodsSku();
//            update.setId(oGoodsSkus.get(0).getId());
//            update.setOuterErpSkuId(addBo.getErpSkuId());
//            update.setSkuName(addBo.getProductSpec());
//            update.setSkuCode(addBo.getErpSkuCode());
//            update.setGoodsName(addBo.getErpSkuName());
//            update.setRetailPrice(addBo.getSalePrice());
//            update.setColorValue(addBo.getProductColor());
//            update.setColorImage(addBo.getProductPicture1());
//            update.setSizeValue(addBo.getMaterialKind());
//            update.setVolume(addBo.getProductVolume());
//            update.setStatus(addBo.getProductIsUse());
//            skuMapper.updateById(update);
//        }
//        return 1;
//    }
//
//    @Override
//    public int batchSaveGoodsSku(List<GoodsSkuAddBo> list) {
//        for (var bo:list) {
//            if(StringUtils.hasText(bo.getErpSkuId()) && StringUtils.hasText(bo.getErpSkuCode()) ){
//                this.saveGoodsSku(bo);
//            }
//        }
//        return 1;
//    }
}




