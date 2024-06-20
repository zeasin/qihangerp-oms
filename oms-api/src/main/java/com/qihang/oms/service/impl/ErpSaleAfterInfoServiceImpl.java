package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleAfterInfo;
import com.qihang.oms.service.ErpSaleAfterInfoService;
import com.qihang.oms.mapper.ErpSaleAfterInfoMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【erp_sale_after_info(售后处理表)】的数据库操作Service实现
* @createDate 2024-06-20 10:58:40
*/
@AllArgsConstructor
@Service
public class ErpSaleAfterInfoServiceImpl extends ServiceImpl<ErpSaleAfterInfoMapper, ErpSaleAfterInfo>
    implements ErpSaleAfterInfoService{
    private final ErpSaleAfterInfoMapper mapper;
    @Override
    public PageResult<ErpSaleAfterInfo> queryPageList(ErpSaleAfterInfo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<ErpSaleAfterInfo> queryWrapper = new LambdaQueryWrapper<ErpSaleAfterInfo>().
                eq( ErpSaleAfterInfo::getType, bo.getType())
                .eq(bo.getShopId() != null, ErpSaleAfterInfo::getShopId, bo.getShopId());

        Page<ErpSaleAfterInfo> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }
}




