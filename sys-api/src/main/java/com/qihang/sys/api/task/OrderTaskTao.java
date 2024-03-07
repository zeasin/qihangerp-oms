//package com.qihang.sys.api.task;
//
//import com.qihang.sys.api.domain.SysTask;
//import com.qihang.sys.api.feign.EchoService;
//import com.qihang.sys.api.service.SysTaskService;
//import com.qihang.common.task.IPollableService;
//import jakarta.annotation.Resource;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//
//@Service
//public class OrderTaskTao implements IPollableService {
//    @Autowired
//    private SysTaskService taskService;
//    @Resource
//    private EchoService echoService;
//    @Override
//    public void poll() {
//        String token = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjdkOTBmN2EzLWUwNWQtNDkxNy04NjIzLTU1OGRhNGY3NjE3NiJ9._Oukm9b0P1WvcOywLdhs6_BOt_6mRSF41Q6f4fBm_DGUkPR86Qg1tqyRTM5ouTR2Xz46IRuRAVez8Wcl3NIlwg";
//        String echo = echoService.echo(token);
//        System.out.printf("更新淘宝订单%s",echo);
//    }
//
//    @Override
//    public String getCronExpression() {
//        SysTask task = taskService.getById(1);
////        return "0/1 * * * * ?";
//        return task.getCron();
//    }
//}