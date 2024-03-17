package com.qihang.common.common;

import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Data
public class PageQuery implements Serializable {
    private Integer pageSize;
    private Integer pageNum;
    private String orderByColumn;
    private String isAsc;

    public static final int DEFAULT_PAGE_INDEX =1;
    public static final int DEFAULT_PAGE_SIZE = 10;

    public <T> Page<T> build() {
        Integer pageIndex = (getPageNum() == null || getPageNum() == 0) ? DEFAULT_PAGE_INDEX : getPageNum();
        Integer pageSize = (getPageSize() == null || getPageSize() == 0) ? DEFAULT_PAGE_SIZE : getPageSize();
        if (pageIndex <= 0) {
            pageIndex = DEFAULT_PAGE_INDEX;
        }
        Page<T> page = new Page<>(pageIndex,pageSize);
        // 加上排序
        List<OrderItem> orderItems = buildOrderItem();
        if(!CollectionUtils.isEmpty(orderItems)){
            page.addOrder(orderItems);
        }
        return page;
    }

    private List<OrderItem> buildOrderItem(){
        List<OrderItem> list = new ArrayList<>();
        if(StringUtils.isEmpty(orderByColumn) || StringUtils.isEmpty(isAsc)){
            list.add(OrderItem.desc("id"));
            return list;
        }
        String[] orderByArr = orderByColumn.split(",");
        String[] isAscArr = isAsc.split(",");

        // 字段加上排序
        for (int i = 0; i < orderByArr.length; i++) {
            String orderByStr = orderByArr[i];
            String isAscStr = isAscArr.length ==1 ?isAscArr[0]:isAscArr[i];
            if("asc".equals(isAscStr)){
                list.add(OrderItem.asc(orderByStr));
            }else if("desc".equals(isAscStr)){
                list.add(OrderItem.desc(orderByStr));
            }else {
                throw new ServiceException("排序参数错误");
            }
        }
        return list;
    }

}
