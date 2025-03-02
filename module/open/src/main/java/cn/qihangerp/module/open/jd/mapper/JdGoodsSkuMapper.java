package cn.qihangerp.module.open.jd.mapper;

import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.vo.JdGoodsSkuListVo;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import org.apache.ibatis.annotations.Param;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Mapper
* @createDate 2024-03-09 20:44:11
* @Entity cn.qihangerp.jd.domain.JdGoodsSku
*/
public interface JdGoodsSkuMapper extends BaseMapper<JdGoodsSku> {
    IPage<JdGoodsSkuListVo> selectSkuPageList(Page<JdGoodsSku> page,
                                              @Param("shopId") Integer shopId,
                                              @Param("wareId") Long wareId,
                                              @Param("skuId") Long skuId,
                                              @Param("outerId") String outerId,
                                              @Param("hasLink") Integer hasLink
                                              );
}




