package cn.qihangerp.erp.waybill.jd;

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
import cn.qihangerp.open.jd.JdOrderApiHelper;
import cn.qihangerp.open.jd.JdWaybillApiHelper;
import cn.qihangerp.open.jd.jdl.CloudPrintApiHelper;
import cn.qihangerp.open.jd.jdl.CloudPrintData;
import cn.qihangerp.open.jd.jdl.PullCloudPrintRequestDto;
import cn.qihangerp.open.jd.jdl.WayBillInfo;
import cn.qihangerp.open.jd.model.WaybillCodeResponse;
import cn.qihangerp.open.jd.request.WaybillAddress;
import cn.qihangerp.open.jd.request.WaybillReceiveRequest;
import cn.qihangerp.open.jd.response.JdOrderDetailResponse;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 京东统一电子面单适配器
 * 设计口径对齐企业版 docs/design/16-打单发货.md §4.3 / §4.4
 * 说明：开源版 SDK 仅有 jingdong.ldop.alpha.waybill.receive（取号）与 JDL 云打印拉取，
 * 面单取消、POP 发货回传缺少可确认的平台端点，故 cancel / ship 能力关闭。
 */
@Slf4j
@Component
@AllArgsConstructor
public class JdPlatformWaybillAdapter implements PlatformWaybillAdapter {

    /** 京东订单状态：待发货（出库中） */
    private static final String JD_ORDER_STATE_WAIT_STOCK_OUT = "WAIT_SELLER_STOCK_OUT";
    /** 京东订单状态：待发货（待配货） */
    private static final String JD_ORDER_STATE_WAIT_DELIVERY = "WAIT_SELLER_DELIVERY";
    /** 云打印查询：POP 订单标识 */
    private static final Integer CLOUD_PRINT_POP_FLAG = 1;

    private final ShopApiCommon apiCommon;
    private final ShopOrderMapper shopOrderMapper;
    private final OOrderItemMapper orderItemMapper;

    @Override
    public Integer shopType() {
        return EnumShopType.JD.getIndex();
    }

    @Override
    public PlatformWaybillCapability capability() {
        return PlatformWaybillCapability.of(EnumShopType.JD.getIndex(), true, true, false, true, false,
                "京东已接入取号与云打印数据获取；SDK 缺少面单取消与 POP 发货回传端点，暂不支持取消取号与发货回传");
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

        ResultVo<ShopApiParams> checkResult = apiCommon.checkBefore(order.getShopId(), EnumShopType.JD.getIndex());
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

        WaybillReceiveRequest request = buildTakeRequest(order, account, platformOrder, apiParams);

        ApiResultVo<WaybillCodeResponse> takeResult = JdWaybillApiHelper.getWaybillCode(
                apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), request);
        if (takeResult == null || takeResult.getCode() != 0) {
            return ResultVo.error(takeResult == null ? "平台取号无响应" : takeResult.getMsg());
        }
        WaybillCodeResponse data = takeResult.getData();
        if (data == null || data.getWaybillCodeList() == null || data.getWaybillCodeList().isEmpty()
                || !StringUtils.hasText(data.getWaybillCodeList().get(0))) {
            return ResultVo.error("平台取号未返回快递单号");
        }
        String waybillCode = data.getWaybillCodeList().get(0);

        PlatformWaybillTakeResult result = new PlatformWaybillTakeResult();
        result.setWaybillCode(waybillCode);
        result.setLogisticsCode(account.getProviderCode());
        result.setWaybillCompany(StringUtils.hasText(account.getRefLogisticsName())
                ? account.getRefLogisticsName() : account.getProviderCode());
        result.setTemplateUrl(account.getTemplateUrl());
        result.setGoodsDetail(buildGoodsDetail(unitItems));

