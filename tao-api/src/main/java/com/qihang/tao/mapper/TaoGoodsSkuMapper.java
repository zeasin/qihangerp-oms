package com.qihang.tao.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qihang.tao.domain.TaoGoodsSku;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;
import org.apache.ibatis.annotations.Param;

/**
* @author TW
* @description 针对表【tao_goods_sku】的数据库操作Mapper
* @createDate 2024-02-29 19:01:35
* @Entity com.qihang.tao.domain.TaoGoodsSku
*/
public interface TaoGoodsSkuMapper extends BaseMapper<TaoGoodsSku> {
    IPage<TaoGoodsSkuListVo> selectSkuPageList(Page<TaoGoodsSku> page, @Param("shopId") Integer shopId,@Param("numIid") Long numIid);
}




