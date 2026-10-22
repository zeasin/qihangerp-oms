package cn.qihangerp.erp.waybill.xhs;

import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.api.ShopApiParams;
import cn.qihangerp.enums.EnumOrderRole;
import cn.qihangerp.enums.EnumShopOrderRefundStatus;
import cn.qihangerp.enums.EnumShopType;
import cn.qihangerp.erp.service.ShopApiCommon;
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
import cn.qihangerp.open.xhs.model.SenderAddress;
import cn.qihangerp.open.xhs.model.TradeOrderInfo;
import cn.qihangerp.open.xhs.response.EbillOrderInfo;
import cn.qihangerp.open.xhs.response.OrderResponse;
import cn.qihangerp.open.xhs.xhsOrderApiHelper;
import cn.qihangerp.open.xhs.xhsWaybillCodeApiHelper;
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
 * 小红书统一电子面单适配器
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.4：取号=是、取消取号=否、打印=是、发货=暂关
 * 说明：
 * 1. 取号使用 xhsWaybillCodeApiHelper.getWaybillOrders（express.createEbillOrders 批量取号）；
 * 2. 打印走小红书自研打印组件（面单号 + 商家后台模板 templateUrl 由前端打印组件渲染），
 *    SDK 无可核实的服务端打印报文端点，printData/sign 不填充；
 * 3. SDK（xhsOrderApiHelper/xhsExpressApiHelper）没有现成的发货回传/取消面单方法，
 *    遵循"没有就不编造"原则，cancel 能力关闭、ship 能力关闭，需人工确认后再补端点。
 */
