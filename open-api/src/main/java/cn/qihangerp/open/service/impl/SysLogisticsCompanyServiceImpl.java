package cn.qihangerp.open.service.impl;

import cn.qihangerp.open.domain.SysLogisticsCompany;
import cn.qihangerp.open.mapper.SysLogisticsCompanyMapper;
import cn.qihangerp.open.service.SysLogisticsCompanyService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service实现
* @createDate 2024-03-22 09:57:38
*/
@AllArgsConstructor
@Service
public class SysLogisticsCompanyServiceImpl extends ServiceImpl<SysLogisticsCompanyMapper, SysLogisticsCompany>
    implements SysLogisticsCompanyService {
    private final SysLogisticsCompanyMapper mapper;
    @Override
    public int insert(SysLogisticsCompany logisticsCompany) {
        List<SysLogisticsCompany> sysLogisticsCompanies = mapper.selectList(new LambdaQueryWrapper<SysLogisticsCompany>()
                .eq(SysLogisticsCompany::getPlatformId, logisticsCompany.getPlatformId())
                .eq(SysLogisticsCompany::getCode, logisticsCompany.getCode()));
        if(sysLogisticsCompanies == null || sysLogisticsCompanies.size() ==0){
            return mapper.insert(logisticsCompany);
        }
        return 0;
    }
}




