package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.JdOrder;
import com.qihang.oms.service.JdOrderService;
import com.qihang.oms.mapper.JdOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【jd_order(京东订单表)】的数据库操作Service实现
* @createDate 2024-03-11 14:24:49
*/
@Service
public class JdOrderServiceImpl extends ServiceImpl<JdOrderMapper, JdOrder>
    implements JdOrderService{

}




