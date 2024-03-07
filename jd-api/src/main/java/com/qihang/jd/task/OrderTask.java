package com.qihang.jd.task;

import com.qihang.common.task.IPollableService;
import com.qihang.jd.domain.SysTask;
import com.qihang.jd.service.SysTaskService;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class OrderTask implements IPollableService {

    private final SysTaskService taskService;
    @Override
    public void poll() {
        System.out.printf("更新JD订单%s","echo");
    }

    @Override
    public String getCronExpression() {
        SysTask task = taskService.getById(1);
//        return "0/1 * * * * ?";
        return task.getCron();
    }
}