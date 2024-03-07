package com.qihang.tao.task;

import com.qihang.common.task.IPollableService;
import com.qihang.tao.domain.SysTask;
import com.qihang.tao.service.SysTaskService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class OrderTask implements IPollableService {

    private final SysTaskService taskService;
    @Override
    public void poll() {
        System.out.printf("更新TAO订单%s","echo");
    }

    @Override
    public String getCronExpression() {
        SysTask task = taskService.getById(1);
//        return "0/1 * * * * ?";
        return task.getCron();
    }
}