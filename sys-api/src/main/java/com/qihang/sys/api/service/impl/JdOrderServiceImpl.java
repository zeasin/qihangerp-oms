package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.sys.api.domain.JdOrder;
import com.qihang.sys.api.service.JdOrderService;
import com.qihang.sys.api.mapper.JdOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【jd_order(京东订单表)】的数据库操作Service实现
* @createDate 2024-03-09 13:15:57
*/
@Service
public class JdOrderServiceImpl extends ServiceImpl<JdOrderMapper, JdOrder>
    implements JdOrderService{

}




