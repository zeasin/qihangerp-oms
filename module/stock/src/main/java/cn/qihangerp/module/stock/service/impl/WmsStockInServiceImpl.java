package cn.qihangerp.module.stock.service.impl;

import cn.qihangerp.common.PageQuery;
import cn.qihangerp.common.PageResult;
import cn.qihangerp.common.ResultVo;
import cn.qihangerp.common.ResultVoEnum;
import cn.qihangerp.common.utils.DateUtils;

import cn.qihangerp.module.goods.domain.OGoodsInventory;
import cn.qihangerp.module.goods.domain.OGoodsInventoryBatch;
import cn.qihangerp.module.goods.service.OGoodsInventoryBatchService;
import cn.qihangerp.module.goods.service.OGoodsInventoryService;
import cn.qihangerp.module.stock.domain.WmsStockIn;
import cn.qihangerp.module.stock.domain.WmsStockInItem;
import cn.qihangerp.module.stock.mapper.WmsStockInMapper;
import cn.qihangerp.module.stock.request.StockInCreateItem;
import cn.qihangerp.module.stock.request.StockInCreateRequest;
import cn.qihangerp.module.stock.request.StockInItem;
import cn.qihangerp.module.stock.request.StockInRequest;
import cn.qihangerp.module.stock.service.WmsStockInItemService;
import cn.qihangerp.module.stock.service.WmsStockInService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import lombok.AllArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
* @author qilip
* @description 针对表【wms_stock_in(入库单)】的数据库操作Service实现
* @createDate 2024-09-22 16:10:08
*/
@AllArgsConstructor
@Service
public class WmsStockInServiceImpl extends ServiceImpl<WmsStockInMapper, WmsStockIn>
    implements WmsStockInService {
    private final WmsStockInMapper mapper;
    private final WmsStockInItemService inItemService;
    private final OGoodsInventoryBatchService inventoryBatchService;
    private final OGoodsInventoryService inventoryService;
    @Override
    public PageResult<WmsStockIn> queryPageList(WmsStockIn bo, PageQuery pageQuery) {
        LambdaQueryWrapper<WmsStockIn> queryWrapper = new LambdaQueryWrapper<WmsStockIn>()
                .eq( bo.getStatus()!=null,WmsStockIn::getStatus, bo.getStatus())
                .eq( bo.getStockInType()!=null,WmsStockIn::getStockInType, bo.getStockInType())
                .eq(StringUtils.isNotBlank(bo.getStockInNum()),WmsStockIn::getStockInNum, bo.getStockInNum())
                .eq(StringUtils.isNotBlank(bo.getSourceNo()),WmsStockIn::getSourceNo, bo.getSourceNo())
                .eq(bo.getSourceId()!=null,WmsStockIn::getSourceId, bo.getSourceId())
            ;

        Page<WmsStockIn> pages = mapper.selectPage(pageQuery.build(), queryWrapper);
        return PageResult.build(pages);
    }

    @Transactional
    @Override
    public ResultVo<Long> createEntry(Long userId, String userName, StockInCreateRequest request) {
        if(request.getStockInType() == null ) return ResultVo.error(ResultVoEnum.ParamsError,"缺少参数stockInType");
        if(request.getItemList().isEmpty()) return ResultVo.error(ResultVoEnum.ParamsError,"缺少参数itemList");
        if(StringUtils.isBlank(request.getStockInNum())){
            request.setStockInNum(DateUtils.parseDateToStr("yyyyMMddHHmmss",new Date()));
        }
        if(StringUtils.isBlank(request.getStockInOperator())){
            request.setStockInOperator(userName);
        }

        Map<String, List<StockInCreateItem>> goodsGroup = request.getItemList().stream().collect(Collectors.groupingBy(x -> x.getGoodsId()));
        Long total = request.getItemList().stream().mapToLong(StockInCreateItem::getQuantity).sum();
        //添加主表信息
        WmsStockIn insert = new WmsStockIn();
        insert.setStockInNum(request.getStockInNum());
        insert.setStockInType(request.getStockInType());
        insert.setStockInOperator(request.getStockInOperator());
        insert.setStockInOperatorId(userId+"");
//        insert.setStockInTime(new Date());
        insert.setSourceNo(request.getSourceNo());
        insert.setRemark(request.getRemark());
        insert.setCreateBy(userName);
        insert.setCreateTime(new Date());
        insert.setSourceGoodsUnit(goodsGroup.size());
        insert.setSourceSpecUnit(request.getItemList().size());
        insert.setSourceSpecUnitTotal(total.intValue());
        insert.setStatus(0);//状态（0待入库1部分入库2全部入库）
        mapper.insert(insert);

        //添加子表信息
        List<WmsStockInItem> itemList = new ArrayList<>();
        for(StockInCreateItem item: request.getItemList()){
            WmsStockInItem inItem = new WmsStockInItem();
            inItem.setStockInId(insert.getId());
            inItem.setStockInType(insert.getStockInType());
            inItem.setSourceNo(insert.getSourceNo());
            inItem.setSourceId(0L);
            inItem.setSourceItemId(0L);
            inItem.setGoodsId(item.getGoodsId());
            inItem.setGoodsName(item.getGoodsName());
            inItem.setGoodsImage(item.getGoodsImg());
            inItem.setSkuName(item.getSkuName());
            inItem.setSkuId(item.getSkuId());
            inItem.setSkuCode(item.getSkuCode());
            inItem.setQuantity(item.getQuantity());
            inItem.setInQuantity(0);
            inItem.setStatus(0);
            inItem.setCreateBy(userName);
            inItem.setCreateTime(new Date());
            itemList.add(inItem);
        }
        inItemService.saveBatch(itemList);
        return ResultVo.success();
    }

    @Transactional
    @Override
    public ResultVo<Long> stockIn(Long userId, String userName, StockInRequest request) {
        if (request.getStockInId() == null) return ResultVo.error(ResultVoEnum.ParamsError, "缺少参数stockInId");
        if (request.getWarehouseId() == null) return ResultVo.error(ResultVoEnum.ParamsError, "缺少参数warehouseId");
        if (request.getItemList().isEmpty()) return ResultVo.error(ResultVoEnum.ParamsError, "缺少入库数据");

        WmsStockIn wmsStockIn = mapper.selectById(request.getStockInId());
        if (wmsStockIn == null) return ResultVo.error(ResultVoEnum.NotFound, "没有找到入库单");
        else if (wmsStockIn.getStatus() == 2) {
            return ResultVo.error(ResultVoEnum.SystemException, "入库单状态不能入库");
        }

        List<StockInItem> waitList = new ArrayList<>();
        for (var item : request.getItemList()) {
            if (item.getIntoQuantity() == null || item.getPositionId() == null) {
                waitList.add(item);
            }
        }
        if (waitList.size() == 0) return ResultVo.error(ResultVoEnum.ParamsError, "缺少入库明细数据");

        // 开始入库
        for (var item:waitList) {
            // 查询明细
            WmsStockInItem stockInItem = inItemService.getById(item.getId());
            if(stockInItem == null){
                return ResultVo.error(ResultVoEnum.DataError, "数据错误！没有找到入库单明细");
            }
            // 添加库存操作表

            // 增加商品库存批次表
            OGoodsInventoryBatch inventoryBatch = new OGoodsInventoryBatch();
            inventoryBatch.setBatchNum(DateUtils.parseDateToStr("yyyyMMddHHmmss",new Date()));
            inventoryBatch.setOriginQty(item.getIntoQuantity());
            inventoryBatch.setCurrentQty(item.getIntoQuantity());
            inventoryBatch.setPurPrice(0.0);
            inventoryBatch.setPurId(0L);
            inventoryBatch.setPurItemId(0L);
            inventoryBatch.setSkuId(stockInItem.getSkuId());
            inventoryBatch.setSkuCode(stockInItem.getSkuCode());
            inventoryBatch.setGoodsId(stockInItem.getGoodsId());
            inventoryBatch.setWarehouseId(request.getWarehouseId());
            inventoryBatch.setPositionId(item.getPositionId());
            inventoryBatch.setCreateTime(new Date());
            inventoryBatch.setCreateBy(userName);
            inventoryBatchService.save(inventoryBatch);
            // 增加商品库存表
            List<OGoodsInventory> inventoryList = inventoryService.list(new LambdaQueryWrapper<OGoodsInventory>().eq(OGoodsInventory::getSkuId, stockInItem.getSkuId()));
            if(inventoryList.isEmpty()) {
                // 新增
                OGoodsInventory inventory = new OGoodsInventory();
                inventory.setGoodsId(stockInItem.getGoodsId());
                inventory.setGoodsNum(stockInItem.getGoodsNum());
                inventory.setSkuId(stockInItem.getSkuId());
                inventory.setSkuCode(stockInItem.getSkuCode());
                inventory.setQuantity(stockInItem.getIntoQuantity().longValue());
                inventory.setIsDelete(0);
                inventory.setCreateBy(userName);
                inventory.setCreateTime(new Date());
                inventoryService.save(inventory);
            }else{
                //修改
                OGoodsInventory update = new OGoodsInventory();
                update.setId(inventoryList.get(0).getId());
                update.setUpdateBy(userName);
                update.setUpdateTime(new Date());
                update.setQuantity(inventoryList.get(0).getQuantity()+stockInItem.getIntoQuantity().longValue());
                inventoryService.updateById(update);

            }
        }
        return ResultVo.success();
    }

    @Override
    public WmsStockIn getDetailAndItemById(Long id) {
        WmsStockIn wmsStockIn = mapper.selectById(id);
        if(wmsStockIn!=null){
            wmsStockIn.setItemList(inItemService.list(new LambdaQueryWrapper<WmsStockInItem>().eq(WmsStockInItem::getStockInId,id)));
            return wmsStockIn;
        }else
            return null;
    }
}




