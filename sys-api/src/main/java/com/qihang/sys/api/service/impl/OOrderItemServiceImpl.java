package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.sys.api.domain.OOrderItem;
import com.qihang.sys.api.service.OOrderItemService;
import com.qihang.sys.api.mapper.OOrderItemMapper;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【o_order_item(订单明细表)】的数据库操作Service实现
* @createDate 2024-03-09 13:15:57
*/
@Service
public class OOrderItemServiceImpl extends ServiceImpl<OOrderItemMapper, OOrderItem>
    implements OOrderItemService{

}




