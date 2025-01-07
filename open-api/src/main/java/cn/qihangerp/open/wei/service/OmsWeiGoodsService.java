package cn.qihangerp.open.wei.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.open.wei.domain.OmsWeiGoods;

/**
* @author TW
* @description 针对表【oms_wei_goods】的数据库操作Service
* @createDate 2024-06-03 16:51:29
*/
public interface OmsWeiGoodsService extends IService<OmsWeiGoods> {
    int saveAndUpdateGoods(Long shopId,OmsWeiGoods goods);
}
