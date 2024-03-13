package com.qihang.pdd.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.pdd.domain.SysPlatform;
import com.qihang.pdd.service.SysPlatformService;
import com.qihang.pdd.mapper.SysPlatformMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_platform】的数据库操作Service实现
* @createDate 2024-03-13 17:43:42
*/
@AllArgsConstructor
@Service
public class SysPlatformServiceImpl extends ServiceImpl<SysPlatformMapper, SysPlatform>
    implements SysPlatformService{
    private final SysPlatformMapper mapper;
    @Override
    public SysPlatform selectById(Integer id) {
        return mapper.selectById(id);
    }
}