@Slf4j
@Component
@AllArgsConstructor
public class XhsPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 小红书订单状态：4待发货 */
    private static final int XHS_ORDER_STATUS_WAIT_SHIP = 4;
    /** 小红书订单状态：5部分发货 */
    private static final int XHS_ORDER_STATUS_PART_SHIP = 5;
    /** 小红书订单渠道常量（官方对接说明附录：orderChannelsType:XIAO_HONG_SHU） */
    private static final String XHS_ORDER_CHANNEL = "XIAO_HONG_SHU";

    private final ShopApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.XHS.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.XHS.getIndex(), true, true, false, true, false,
                "小红书已接入取号与打印（自研打印组件+模板）；SDK 缺少取消面单与发货回传端点，暂不支持取消取号与发货回传");
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
        if (account.getTemplateId() == null) {
            return ResultVo.error("电子面单账户未配置面单模板ID（templateId，经 express.queryEbillTemplates 查询）");
        }

        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId(), EnumShopType.XHS.getIndex());
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

        ApiResultVo<EbillOrderInfo> takeResult;
        try {
            takeResult = xhsWaybillCodeApiHelper.getWaybillOrders(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(),
                    account.getProviderCode(), account.getBranchCode(),
                    buildSenderInfo(account),
                    Collections.singletonList(buildTradeOrderInfo(order, account, platformOrder, unitItems)));
        } catch (Exception e) {
            log.error("======小红书取号接口异常======orderNum={}，error={}", order.getOrderNum(), e.getMessage(), e);
            return ResultVo.error("小红书取号异常：" + e.getMessage());
        }
        if (takeResult == null || takeResult.getCode() != 0) {
            return ResultVo.error(takeResult == null ? "平台取号无响应" : takeResult.getMsg());
        }
        EbillOrderInfo bill = pickSuccessItem(takeResult.getList(), order.getOrderNum());
        if (bill == null) {
            return ResultVo.error("小红书取号失败：" + lastErrorMsg(takeResult.getList()));
        }

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(bill.getWaybillCode());
        result.setLogisticsCode(account.getProviderCode());
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));
        log.info("======小红书统一取号成功======orderNum={}，waybillCode={}，accountId={}",
                order.getOrderNum(), result.getWaybillCode(), account.getId());
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<Void> cancel(WaybillCancelContext context) {
        // 能力口径 §4.4：小红书缺取消取号；SDK 亦无取消面单方法，不编造端点
        return ResultVo.error("小红书暂不支持统一取消取号");
    }

    @Override
    public ResultVo<WaybillShipResult> ship(WaybillShipContext context) {
        // xhsOrderApiHelper/xhsExpressApiHelper 无现成发货回传方法，不编造；能力已声明 ship=false，正常不会路由到这里
        return ResultVo.error("小红书暂不支持统一发货回传，请在平台后台手动发货");
    }

    private ShopOrder loadPlatformOrder(OOrder order) {
        List<ShopOrder> list = shopOrderMapper.selectList(new LambdaQueryWrapper<ShopOrder>()
                .eq(ShopOrder::getOrderId, order.getOrderNum())
                .eq(ShopOrder::getShopId, order.getShopId())
                .last("LIMIT 1"));
        return list.isEmpty() ? null : list.get(0);
    }

    /**
     * 平台订单状态校验：仅待发货(4)/部分发货(5)允许取号；查询失败不阻断
     */
    private String checkPlatformOrderStatus(ShopApiParams apiParams, String orderNum) {
        try {
            ApiResultVo<OrderResponse> statusResult = xhsOrderApiHelper.getOrderDetailVo(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), orderNum);
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                Integer status = statusResult.getData().getOrderStatus();
                if (status != null && status != XHS_ORDER_STATUS_WAIT_SHIP
                        && status != XHS_ORDER_STATUS_PART_SHIP) {
                    return "平台订单当前状态不允许取号（状态：" + status + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======小红书取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
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

    private SenderAddress buildSenderInfo(ShopWaybillAccount account) {
        SenderAddress.Address address = new SenderAddress.Address();
        address.setProvince(account.getProvinceName());
        address.setCity(account.getCityName());
        // 实体字段命名：countryName 存区县、countrysideName 存乡镇（与抖店适配器口径一致）
        address.setDistrict(account.getCountryName());
        address.setTown(account.getCountrysideName());
        address.setDetail(account.getAddressAddress());

        SenderAddress sender = new SenderAddress();
        sender.setName(account.getDeliverName());
        sender.setMobile(account.getDeliverMobile());
        sender.setPhone(account.getDeliverPhone());
        sender.setAddress(address);
        return sender;
    }

    private TradeOrderInfo buildTradeOrderInfo(OOrder order, ShopWaybillAccount account,
                                               ShopOrder platformOrder, List<OOrderItem> unitItems) {
        TradeOrderInfo info = new TradeOrderInfo();
        // templateId 必填：新版/旧版模板ID不可混用，取自面单账号维护值（来源 express.queryEbillTemplates）
        info.setTemplateId(String.valueOf(account.getTemplateId()));

        TradeOrderInfo.OrderInfo orderInfo = new TradeOrderInfo.OrderInfo();
        orderInfo.setOrderChannelsType(XHS_ORDER_CHANNEL);
        // 小红书订单号 + 密文收件人依赖 xhsOrderId/openAddressId 组合解密（官方对接说明）
        orderInfo.setXhsOrderId(order.getOrderNum());
        orderInfo.setTradeOrderList(Collections.singletonList(order.getOrderNum()));
        info.setOrderInfo(orderInfo);

        TradeOrderInfo.Recipient recipient = new TradeOrderInfo.Recipient();
        recipient.setName(receiverName(platformOrder));
        recipient.setMobile(receiverMobile(platformOrder));
        recipient.setOpenAddressId(platformOrder.getOpenAddressId());

        TradeOrderInfo.Recipient.Address address = new TradeOrderInfo.Recipient.Address();
        address.setProvince(firstText(platformOrder.getProvince(), order.getProvince()));
        address.setCity(firstText(platformOrder.getCity(), order.getCity()));
        address.setDistrict(platformOrder.getCounty());
        address.setTown(platformOrder.getTown());
        address.setDetail(receiverAddress(platformOrder));
        recipient.setAddress(address);
        info.setRecipient(recipient);

        TradeOrderInfo.PackageInfo packageInfo = new TradeOrderInfo.PackageInfo();
        List<TradeOrderInfo.PackageInfo.Item> items = new ArrayList<>();
        for (OOrderItem item : unitItems) {
            if (item.getQuantity() == null || item.getQuantity() <= 0) {
                continue;
            }
            TradeOrderInfo.PackageInfo.Item apiItem = new TradeOrderInfo.PackageInfo.Item();
            apiItem.setName(firstText(item.getGoodsTitle(), "商品"));
            apiItem.setSpecification(item.getGoodsSpec() == null ? "" : item.getGoodsSpec());
            apiItem.setCount(item.getQuantity());
            items.add(apiItem);
        }
        packageInfo.setItems(items);
        info.setPackageInfo(packageInfo);
        return info;
    }

    /**
     * 从单条结果列表中挑选取号成功记录：官方口径 success=true 或 waybillCode 不为空即成功
     */
    private EbillOrderInfo pickSuccessItem(List<EbillOrderInfo> list, String orderNum) {
        if (list == null || list.isEmpty()) {
            return null;
        }
        for (EbillOrderInfo info : list) {
            if (info != null && StringUtils.hasText(info.getWaybillCode())) {
                return info;
            }
        }
        log.warn("======小红书取号无成功记录======orderNum={}，结果数={}", orderNum, list.size());
        return null;
    }

    private String lastErrorMsg(List<EbillOrderInfo> list) {
        if (list == null) {
            return "无结果";
        }
        return list.stream()
                .filter(i -> i != null && StringUtils.hasText(i.getErrorMsg()))
                .map(EbillOrderInfo::getErrorMsg)
                .findFirst().orElse("未知原因");
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
