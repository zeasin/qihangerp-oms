package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.tao.domain.TaoOrder;
import com.qihang.tao.service.TaoOrderService;
import com.qihang.tao.mapper.TaoOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author TW
* @description 针对表【tao_order(淘宝订单表)】的数据库操作Service实现
* @createDate 2024-02-29 19:01:11
*/
@Service
public class TaoOrderServiceImpl extends ServiceImpl<TaoOrderMapper, TaoOrder>
    implements TaoOrderService{

}




