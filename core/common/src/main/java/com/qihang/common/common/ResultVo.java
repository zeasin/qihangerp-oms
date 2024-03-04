package com.qihang.common.common;

/**
 * 描述：
 * Service返回结果VO
 *
 * @author qlp
 * @date 2018-12-26 5:20 PM
 */
public class ResultVo<T> {
    private int code;
    private String msg;
    private T data;

    public ResultVo() {
    }

    public ResultVo(ResultVoEnum result) {
        this.code = result.getIndex();
        this.msg = result.getName();
    }

    public ResultVo(ResultVoEnum result, String msg, T data) {
        this.code = result.getIndex();
        this.msg = msg;
        this.data = data;
    }

    public ResultVo(ResultVoEnum result, String msg) {
        this.code = result.getIndex();
        this.msg = msg;
    }

    public ResultVo(ResultVoEnum result, T data) {
        this.code = result.getIndex();
        this.msg = result.getName();
        this.data = data;
    }
//    public ResultVo(Integer code, String msg) {
//        this.code = code;
//        this.msg = msg;
//    }

//    public ResultVo(Integer code, String msg, T data) {
//        this.code = code;
//        this.msg = msg;
//        this.data = data;
//    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
