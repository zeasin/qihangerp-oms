package com.qihang.common.common;

import lombok.Data;

import java.util.List;

/**
 * 描述：
 * Service返回结果VO
 *
 * @author qlp
 * @date 2018-12-26 5:20 PM
 */
@Data
public class ResultVo<T> {
    private int code;
    private String msg;
    private T data;
    private List<T> list;
    private Integer totalRecords;

    public ResultVo() {
    }
//
//    public ResultVo(ResultVoEnum result) {
//        this.code = result.getIndex();
//        this.msg = result.getName();
//    }
//
//    public ResultVo(ResultVoEnum result, String msg, T data) {
//        this.code = result.getIndex();
//        this.msg = msg;
//        this.data = data;
//    }
//
//    public ResultVo(ResultVoEnum result, String msg) {
//        this.code = result.getIndex();
//        this.msg = msg;
//    }
//
//    public ResultVo(ResultVoEnum result, T data) {
//        this.code = result.getIndex();
//        this.msg = result.getName();
//        this.data = data;
//    }


    public static <T> ResultVo<T> success(int totalRecords , List<T> list){
        ResultVo<T> result = new ResultVo<>();
        result.setCode(ResultVoEnum.SUCCESS.getIndex());
        result.setMsg("SUCCESS");
        result.totalRecords = totalRecords;
        result.setList(list);
        return result;
    }

    public static <T> ResultVo<T> success(T data){
        ResultVo<T> result = new ResultVo<>();
        result.setCode(ResultVoEnum.SUCCESS.getIndex());
        result.setMsg("SUCCESS");
        result.setData(data);
        return result;
    }
    public static <T> ResultVo<T> success(int code,T data){
        ResultVo<T> result = new ResultVo<>();
        result.setCode(code);
        result.setMsg("SUCCESS");
        result.setData(data);
        return result;
    }

    public static <T> ResultVo<T> success(){
        ResultVo<T> result = new ResultVo<>();
        result.setCode(ResultVoEnum.SUCCESS.getIndex());
        result.setMsg("SUCCESS");
        return result;
    }
    public static <T> ResultVo<T> success(String msg){
        ResultVo<T> result = new ResultVo<>();
        result.setCode(ResultVoEnum.SUCCESS.getIndex());
        result.setMsg(msg);
        return result;
    }
    public static <T> ResultVo<T> error(ResultVoEnum resultVoEnum )
    {
        ResultVo<T> result = new ResultVo<>();
        result.setCode(resultVoEnum.getIndex());
        result.setMsg(resultVoEnum.getName());
        return result;
    }

    public static <T> ResultVo<T> error(ResultVoEnum resultVoEnum , String msg)
    {
        ResultVo<T> result = new ResultVo<>();
        result.setCode(resultVoEnum.getIndex());
        result.setMsg(msg);
        return result;
    }

    public static <T> ResultVo<T> error(int code, String msg)
    {
        ResultVo<T> result = new ResultVo<>();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }
    public static <T> ResultVo<T> error(int code, String msg,T data)
    {
        ResultVo<T> result = new ResultVo<>();
        result.setCode(code);
        result.setMsg(msg);
        result.setData(data);
        return result;
    }

}
