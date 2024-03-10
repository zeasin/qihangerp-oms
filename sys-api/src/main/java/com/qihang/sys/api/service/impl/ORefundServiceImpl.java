package com.qihang.sys.api.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.common.ResultVoEnum;
import com.qihang.sys.api.domain.JdRefund;
import com.qihang.sys.api.domain.ORefund;
import com.qihang.sys.api.mapper.JdRefundMapper;
import com.qihang.sys.api.service.ORefundService;
import com.qihang.sys.api.mapper.ORefundMapper;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
* @author qilip
* @description 针对表【o_refund(退换货表)】的数据库操作Service实现
* @createDate 2024-03-10 16:23:12
*/
@Log
@AllArgsConstructor
@Service
public class ORefundServiceImpl extends ServiceImpl<ORefundMapper, ORefund>
    implements ORefundService{
    private final ORefundMapper mapper;
    private final JdRefundMapper jdRefundMapper;
    @Transactional
    @Override
    public ResultVo<Integer> jdRefundMessage(String refundId) {
        log.info("京东退款消息处理"+refundId);
        // TODO:业务问题：一个订单退款单是否包含多个商品；一个京东订单是否包含多个ITEM
        List<JdRefund> jdRefunds = jdRefundMapper.selectList(new LambdaQueryWrapper<JdRefund>().eq(JdRefund::getRefundId, refundId));
        if(jdRefunds == null || jdRefunds.size() == 0) {
            // 没有找到订单信息
            return new ResultVo<>(ResultVoEnum.NotFound,"没有找到京东退款单："+refundId);
        }
        JdRefund jdRefund = jdRefunds.get(0);
        List<ORefund> oRefunds = mapper.selectList(new LambdaQueryWrapper<ORefund>().eq(ORefund::getRefundNum, jdRefund.getRefundId()));
        if(oRefunds == null || oRefunds.isEmpty()) {
            // 新增
            ORefund insert = new ORefund();

        }else{
            // 修改
        }
        return null;
    }
}




