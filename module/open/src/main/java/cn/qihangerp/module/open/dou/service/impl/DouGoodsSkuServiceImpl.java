package cn.qihangerp.module.open.dou.service.impl;

import cn.qihangerp.module.open.dou.domain.DouGoodsSku;
import cn.qihangerp.module.open.dou.domain.bo.DouGoodsBo;
import cn.qihangerp.module.open.dou.mapper.DouGoodsSkuMapper;
import cn.qihangerp.module.open.dou.service.DouGoodsSkuService;
import cn.qihangerp.module.open.dou.domain.vo.DouGoodsSkuListVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author TW
* @description 针对表【dou_goods_sku(抖店商品Sku表)】的数据库操作Service实现
* @createDate 2024-05-31 17:23:21
*/
@AllArgsConstructor
@Service
public class DouGoodsSkuServiceImpl extends ServiceImpl<DouGoodsSkuMapper, DouGoodsSku>
    implements DouGoodsSkuService {
    private final DouGoodsSkuMapper mapper;
    @Override
    public PageResult<DouGoodsSkuListVo> queryPageList(DouGoodsBo bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getCode())){
            bo.setCode(bo.getCode().trim());
        }
        IPage<DouGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getProductId(),bo.getSkuId(),bo.getCode(),bo.getHasLink());
        return PageResult.build(result);
    }
}




