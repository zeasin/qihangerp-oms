package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.domain.ErpSaleOrderItem;
import com.qihang.oms.domain.ErpShipStockUp;
import com.qihang.oms.domain.bo.ShipStockUpBo;
import com.qihang.oms.service.ErpShipStockUpService;
import com.qihang.oms.mapper.ErpShipStockUpMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author TW
* @description 针对表【erp_ship_stock_up(备货表)】的数据库操作Service实现
* @createDate 2024-06-18 15:25:18
*/
@AllArgsConstructor
@Service
public class ErpShipStockUpServiceImpl extends ServiceImpl<ErpShipStockUpMapper, ErpShipStockUp>
    implements ErpShipStockUpService{
    private final ErpShipStockUpMapper mapper;

    @Override
    public PageResult<ErpShipStockUp> queryPageList(ShipStockUpBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpShipStockUp> queryWrapper = new LambdaQueryWrapper<ErpShipStockUp>()
                .eq(bo.getShopId()!=null,ErpShipStockUp::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getOrderNum()),ErpShipStockUp::getOrderNum,bo.getOrderNum())
                ;
        Page<ErpShipStockUp> pages = mapper.selectPage(pageQuery.build(), queryWrapper);

        return PageResult.build(pages);
    }
}




