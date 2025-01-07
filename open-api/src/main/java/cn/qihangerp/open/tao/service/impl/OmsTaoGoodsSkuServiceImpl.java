package cn.qihangerp.open.tao.service.impl;

import cn.qihangerp.open.tao.domain.OmsTaoGoods;
import cn.qihangerp.open.tao.domain.OmsTaoGoodsSku;
import cn.qihangerp.open.tao.domain.vo.TaoGoodsSkuListVo;
import cn.qihangerp.open.tao.mapper.OmsTaoGoodsSkuMapper;
import cn.qihangerp.open.tao.service.OmsTaoGoodsSkuService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;

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
    implements OmsTaoGoodsSkuService {
    private final OmsTaoGoodsSkuMapper mapper;
    @Override
    public PageResult<TaoGoodsSkuListVo> queryPageList(OmsTaoGoods bo, PageQuery pageQuery) {
        IPage<TaoGoodsSkuListVo> result = mapper.selectSkuPageList(pageQuery.build(), bo.getShopId(),bo.getNumIid());
        return PageResult.build(result);
    }
}




