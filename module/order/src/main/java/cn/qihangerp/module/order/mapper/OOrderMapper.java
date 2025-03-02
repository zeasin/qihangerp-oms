package cn.qihangerp.module.order.mapper;


import cn.qihangerp.module.order.domain.OOrder;
import cn.qihangerp.module.order.domain.vo.OrderDiscountVo;
import cn.qihangerp.module.order.domain.vo.SalesDailyVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;


import java.util.List;

/**
* @author TW
* @description 针对表【o_order(订单表)】的数据库操作Mapper
* @createDate 2024-03-11 14:24:49
* @Entity cn.qihangerp.module.order.domain.OOrder
*/
public interface OOrderMapper extends BaseMapper<OOrder> {
    List<OrderDiscountVo> getTaoOrderDiscount(String tid);
    List<OrderDiscountVo> getJdOrderDiscount(String orderId);

    List<SalesDailyVo> salesDaily();
    SalesDailyVo getTodaySalesDaily();
}




