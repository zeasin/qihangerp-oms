//package com.qihang.common.common;
//
//import java.util.HashMap;
//import java.util.Map;
//
///**
// *
// *
// * @Description 统一返回类封装
// **/
//public class R extends HashMap<String, Object> {
//
//    private static final long serialVersionUID = 563554414843661955L;
//
//    public R() {
//        put("code", 0);
//        put("msg", "success");
//    }
//
//    public static R error(int code, String msg) {
//        R r = new R();
//        r.put("code", code);
//        r.put("msg", msg);
//        r.put("success", false);
//        return r;
//    }
//
//    public static R success(Object data, String msg) {
//        R r = new R();
//        r.put("code", 200);
//        r.put("data", data);
//        r.put("msg", msg);
//        r.put("success", true);
//        return r;
//    }
//
//    public static R success(Object data) {
//        return success(data, "success");
//    }
//
//    public static R ok(String msg) {
//        R r = new R();
//        r.put("msg", msg);
//        return r;
//    }
//
//    public static R ok(Map<String, Object> map) {
//        R r = new R();
//        r.putAll(map);
//        return r;
//    }
//
//    public static R ok() {
//        return new R();
//    }
//
//    public R put(String key, Object value) {
//        super.put(key, value);
//        return this;
//    }
//}
//
