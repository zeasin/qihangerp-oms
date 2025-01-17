package cn.qihangerp.open.dou.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import cn.qihangerp.open.dou.domain.OmsDouGoods;

/**
* @author TW
* @description 针对表【oms_dou_goods(抖店商品表)】的数据库操作Service
* @createDate 2024-06-11 14:49:40
*/
public interface OmsDouGoodsService extends IService<OmsDouGoods> {
    PageResult<OmsDouGoods> queryPageList(OmsDouGoods bo, PageQuery pageQuery);

    int saveAndUpdateGoods(Long shopId,OmsDouGoods goods);
}
