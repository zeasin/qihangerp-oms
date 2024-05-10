package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleOrderItem;
import com.qihang.oms.domain.bo.OrderItemListBo;
import com.qihang.oms.domain.vo.OrderItemListVo;
import com.qihang.oms.service.ErpSaleOrderItemService;
import com.qihang.oms.mapper.ErpSaleOrderItemMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【erp_sale_order_item(订单明细表)】的数据库操作Service实现
* @createDate 2024-05-09 17:34:42
*/
@AllArgsConstructor
@Service
public class ErpSaleOrderItemServiceImpl extends ServiceImpl<ErpSaleOrderItemMapper, ErpSaleOrderItem>
    implements ErpSaleOrderItemService{
    private final ErpSaleOrderItemMapper mapper;

    @Override
    public PageResult<OrderItemListVo> selectPageVo(PageQuery pageQuery, OrderItemListBo bo) {
        var pages = mapper.selectPageVo(pageQuery.build(),bo);
        return   PageResult.build(pages);
    }
}




