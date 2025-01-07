package cn.qihangerp.open.pdd.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import cn.qihangerp.open.pdd.domain.OmsPddGoodsSku;

/**
* @author TW
* @description 针对表【oms_pdd_goods_sku(pdd商品SKU表)】的数据库操作Service
* @createDate 2024-06-11 14:16:55
*/
public interface OmsPddGoodsSkuService extends IService<OmsPddGoodsSku> {
    PageResult<OmsPddGoodsSku> queryPageList(OmsPddGoodsSku bo, PageQuery pageQuery);
}
