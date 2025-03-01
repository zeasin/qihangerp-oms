package cn.qihangerp.oms.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.oms.domain.ErpSaleOrderItem;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.oms.domain.bo.OrderItemListBo;
import cn.qihangerp.oms.domain.vo.OrderItemListVo;

/**
* @author TW
* @description 针对表【erp_sale_order_item(订单明细表)】的数据库操作Service
* @createDate 2024-05-09 17:34:42
*/

public interface ErpSaleOrderItemService extends IService<ErpSaleOrderItem> {
    PageResult<OrderItemListVo> selectPageVo(PageQuery pageQuery, OrderItemListBo bo);
}
