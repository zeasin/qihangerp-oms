package com.qihang.wei.service;

import com.qihang.common.common.ResultVo;
import com.qihang.wei.domain.ErpShipWaybill;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
* @author TW
* @description 针对表【erp_ship_waybill(发货电子面单记录表)】的数据库操作Service
* @createDate 2024-06-20 10:05:35
*/
public interface ErpShipWaybillService extends IService<ErpShipWaybill> {
    ResultVo<Integer> waybillUpdate(ErpShipWaybill shipWaybill);
    List<ErpShipWaybill> getListByOrderIds(Long shopId, String[] orderIds);

    ResultVo<Integer> printSuccess(Long shopId,String[] orderIds);
    ResultVo<Integer> pushShipSend(Long shopId,String[] orderIds);
}
