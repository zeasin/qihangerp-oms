package cn.qihangerp.module.open.jd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.open.jd.domain.JdGoodsSku;
import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import cn.qihangerp.module.open.jd.domain.vo.JdGoodsSkuListVo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【jd_goods_sku】的数据库操作Service
* @createDate 2024-03-09 20:44:11
*/
public interface JdGoodsSkuService extends IService<JdGoodsSku> {
    PageResult<JdGoodsSkuListVo> queryPageList(JdGoodsBo bo, PageQuery pageQuery);
}
