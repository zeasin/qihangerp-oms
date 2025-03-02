package cn.qihangerp.module.open.jd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.open.jd.domain.JdVcGoods;
import cn.qihangerp.module.open.jd.domain.bo.JdGoodsBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【jd_vc_goods】的数据库操作Service
* @createDate 2024-05-25 15:31:46
*/
public interface JdVcGoodsService extends IService<JdVcGoods> {

    PageResult<JdVcGoods> queryPageList(JdGoodsBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveGoods(Long shopId, JdVcGoods goods);
}
