package cn.qihangerp.module.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.domain.OLogisticsCompany;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author TW
* @description 针对表【sys_logistics_company(平台快递公司表)】的数据库操作Service
* @createDate 2024-03-22 11:03:11
*/
public interface OLogisticsCompanyService extends IService<OLogisticsCompany> {
    PageResult<OLogisticsCompany> queryPageList(Integer platform, Integer shopId, PageQuery pageQuery);
    List<OLogisticsCompany> queryListByStatus(Integer status, Integer shopType, Integer shopId);
    int updateStatus(String id,Integer status);
    int insert(OLogisticsCompany logisticsCompany);
}
