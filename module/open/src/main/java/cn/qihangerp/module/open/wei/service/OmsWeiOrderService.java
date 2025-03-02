package cn.qihangerp.module.open.wei.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.open.wei.domain.OmsWeiOrder;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【oms_wei_order】的数据库操作Service
* @createDate 2024-06-03 16:48:31
*/
public interface OmsWeiOrderService extends IService<OmsWeiOrder> {
    PageResult<OmsWeiOrder> queryPageList(OmsWeiOrder bo, PageQuery pageQuery);
    ResultVo<Integer> saveOrder(Long shopId, OmsWeiOrder order);
    OmsWeiOrder queryDetailById(Long id);
    OmsWeiOrder queryDetailByOrderId(String orderId);
}
