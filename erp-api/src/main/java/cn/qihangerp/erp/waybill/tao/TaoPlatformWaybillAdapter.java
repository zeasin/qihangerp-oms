package cn.qihangerp.erp.waybill.tao;

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
import cn.qihangerp.erp.waybill.WaybillTakeContext;
import cn.qihangerp.mapper.OOrderItemMapper;
import cn.qihangerp.mapper.ShopOrderMapper;
import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.OOrderItem;
import cn.qihangerp.model.entity.ShopOrder;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import cn.qihangerp.open.common.ApiResultVo;
import cn.qihangerp.open.tao.TaoOrderApiHelper;
import cn.qihangerp.open.tao.TaoWaybillApiHelper;
import cn.qihangerp.open.tao.model.WaybillCloudPrint;
import cn.qihangerp.open.tao.request.WaybillCloudPrintApplyNewRequest;
import cn.qihangerp.open.tao.request.WaybillCloudPrintApplyNewRequestSender;
import cn.qihangerp.open.tao.request.WaybillCloudPrintApplyNewRequestTradeOrderInfoDto;
import cn.qihangerp.open.tao.response.TaoOrderDetailResponse;
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
 * 淘宝统一电子面单适配器（菜鸟电子面单 cainiao.waybill.ii.get）
 * 能力口径：仅接入统一取号；取消/打印/发货回传走手动兜底通道
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.3 / §4.4
 */
@Slf4j
@Component
@AllArgsConstructor
public class TaoPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 淘宝订单状态：等待卖家发货 */
    private static final String TAO_STATUS_WAIT_SEND = "WAIT_SELLER_SEND_GOODS";
    /** 淘宝订单状态：部分发货 */
    private static final String TAO_STATUS_PART_SEND = "SELLER_CONSIGNED_PART";

    private final ShopApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.TAO.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.TAO.getIndex(), true, true, false, false, false,
                "淘宝仅接入统一取号；打印与发货回传走手动兜底通道");
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

        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId(), EnumShopType.TAO.getIndex());
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

        ApiResultVo<WaybillCloudPrint> takeResult;
        try {
            takeResult = TaoWaybillApiHelper.waybillCloudPrintApplyNew(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        } catch (Exception e) {
            log.error("======淘宝统一取号异常======orderNum={}，error={}", order.getOrderNum(), e.getMessage(), e);
            return ResultVo.error("淘宝取号异常：" + e.getMessage());
        }
        if (takeResult == null || takeResult.getCode() != 0) {
            return ResultVo.error(takeResult == null ? "平台取号无响应" : takeResult.getMsg());
        }
        if (takeResult.getList() == null || takeResult.getList().isEmpty()) {
            return ResultVo.error("平台取号未返回快递单号");
        }
        WaybillCloudPrint applied = takeResult.getList().get(0);
        if (!StringUtils.hasText(applied.getWaybillCode())) {
            return ResultVo.error("平台取号未返回快递单号");
        }

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(applied.getWaybillCode());
        // 菜鸟返回的实际承运商编码优先（cp_code 可能是伞面单品牌码）
        result.setLogisticsCode(firstText(applied.getRealCpCode(), applied.getCpCode(), account.getProviderCode()));
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));
        // 菜鸟 cloud print 模板取号即回打打印数据；sign 内嵌在 print_data 中，不再单独返回
        result.setPrintData(applied.getPrintData());
        log.info("======淘宝统一取号成功======orderNum={}，waybillCode={}，accountId={}",
                order.getOrderNum(), result.getWaybillCode(), account.getId());
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<Void> cancel(WaybillCancelContext context) {
        // 能力矩阵：淘宝 cancel=false，取消走平台侧/人工兜底
        return ResultVo.error("淘宝暂不支持统一取消面单号");
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
            ApiResultVo<TaoOrderDetailResponse> statusResult = TaoOrderApiHelper.pullOrderDetail(
                    orderNum, apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken());
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                String status = statusResult.getData().getStatus();
                if (StringUtils.hasText(status) && !TAO_STATUS_WAIT_SEND.equals(status)
                        && !TAO_STATUS_PART_SEND.equals(status)) {
                    return "平台订单当前状态不允许取号（状态：" + status + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======淘宝取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
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
        request.setCp_code(account.getProviderCode());
        request.setSender(buildSender(account));

        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto dto = new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto();
        dto.setObjectId(order.getOrderNum());
        dto.setTemplateUrl(account.getTemplateUrl());
        // 菜鸟电子面单账号ID（月结账号），操作员在面单账号上维护；非数字时不传，由平台校验报错透传
        if (StringUtils.hasText(account.getSettleAccount())) {
            try {
                dto.setUserId(Integer.parseInt(account.getSettleAccount().trim()));
            } catch (NumberFormatException ignore) {
            }
        }

        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.OrderInfoDTO orderInfo =
                new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.OrderInfoDTO();
        orderInfo.setOrderChannelsType("TB");
        orderInfo.setTradeOrderList(order.getOrderNum());
        dto.setOrderInfo(orderInfo);

        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO packageInfo =
                new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO();
        List<WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO> items = new ArrayList<>();
        for (OOrderItem item : unitItems) {
            if (item.getQuantity() == null || item.getQuantity() <= 0) {
                continue;
            }
            WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO itemDto =
                    new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.PackageInfoDTO.ItemsDTO();
            itemDto.setCount(item.getQuantity());
            itemDto.setName(firstText(item.getGoodsTitle(), "商品"));
            items.add(itemDto);
        }
        packageInfo.setItems(items);
        packageInfo.setGoodsDescription(buildGoodsDetail(unitItems));
        packageInfo.setTotalPackagesCount(1);
        dto.setPackageInfo(packageInfo);

        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO recipient =
                new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO();
        WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO.AddressDTO address =
                new WaybillCloudPrintApplyNewRequestTradeOrderInfoDto.RecipientDTO.AddressDTO();
        address.setProvince(platformOrder.getProvince());
        address.setCity(platformOrder.getCity());
        address.setDistrict(platformOrder.getCounty());
        address.setDetail(receiverAddress(platformOrder));
        recipient.setAddress(address);
        recipient.setName(receiverName(platformOrder));
        recipient.setMobile(receiverMobile(platformOrder));
        recipient.setTid(order.getOrderNum());
        dto.setRecipient(recipient);

        request.setTrade_order_info_dtos(Collections.singletonList(dto));
        return request;
    }

    private WaybillCloudPrintApplyNewRequestSender buildSender(ShopWaybillAccount account) {
        WaybillCloudPrintApplyNewRequestSender.AddressDTO address =
                new WaybillCloudPrintApplyNewRequestSender.AddressDTO();
        address.setProvince(account.getProvinceName());
        address.setCity(account.getCityName());
        address.setDistrict(account.getCountryName());
        address.setTown(account.getCountrysideName());
        address.setDetail(account.getAddressAddress());

        WaybillCloudPrintApplyNewRequestSender sender = new WaybillCloudPrintApplyNewRequestSender();
        sender.setAddress(address);
        sender.setName(account.getDeliverName());
        sender.setMobile(account.getDeliverMobile());
        sender.setPhone(account.getDeliverPhone());
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

    private String firstText(String... values) {
        for (String value : values) {
            if (StringUtils.hasText(value)) {
                return value;
            }
        }
        return null;
    }
}
