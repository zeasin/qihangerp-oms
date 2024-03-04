package com.qihang.tao.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.tao.domain.TaoRefund;
import com.qihang.tao.service.TaoRefundService;
import com.qihang.tao.mapper.TaoRefundMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【tao_refund(淘宝退款订单表)】的数据库操作Service实现
* @createDate 2024-02-29 19:01:45
*/
@AllArgsConstructor
@Service
public class TaoRefundServiceImpl extends ServiceImpl<TaoRefundMapper, TaoRefund>
    implements TaoRefundService{

    private final TaoRefundMapper mapper;
    @Override
    public int saveAndUpdateRefund(Integer shopId, TaoRefund refund) {
        List<TaoRefund> taoRefunds = mapper.selectList(new LambdaQueryWrapper<TaoRefund>().eq(TaoRefund::getRefundId, refund.getRefundId()));
        if(taoRefunds!=null && taoRefunds.size()>0){
            // 存在，修改
            TaoRefund update = new TaoRefund();
            update.setId(taoRefunds.get(0).getId());
            update.setModified(refund.getModified());
            update.setStatus(refund.getStatus());
            update.setEndTime(refund.getEndTime());
            update.setUpdateTime(new Date());
            mapper.updateById(update);
            return ResultVoEnum.DataExist.getIndex();
        }else{
            refund.setShopId(shopId);
            refund.setCreateTime(new Date());
            mapper.insert(refund);
            return 0;
        }

    }
}




