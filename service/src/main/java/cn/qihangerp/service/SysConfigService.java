package cn.qihangerp.service;

import cn.qihangerp.model.entity.SysConfig;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author qilip
* @description 针对表【sys_config(参数配置表)】的数据库操作Service
* @createDate 2024-10-23 21:02:48
*/
public interface SysConfigService extends IService<SysConfig> {
    boolean selectCaptchaEnabled();

    /**
     * 订单人工审单开关：true=拉单进入待审核池；false=拉单自动放行（配置缺失时默认 true）
     */
    boolean selectManualAuditEnabled();
}