        // 取号成功即视为成功；打印数据失败只记录日志，避免平台单号丢失无法取消
        fillPrintData(result, apiParams, account, order.getOrderNum(), waybillCode);
        log.info("======京东统一取号成功======orderNum={}，waybillCode={}，accountId={}",
                order.getOrderNum(), result.getWaybillCode(), account.getId());
        return ResultVo.success(result);
    }

    @Override
    public ResultVo<Void> cancel(WaybillCancelContext context) {
        return ResultVo.error("京东电子面单取消端点尚未接入 SDK，暂不支持取消取号");
    }

    @Override
    public ResultVo<WaybillShipResult> ship(WaybillShipContext context) {
        return ResultVo.error("京东 POP 发货回传端点尚未接入 SDK，暂不支持统一发货回传");
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
            ApiResultVo<JdOrderDetailResponse> statusResult = JdOrderApiHelper.pullOrderDetail(
                    Long.parseLong(orderNum.trim()), apiParams.getAppKey(),
                    apiParams.getAppSecret(), apiParams.getAccessToken());
            if (statusResult != null && statusResult.getCode() == 0 && statusResult.getData() != null) {
                String state = statusResult.getData().getOrderState();
                if (StringUtils.hasText(state) && !JD_ORDER_STATE_WAIT_STOCK_OUT.equals(state)
                        && !JD_ORDER_STATE_WAIT_DELIVERY.equals(state)) {
                    return "平台订单当前状态不允许取号（状态：" + state + "）";
                }
            }
        } catch (Exception e) {
            log.warn("======京东取号查询平台订单状态异常======orderNum={}，error={}", orderNum, e.getMessage());
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

    private WaybillReceiveRequest buildTakeRequest(OOrder order, ShopWaybillAccount account,
                                                   ShopOrder platformOrder, ShopApiParams apiParams) {
        WaybillReceiveRequest request = new WaybillReceiveRequest();
        request.setWaybillCount(1);
        request.setSalePlatform("JD");
        request.setProviderCode(account.getProviderCode());
        if (account.getProviderId() != null) {
            request.setProviderId(account.getProviderId().intValue());
        }
        request.setBranchCode(account.getBranchCode());
        // 结算账号（月结卡号）在面单账号上维护
        request.setSettlementCode(account.getSettleAccount());
        // 京东商家编码（vendorCode）取店铺授权的卖家标识
        request.setVendorCode(firstText(apiParams.getSellerId(), account.getCode()));
        request.setPlatformOrderNo(order.getOrderNum());
        request.setVendorOrderCode(order.getOrderNum());
        request.setFromAddress(buildSenderAddress(account));
        request.setToAddress(buildReceiverAddress(order, platformOrder));
        return request;
    }

    private WaybillAddress buildSenderAddress(ShopWaybillAccount account) {
        WaybillAddress address = new WaybillAddress();
        address.setProvinceId(account.getProvinceId());
        address.setProvinceName(account.getProvinceName());
        address.setCityId(account.getCityId());
        address.setCityName(account.getCityName());
        address.setCountryId(account.getCountryId());
        address.setCountryName(account.getCountryName());
        address.setCountrysideId(account.getCountrysideId());
        address.setCountrysideName(account.getCountrysideName());
        address.setAddress(account.getAddressAddress());
        address.setContact(account.getDeliverName());
        address.setPhone(account.getDeliverPhone());
        address.setMobile(account.getDeliverMobile());
        return address;
    }

    private WaybillAddress buildReceiverAddress(OOrder order, ShopOrder platformOrder) {
        WaybillAddress address = new WaybillAddress();
        address.setProvinceName(firstText(platformOrder.getProvince(), order.getProvince()));
        address.setCityName(firstText(platformOrder.getCity(), order.getCity()));
        address.setCountryName(firstText(platformOrder.getCounty(), order.getTown()));
        address.setAddress(receiverAddress(platformOrder));
        address.setContact(receiverName(platformOrder));
        address.setMobile(receiverMobile(platformOrder));
        return address;
    }

    /**
     * 拉取 JDL 云打印报文；失败仅记录日志
     */
    private void fillPrintData(PlatformWaybillTakeResult result, ShopApiParams apiParams,
                               ShopWaybillAccount account, String orderNum, String waybillCode) {
        try {
            WayBillInfo wayBillInfo = new WayBillInfo();
            wayBillInfo.setPopFlag(CLOUD_PRINT_POP_FLAG);
            wayBillInfo.setOrderNo(orderNum);
            wayBillInfo.setWayBillCode(waybillCode);

            PullCloudPrintRequestDto dto = new PullCloudPrintRequestDto();
            dto.setCpCode(account.getProviderCode());
            dto.setObjectId(orderNum);
            dto.setWayBillInfos(Collections.singletonList(wayBillInfo));
            if (StringUtils.hasText(account.getSettleAccount())) {
                Map<String, String> parameters = new HashMap<>();
                parameters.put("eCustomerCode", account.getSettleAccount());
                dto.setParameters(parameters);
            }

            List<PullCloudPrintRequestDto> requests = new ArrayList<>();
            requests.add(dto);

            ApiResultVo<CloudPrintData> printResult = CloudPrintApiHelper.pullCloudPrintData(
                    apiParams.getAppKey(), apiParams.getAppSecret(), apiParams.getAccessToken(), requests);
            if (printResult == null || printResult.getCode() != 0 || printResult.getList() == null) {
                log.warn("======京东取号后获取打印数据失败======waybillCode={}，msg={}",
                        result.getWaybillCode(), printResult == null ? "无响应" : printResult.getMsg());
                return;
            }
            for (CloudPrintData printData : printResult.getList()) {
                if (Objects.equals(printData.getWayBillNo(), waybillCode)) {
                    result.setPrintData(printData.getPerPrintData());
                    break;
                }
            }
        } catch (Exception e) {
            log.warn("======京东取号后获取打印数据异常======waybillCode={}，error={}",
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
