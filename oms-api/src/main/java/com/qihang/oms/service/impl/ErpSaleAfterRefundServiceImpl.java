package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleAfterRefund;
import com.qihang.oms.domain.ErpSaleOrder;
import com.qihang.oms.domain.ErpSaleOrderItem;
import com.qihang.oms.service.ErpSaleAfterRefundService;
import com.qihang.oms.mapper.ErpSaleAfterRefundMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
* @author TW
* @description 针对表【erp_sale_after_refund(售后退款表)】的数据库操作Service实现
* @createDate 2024-06-19 17:59:48
*/
@AllArgsConstructor
@Service
public class ErpSaleAfterRefundServiceImpl extends ServiceImpl<ErpSaleAfterRefundMapper, ErpSaleAfterRefund>
    implements ErpSaleAfterRefundService{
    private final  ErpSaleAfterRefundMapper mapper;
    @Override
    public PageResult<ErpSaleAfterRefund> queryPageList(ErpSaleAfterRefund bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSaleAfterRefund> queryWrapper = new LambdaQueryWrapper<ErpSaleAfterRefund>()
                .eq(bo.getShopId()!=null,ErpSaleAfterRefund::getShopId,bo.getShopId())
                .eq(StringUtils.hasText(bo.getRefundNum()),ErpSaleAfterRefund::getRefundNum,bo.getRefundNum())
                .eq(StringUtils.hasText(bo.getOriginalOrderId()),ErpSaleAfterRefund::getOriginalOrderId,bo.getOriginalOrderId())
                ;
        Page<ErpSaleAfterRefund> pages = mapper.selectPage(pageQuery.build(), queryWrapper);



        return PageResult.build(pages);
    }
}




