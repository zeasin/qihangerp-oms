package cn.qihangerp.module.open.pdd.service.impl;

import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.bo.PddGoodsBo;
import cn.qihangerp.module.open.pdd.domain.vo.PddGoodsSkuListVo;
import cn.qihangerp.module.open.pdd.mapper.PddGoodsSkuMapper;
import cn.qihangerp.module.open.pdd.service.PddGoodsSkuService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author TW
* @description 针对表【pdd_goods_sku(pdd商品SKU表)】的数据库操作Service实现
* @createDate 2024-06-04 17:11:49
*/
@AllArgsConstructor
@Service
public class PddGoodsSkuServiceImpl extends ServiceImpl<PddGoodsSkuMapper, PddGoodsSku>
    implements PddGoodsSkuService {
    private final PddGoodsSkuMapper mapper;
    @Override
    public PageResult<PddGoodsSkuListVo> queryPageList(PddGoodsBo bo, PageQuery pageQuery) {
        if(StringUtils.hasText(bo.getOuterId())){
            bo.setOuterId(bo.getOuterId().trim());
        }
        IPage<PddGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getGoodsId(),bo.getSkuId(),bo.getOuterId(),bo.getHasLink());
        return PageResult.build(result);
    }
}




