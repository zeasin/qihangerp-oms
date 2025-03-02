package cn.qihangerp.module.open.pdd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.module.open.pdd.domain.PddGoodsSku;
import cn.qihangerp.module.open.pdd.domain.bo.PddGoodsBo;
import cn.qihangerp.module.open.pdd.domain.vo.PddGoodsSkuListVo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【pdd_goods_sku(pdd商品SKU表)】的数据库操作Service
* @createDate 2024-06-04 17:11:49
*/
public interface PddGoodsSkuService extends IService<PddGoodsSku> {
    PageResult<PddGoodsSkuListVo> queryPageList(PddGoodsBo bo, PageQuery pageQuery);
}
