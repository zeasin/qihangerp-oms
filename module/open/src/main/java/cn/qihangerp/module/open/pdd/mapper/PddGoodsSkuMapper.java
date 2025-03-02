package cn.qihangerp.module.open.pdd.mapper;

import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.vo.PddGoodsSkuListVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Param;

/**
* @author TW
* @description 针对表【pdd_goods_sku(pdd商品SKU表)】的数据库操作Mapper
* @createDate 2024-06-04 17:11:49
* @Entity cn.qihangerp.pdd.domain.PddGoodsSku
*/
public interface PddGoodsSkuMapper extends BaseMapper<PddGoodsSku> {
    IPage<PddGoodsSkuListVo> selectSkuPageList(Page<PddGoodsSku> page,
                                               @Param("shopId") Integer shopId,
                                               @Param("goodsId") Long goodsId,
                                               @Param("skuId") Long skuId,
                                               @Param("outerId") String outerId,
                                               @Param("hasLink") Integer hasLink
    );
}




