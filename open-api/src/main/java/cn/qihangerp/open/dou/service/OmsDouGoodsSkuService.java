package cn.qihangerp.open.dou.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import cn.qihangerp.open.dou.domain.OmsDouGoodsSku;

/**
* @author TW
* @description 针对表【oms_dou_goods_sku(抖店商品Sku表)】的数据库操作Service
* @createDate 2024-06-11 14:49:40
*/
public interface OmsDouGoodsSkuService extends IService<OmsDouGoodsSku> {
    PageResult<OmsDouGoodsSku> queryPageList(OmsDouGoodsSku bo, PageQuery pageQuery);
}
