package com.qihang.tao.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qihang.tao.domain.OmsTaoGoodsSku;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import org.apache.ibatis.annotations.Param;

/**
* @author TW
* @description 针对表【oms_tao_goods_sku(淘宝商品SKU表)】的数据库操作Mapper
* @createDate 2024-05-09 16:15:39
* @Entity com.qihang.tao.domain.OmsTaoGoodsSku
*/
public interface OmsTaoGoodsSkuMapper extends BaseMapper<OmsTaoGoodsSku> {
    IPage<TaoGoodsSkuListVo> selectSkuPageList(Page<OmsTaoGoodsSku> page, @Param("shopId") Long shopId, @Param("numIid") Long numIid);
}




