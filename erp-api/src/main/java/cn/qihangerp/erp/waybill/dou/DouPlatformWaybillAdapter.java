package cn.qihangerp.erp.waybill.dou;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.api.ShopApiParams;
import cn.qihangerp.enums.EnumOrderRole;
import cn.qihangerp.enums.EnumShopOrderRefundStatus;
import cn.qihangerp.enums.EnumShopType;
import cn.qihangerp.erp.controller.oms.dou.DouApiCommon;
import cn.qihangerp.erp.waybill.PlatformWaybillAdapter;
import cn.qihangerp.erp.waybill.PlatformWaybillCapability;
import cn.qihangerp.erp.waybill.PlatformWaybillTakeResult;
import cn.qihangerp.erp.waybill.WaybillCancelContext;
import cn.qihangerp.erp.waybill.WaybillShipContext;
import cn.qihangerp.erp.waybill.WaybillShipResult;
import cn.qihangerp.erp.waybill.WaybillTakeContext;
import cn.qihangerp.mapper.OOrderItemMapper;
import cn.qihangerp.mapper.ShopOrderMapper;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OOrderItem;
import cn.qihangerp.model.entity.ShopOrder;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.dou.DouLogisticsApiHelper;
import cn.qihangerp.open.dou.DouOrderApiHelper;
import cn.qihangerp.open.dou.DouWaybillApiHelper;
import cn.qihangerp.open.dou.model.WaybillCode;
import cn.qihangerp.open.dou.model.WaybillPrintData;
import cn.qihangerp.open.dou.model.order.Order;
import cn.qihangerp.open.dou.request.WaybillAddress;
import cn.qihangerp.open.dou.request.WaybillAddressInfo;
import cn.qihangerp.open.dou.request.WaybillApply;
import cn.qihangerp.open.dou.request.WaybillApplyRequest;
import cn.qihangerp.open.dou.request.WaybillCodeRequest;
import cn.qihangerp.open.dou.request.WaybillContact;
import cn.qihangerp.open.dou.request.WaybillOrderInfo;
import cn.qihangerp.open.dou.request.WaybillOrderItem;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 抖店统一电子面单适配器
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.3 / §4.4
 */
