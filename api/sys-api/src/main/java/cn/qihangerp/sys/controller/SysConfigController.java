package cn.qihangerp.sys.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.module.domain.SysConfig;
import cn.qihangerp.module.service.SysConfigService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/system/config")
public class SysConfigController {
    private final SysConfigService configService;

    @GetMapping(value = "/getConfigValue/{key}")
    public AjaxResult getConfigValue(@PathVariable String key)
    {
        List<SysConfig> list = configService.list(new LambdaQueryWrapper<SysConfig>().eq(SysConfig::getConfigKey, key));
        if(list!=null && !list.isEmpty())
        {
            return AjaxResult.success(list.get(0));
        }else{
            return AjaxResult.success();
        }
    }
}
