package cn.qihangerp.module.open.wei.service;

import cn.qihangerp.module.open.wei.domain.OmsWeiGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【oms_wei_goods】的数据库操作Service
* @createDate 2024-09-21 15:09:54
*/
public interface OmsWeiGoodsService extends IService<OmsWeiGoods> {
    int saveAndUpdateGoods(Long shopId,OmsWeiGoods goods);
}
