package cn.qihangerp.open.jd.service;

import cn.qihangerp.open.jd.domain.OmsJdOrder;
import cn.qihangerp.open.jd.domain.bo.JdOrderBo;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;


/**
* @author TW
* @description 针对表【oms_jd_order(京东订单表)】的数据库操作Service
* @createDate 2024-05-10 10:54:06
*/
public interface OmsJdOrderService extends IService<OmsJdOrder> {
    PageResult<OmsJdOrder> queryPageList(JdOrderBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveOrder(Long shopId, OmsJdOrder order);
    OmsJdOrder queryDetailById(Long id);
}
