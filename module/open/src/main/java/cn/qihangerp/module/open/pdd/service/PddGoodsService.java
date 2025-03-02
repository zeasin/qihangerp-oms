package cn.qihangerp.module.open.pdd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.pdd.domain.PddGoods;
import cn.qihangerp.module.open.pdd.domain.bo.PddGoodsBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【pdd_goods(pdd商品表)】的数据库操作Service
* @createDate 2024-06-04 17:11:49
*/
public interface PddGoodsService extends IService<PddGoods> {
    PageResult<PddGoods> queryPageList(PddGoodsBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveGoods(Long shopId, PddGoods goods);
}