@Slf4j
@Component
@AllArgsConstructor
public class DouPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 抖店订单状态：待发货 */
    private static final int DOU_ORDER_STATUS_WAIT_SHIP = 2;
    /** 抖店订单状态：部分发货 */
    private static final int DOU_ORDER_STATUS_PART_SHIP = 101;

    private final DouApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.DOU.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.DOU.getIndex(), true, true, true, true, true,
                "抖店已接入取号、取消取号、打印数据与平台发货回传");
    }

    @Override
    public ResultVo<PlatformWaybillTakeResult> take(WaybillTakeContext context) {
        OOrder order = context.getOrder();
        ShopWaybillAccount account = context.getAccount();
        if (order == null || account == null) {
            return ResultVo.error("取号参数不完整");
        }
        if (!StringUtils.hasText(account.getDeliverName())) {
            return ResultVo.error("电子面单账户未配置发货人");
        }
        if (!StringUtils.hasText(account.getDeliverMobile())) {
            return ResultVo.error("电子面单账户未配置发货人手机号");
        }
        if (!StringUtils.hasText(account.getProviderCode())) {
            return ResultVo.error("电子面单账户未配置快递公司编码");
        }

        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId());
        if (checkResult.getCode() != 0) {
            return ResultVo.error(checkResult.getMsg());
        }
        ShopApiParams apiParams = checkResult.getData();

        ShopOrder platformOrder = loadPlatformOrder(order);
        if (platformOrder == null) {
            return ResultVo.error("未找到平台原始订单，无法取号");
        }
        String platformStatusMsg = checkPlatformOrderStatus(apiParams, order.getOrderNum());
        if (platformStatusMsg != null) {
            return ResultVo.error(platformStatusMsg);
        }

        List<OOrderItem> unitItems = loadUnitItems(order);
        if (unitItems.isEmpty()) {
            return ResultVo.error("订单商品明细为空，无法取号");
        }
        String receiverMsg = checkReceiver(platformOrder);
        if (receiverMsg != null) {
            return ResultVo.error(receiverMsg);
        }

        WaybillCodeRequest request = buildTakeRequest(order, account, platformOrder, unitItems);

        ApiResultVo<WaybillCode> takeResult = DouWaybillApiHelper.getWaybillCode(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        if (takeResult == null || takeResult.getCode() != 0) {
            return ResultVo.error(takeResult == null ? "平台取号无响应" : takeResult.getMsg());
        }
        if (takeResult.getList() == null || takeResult.getList().isEmpty()) {
            return ResultVo.error("平台取号未返回快递单号");
        }
        WaybillCode ebill = takeResult.getList().get(0);
        if (!StringUtils.hasText(ebill.getTrackNo())) {
            return ResultVo.error("平台取号未返回快递单号");
        }

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(ebill.getTrackNo());
        result.setLogisticsCode(account.getProviderCode());
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));

        // 取号成功即视为成功；打印数据失败只记录日志，避免平台单号丢失无法取消
        fillPrintData(result, apiParams, account.getProviderCode(), ebill.getTrackNo());
        log.info("======抖店统一取号成功======orderNum={}，waybillCode={}，accountId={}",
                order.getOrderNum(), result.getWaybillCode(), account.getId());
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<Void> cancel(WaybillCancelContext context) {
        if (context.getOrder() == null) {
            return ResultVo.error("取消取号参数不完整");
        }
        if (!StringUtils.hasText(context.getWaybillCode()) || !StringUtils.hasText(context.getLogisticsCode())) {
            return ResultVo.error("缺少快递单号或快递公司编码");
        }
        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(context.getOrder().getShopId());
        if (checkResult.getCode() != 0) {
            return ResultVo.error(checkResult.getMsg());
        }
        ShopApiParams apiParams = checkResult.getData();
        ApiResultVo<Void> cancelResult = DouWaybillApiHelper.waybillCancel(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(),
                context.getLogisticsCode(), context.getWaybillCode());
        if (cancelResult == null || cancelResult.getCode() != 0) {
            return ResultVo.error(cancelResult == null ? "平台取消取号无响应" : cancelResult.getMsg());
        }
        log.info("======抖店统一取消取号成功======orderNum={}，waybillCode={}",
                context.getOrder().getOrderNum(), context.getWaybillCode());
        return ResultVo.success();
    }

    @Override
    public ResultVo<WaybillShipResult> ship(WaybillShipContext context) {
        OOrder order = context.getOrder();
        if (order == null) {
            return ResultVo.error("发货回传参数不完整");
        }
        if (!StringUtils.hasText(context.getWaybillCode())) {
            return ResultVo.error("缺少快递单号");
        }
        if (!StringUtils.hasText(context.getLogisticsCode())) {
            return ResultVo.error("缺少快递公司编码");
        }
        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId());
        if (checkResult.getCode() != 0) {
            return ResultVo.error(checkResult.getMsg());
        }
        ShopApiParams apiParams = checkResult.getData();

        ApiResultVo<Void> shipResult = DouLogisticsApiHelper.logisticsAdd(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(),
                order.getOrderNum(), context.getLogisticsCode(), context.getWaybillCode());
        if (shipResult == null || shipResult.getCode() != 0) {
            return ResultVo.error(shipResult == null ? "平台发货回传无响应" : shipResult.getMsg());
        }
        WaybillShipResult result = new WaybillShipResult();
        result.setPlatformMsg(shipResult.getMsg());
        log.info("======抖店统一发货回传成功======orderNum={}，waybillCode={}",
                order.getOrderNum(), context.getWaybillCode());
        return ResultVo.success(result);
    }

    private ShopOrder loadPlatformOrder(OOrder order) {
        List<ShopOrder> list = shopOrderMapper.selectList(new LambdaQueryWrapper<ShopOrder>()
                .eq(ShopOrder::getOrderId, order.getOrderNum())
                .eq(ShopOrder::getShopId, order.getShopId())
                .last("LIMIT 1"));
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 平台订单状态校验：仅待发货/部分发货允许取号；查询失败不阻断
     */
    private String checkPlatformOrderStatus(ShopApiParams apiParams, String orderNum) {
        try {
            ApiResultVo<Order> statusResult = DouOrderApiHelper.pullOrderDetail(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), orderNum);
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                Integer status = statusResult.getData().getOrderStatus();
                if (status != null && status != DOU_ORDER_STATUS_WAIT_SHIP
                        && status != DOU_ORDER_STATUS_PART_SHIP) {
                    return "平台订单当前状态不允许取号（状态：" + status + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======抖店取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
        }
        return null;
    }

    /**
     * 取本发货单元对应的明细行：拆单子单取 item_role=1，未拆主单取 item_role=0；历史空值兜底全部
     */
    private List<OOrderItem> loadUnitItems(OOrder order) {
        List<OOrderItem> all = orderItemMapper.selectList(new LambdaQueryWrapper<OOrderItem>()
                .eq(OOrderItem::getOrderId, order.getId()));
        int itemRole = order.getOrderRole() != null && order.getOrderRole() == EnumOrderRole.CHILD.getCode() ? 1 : 0;
        List<OOrderItem> unit = all.stream()
                .filter(i -> i.getItemRole() != null && i.getItemRole() == itemRole)
                .collect(Collectors.toList());
        if (unit.isEmpty()) {
            unit = all;
        }
        return unit.stream()
                .filter(i -> !Objects.equals(i.getRefundStatus(), EnumShopOrderRefundStatus.COMPLETE.getStatus()))
                .collect(Collectors.toList());
    }

    private String checkReceiver(ShopOrder platformOrder) {
        if (!StringUtils.hasText(receiverName(platformOrder))) {
            return "平台订单收件人姓名缺失，无法取号";
        }
        if (!StringUtils.hasText(receiverMobile(platformOrder))) {
            return "平台订单收件人电话缺失，无法取号";
        }
        if (!StringUtils.hasText(receiverAddress(platformOrder))) {
            return "平台订单收件地址缺失，无法取号";
        }
        return null;
    }

    private WaybillCodeRequest buildTakeRequest(OOrder order, ShopWaybillAccount account,
                                                ShopOrder platformOrder, List<OOrderItem> unitItems) {
        WaybillCodeRequest request = new WaybillCodeRequest();
        request.setLogistics_code(account.getProviderCode());
        request.setOrder_channel("1");
        // 抖店面单账号ID（月结账号），操作员在面单账号上维护
        if (StringUtils.hasText(account.getSettleAccount())) {
            try {
                request.setUser_id(Long.parseLong(account.getSettleAccount().trim()));
            } catch (NumberFormatException ignore) {
                // 非数字时不传，由平台校验报错透传
            }
        }
        request.setSender_info(buildSenderInfo(account));
        request.setOrder_infos(Collections.singletonList(buildOrderInfo(order, platformOrder, unitItems)));
        return request;
    }

    private WaybillAddressInfo buildSenderInfo(ShopWaybillAccount account) {
        WaybillAddress address = new WaybillAddress();
        address.setCountry_code("CHN");
        address.setProvince_name(account.getProvinceName());
        address.setCity_name(account.getCityName());
        address.setDistrict_name(account.getCountryName());
        address.setStreet_name(account.getCountrysideName());
        address.setDetail_address(account.getAddressAddress());

        WaybillContact contact = new WaybillContact();
        contact.setName(account.getDeliverName());
        contact.setMobile(account.getDeliverMobile());
        contact.setPhone(account.getDeliverPhone());

        WaybillAddressInfo sender = new WaybillAddressInfo();
        sender.setAddress(address);
        sender.setContact(contact);
        return sender;
    }

    private WaybillOrderInfo buildOrderInfo(OOrder order, ShopOrder platformOrder, List<OOrderItem> unitItems) {
        WaybillOrderInfo orderInfo = new WaybillOrderInfo();
        orderInfo.setOrder_id(order.getOrderNum());

        WaybillAddress address = new WaybillAddress();
        address.setCountry_code("CHN");
        address.setProvince_name(firstText(platformOrder.getProvince(), order.getProvince()));
        address.setCity_name(firstText(platformOrder.getCity(), order.getCity()));
        address.setDistrict_name(firstText(platformOrder.getCounty(), order.getTown()));
        address.setDetail_address(receiverAddress(platformOrder));

        WaybillContact contact = new WaybillContact();
        contact.setName(receiverName(platformOrder));
        contact.setMobile(receiverMobile(platformOrder));

        WaybillAddressInfo receiver = new WaybillAddressInfo();
        receiver.setAddress(address);
        receiver.setContact(contact);
        orderInfo.setReceiver_info(receiver);

        List<WaybillOrderItem> items = new ArrayList<>();
        for (OOrderItem item : unitItems) {
            if (item.getQuantity() == null || item.getQuantity() <= 0) {
                continue;
            }
            WaybillOrderItem douItem = new WaybillOrderItem();
            douItem.setItem_count(item.getQuantity());
            douItem.setItem_name(firstText(item.getGoodsTitle(), "商品"));
            douItem.setItem_specs(item.getGoodsSpec() == null ? "" : item.getGoodsSpec());
            items.add(douItem);
        }
        orderInfo.setItems(items);
        return orderInfo;
    }

    private void fillPrintData(PlatformWaybillTakeResult result, ShopApiParams apiParams,
                               String logisticsCode, String trackNo) {
        try {
            WaybillApply apply = new WaybillApply();
            apply.setLogistics_code(logisticsCode);
            apply.setTrack_no(trackNo);
            WaybillApplyRequest applyRequest = new WaybillApplyRequest();
            applyRequest.setWaybill_applies(Collections.singletonList(apply));

            ApiResultVo<WaybillPrintData> printResult = DouWaybillApiHelper.pullWaybillPrintData(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), applyRequest);
            if (printResult == null || printResult.getCode() != 0 || printResult.getList() == null) {
                log.warn("======抖店取号后获取打印数据失败======waybillCode={}，msg={}",
                        result.getWaybillCode(), printResult == null ? "无响应" : printResult.getMsg());
                return;
            }
            for (WaybillPrintData data : printResult.getList()) {
                if (Objects.equals(data.getTrackNo(), trackNo)) {
                    result.setPrintData(data.getPrintData());
                    result.setSign(data.getSign());
                    break;
                }
            }
        } catch (Exception e) {
            log.warn("======抖店取号后获取打印数据异常======waybillCode={}，error={}",
                    result.getWaybillCode(), e.getMessage());
        }
    }

    private String buildGoodsDetail(List<OOrderItem> unitItems) {
        return unitItems.stream()
                .map(i -> firstText(i.getGoodsTitle(), "商品")
                        + "|" + (i.getGoodsSpec() == null ? "" : i.getGoodsSpec())
                        + "|" + (i.getQuantity() == null ? 0 : i.getQuantity()))
                .collect(Collectors.joining(";"));
    }

    private String receiverName(ShopOrder order) {
        return firstText(order.getEncryptPostReceiver(), order.getReceiverName());
    }

    private String receiverMobile(ShopOrder order) {
        return firstText(order.getEncryptPostTel(), order.getReceiverPhone());
    }

    private String receiverAddress(ShopOrder order) {
        return firstText(order.getEncryptPostAddress(), order.getAddress());
    }

    private String firstText(String first, String second) {
        return StringUtils.hasText(first) ? first : (StringUtils.hasText(second) ? second : null);
    }
}
