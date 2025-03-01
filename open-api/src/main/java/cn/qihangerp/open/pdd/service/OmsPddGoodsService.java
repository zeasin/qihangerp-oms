package cn.qihangerp.open.pdd.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.open.pdd.domain.OmsPddGoods;

/**
* @author TW
* @description 针对表【oms_pdd_goods(pdd商品表)】的数据库操作Service
* @createDate 2024-06-11 14:16:55
*/
public interface OmsPddGoodsService extends IService<OmsPddGoods> {
    PageResult<OmsPddGoods> queryPageList(OmsPddGoods bo, PageQuery pageQuery);

    int saveAndUpdateGoods(Long shopId,OmsPddGoods goods);
}
