//package com.qihang.common.common;
//
//import lombok.Data;
//
//import java.util.List;
//
//@Data
//public class ApiResult<T> {
//    private T data;
//    private int code;
//    private String msg;
//    private Integer totalRecords;
//    private List<T> list;
//    public static <T> ApiResult<T> build(int code ,String msg){
//        ApiResult<T> result = new ApiResult<>();
//        result.setCode(code);
//        result.setMsg(msg);
//        return result;
//    }
//
//    public static <T> ApiResult<T> build(int code ,String msg,T data){
//        ApiResult<T> result = new ApiResult<>();
//        result.setCode(code);
//        result.setMsg(msg);
//        result.setData(data);
//        return result;
//    }
//
//    public static <T> ApiResult<T> build(int totalRecords , List<T> list){
//        ApiResult<T> result = new ApiResult<>();
//        result.setCode(0);
//        result.setMsg("SUCCESS");
//        result.totalRecords = totalRecords;
//        result.setList(list);
//        return result;
//    }
//
//    //    public ApiResult(Integer totalRecords, List<T> list) {
////        this.code = 0;
////        this.msg = "SUCCESS";
////        this.totalRecords = totalRecords;
////        this.list = list;
////    }
//}
