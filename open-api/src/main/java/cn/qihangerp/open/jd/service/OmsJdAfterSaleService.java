package cn.qihangerp.open.jd.service;

import cn.qihangerp.open.jd.domain.OmsJdAfterSale;
import cn.qihangerp.open.jd.domain.bo.JdAfterBo;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;


/**
* @author TW
* @description 针对表【oms_jd_after_sale(京东退款与售后表)】的数据库操作Service
* @createDate 2024-06-20 15:42:38
*/
public interface OmsJdAfterSaleService extends IService<OmsJdAfterSale> {
    PageResult<OmsJdAfterSale> queryPageList(JdAfterBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveAfter(Long shopId, OmsJdAfterSale after);
}
