//package com.qihang.pdd.controller;
//
//
//import com.qihang.common.common.TableDataInfo;
//import com.qihang.security.common.BaseController;
//import lombok.AllArgsConstructor;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
///**
// * 拼多多订单Controller
// *
// * @author qihang
// * @date 2024-01-02
// */
//@AllArgsConstructor
//@RestController
//@RequestMapping("/order")
//public class PddOrderController extends BaseController
//{
//
//    private final OmsPddOrderService orderService;
//    @RequestMapping(value = "/list", method = RequestMethod.GET)
//    public TableDataInfo orderList(OmsPddOrder bo, PageQuery pageQuery) {
//        PageResult<OmsPddOrder> result = orderService.queryPageList(bo, pageQuery);
//
//        return getDataTable(result);
//    }
////    @Autowired
////    private IPddOrderService pddOrderService;
////
////    /**
////     * 查询拼多多订单列表
////     */
////    @PreAuthorize("@ss.hasPermi('pdd:order:list')")
////    @GetMapping("/list")
////    public TableDataInfo list(PddOrder pddOrder)
////    {
////        startPage();
////        List<PddOrder> list = pddOrderService.selectPddOrderList(pddOrder);
////        return getDataTable(list);
////    }
////
////    /**
////     * 导出拼多多订单列表
////     */
////    @PreAuthorize("@ss.hasPermi('pdd:order:export')")
////    @Log(title = "拼多多订单", businessType = BusinessType.EXPORT)
////    @PostMapping("/export")
////    public void export(HttpServletResponse response, PddOrder pddOrder)
////    {
////        List<PddOrder> list = pddOrderService.selectPddOrderList(pddOrder);
////        ExcelUtil<PddOrder> util = new ExcelUtil<PddOrder>(PddOrder.class);
////        util.exportExcel(response, list, "拼多多订单数据");
////    }
////
////    /**
////     * 获取拼多多订单详细信息
////     */
////    @PreAuthorize("@ss.hasPermi('pdd:order:query')")
////    @GetMapping(value = "/{id}")
////    public AjaxResult getInfo(@PathVariable("id") Long id)
////    {
////        return success(pddOrderService.selectPddOrderById(id));
////    }
////
////    /**
////     * 新增拼多多订单
////     */
////    @PreAuthorize("@ss.hasPermi('pdd:order:add')")
////    @Log(title = "拼多多订单", businessType = BusinessType.INSERT)
////    @PostMapping
////    public AjaxResult add(@RequestBody PddOrder pddOrder)
////    {
////        Integer result = pddOrderService.insertPddOrder(pddOrder);
////        if(result == -1) return new AjaxResult(505,"订单号已存在");
////        else if(result == -2) return new AjaxResult(506,"请添加商品");
////        else if(result == -3) return new AjaxResult(507,"商品数据错误");
////        return toAjax(result);
////    }
////
////    @Log(title = "拼多多订单", businessType = BusinessType.UPDATE)
////    @PostMapping("/confirm")
////    public AjaxResult confirmOrder(@RequestBody PddOrder pddOrder)
////    {
////        pddOrder.setUpdateBy(getUsername());
////        Integer result = pddOrderService.confirmOrder(pddOrder);
////        if(result == -1) return new AjaxResult(505,"订单不存在");
////        else if(result == -2) return new AjaxResult(506,"订单已确认过了");
////        else if(result == -3) return new AjaxResult(507,"订单售后中！无法操作！");
////        else if(result == -4) return new AjaxResult(508,"订单号确认过了！请检查订单号是否正确！");
////        else if(result == -5) return new AjaxResult(509,"不支持的发货方式！");
////        else if(result == -11) return new AjaxResult(511,"商品SKU编码不存在！");
////        else if(result == -12) return new AjaxResult(512,"商品信息不存在！");
////        return toAjax(result);
////    }
////
//
//}
