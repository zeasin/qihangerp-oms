package cn.qihangerp.module.open.jd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.jd.domain.JdGoods;
import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author qilip
* @description 针对表【jd_goods】的数据库操作Service
* @createDate 2024-03-09 11:29:59
*/
public interface JdGoodsService extends IService<JdGoods> {
    PageResult<JdGoods> queryPageList(JdGoodsBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveGoods(Long shopId, JdGoods goods);
    ResultVo<Integer> saveGoodsSku(Long shopId, JdGoodsSku goodsSku);
}
