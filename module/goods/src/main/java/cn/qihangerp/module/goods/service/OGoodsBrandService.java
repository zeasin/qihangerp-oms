package cn.qihangerp.module.goods.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.goods.domain.OGoodsBrand;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【o_goods_brand】的数据库操作Service
* @createDate 2024-09-07 16:11:56
*/
public interface OGoodsBrandService extends IService<OGoodsBrand> {
    PageResult<OGoodsBrand> queryPageList(OGoodsBrand bo, PageQuery pageQuery);
}
