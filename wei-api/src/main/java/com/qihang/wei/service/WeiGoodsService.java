package com.qihang.wei.service;

import com.qihang.wei.domain.WeiGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【wei_goods】的数据库操作Service
* @createDate 2024-03-29 11:25:17
*/
public interface WeiGoodsService extends IService<WeiGoods> {
    int saveAndUpdateGoods(Integer shopId,WeiGoods goods);
}
