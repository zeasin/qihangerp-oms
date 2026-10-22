package cn.qihangerp.erp.waybill;

import cn.qihangerp.model.entity.OOrder;
import cn.qihangerp.model.entity.ShopWaybillAccount;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 统一取号上下文（按订单 + 面单账号完成平台调用）
 */
@Data
@AllArgsConstructor
public class WaybillTakeContext implements Serializable {
    private static final long serialVersionUID = 1L;

    private OOrder order;
    private ShopWaybillAccount account;
}
