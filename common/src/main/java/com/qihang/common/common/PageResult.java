package com.qihang.common.common;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.qihang.common.enums.HttpStatus;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PageResult<T> implements Serializable {
    private long total;
    private List<T> records;
    private int code;
    private String msg;

    public static <T> PageResult<T> build(IPage<T> page){
        PageResult<T> result = new PageResult<>();
        result.setCode(HttpStatus.SUCCESS);
        result.setMsg("查询成功");
        result.setRecords(page.getRecords());
        result.setTotal(page.getTotal());
        return result;
    }

    public static <T> PageResult<T> build(List<T> list){
        PageResult<T> result = new PageResult<>();
        result.setCode(HttpStatus.SUCCESS);
        result.setMsg("查询成功");
        result.setRecords(list);
        result.setTotal(list.size());
        return result;
    }

    public static <T> PageResult<T> build(){
        PageResult<T> result = new PageResult<>();
        result.setCode(HttpStatus.SUCCESS);
        result.setMsg("查询成功");
        return result;
    }
}
