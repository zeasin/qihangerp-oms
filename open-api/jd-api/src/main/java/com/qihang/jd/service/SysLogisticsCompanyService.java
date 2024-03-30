package com.qihang.jd.service;

import com.qihang.jd.domain.SysLogisticsCompany;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service
* @createDate 2024-03-22 10:07:44
*/
public interface SysLogisticsCompanyService extends IService<SysLogisticsCompany> {
    int insert(SysLogisticsCompany logisticsCompany);
}
