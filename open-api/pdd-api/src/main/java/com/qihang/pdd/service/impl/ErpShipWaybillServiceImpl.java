package com.qihang.pdd.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.qihang.common.common.ResultVo;
import com.qihang.common.enums.EnumShopType;
import com.qihang.pdd.domain.ErpShipWaybill;
import com.qihang.pdd.domain.OmsPddOrder;
import com.qihang.pdd.mapper.OmsPddOrderMapper;
import com.qihang.pdd.service.ErpShipWaybillService;
import com.qihang.pdd.mapper.ErpShipWaybillMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
* @author TW
* @description 针对表【erp_ship_waybill(发货电子面单记录表)】的数据库操作Service实现
* @createDate 2024-06-17 10:16:47
*/
@AllArgsConstructor
@Service
public class ErpShipWaybillServiceImpl extends ServiceImpl<ErpShipWaybillMapper, ErpShipWaybill>
    implements ErpShipWaybillService{
    private final ErpShipWaybillMapper mapper;
    private final OmsPddOrderMapper orderMapper;

    /**
     * 更新电子面单信息
     * @param shipWaybill
     * @return
     */
    @Transactional
    @Override
    public ResultVo<Integer> waybillUpdate(ErpShipWaybill shipWaybill) {
        String orderSn= shipWaybill.getOrderId();
        if(shipWaybill.getId()!=null&&shipWaybill.getId()>0){
            // 存在，修改
            shipWaybill.setCreateBy(null);
            shipWaybill.setCreateTime(null);
            shipWaybill.setOrderId(null);
            shipWaybill.setShopId(null);
            shipWaybill.setShopType(null);
            mapper.updateById(shipWaybill);
        }else{
            // 新增
            List<ErpShipWaybill> erpShipWaybills = mapper.selectList(new LambdaQueryWrapper<ErpShipWaybill>().eq(ErpShipWaybill::getOrderId, orderSn));
            if(erpShipWaybills==null|| erpShipWaybills.size()==0) {
                shipWaybill.setStatus(1);//已取号
                shipWaybill.setShopType(EnumShopType.PDD.getIndex());
                shipWaybill.setCreateTime(new Date());
                mapper.insert(shipWaybill);
            }else{
                ErpShipWaybill update = new ErpShipWaybill();
                update.setId(erpShipWaybills.get(0).getId());
                update.setWaybillCode(shipWaybill.getWaybillCode());
                update.setLogisticsCode(shipWaybill.getLogisticsCode());
                update.setPrintData(shipWaybill.getPrintData());
                update.setStatus(1);
                update.setUpdateTime(new Date());
                update.setUpdateBy("重新取号");
                mapper.updateById(update);
            }
        }
        // 更新关联订单erp_send_status状态
        OmsPddOrder orderUpdate = new OmsPddOrder();
        orderUpdate.setErpSendStatus(shipWaybill.getStatus());
        orderUpdate.setErpSendCode(shipWaybill.getWaybillCode());
        orderUpdate.setErpSendCompany(shipWaybill.getLogisticsCode());
        orderMapper.update(orderUpdate,new LambdaQueryWrapper<OmsPddOrder>().eq(OmsPddOrder::getOrderSn,orderSn));

        return ResultVo.success();
    }

    @Override
    public List<ErpShipWaybill> getListByOrderIds(Long shopId, String[] orderIds) {
        List<ErpShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<ErpShipWaybill>()
                        .eq(ErpShipWaybill::getShopId,shopId)
                        .in(ErpShipWaybill::getOrderId, Arrays.stream(orderIds).toList()));
        return erpShipWaybills;
    }

    @Transactional
    @Override
    public ResultVo<Integer> printSuccess(Long shopId, String[] orderIds) {
        List<ErpShipWaybill> erpShipWaybills = mapper.selectList(
                new LambdaQueryWrapper<ErpShipWaybill>()
                        .eq(ErpShipWaybill::getShopId,shopId)
                        .in(ErpShipWaybill::getOrderId, Arrays.stream(orderIds).toList()));
        if(erpShipWaybills!=null){
            for (var w : erpShipWaybills){
                ErpShipWaybill update = new ErpShipWaybill();
                update.setId(erpShipWaybills.get(0).getId());
                update.setStatus(2);
                update.setUpdateTime(new Date());
                update.setUpdateBy("打印面单");
                mapper.updateById(update);

                // 更新关联订单erp_send_status状态
                OmsPddOrder orderUpdate = new OmsPddOrder();
                orderUpdate.setErpSendStatus(update.getStatus());

                orderMapper.update(orderUpdate,new LambdaQueryWrapper<OmsPddOrder>().eq(OmsPddOrder::getOrderSn,w.getOrderId()));

                //TODO: 打印成功之后 加入备货清单




            }
        }
        return ResultVo.success();
    }
}




