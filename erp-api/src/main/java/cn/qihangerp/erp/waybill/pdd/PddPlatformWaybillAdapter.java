package cn.qihangerp.erp.waybill.pdd;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.api.ShopApiParams;
import cn.qihangerp.enums.EnumOrderRole;
import cn.qihangerp.enums.EnumShopOrderRefundStatus;
import cn.qihangerp.enums.EnumShopType;
import cn.qihangerp.erp.controller.oms.pdd.PddApiCommon;
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
import cn.qihangerp.open.pdd.PddLogisticsApiHelper;
import cn.qihangerp.open.pdd.PddOrderApiHelper;
import cn.qihangerp.open.pdd.PddWaybillApiHelper;
import cn.qihangerp.open.pdd.model.LogisticsCompany;
import cn.qihangerp.open.pdd.model.Order;
import cn.qihangerp.open.pdd.model.WaybillCodeModule;
import cn.qihangerp.open.pdd.request.OrderInfo;
import cn.qihangerp.open.pdd.request.PackageInfo;
import cn.qihangerp.open.pdd.request.PackageInfoItem;
import cn.qihangerp.open.pdd.request.WaybillCloudPrintApplyNewRequest;
import cn.qihangerp.open.pdd.request.WaybillCloudPrintApplyNewRequestContact;
import cn.qihangerp.open.pdd.request.WaybillCloudPrintApplyNewRequestContactAddress;
import cn.qihangerp.open.pdd.request.WaybillCloudPrintApplyNewRequestTradeOrderInfoDto;
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
 * 拼多多统一电子面单适配器（pdd.waybill.get / pdd.waybill.cancel / pdd.logistics.online.send）
 * 取号响应即回打打印数据；发货回传需将快递公司编码换算为拼多多数字物流编号
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.3 / §4.4
 */
