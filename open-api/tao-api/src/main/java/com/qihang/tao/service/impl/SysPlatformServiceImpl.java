package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.tao.domain.SysPlatform;
import com.qihang.tao.service.SysPlatformService;
import com.qihang.tao.mapper.SysPlatformMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【sys_platform】的数据库操作Service实现
* @createDate 2024-02-29 18:52:46
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




