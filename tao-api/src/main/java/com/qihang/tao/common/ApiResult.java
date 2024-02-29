package com.qihang.tao.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qihang.common.enums.HttpStatus;
import lombok.Data;

import java.util.List;

@Data
public class ApiResult<T> {
    private T data;
    private int code;
    private String msg;

}
