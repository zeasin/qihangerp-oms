package cn.qihangerp.module.open.dou.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.dou.domain.DouGoods;
import cn.qihangerp.module.open.dou.domain.bo.DouGoodsBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【dou_goods(抖店商品表)】的数据库操作Service
* @createDate 2024-05-31 17:23:21
*/
public interface DouGoodsService extends IService<DouGoods> {
    PageResult<DouGoods> queryPageList(DouGoodsBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveGoods(Long shopId, DouGoods goods);
}
