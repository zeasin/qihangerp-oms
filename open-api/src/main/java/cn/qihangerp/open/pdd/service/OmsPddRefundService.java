package cn.qihangerp.open.pdd.service;

import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.open.pdd.domain.OmsPddRefund;
import cn.qihangerp.open.pdd.domain.bo.PddAfterSaleBo;

/**
* @author TW
* @description 针对表【oms_pdd_refund(拼多多订单退款表)】的数据库操作Service
* @createDate 2024-06-20 16:33:28
*/
public interface OmsPddRefundService extends IService<OmsPddRefund> {
    PageResult<OmsPddRefund> queryPageList(PddAfterSaleBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveRefund(Long shopId, OmsPddRefund refund);
}
