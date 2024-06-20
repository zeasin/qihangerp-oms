package com.qihang.oms.service;

import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.oms.domain.ErpSaleAfterInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【erp_sale_after_info(售后处理表)】的数据库操作Service
* @createDate 2024-06-20 10:58:40
*/
public interface ErpSaleAfterInfoService extends IService<ErpSaleAfterInfo> {
    PageResult<ErpSaleAfterInfo> queryPageList(ErpSaleAfterInfo bo, PageQuery pageQuery);
}
