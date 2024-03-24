package com.qihang.tao.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.TaoGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.domain.vo.TaoGoodsSkuListVo;

/**
* @author TW
* @description 针对表【tao_goods_sku】的数据库操作Service
* @createDate 2024-02-29 19:01:35
*/
public interface TaoGoodsSkuService extends IService<TaoGoodsSku> {
    PageResult<TaoGoodsSkuListVo> queryPageList(TaoGoodsBo bo, PageQuery pageQuery);
}
