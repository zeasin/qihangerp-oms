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

    public static <T> ApiResult<T> build(int code ,String msg){
        ApiResult<T> result = new ApiResult<>();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    public static <T> ApiResult<T> build(int code ,String msg,T data){
        ApiResult<T> result = new ApiResult<>();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }
}
