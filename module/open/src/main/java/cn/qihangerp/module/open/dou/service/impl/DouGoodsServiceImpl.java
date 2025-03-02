package cn.qihangerp.module.open.dou.service.impl;



import cn.qihangerp.module.goods.domain.OGoodsSku;
import cn.qihangerp.module.goods.mapper.OGoodsSkuMapper;
import cn.qihangerp.module.open.dou.domain.DouGoods;
import cn.qihangerp.module.open.dou.domain.DouGoodsSku;
import cn.qihangerp.module.open.dou.domain.bo.DouGoodsBo;
import cn.qihangerp.module.open.dou.mapper.DouGoodsMapper;
import cn.qihangerp.module.open.dou.mapper.DouGoodsSkuMapper;
import cn.qihangerp.module.open.dou.service.DouGoodsService;
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
* @description 针对表【dou_goods(抖店商品表)】的数据库操作Service实现
* @createDate 2024-05-31 17:23:21
*/
@AllArgsConstructor
@Service
public class DouGoodsServiceImpl extends ServiceImpl<DouGoodsMapper, DouGoods>
    implements DouGoodsService {
    private final DouGoodsMapper mapper;
    private final DouGoodsSkuMapper skuMapper;
    private final OGoodsSkuMapper goodsSkuMapper;
    @Override
    public PageResult<DouGoods> queryPageList(DouGoodsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<DouGoods> queryWrapper = new LambdaQueryWrapper<DouGoods>()
                .eq(bo.getShopId()!=null,DouGoods::getShopId,bo.getShopId())

                ;

        Page<DouGoods> goodsPage = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(goodsPage);
    }

    @Transactional
    @Override
    public ResultVo<Integer> saveGoods(Long shopId, DouGoods goods) {
        List<DouGoods> jdGoods = mapper.selectList(new LambdaQueryWrapper<DouGoods>().eq(DouGoods::getProductId, goods.getProductId()));
        if(jdGoods== null || jdGoods.isEmpty()){
            // 新增
            goods.setShopId(shopId);
            goods.setPullTime(new Date());
            mapper.insert(goods);
        }else{
            // 修改
            goods.setId(jdGoods.get(0).getId());
            goods.setModifyTime(new Date());

            mapper.updateById(goods);
            // 删除sku
            skuMapper.delete(new LambdaQueryWrapper<DouGoodsSku>().eq(DouGoodsSku::getProductId,goods.getProductId()));
        }

        // 添加sku
        if(goods.getSkuList()!=null && !goods.getSkuList().isEmpty()){
            for (var item : goods.getSkuList()){
                item.setName(goods.getName());
                item.setImg(goods.getImg());
                item.setShopId(shopId);
                // 根据OuterId查找ERP系统中的skuid
                if(StringUtils.isNotEmpty(item.getCode())) {
                    List<OGoodsSku> oGoodsSkus = goodsSkuMapper.selectList(new LambdaQueryWrapper<OGoodsSku>().eq(OGoodsSku::getSkuCode, item.getCode()));
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




