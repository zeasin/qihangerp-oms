package cn.qihangerp.module.order.mapper;


import cn.qihangerp.module.order.domain.OOrderItem;
import cn.qihangerp.module.order.domain.bo.OrderItemListBo;
import cn.qihangerp.module.order.domain.vo.OrderItemListVo;
import cn.qihangerp.module.order.domain.vo.SalesTopSkuVo;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;


import java.util.List;

/**
* @author TW
* @description 针对表【o_order_item(订单明细表)】的数据库操作Mapper
* @createDate 2024-03-11 14:24:49
* @Entity cn.qihangerp.module.order.domain.OOrderItem
*/
public interface OOrderItemMapper extends BaseMapper<OOrderItem> {
    Page<OrderItemListVo> selectPageVo(@Param("page") Page<OrderItemListVo> page, @Param("qw") OrderItemListBo qw);
    List<OrderItemListVo> selectOrderItemListByOrderId(@Param("orderId") Long orderId);
    List<SalesTopSkuVo> selectTopSku(@Param("startDate") String startDate, @Param("endDate") String endDate);
}




