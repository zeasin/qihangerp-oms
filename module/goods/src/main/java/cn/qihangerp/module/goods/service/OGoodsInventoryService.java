package cn.qihangerp.module.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.goods.domain.OGoodsInventory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_goods_inventory(商品库存表)】的数据库操作Service
* @createDate 2024-09-23 22:39:50
*/
public interface OGoodsInventoryService extends IService<OGoodsInventory> {
    PageResult<OGoodsInventory> queryPageList(OGoodsInventory bo, PageQuery pageQuery);
    long getAllInventoryQuantity();
}
