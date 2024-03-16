package com.qihang.oms.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.oms.domain.TaoOrderItem;
import com.qihang.oms.service.TaoOrderItemService;
import com.qihang.oms.mapper.TaoOrderItemMapper;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【tao_order_item(淘宝订单明细表)】的数据库操作Service实现
* @createDate 2024-03-16 17:51:46
*/
@Service
public class TaoOrderItemServiceImpl extends ServiceImpl<TaoOrderItemMapper, TaoOrderItem>
    implements TaoOrderItemService{

}




