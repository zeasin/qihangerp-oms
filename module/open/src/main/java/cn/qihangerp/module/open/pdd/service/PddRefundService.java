package cn.qihangerp.module.open.pdd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;

import cn.qihangerp.module.open.pdd.domain.PddRefund;
import cn.qihangerp.module.open.pdd.domain.bo.PddRefundBo;
import com.baomidou.mybatisplus.extension.service.IService;


/**
* @author TW
* @description 针对表【pdd_refund(拼多多订单退款表)】的数据库操作Service
* @createDate 2024-06-06 09:48:28
*/
public interface PddRefundService extends IService<PddRefund> {
    PageResult<PddRefund> queryPageList(PddRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer>  saveRefund(Long shopId, PddRefund refund);
}
