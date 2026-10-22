package cn.qihangerp.erp.waybill;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 平台面单适配器注册表（按店铺类型路由）
 */
@Slf4j
@Component
public class PlatformWaybillAdapterRegistry {

    private final Map<Integer, PlatformWaybillAdapter> adapterMap = new HashMap<>();

    public PlatformWaybillAdapterRegistry(List<PlatformWaybillAdapter> adapters) {
        if (adapters != null) {
            for (PlatformWaybillAdapter adapter : adapters) {
                adapterMap.put(adapter.shopType(), adapter);
            }
        }
    }

    public PlatformWaybillAdapter get(Integer shopType) {
        return shopType == null ? null : adapterMap.get(shopType);
    }

    public PlatformWaybillCapability capability(Integer shopType) {
        PlatformWaybillAdapter adapter = get(shopType);
        if (adapter == null) {
            return PlatformWaybillCapability.unsupported(shopType);
        }
        return adapter.capability();
    }
}
