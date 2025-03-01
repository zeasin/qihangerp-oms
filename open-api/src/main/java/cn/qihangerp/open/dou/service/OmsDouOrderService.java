package cn.qihangerp.open.dou.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.open.dou.domain.OmsDouOrder;
import cn.qihangerp.open.dou.domain.bo.DouOrderBo;

/**
* @author TW
* @description 针对表【oms_dou_order(抖店订单表)】的数据库操作Service
* @createDate 2024-06-14 11:20:51
*/
public interface OmsDouOrderService extends IService<OmsDouOrder> {
    PageResult<OmsDouOrder> queryPageList(DouOrderBo bo, PageQuery pageQuery);

    OmsDouOrder queryDetailById(Long id);
    OmsDouOrder queryDetailByOrderId(String orderId);
    /**
     * 保存店铺订单
     * @param shopId
     * @param order
     * @return
     */
    ResultVo<Integer> saveOrder(Long shopId, OmsDouOrder order);
}
