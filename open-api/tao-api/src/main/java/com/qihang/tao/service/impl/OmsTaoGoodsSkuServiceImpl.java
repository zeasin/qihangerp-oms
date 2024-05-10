package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.tao.domain.OmsTaoGoods;
import com.qihang.tao.domain.OmsTaoGoodsSku;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import com.qihang.tao.service.OmsTaoGoodsSkuService;
import com.qihang.tao.mapper.OmsTaoGoodsSkuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【oms_tao_goods_sku(淘宝商品SKU表)】的数据库操作Service实现
* @createDate 2024-05-09 16:15:39
*/
@AllArgsConstructor
@Service
public class OmsTaoGoodsSkuServiceImpl extends ServiceImpl<OmsTaoGoodsSkuMapper, OmsTaoGoodsSku>
    implements OmsTaoGoodsSkuService{
    private final OmsTaoGoodsSkuMapper mapper;
    @Override
    public PageResult<TaoGoodsSkuListVo> queryPageList(OmsTaoGoods bo, PageQuery pageQuery) {
        IPage<TaoGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getNumIid());
        return PageResult.build(result);
    }
}




