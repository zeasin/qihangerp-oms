package cn.qihangerp.open.tao.service;


import cn.qihangerp.open.tao.domain.OmsTaoOrder;
import cn.qihangerp.open.tao.domain.bo.TaoOrderBo;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.PageQuery;
import com.qihang.common.common.PageResult;
import com.qihang.common.common.ResultVo;


/**
* @author TW
* @description 针对表【oms_tao_order(淘宝订单表)】的数据库操作Service
* @createDate 2024-04-30 13:52:20
*/
public interface OmsTaoOrderService extends IService<OmsTaoOrder> {
    /**
     * 保存店铺订单
     * @param shopId
     * @param order
     * @return
     */
    ResultVo<Integer> saveOrder(Long shopId, OmsTaoOrder order);
    ResultVo<Integer> updateOrderStatus( OmsTaoOrder order);
    PageResult<OmsTaoOrder> queryPageList(TaoOrderBo bo, PageQuery pageQuery);

    OmsTaoOrder queryDetailById(Long id);
    OmsTaoOrder queryDetailByTid(String tid);
}
