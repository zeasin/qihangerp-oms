package cn.qihangerp.module.service;


import cn.qihangerp.module.domain.SysConfig;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【sys_config(参数配置表)】的数据库操作Service
* @createDate 2024-10-23 21:02:48
*/
public interface SysConfigService extends IService<SysConfig> {
    boolean selectCaptchaEnabled();
}
