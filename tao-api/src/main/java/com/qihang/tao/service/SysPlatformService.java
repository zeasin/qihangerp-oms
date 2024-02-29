package com.qihang.tao.service;

import com.qihang.tao.domain.SysPlatform;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【sys_platform】的数据库操作Service
* @createDate 2024-02-29 18:52:46
*/
public interface SysPlatformService extends IService<SysPlatform> {
    SysPlatform selectById(Integer id);
}
