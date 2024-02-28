package com.qihang.tao.controller;

import com.qihang.tao.domain.TaoGoods;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/goods")
@RestController
public class GoodsController {
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ApiResult<List<TaoGoods>> goodsList(String key) {
        try {
            var result=taoGoodService.getList(req);
            return new ApiResult<>(EnumResultVo.SUCCESS.getIndex(),"成功",result);
        }catch (Exception ex){
            return new ApiResult<>(EnumResultVo.Fail.getIndex(),EnumResultVo.Fail.getName()+ex.getMessage());
        }
    }
}
