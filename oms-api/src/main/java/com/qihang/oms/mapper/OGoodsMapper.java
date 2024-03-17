package com.qihang.oms.mapper;

import com.qihang.oms.domain.OGoods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qihang.oms.vo.GoodsSpecListVo;

import java.util.List;

/**
* @author TW
* @description 针对表【o_goods(商品库存管理)】的数据库操作Mapper
* @createDate 2024-03-11 14:24:49
* @Entity com.qihang.oms.domain.OGoods
*/
public interface OGoodsMapper extends BaseMapper<OGoods> {
    List<GoodsSpecListVo> searchGoodsSpec(String keyword);
}




