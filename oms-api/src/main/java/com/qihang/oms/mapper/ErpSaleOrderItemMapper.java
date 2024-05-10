package com.qihang.oms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qihang.oms.domain.ErpSaleOrderItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.qihang.oms.domain.bo.OrderItemListBo;
import com.qihang.oms.domain.vo.OrderItemListVo;
import io.lettuce.core.dynamic.annotation.Param;

import java.util.List;

/**
* @author TW
* @description 针对表【erp_sale_order_item(订单明细表)】的数据库操作Mapper
* @createDate 2024-05-09 17:34:42
* @Entity com.qihang.oms.domain.ErpSaleOrderItem
*/
public interface ErpSaleOrderItemMapper extends BaseMapper<ErpSaleOrderItem> {
    Page<OrderItemListVo> selectPageVo(@Param("page") Page<OrderItemListVo> page, @Param("qw") OrderItemListBo qw);
    List<OrderItemListVo> selectOrderItemListByOrderId(@Param("orderId") Long orderId);
}




