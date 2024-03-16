package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.TaoOrder;
import com.qihang.oms.service.TaoOrderService;
import com.qihang.oms.mapper.TaoOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【tao_order(淘宝订单表)】的数据库操作Service实现
* @createDate 2024-03-16 17:51:46
*/
@Service
public class TaoOrderServiceImpl extends ServiceImpl<TaoOrderMapper, TaoOrder>
    implements TaoOrderService{

}




