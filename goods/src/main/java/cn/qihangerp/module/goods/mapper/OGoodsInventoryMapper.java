package cn.qihangerp.module.goods.mapper;

import cn.qihangerp.module.goods.domain.OGoodsInventory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
* @author qilip
* @description 针对表【o_goods_inventory(商品库存表)】的数据库操作Mapper
* @createDate 2024-09-23 22:39:50
* @Entity cn.qihangerp.module.goods.domain.OGoodsInventory
*/
public interface OGoodsInventoryMapper extends BaseMapper<OGoodsInventory> {
    long getAllInventoryQuantity();
}




