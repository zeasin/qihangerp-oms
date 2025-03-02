package cn.qihangerp.module.service.impl;


import cn.qihangerp.module.mapper.OLogisticsCompanyMapper;
import cn.qihangerp.module.service.OLogisticsCompanyService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.domain.OLogisticsCompany;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service实现
* @createDate 2024-03-22 11:03:11
*/
@AllArgsConstructor
@Service
public class OLogisticsCompanyServiceImpl extends ServiceImpl<OLogisticsCompanyMapper, OLogisticsCompany>
    implements OLogisticsCompanyService {
    private final OLogisticsCompanyMapper mapper;

    @Override
    public PageResult<OLogisticsCompany> queryPageList(Integer platform, Integer shopId, PageQuery pageQuery) {
        pageQuery.setOrderByColumn("status");
        pageQuery.setIsAsc("desc");
        LambdaQueryWrapper<OLogisticsCompany> queryWrapper = new LambdaQueryWrapper<OLogisticsCompany>().
                eq(OLogisticsCompany::getPlatformId, platform)
                .eq(shopId != null, OLogisticsCompany::getShopId, shopId);

        Page<OLogisticsCompany> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<OLogisticsCompany> queryListByStatus(Integer status, Integer shopType, Integer shopId) {
        LambdaQueryWrapper<OLogisticsCompany> queryWrapper = new LambdaQueryWrapper<OLogisticsCompany>().
                eq(OLogisticsCompany::getStatus, status)
                .eq(shopId != null, OLogisticsCompany::getShopId, shopId)
                .eq(shopType != null, OLogisticsCompany::getPlatformId, shopType);
        return mapper.selectList(queryWrapper);
    }

    @Override
    public int updateStatus(String id, Integer status) {
        OLogisticsCompany update = new OLogisticsCompany();
        update.setId(id);
        update.setStatus(status);
        return mapper.updateById(update);
    }

    @Override
    public int insert(OLogisticsCompany logisticsCompany) {
        List<OLogisticsCompany> sysLogisticsCompanies = mapper.selectList(new LambdaQueryWrapper<OLogisticsCompany>()
                .eq(OLogisticsCompany::getPlatformId, logisticsCompany.getPlatformId())
                .eq(OLogisticsCompany::getLogisticsId, logisticsCompany.getLogisticsId()));
        if (sysLogisticsCompanies == null || sysLogisticsCompanies.size() == 0) {
            return mapper.insert(logisticsCompany);
        }
        return 0;
    }
}




