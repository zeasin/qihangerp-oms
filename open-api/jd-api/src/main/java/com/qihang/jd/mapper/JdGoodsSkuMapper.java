package com.qihang.jd.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qihang.jd.domain.JdGoodsSku;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Mapper
* @createDate 2024-03-09 20:44:11
* @Entity com.qihang.jd.domain.JdGoodsSku
*/
public interface JdGoodsSkuMapper extends BaseMapper<JdGoodsSku> {
    IPage<JdGoodsSku> selectSkuPageList(Page<JdGoodsSku> page, @Param("shopId") Integer shopId);
}




