package com.qihang.tao.api;
import java.util.List;

/**
 * 淘宝开放平台订单更新结果
 */
public class ApiResult<T> {
    private Integer code;//代码 0成功其他错误
    private String msg;//错误信息
    private Integer totalRecords;//总记录数
    private List<T> list;//订单

    public ApiResult(Integer code, String msg, Integer totalRecords, List<T> list) {
        this.code = code;
        this.msg = msg;
        this.totalRecords = totalRecords;
        this.list = list;
    }

    public ApiResult(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
        this.totalRecords = 0;
        this.list = null;
    }

    public ApiResult(Integer totalRecords, List<T> list) {
        this.code = 0;
        this.msg = "SUCCESS";
        this.totalRecords = totalRecords;
        this.list = list;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getTotalRecords() {
        return totalRecords;
    }

    public void setTotalRecords(Integer totalRecords) {
        this.totalRecords = totalRecords;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
