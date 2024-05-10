package com.qihang.tao.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;
import com.qihang.tao.domain.OmsTaoRefund;
import com.qihang.tao.domain.bo.TaoRefundBo;

/**
* @author TW
* @description 针对表【oms_tao_refund(淘宝退款表)】的数据库操作Service
* @createDate 2024-04-30 13:52:20
*/
public interface OmsTaoRefundService extends IService<OmsTaoRefund> {
    PageResult<OmsTaoRefund> queryPageList(TaoRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveAndUpdateRefund(Long shopId, OmsTaoRefund refund);
}
