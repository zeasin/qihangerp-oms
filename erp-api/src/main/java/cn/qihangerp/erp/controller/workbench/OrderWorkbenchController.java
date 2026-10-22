package cn.qihangerp.erp.controller.workbench;

import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.TableDataInfo;
import cn.qihangerp.enums.EnumUserType;
import cn.qihangerp.request.OrderWorkbenchQuery;
import cn.qihangerp.security.common.BaseController;
import cn.qihangerp.security.common.SecurityUtils;
import cn.qihangerp.service.OrderWorkbenchService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

/**
 * 订单处理工作台Controller：主订单分页/订单树/商品行查询
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping("/api/erp-api/orderWorkbench")
public class OrderWorkbenchController extends BaseController {

    private final OrderWorkbenchService orderWorkbenchService;

    /**
     * 主订单分页查询（工作台列表，支持多订单号与商品关键词搜索）
     */
    @GetMapping("/order/list")
    public TableDataInfo orderList(OrderWorkbenchQuery query, PageQuery pageQuery) {
        log.info("======订单工作台主订单list======{}", query);
        if (query.getMerchantId() == null && query.getShopId() == null) {
            Integer userIdentity = SecurityUtils.getUserIdentity();
            if (userIdentity == null) {
                return getDataTable(new ArrayList<>());
            }
            if (userIdentity == EnumUserType.MERCHANT.getIndex()) {
                query.setMerchantId(SecurityUtils.getDeptId());
            } else if (userIdentity == EnumUserType.STORE.getIndex()) {
                query.setShopId(SecurityUtils.getDeptId());
            } else if (userIdentity != EnumUserType.SUPPER.getIndex()) {
                return getDataTable(new ArrayList<>());
            }
        }
        return getDataTable(orderWorkbenchService.queryMasterOrderPage(query, pageQuery));
    }

    /**
     * 订单树查询：主订单 + 子订单 + 主订单原始商品行 + 子订单履约商品行
     */
    @GetMapping("/order/tree/{id}")
    public AjaxResult orderTree(@PathVariable("id") Long id) {
        log.info("======订单工作台订单树======{}", id);
        return success(orderWorkbenchService.queryOrderTree(id));
    }

    /**
     * 订单商品行查询（主订单返回原始行，子订单返回履约行）
     */
    @GetMapping("/item/list/{orderId}")
    public AjaxResult itemList(@PathVariable("orderId") Long orderId) {
        log.info("======订单工作台商品行list======{}", orderId);
        return success(orderWorkbenchService.queryOrderItems(orderId));
    }
}
