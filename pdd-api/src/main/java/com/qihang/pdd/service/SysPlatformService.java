package com.qihang.pdd.service;

import com.qihang.pdd.domain.SysPlatform;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_platform】的数据库操作Service
* @createDate 2024-03-13 17:43:42
*/
public interface SysPlatformService extends IService<SysPlatform> {
    SysPlatform selectById(Integer id);
}
