package com.qihang.jd.task;

import com.qihang.common.task.IPollableService;
import com.qihang.jd.domain.SysTask;
import com.qihang.jd.service.SysTaskService;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
@Log
@AllArgsConstructor
@Service
public class OrderTask implements IPollableService {

    private final SysTaskService taskService;
    @Override
    public void poll() {
        log.info("=======自动任务==JD===拉取订单========="+ LocalDateTime.now());
//        System.out.printf("更新JD订单%s","echo");
    }

    @Override
    public String getCronExpression() {
        SysTask task = taskService.getById(2);
//        return "0/1 * * * * ?";
        return task.getCron();
    }
}