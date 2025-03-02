package cn.qihangerp.module.service.impl;

import cn.qihangerp.module.domain.SysConfig;
import cn.qihangerp.module.mapper.SysConfigMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import cn.qihangerp.module.service.SysConfigService;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author qilip
* @description 针对表【sys_config(参数配置表)】的数据库操作Service实现
* @createDate 2024-10-23 21:02:48
*/
@AllArgsConstructor
@Service
public class SysConfigServiceImpl extends ServiceImpl<SysConfigMapper, SysConfig>
    implements SysConfigService{
    private final SysConfigMapper configMapper;

    @Override
    public boolean selectCaptchaEnabled() {
        List<SysConfig> sysConfigs = configMapper.selectList(new LambdaQueryWrapper<SysConfig>().eq(SysConfig::getConfigKey, "sys.account.captchaEnabled"));
        if(sysConfigs==null || sysConfigs.isEmpty())
         return false;
        else if(sysConfigs.get(0).getConfigValue().equals("true")){
            return true;
        }else return false;
    }
}




