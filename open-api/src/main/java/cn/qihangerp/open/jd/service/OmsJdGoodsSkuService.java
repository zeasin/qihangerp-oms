package cn.qihangerp.open.jd.service;

import cn.qihangerp.open.jd.domain.OmsJdGoodsSku;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;


/**
* @author TW
* @description 针对表【oms_jd_goods_sku(京东商品SKU表)】的数据库操作Service
* @createDate 2024-05-10 10:56:39
*/
public interface OmsJdGoodsSkuService extends IService<OmsJdGoodsSku> {
    PageResult<OmsJdGoodsSku> queryPageList(OmsJdGoodsSku bo, PageQuery pageQuery);

    ResultVo<Integer> saveGoodsSku(Long shopId, OmsJdGoodsSku goodsSku);
}
