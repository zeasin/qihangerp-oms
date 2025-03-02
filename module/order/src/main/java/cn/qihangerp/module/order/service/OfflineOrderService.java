package cn.qihangerp.module.order.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;

import cn.qihangerp.module.order.domain.OfflineOrder;
import cn.qihangerp.module.order.domain.bo.OfflineOrderCreateBo;
import cn.qihangerp.module.order.domain.bo.OfflineOrderShipBo;
import com.baomidou.mybatisplus.extension.service.IService;

import cn.qihangerp.request.OrderSearchRequest;


/**
* @author qilip
* @description 针对表【offline_order(线下渠道订单表)】的数据库操作Service
* @createDate 2024-07-27 23:03:38
*/
public interface OfflineOrderService extends IService<OfflineOrder> {
    PageResult<OfflineOrder> queryPageList(OrderSearchRequest bo, PageQuery pageQuery);

    OfflineOrder queryDetailById(Long id);

    /**
     * 手动添加订单
     * @param bo
     * @return
     */
    Long insertOfflineOrder(OfflineOrderCreateBo bo, String createBy);
    int orderLogistics(OfflineOrderShipBo bo, String operator);
}
