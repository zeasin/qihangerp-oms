package cn.qihangerp.open.tao.service;


import cn.qihangerp.open.tao.domain.OmsTaoRefund;
import cn.qihangerp.open.tao.domain.bo.TaoRefundBo;
import com.baomidou.mybatisplus.extension.service.IService;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;


/**
* @author TW
* @description 针对表【oms_tao_refund(淘宝退款表)】的数据库操作Service
* @createDate 2024-04-30 13:52:20
*/
public interface OmsTaoRefundService extends IService<OmsTaoRefund> {
    PageResult<OmsTaoRefund> queryPageList(TaoRefundBo bo, PageQuery pageQuery);
    ResultVo<Integer> saveAndUpdateRefund(Long shopId, OmsTaoRefund refund);
}
