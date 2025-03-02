package cn.qihangerp.module.open.tao.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.module.open.tao.domain.TaoGoodsSku;
import cn.qihangerp.module.open.tao.domain.bo.TaoGoodsBo;
import cn.qihangerp.module.open.tao.domain.vo.TaoGoodsSkuListVo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【tao_goods_sku】的数据库操作Service
* @createDate 2024-02-29 19:01:35
*/
public interface TaoGoodsSkuService extends IService<TaoGoodsSku> {
    PageResult<TaoGoodsSkuListVo> queryPageList(TaoGoodsBo bo, PageQuery pageQuery);
}