@Slf4j
@Component
@AllArgsConstructor
public class PddPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 拼多多订单状态：待发货 */
    private static final int PDD_ORDER_STATUS_WAIT_SHIP = 1;

    private final PddApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.PDD.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.PDD.getIndex(), true, true, true, true, true,
                "拼多多已接入取号、取消取号、打印数据与平台发货回传");
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

        WaybillCloudPrintApplyNewRequest request = buildTakeRequest(order, account, platformOrder, unitItems);

        ApiResultVo<WaybillCodeModule> takeResult;
        try {
            takeResult = PddWaybillApiHelper.getWaybillCode(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        } catch (Exception e) {
            log.error("======拼多多统一取号异常======orderNum={}，error={}", order.getOrderNum(), e.getMessage(), e);
            return ResultVo.error("拼多多取号异常：" + e.getMessage());
        }
        if (takeResult == null || takeResult.getCode() != 0) {
            return ResultVo.error(takeResult == null ? "平台取号无响应" : takeResult.getMsg());
        }
        if (takeResult.getList() == null || takeResult.getList().isEmpty()) {
            return ResultVo.error("平台取号未返回快递单号");
        }
        WaybillCodeModule module = takeResult.getList().get(0);
        if (!StringUtils.hasText(module.getWaybill_code())) {
            return ResultVo.error("平台取号未返回快递单号");
        }

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(module.getWaybill_code());
        result.setLogisticsCode(account.getProviderCode());
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));
        // pdd.waybill.get 取号响应即携带打印数据
        result.setPrintData(module.getPrint_data());
        log.info("======拼多多统一取号成功======orderNum={}，waybillCode={}，accountId={}",
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
        ApiResultVo<Void> cancelResult;
        try {
            // wp_code = 面单取号时使用的快递公司编码
            cancelResult = PddWaybillApiHelper.waybillCancel(apiParams.getAppKey(), apiParams.getAppSecret(),
                    apiParams.getAccessToken(), context.getWaybillCode(), context.getLogisticsCode());
        } catch (Exception e) {
            log.error("======拼多多取消取号异常======waybillCode={}，error={}",
                    context.getWaybillCode(), e.getMessage(), e);
            return ResultVo.error("拼多多取消取号异常：" + e.getMessage());
        }
        if (cancelResult == null || cancelResult.getCode() != 0) {
            return ResultVo.error(cancelResult == null ? "平台取消取号无响应" : cancelResult.getMsg());
        }
        log.info("======拼多多统一取消取号成功======orderNum={}，waybillCode={}",
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

        // pdd.logistics.online.send 需要数字快递公司编号（logistics_id），编码优先按数字解析，否则按 code 查快递公司列表换算
        ResultVo<Long> logisticsIdResult = resolveLogisticsId(apiParams, context.getLogisticsCode());
        if (logisticsIdResult.getCode() != 0) {
            return ResultVo.error(logisticsIdResult.getMsg());
        }

        ApiResultVo<Void> shipResult;
        try {
            shipResult = PddLogisticsApiHelper.onlineSend(apiParams.getAppKey(), apiParams.getAppSecret(),
                    apiParams.getAccessToken(), order.getOrderNum(), logisticsIdResult.getData(), context.getWaybillCode());
        } catch (Exception e) {
            log.error("======拼多多发货回传异常======orderNum={}，error={}", order.getOrderNum(), e.getMessage(), e);
            return ResultVo.error("拼多多发货回传异常：" + e.getMessage());
        }
        if (shipResult == null || shipResult.getCode() != 0) {
            return ResultVo.error(shipResult == null ? "平台发货回传无响应" : shipResult.getMsg());
        }
        WaybillShipResult result = new WaybillShipResult();
        result.setPlatformMsg(shipResult.getMsg());
        log.info("======拼多多统一发货回传成功======orderNum={}，waybillCode={}",
                order.getOrderNum(), context.getWaybillCode());
        return ResultVo.success(result);
    }

    /**
     * 快递公司编码 -> 拼多多数字物流编号：数字编码直接用，字母编码按 pdd.logistics.companies.get 匹配
     */
    private ResultVo<Long> resolveLogisticsId(ShopApiParams apiParams, String logisticsCode) {
        String code = logisticsCode.trim();
        try {
            return ResultVo.success(Long.parseLong(code));
        } catch (NumberFormatException ignore) {
            // 非数字编码，走快递公司列表换算
        }
        try {
            ApiResultVo<LogisticsCompany> companyResult = PddLogisticsApiHelper.getLogisticsCompany(
                    apiParams.getAppKey(), apiParams.getAppSecret());
            if (companyResult != null && companyResult.getCode() == 0 && companyResult.getList() != null) {
                for (LogisticsCompany company : companyResult.getList()) {
                    if (code.equalsIgnoreCase(company.getCode()) && company.getId() != null) {
                        return ResultVo.success(company.getId().longValue());
                    }
                }
            }
        } catch (Exception e) {
            log.warn("======拼多多查询快递公司列表异常======logisticsCode={}，error={}", code, e.getMessage());
        }
        return ResultVo.error("未找到拼多多物流编号（快递公司编码：" + code + "），无法发货回传");
    }

    private ShopOrder loadPlatformOrder(OOrder order) {
        List<ShopOrder> list = shopOrderMapper.selectList(new LambdaQueryWrapper<ShopOrder>()
                .eq(ShopOrder::getOrderId, order.getOrderNum())
                .eq(ShopOrder::getShopId, order.getShopId())
                .last("LIMIT 1"));
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 平台订单状态校验：仅待发货允许取号；查询失败不阻断
     */
    private String checkPlatformOrderStatus(ShopApiParams apiParams, String orderNum) {
        try {
            ApiResultVo<Order> statusResult = PddOrderApiHelper.pullOrderDetail(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), orderNum);
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                int status = statusResult.getData().getOrderStatus();
                if (status != PDD_ORDER_STATUS_WAIT_SHIP) {
                    return "平台订单当前状态不允许取号（状态：" + status + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======拼多多取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
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

    private WaybillCloudPrintApplyNewRequest buildTakeRequest(OOrder order, ShopWaybillAccount account,
                                                                ShopOrder platformOrder, List<OOrderItem> unitItems) {
        WaybillCloudPrintApplyNewRequest request = new WaybillCloudPrintApplyNewRequest();
        request.setNeed_encrypt(Boolean.TRUE);
        request.setWp_code(account.getProviderCode());
        request.setSender(buildSenderContact(account));

        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto dto = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto();
        dto.setObject_id(order.getOrderNum());
        dto.setTemplate_url(account.getTemplateUrl());
        // 电子面单账号ID（月结账号），操作员在面单账号上维护；非数字时不传，由平台校验报错透传
        if (StringUtils.hasText(account.getSettleAccount())) {
            try {
                dto.setUser_id(Long.parseLong(account.getSettleAccount().trim()));
            } catch (NumberFormatException ignore) {
            }
        }

        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrder_channels_type("PDD");
        orderInfo.setTrade_order_list(new String[]{order.getOrderNum()});
        dto.setOrder_info(orderInfo);

        PackageInfo packageInfo = new PackageInfo();
        List<PackageInfoItem> items = new ArrayList<>();
        for (OOrderItem item : unitItems) {
            if (item.getQuantity() == null || item.getQuantity() <= 0) {
                continue;
            }
            PackageInfoItem packageItem = new PackageInfoItem();
            packageItem.setCount(item.getQuantity());
            packageItem.setName(firstText(item.getGoodsTitle(), "商品"));
            items.add(packageItem);
        }
        packageInfo.setItems(items);
        dto.setPackage_info(packageInfo);

        WaybillCloudPrintApplyNewRequestContactAddress address = new WaybillCloudPrintApplyNewRequestContactAddress();
        address.setProvince(firstText(platformOrder.getProvince(), order.getProvince()));
        address.setCity(firstText(platformOrder.getCity(), order.getCity()));
        address.setDistrict(platformOrder.getCounty());
        address.setDetail(receiverAddress(platformOrder));

        WaybillCloudPrintApplyNewRequestContact recipient = new WaybillCloudPrintApplyNewRequestContact();
        recipient.setName(receiverName(platformOrder));
        recipient.setMobile(receiverMobile(platformOrder));
        recipient.setAddress(address);
        dto.setRecipient(recipient);

        request.setTrade_order_info_dtos(Collections.singletonList(dto));
        return request;
    }

    private WaybillCloudPrintApplyNewRequestContact buildSenderContact(ShopWaybillAccount account) {
        WaybillCloudPrintApplyNewRequestContactAddress address = new WaybillCloudPrintApplyNewRequestContactAddress();
        address.setProvince(account.getProvinceName());
        address.setCity(account.getCityName());
        address.setDistrict(account.getCountryName());
        address.setTown(account.getCountrysideName());
        address.setDetail(account.getAddressAddress());

        WaybillCloudPrintApplyNewRequestContact sender = new WaybillCloudPrintApplyNewRequestContact();
        sender.setName(account.getDeliverName());
        sender.setMobile(account.getDeliverMobile());
        sender.setPhone(account.getDeliverPhone());
        sender.setAddress(address);
        return sender;
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
