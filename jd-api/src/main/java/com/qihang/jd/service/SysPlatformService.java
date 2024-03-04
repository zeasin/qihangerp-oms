package com.qihang.jd.service;

import com.qihang.jd.domain.SysPlatform;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_platform】的数据库操作Service
* @createDate 2024-03-04 18:43:05
*/
public interface SysPlatformService extends IService<SysPlatform> {
    SysPlatform selectById(Integer id);
}
