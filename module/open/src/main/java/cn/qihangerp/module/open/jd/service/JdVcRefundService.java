package cn.qihangerp.module.open.jd.service;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.module.open.jd.domain.JdVcRefund;
import cn.qihangerp.module.open.jd.domain.bo.JdVcRefundBo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author TW
* @description 针对表【jd_vc_refund(京东自营退款表)】的数据库操作Service
* @createDate 2024-05-31 15:25:05
*/
public interface JdVcRefundService extends IService<JdVcRefund> {
    PageResult<JdVcRefund> queryPageList(JdVcRefundBo bo, PageQuery pageQuery);

    ResultVo<Integer> saveRefund(Long shopId, JdVcRefund jdVcRefund);
}
