package cn.qihangerp.erp.waybill.wei;

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
import cn.qihangerp.open.wei.WeiOrderApiHelper;
import cn.qihangerp.open.wei.WeiWaybillApiHelper;
import cn.qihangerp.open.wei.bo.ewaybill.EcOrderInfo;
import cn.qihangerp.open.wei.bo.ewaybill.GoodsInfo;
import cn.qihangerp.open.wei.bo.ewaybill.SenderAddressBo;
import cn.qihangerp.open.wei.bo.ewaybill.WaybillRequest;
import cn.qihangerp.open.wei.model.Order;
import cn.qihangerp.open.wei.vo.ewaybill.EwaybillOrderCreateVo;
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
 * 微信小店（视频号）统一电子面单适配器
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.3 / §4.4
 * 取号走平台两段式：precreate 拿 ewaybill_order_id → create 拿运单号与 print_info。
 * 说明：开源版 SDK 无面单取消与订单发货（delivery send）端点，故 cancel / ship 能力关闭。
 */
@Slf4j
@Component
@AllArgsConstructor
public class WeiPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 微信小店订单状态：待发货 */
    private static final int WEI_ORDER_STATUS_WAIT_SHIP = 20;
    /** 微信小店订单状态：待发货（备货中） */
    private static final int WEI_ORDER_STATUS_WAIT_SHIP_BATCH = 21;
    /** 微信小店订单状态：部分发货 */
    private static final int WEI_ORDER_STATUS_PART_SHIP = 22;
    /** 打印模板：使用平台默认单页模板，回包返回 print_info */
    private static final String TEMPLATE_ID_SINGLE = "single";

    private final ShopApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.WEI.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.WEI.getIndex(), true, true, false, true, false,
                "微信小店已接入预创建+创建两段式取号与 print_info 打印数据；SDK 缺少年单取消与订单发货端点，暂不支持取消取号与发货回传");
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
        if (!StringUtils.hasText(account.getBranchCode())) {
            return ResultVo.error("电子面单账户未配置网点编码");
        }

        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId(), EnumShopType.WEI.getIndex());
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

        WaybillRequest request = buildTakeRequest(order, account, platformOrder, unitItems, apiParams);

        // 第一段：预取号，拿到电子面单订单标识
        ApiResultVo<String> preCreateResult = WeiWaybillApiHelper.ewaybillOrderPreCreate(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        if (preCreateResult == null || preCreateResult.getCode() != 0) {
            return ResultVo.error(preCreateResult == null ? "平台预取号无响应" : preCreateResult.getMsg());
        }
        String ewaybillOrderId = preCreateResult.getData();
        if (!StringUtils.hasText(ewaybillOrderId)) {
            return ResultVo.error("平台预取号未返回电子面单订单号");
        }

        // 第二段：正式取号，回填 ewaybill_order_id 与打印模板
        request.setEwaybill_order_id(ewaybillOrderId);
        request.setTemplate_id(TEMPLATE_ID_SINGLE);
        ApiResultVo<EwaybillOrderCreateVo> createResult = WeiWaybillApiHelper.ewaybillOrderCreate(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        if (createResult == null || createResult.getCode() != 0) {
            return ResultVo.error(createResult == null ? "平台取号无响应" : createResult.getMsg());
        }
        EwaybillOrderCreateVo createVo = createResult.getData();
        if (createVo == null || !StringUtils.hasText(createVo.getWaybill_id())) {
            // 平台取号失败时优先透出电子面单错误原因
            if (createVo != null && StringUtils.hasText(createVo.getDelivery_error_msg())) {
                return ResultVo.error(createVo.getDelivery_error_msg());
            }
            return ResultVo.error("平台取号未返回快递单号");
        }

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(createVo.getWaybill_id());
        result.setLogisticsCode(account.getProviderCode());
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        // 平台电子面单订单标识：取消/发货回传需回传该值
        result.setWaybillOrderId(StringUtils.hasText(createVo.getEwaybill_order_id())
                ? createVo.getEwaybill_order_id() : ewaybillOrderId);
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));
        // template_id=single 时创建接口直接回传打印报文
        result.setPrintData(createVo.getPrint_info());

        log.info("======微信小店统一取号成功======orderNum={}，waybillCode={}，ewaybillOrderId={}",
                order.getOrderNum(), result.getWaybillCode(), result.getWaybillOrderId());
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<Void> cancel(WaybillCancelContext context) {
        return ResultVo.error("微信小店电子面单取消端点尚未接入 SDK，暂不支持取消取号");
    }

    @Override
    public ResultVo<WaybillShipResult> ship(WaybillShipContext context) {
        return ResultVo.error("微信小店订单发货端点尚未接入 SDK，暂不支持统一发货回传");
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
            ApiResultVo<Order> statusResult = WeiOrderApiHelper.pullOrderDetail(
                    Long.parseLong(orderNum.trim()), apiParams.getAccessToken());
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                Integer status = statusResult.getData().getStatus();
                if (status != null && status != WEI_ORDER_STATUS_WAIT_SHIP
                        && status != WEI_ORDER_STATUS_WAIT_SHIP_BATCH && status != WEI_ORDER_STATUS_PART_SHIP) {
                    return "平台订单当前状态不允许取号（状态：" + status + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======微信小店取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
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

    private WaybillRequest buildTakeRequest(OOrder order, ShopWaybillAccount account, ShopOrder platformOrder,
                                            List<OOrderItem> unitItems, ShopApiParams apiParams) {
        WaybillRequest request = new WaybillRequest();
        // delivery_id=快递公司编码，site_code=网点编码，ewaybill_acct_id=月结账号
        request.setDelivery_id(account.getProviderCode());
        request.setSite_code(account.getBranchCode());
        request.setEwaybill_acct_id(account.getSettleAccount());
        request.setSender(buildSender(account));
        request.setReceiver(buildReceiver(order, platformOrder));
        request.setEc_order_list(Collections.singletonList(
                buildEcOrderInfo(order, platformOrder, unitItems, apiParams)));
        return request;
    }

    private SenderAddressBo buildSender(ShopWaybillAccount account) {
        SenderAddressBo sender = new SenderAddressBo();
        sender.setName(account.getDeliverName());
        sender.setMobile(account.getDeliverMobile());
        sender.setProvince(account.getProvinceName());
        sender.setCity(account.getCityName());
        sender.setCounty(account.getCountryName());
        sender.setStreet(account.getCountrysideName());
        sender.setAddress(account.getAddressAddress());
        return sender;
    }

    private SenderAddressBo buildReceiver(OOrder order, ShopOrder platformOrder) {
        SenderAddressBo receiver = new SenderAddressBo();
        receiver.setName(receiverName(platformOrder));
        receiver.setMobile(receiverMobile(platformOrder));
        receiver.setProvince(firstText(platformOrder.getProvince(), order.getProvince()));
        receiver.setCity(firstText(platformOrder.getCity(), order.getCity()));
        receiver.setCounty(firstText(platformOrder.getCounty(), order.getTown()));
        receiver.setAddress(receiverAddress(platformOrder));
        return receiver;
    }

    private EcOrderInfo buildEcOrderInfo(OOrder order, ShopOrder platformOrder,
                                         List<OOrderItem> unitItems, ShopApiParams apiParams) {
        EcOrderInfo ecOrderInfo = new EcOrderInfo();
        ecOrderInfo.setEc_order_id(parseLong(order.getOrderNum()));
        // 平台订单密文：取号必须回传（订单同步时落到 shop_order.ewaybill_order_code）
        ecOrderInfo.setEwaybill_order_code(platformOrder.getEwaybillOrderCode());
        ecOrderInfo.setEwaybill_order_appid(apiParams.getAppKey());

        List<GoodsInfo> goodsList = new ArrayList<>();
        for (OOrderItem item : unitItems) {
            if (item.getQuantity() == null || item.getQuantity() <= 0) {
                continue;
            }
            GoodsInfo goods = new GoodsInfo();
            goods.setGood_name(firstText(item.getGoodsTitle(), "商品"));
            goods.setGood_count(item.getQuantity());
            goods.setProduct_id(item.getGoodsId());
            goods.setSku_id(parseLong(item.getSkuId()));
            goodsList.add(goods);
        }
        ecOrderInfo.setGoods_list(goodsList);
        return ecOrderInfo;
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

    private Long parseLong(String value) {
        if (!StringUtils.hasText(value)) {
            return null;
        }
        try {
            return Long.parseLong(value.trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
