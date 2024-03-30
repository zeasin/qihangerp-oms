package com.qihang.kwai.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.kwai.domain.KwaiOrder;
import com.qihang.kwai.service.KwaiOrderService;
import com.qihang.kwai.mapper.KwaiOrderMapper;
import org.springframework.stereotype.Service;

/**
* @author qilip
* @description 针对表【kwai_order(快手订单)】的数据库操作Service实现
* @createDate 2024-03-30 10:04:16
*/
@Service
public class KwaiOrderServiceImpl extends ServiceImpl<KwaiOrderMapper, KwaiOrder>
    implements KwaiOrderService{

}




