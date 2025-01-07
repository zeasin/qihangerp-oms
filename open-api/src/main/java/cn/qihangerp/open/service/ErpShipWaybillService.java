package cn.qihangerp.open.service;

import cn.qihangerp.open.domain.ErpShipWaybill;
import com.baomidou.mybatisplus.extension.service.IService;
import com.qihang.common.common.ResultVo;


import java.util.List;

/**
* @author qilip
* @description 针对表【erp_ship_waybill(发货电子面单记录表)】的数据库操作Service
* @createDate 2024-06-16 17:18:22
*/
public interface ErpShipWaybillService extends IService<ErpShipWaybill> {
    ResultVo<Integer> waybillUpdate(ErpShipWaybill shipWaybill);
    List<ErpShipWaybill> getListByOrderIds(Long shopId,String[] orderIds);

    ResultVo<Integer> printSuccess(Long shopId,String[] orderIds);
    ResultVo<Integer> pushShipSend(Long shopId,String[] orderIds);
}
