package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.jd.domain.JdGoodsSku;
import com.qihang.jd.domain.bo.JdGoodsBo;
import com.qihang.jd.service.JdGoodsSkuService;
import com.qihang.jd.mapper.JdGoodsSkuMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Service实现
* @createDate 2024-03-09 20:44:11
*/
@AllArgsConstructor
@Service
public class JdGoodsSkuServiceImpl extends ServiceImpl<JdGoodsSkuMapper, JdGoodsSku>
    implements JdGoodsSkuService{
    private final JdGoodsSkuMapper mapper;
    @Override
    public PageResult<JdGoodsSku> queryPageList(JdGoodsBo bo, PageQuery pageQuery) {
        IPage<JdGoodsSku> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId());
        return PageResult.build(result);
    }
}




