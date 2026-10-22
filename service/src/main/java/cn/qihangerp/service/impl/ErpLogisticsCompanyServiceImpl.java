package cn.qihangerp.service.impl;


import cn.qihangerp.mapper.ErpLogisticsCompanyMapper;
import cn.qihangerp.service.ErpLogisticsCompanyService;
import cn.qihangerp.request.LogisticsCompanyRequest;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.model.entity.ErpLogisticsCompany;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service实现
* @createDate 2024-03-22 11:03:11
*/
@AllArgsConstructor
@Service
public class ErpLogisticsCompanyServiceImpl extends ServiceImpl<ErpLogisticsCompanyMapper, ErpLogisticsCompany>
    implements ErpLogisticsCompanyService {
    private final ErpLogisticsCompanyMapper mapper;

    @Override
    public PageResult<ErpLogisticsCompany> queryPageList(LogisticsCompanyRequest request, PageQuery pageQuery) {
        pageQuery.setOrderByColumn("status");
        pageQuery.setIsAsc("desc");
        LambdaQueryWrapper<ErpLogisticsCompany> queryWrapper = new LambdaQueryWrapper<ErpLogisticsCompany>()
                .eq(StringUtils.hasText(request.getType()),ErpLogisticsCompany::getType, request.getType())
                .eq(request.getPlatformId() != null, ErpLogisticsCompany::getPlatformId, request.getPlatformId())
                .like(StringUtils.hasText(request.getName()), ErpLogisticsCompany::getName, request.getName())
                .eq(request.getStatus() != null, ErpLogisticsCompany::getStatus, request.getStatus());
        queryWrapper.orderByDesc(ErpLogisticsCompany::getStatus);
        Page<ErpLogisticsCompany> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Override
    public List<ErpLogisticsCompany> queryListByStatus(String name, Integer status, Integer shopType, Integer shopId, Long supplierId) {
        LambdaQueryWrapper<ErpLogisticsCompany> queryWrapper = new LambdaQueryWrapper<ErpLogisticsCompany>().
                like(StringUtils.hasText(name), ErpLogisticsCompany::getName, name)
                .eq(status != null, ErpLogisticsCompany::getStatus, status)
                .eq(shopId != null, ErpLogisticsCompany::getShopId, shopId)
                .eq(shopType != null, ErpLogisticsCompany::getPlatformId, shopType)
                .eq(supplierId != null && supplierId>0, ErpLogisticsCompany::getSupplierId, supplierId);
        return mapper.selectList(queryWrapper);
    }

    @Override
    public int updateStatus(String id, Integer status) {
        ErpLogisticsCompany update = new ErpLogisticsCompany();
        update.setId(id);
        update.setStatus(status);
        return mapper.updateById(update);
    }

    @Override
    public int insert(ErpLogisticsCompany logisticsCompany) {
        List<ErpLogisticsCompany> sysLogisticsCompanies = mapper.selectList(new LambdaQueryWrapper<ErpLogisticsCompany>()
                .eq(ErpLogisticsCompany::getPlatformId, logisticsCompany.getPlatformId())
                .eq(ErpLogisticsCompany::getLogisticsId, logisticsCompany.getLogisticsId()));
        if (sysLogisticsCompanies == null || sysLogisticsCompanies.size() == 0) {
            return mapper.insert(logisticsCompany);
        }
        return 0;
    }

    @Override
    public ErpLogisticsCompany queryByCode(String code, Integer shopType) {

        List<ErpLogisticsCompany> erpLogisticsCompanies = mapper.selectList(new LambdaQueryWrapper<ErpLogisticsCompany>().eq(ErpLogisticsCompany::getCode, code).eq(ErpLogisticsCompany::getPlatformId, shopType));
        if (erpLogisticsCompanies == null || erpLogisticsCompanies.size() == 0) {
            return null;
        }else return erpLogisticsCompanies.get(0);
    }

    @Override
    public List<ErpLogisticsCompany> queryDistinctByName(String name) {
        return mapper.selectDistinctByName(name);
    }

    @Override
    public ErpLogisticsCompany queryByNameAndPlatform(String name, Integer platformId) {
        List<ErpLogisticsCompany> list = mapper.selectList(new LambdaQueryWrapper<ErpLogisticsCompany>()
                .eq(ErpLogisticsCompany::getName, name)
                .eq(ErpLogisticsCompany::getPlatformId, platformId)
                .eq(ErpLogisticsCompany::getStatus, 0));
        return list != null && !list.isEmpty() ? list.get(0) : null;
    }
}




