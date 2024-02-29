package com.qihang.tao.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.qihang.tao.common.PageQuery;
import com.qihang.tao.common.PageResult;
import com.qihang.tao.domain.TaoGoods;
import com.qihang.tao.domain.bo.TaoGoodsBo;
import com.qihang.tao.service.TaoGoodsService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/goods")
@RestController
@AllArgsConstructor
public class GoodsController {
    private final TaoGoodsService goodsService;
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public PageResult<TaoGoods> goodsList(TaoGoodsBo bo, PageQuery pageQuery) {
        PageResult<TaoGoods> result = goodsService.queryPageList(bo, pageQuery);

//        try {
//            var result=taoGoodService.getList(req);
//            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(),"成功",result);
//        }catch (Exception ex){
//            return new ApiResult<>(EnumResultVo.Fail.getIndex(),EnumResultVo.Fail.getName()+ex.getMessage());
//        }
        return result;
    }
}
