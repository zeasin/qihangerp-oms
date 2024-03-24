package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.tao.domain.TaoGoodsSku;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import com.qihang.tao.service.TaoGoodsSkuService;
import com.qihang.tao.mapper.TaoGoodsSkuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【tao_goods_sku】的数据库操作Service实现
* @createDate 2024-02-29 19:01:35
*/
@AllArgsConstructor
@Service
public class TaoGoodsSkuServiceImpl extends ServiceImpl<TaoGoodsSkuMapper, TaoGoodsSku>
    implements TaoGoodsSkuService{
    private final TaoGoodsSkuMapper mapper;

    @Override
    public PageResult<TaoGoodsSkuListVo> queryPageList(TaoGoodsBo bo, PageQuery pageQuery) {
        IPage<TaoGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getNumIid());
        return PageResult.build(result);
    }
}




