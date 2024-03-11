package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.OOrderItem;
import com.qihang.oms.service.OOrderItemService;
import com.qihang.oms.mapper.OOrderItemMapper;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【o_order_item(订单明细表)】的数据库操作Service实现
* @createDate 2024-03-11 14:24:49
*/
@Service
public class OOrderItemServiceImpl extends ServiceImpl<OOrderItemMapper, OOrderItem>
    implements OOrderItemService{

}




