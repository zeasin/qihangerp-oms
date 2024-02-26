package com.qihang.tao.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("tao_goods")
public class TaoGoods {
    private Long id;
    private Long goodsId;
}
