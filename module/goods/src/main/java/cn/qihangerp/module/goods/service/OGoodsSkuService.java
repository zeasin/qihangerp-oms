package cn.qihangerp.module.goods.service;


import cn.qihangerp.module.goods.domain.OGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author TW
* @description 针对表【o_goods_sku(商品规格库存管理)】的数据库操作Service
* @createDate 2024-03-11 14:24:49
*/
public interface OGoodsSkuService extends IService<OGoodsSku> {
    List<OGoodsSku> searchGoodsSpec(String keyword);
}
