package cn.qihangerp.mapper;

import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.vo.OrderDiscountVo;
import cn.qihangerp.model.vo.SalesDailyVo;
import cn.qihangerp.model.vo.WaitShipReportVo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


import java.util.List;

/**
* @author TW
* @description 针对表【o_order(订单表)】的数据库操作Mapper
* @createDate 2024-03-11 14:24:49
* @Entity cn.qihangerp.model.entity.OOrder
*/
public interface OOrderMapper extends BaseMapper<OOrder> {
    /**
     * 行锁订单（拆单等并发操作使用）
     */
    @Select("SELECT * FROM o_order WHERE id = #{id} FOR UPDATE")
    OOrder lockById(@Param("id") Long id);

    List<OrderDiscountVo> getTaoOrderDiscount(String tid);
    List<OrderDiscountVo> getJdOrderDiscount(String orderId);


    List<SalesDailyVo> salesDaily(@Param("merchantId") Long merchantId,@Param("shopId") Long shopId);
    /**
     * 待发货统计
     * @param merchantId
     * @return
     */
    List<WaitShipReportVo> waitOrderReport(@Param("merchantId") Long merchantId);
    SalesDailyVo getTodaySalesDaily(@Param("merchantId") Long merchantId);
    Integer getWaitShipOrderAllCount(@Param("merchantId") Long merchantId);

}




