package cn.qihangerp.module.open.dou.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.dou.domain.DouOrder;
import cn.qihangerp.module.open.dou.domain.bo.DouOrderBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【dou_order(抖店订单表)】的数据库操作Service
* @createDate 2024-06-05 15:06:31
*/
public interface DouOrderService extends IService<DouOrder> {
    PageResult<DouOrder> queryPageList(DouOrderBo bo, PageQuery pageQuery);

    DouOrder queryDetailById(Long id);
    DouOrder queryDetailByOrderId(String orderId);
    /**
     * 保存店铺订单
     * @param shopId
     * @param order
     * @return
     */
    ResultVo<Integer> saveOrder(Long shopId, DouOrder order);
}
