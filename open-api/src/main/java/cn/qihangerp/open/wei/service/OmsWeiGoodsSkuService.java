package cn.qihangerp.open.wei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import cn.qihangerp.open.wei.domain.OmsWeiGoodsSku;

/**
* @author TW
* @description 针对表【oms_wei_goods_sku】的数据库操作Service
* @createDate 2024-06-03 16:51:29
*/
public interface OmsWeiGoodsSkuService extends IService<OmsWeiGoodsSku> {
    PageResult<OmsWeiGoodsSku> queryPageList(OmsWeiGoodsSku bo, PageQuery pageQuery);
}
