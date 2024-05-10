package com.qihang.tao.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.tao.domain.OmsTaoGoods;
import com.qihang.tao.domain.OmsTaoGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;

/**
* @author TW
* @description 针对表【oms_tao_goods_sku(淘宝商品SKU表)】的数据库操作Service
* @createDate 2024-05-09 16:15:39
*/
public interface OmsTaoGoodsSkuService extends IService<OmsTaoGoodsSku> {
    PageResult<TaoGoodsSkuListVo> queryPageList(OmsTaoGoods bo, PageQuery pageQuery);
}
