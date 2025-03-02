package cn.qihangerp.module.open.jd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.open.jd.domain.JdVcOrder;
import cn.qihangerp.module.open.jd.domain.bo.JdOrderBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @author TW
 * @description 针对表【jd_vc_order】的数据库操作Service
 * @createDate 2024-05-25 17:19:21
 */
public interface JdVcOrderService extends IService<JdVcOrder> {
    PageResult<JdVcOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveOrder(Long shopId, JdVcOrder order);
    JdVcOrder queryDetailByOrderId(Long customOrderId);
}
