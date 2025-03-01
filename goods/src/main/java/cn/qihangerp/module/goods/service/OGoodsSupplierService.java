package cn.qihangerp.module.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.goods.domain.OGoodsSupplier;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_goods_supplier】的数据库操作Service
* @createDate 2024-09-07 16:35:43
*/
public interface OGoodsSupplierService extends IService<OGoodsSupplier> {
    PageResult<OGoodsSupplier> queryPageList(OGoodsSupplier bo, PageQuery pageQuery);
}
