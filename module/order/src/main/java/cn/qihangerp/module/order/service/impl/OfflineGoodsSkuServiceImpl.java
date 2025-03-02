package cn.qihangerp.module.order.service.impl;




import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import cn.qihangerp.module.order.domain.OfflineGoodsSku;
import cn.qihangerp.module.order.mapper.OfflineGoodsSkuMapper;
import cn.qihangerp.module.order.service.OfflineGoodsSkuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

/**
* @author qilip
* @description 针对表【offline_goods_sku(OMS商品SKU表)】的数据库操作Service实现
* @createDate 2024-07-27 21:22:27
*/
@AllArgsConstructor
@Service
public class OfflineGoodsSkuServiceImpl extends ServiceImpl<OfflineGoodsSkuMapper, OfflineGoodsSku>
    implements OfflineGoodsSkuService {
    private final OfflineGoodsSkuMapper skuMapper;
    private final OGoodsSkuMapper goodsSkuMapper;
    @Override
    public PageResult<OfflineGoodsSku> querySkuPageList(OfflineGoodsSku bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OfflineGoodsSku> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(bo.getShopId()!=null,OfflineGoodsSku::getShopId,bo.getShopId());
        queryWrapper.eq(bo.getId()!=null,OfflineGoodsSku::getId,bo.getId());
        queryWrapper.eq(bo.getSkuId()!=null,OfflineGoodsSku::getSkuId,bo.getSkuId());
        queryWrapper.eq(StringUtils.hasText(bo.getSkuCode()),OfflineGoodsSku::getSkuCode,bo.getSkuCode());
        queryWrapper.like(StringUtils.hasText(bo.getGoodsName()),OfflineGoodsSku::getGoodsName,bo.getGoodsName());
        Page<OfflineGoodsSku> pages = skuMapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }

    @Override
    public List<OfflineGoodsSku> searchGoodsSpec(String keyword) {
        LambdaQueryWrapper<OfflineGoodsSku> queryWrapper =
                new LambdaQueryWrapper<OfflineGoodsSku>()
                        .likeRight(OfflineGoodsSku::getOGoodsSkuId,keyword).or()
                        .likeRight(OfflineGoodsSku::getSkuId,keyword).or()
                        .likeRight(OfflineGoodsSku::getId,keyword).or()
                        .likeRight(OfflineGoodsSku::getSkuCode,keyword);
        queryWrapper.last("LIMIT 10");
        return skuMapper.selectList(queryWrapper);
    }

    @Transactional
    @Override
    public ResultVo<Long> insertGoodsSku(OfflineGoodsSku goodsSku) {
        List<OGoodsSku> oGoodsSkus1 = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, goodsSku.getSkuCode()));
        if (oGoodsSkus1 == null || oGoodsSkus1.size() == 0) return ResultVo.error(500, "sku编码不存在");

        // 是否存在
//        List<OfflineGoodsSku> oGoodsSkus = skuMapper.selectList(new LambdaQueryWrapper<OfflineGoodsSku>()
//                .eq(OfflineGoodsSku::getSkuCode, goodsSku.getSkuCode()));

        goodsSku.setOGoodsId(oGoodsSkus1.get(0).getGoodsId().toString());
        goodsSku.setOGoodsSkuId(oGoodsSkus1.get(0).getId().toString());
        goodsSku.setGoodsName(oGoodsSkus1.get(0).getGoodsName());
        goodsSku.setSkuName(oGoodsSkus1.get(0).getSkuName());
        goodsSku.setColorId(oGoodsSkus1.get(0).getColorId());
        goodsSku.setColorValue(oGoodsSkus1.get(0).getColorValue());
        goodsSku.setColorImage(oGoodsSkus1.get(0).getColorImage());
        goodsSku.setSizeId(oGoodsSkus1.get(0).getSizeId());
        goodsSku.setSizeValue(oGoodsSkus1.get(0).getSizeValue());
        goodsSku.setStyleId(oGoodsSkus1.get(0).getStyleId());
        goodsSku.setStyleValue(oGoodsSkus1.get(0).getStyleValue());
        goodsSku.setBarCode(oGoodsSkus1.get(0).getBarCode());
        goodsSku.setStatus(1);
        goodsSku.setCreateTime(new Date());
        goodsSku.setCreateBy("手动导入商品");
        skuMapper.insert(goodsSku);
        return ResultVo.success();
    }
}




