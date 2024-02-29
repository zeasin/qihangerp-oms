package com.qihang.tao.domain.bo;

import lombok.Data;

import java.io.Serializable;

@Data
public class TaoGoodsBo implements Serializable {
    /**
     * 商品数字id
     */
    private Long numIid;

    /**
     * 商品标题
     */
    private String title;
}
