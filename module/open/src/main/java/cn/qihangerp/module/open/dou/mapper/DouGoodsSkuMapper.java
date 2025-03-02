package cn.qihangerp.module.open.dou.mapper;

import cn.qihangerp.module.open.dou.domain.DouGoodsSku;
import cn.qihangerp.module.open.dou.domain.vo.DouGoodsSkuListVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Param;

/**
* @author TW
* @description 针对表【dou_goods_sku(抖店商品Sku表)】的数据库操作Mapper
* @createDate 2024-05-31 17:23:21
* @Entity cn.qihangerp.dou.domain.DouGoodsSku
*/
public interface DouGoodsSkuMapper extends BaseMapper<DouGoodsSku> {
    IPage<DouGoodsSkuListVo> selectSkuPageList(Page<DouGoodsSku> page,
                                               @Param("shopId") Integer shopId,
                                               @Param("productId") Long productId,
                                               @Param("skuId") Long skuId,
                                               @Param("code") String code,
                                               @Param("hasLink") Integer hasLink
    );
}




