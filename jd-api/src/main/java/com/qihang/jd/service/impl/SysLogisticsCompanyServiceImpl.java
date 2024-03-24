package com.qihang.jd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.jd.domain.SysLogisticsCompany;
import com.qihang.jd.service.SysLogisticsCompanyService;
import com.qihang.jd.mapper.SysLogisticsCompanyMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service实现
* @createDate 2024-03-22 10:07:44
*/
@AllArgsConstructor
@Service
public class SysLogisticsCompanyServiceImpl extends ServiceImpl<SysLogisticsCompanyMapper, SysLogisticsCompany>
    implements SysLogisticsCompanyService{
    private final SysLogisticsCompanyMapper mapper;
    @Override
    public int insert(SysLogisticsCompany logisticsCompany) {
        List<SysLogisticsCompany> sysLogisticsCompanies = mapper.selectList(new LambdaQueryWrapper<SysLogisticsCompany>()
                .eq(SysLogisticsCompany::getPlatformId, logisticsCompany.getPlatformId())
                .eq(SysLogisticsCompany::getLogisticsId, logisticsCompany.getLogisticsId()));
        if(sysLogisticsCompanies == null || sysLogisticsCompanies.size() ==0){
            return mapper.insert(logisticsCompany);
        }
        return 0;
    }
}




