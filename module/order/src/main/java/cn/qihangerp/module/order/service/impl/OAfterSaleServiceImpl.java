package cn.qihangerp.module.order.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.module.order.domain.OAfterSale;
import cn.qihangerp.module.order.mapper.OAfterSaleMapper;
import cn.qihangerp.module.order.service.OAfterSaleService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【o_after_sale(OMS售后处理表)】的数据库操作Service实现
* @createDate 2024-09-15 21:30:30
*/
@AllArgsConstructor
@Service
public class OAfterSaleServiceImpl extends ServiceImpl<OAfterSaleMapper, OAfterSale>
    implements OAfterSaleService {
    private final OAfterSaleMapper mapper;
    @Override
    public PageResult<OAfterSale> queryPageList(OAfterSale bo, PageQuery pageQuery) {
        LambdaQueryWrapper<OAfterSale> queryWrapper = new LambdaQueryWrapper<OAfterSale>()
        .eq( bo.getStatus()!=null,OAfterSale::getStatus, bo.getStatus())
                .eq( bo.getType()!=null,OAfterSale::getType, bo.getType())
                .eq(StringUtils.isNotBlank(bo.getRefundNum()),OAfterSale::getRefundNum, bo.getRefundNum())
                .eq(StringUtils.isNotBlank(bo.getOrderNum()),OAfterSale::getOrderNum, bo.getOrderNum())
                .eq(StringUtils.isNotBlank(bo.getSkuCode()),OAfterSale::getSkuCode, bo.getSkuCode())
                .eq(bo.getShopId() != null, OAfterSale::getShopId, bo.getShopId());

        Page<OAfterSale> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




