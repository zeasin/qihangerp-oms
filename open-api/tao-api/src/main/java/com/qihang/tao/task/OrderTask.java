//package com.qihang.tao.task;
//
//import com.qihang.common.task.IPollableService;
//import com.qihang.tao.domain.SysTask;
//import com.qihang.tao.service.SysTaskService;
//import lombok.AllArgsConstructor;
//import lombok.extern.java.Log;
//import org.springframework.stereotype.Service;
//
//import java.time.LocalDateTime;
//
//@Log
//@AllArgsConstructor
//@Service
//public class OrderTask implements IPollableService {
//
//    private final SysTaskService taskService;
//    @Override
//    public void poll() {
//        log.info("=======自动任务==TAO===拉取订单========="+ LocalDateTime.now());
////        System.out.printf("更新TAO订单%s","echo");
//    }
//
//    @Override
//    public String getCronExpression() {
//        SysTask task = taskService.getById(1);
////        return "0/1 * * * * ?";
//        return task.getCron();
//    }
//}