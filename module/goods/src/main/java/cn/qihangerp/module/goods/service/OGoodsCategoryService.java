package cn.qihangerp.module.goods.service;

import cn.qihangerp.module.goods.domain.OGoodsCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_goods_category】的数据库操作Service
* @createDate 2024-09-07 16:11:56
*/
public interface OGoodsCategoryService extends IService<OGoodsCategory> {
    void addCategory(OGoodsCategory category);
}
