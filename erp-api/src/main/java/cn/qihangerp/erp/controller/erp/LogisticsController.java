package cn.qihangerp.erp.controller.erp;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.model.entity.ErpLogisticsCompany;
import cn.qihangerp.request.LogisticsCompanyRequest;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.service.ErpLogisticsCompanyService;
import cn.qihangerp.service.SysThirdSystemConfigService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/logistics")
public class LogisticsController extends BaseController {
    private final ErpLogisticsCompanyService logisticsCompanyService;
    private SysThirdSystemConfigService thirdSystemConfigService;
    /**
     * 查询店铺列表logistics
     */
    @GetMapping("/list")
    public TableDataInfo logisticsList(LogisticsCompanyRequest request, PageQuery pageQuery)
    {
//        request.setType("PT");
//        // 查询点三配置
//        List<SysThirdSystemConfig> configs = thirdSystemConfigService.getConfigListBySystemId(EnumThirdSystemId.DIANSAN.getIndex(),0L);
//        if(configs!=null || configs.size() > 0) {
//            request.setType("DIANSAN");
//        }
        if(request.getPlatformId()!=null && request.getPlatformId()==280) request.setPlatformId(200);
        PageResult<ErpLogisticsCompany> result = logisticsCompanyService.queryPageList(request, pageQuery);
        return getDataTable(result);
    }
    @GetMapping("/list_status")
    public TableDataInfo logisticsStatusList(Integer status, Integer shopType, Integer shopId)
    {
        var result =logisticsCompanyService.queryListByStatus(null,status,shopType, shopId,null);
        return getDataTable(result);
    }
    @PutMapping("/updateStatus")
    public AjaxResult logisticsUpdateStatus(@RequestBody ErpLogisticsCompany company)
    {
        Integer newStatus = null;
        if(company.getStatus()==null || company.getStatus().intValue() ==0){
            newStatus = 1;
        }else{
            newStatus = 0;
        }
        return toAjax(logisticsCompanyService.updateStatus(company.getId(),newStatus));
    }

    /**
     * 获取物流公司详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(logisticsCompanyService.getById(id));
    }

    /**
     * 新增物流公司
     */
    @PostMapping("/add")
    public AjaxResult add(@RequestBody ErpLogisticsCompany bLogisticsCompany)
    {
        return toAjax(logisticsCompanyService.save(bLogisticsCompany));
    }

    /**
     * 修改物流公司
     */
    @PutMapping("/update")
    public AjaxResult edit(@RequestBody ErpLogisticsCompany bLogisticsCompany)
    {
        return toAjax(logisticsCompanyService.updateById(bLogisticsCompany));
    }

    /**
     * 删除物流公司
     */
    @DeleteMapping("/del/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(logisticsCompanyService.removeBatchByIds(Arrays.stream(ids).toList()));
    }
}
