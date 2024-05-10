package com.qihang.tao.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.tao.domain.OmsTaoGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【oms_tao_goods(淘宝商品表)】的数据库操作Service
* @createDate 2024-05-09 16:15:39
*/
public interface OmsTaoGoodsService extends IService<OmsTaoGoods> {
    PageResult<OmsTaoGoods> queryPageList(OmsTaoGoods bo, PageQuery pageQuery);

    int saveAndUpdateGoods(Long shopId,OmsTaoGoods goods);
}
