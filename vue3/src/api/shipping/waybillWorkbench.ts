import request from '@/utils/request'

// 打单发货统一工作台接口（对齐企业版 docs/design/16-打单发货.md §8.2）
const BASE = '/api/erp-api/orderWorkbench/waybill'

/** 打单队列分页：复用订单工作台状态池查询，pool 固定 released */
export function pageWaybillOrders(query: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/page', method: 'get', params: { pool: 'released', ...query } })
}

/** 批量取号 */
export function takeWaybill(data: { orderIds: number[]; accountId?: number }) {
  return request({ url: `${BASE}/take`, method: 'post', data })
}

/** 批量取消取号 */
export function cancelWaybill(data: { orderIds: number[] }) {
  return request({ url: `${BASE}/cancel`, method: 'post', data })
}

/** 批量获取打印数据（前端打印组件驱动，含补打） */
export function getWaybillPrintData(data: { orderIds: number[] }) {
  return request({ url: `${BASE}/printData`, method: 'post', data })
}

/** 打印成功状态回传（1→2） */
export function printWaybill(data: { orderIds: number[] }) {
  return request({ url: `${BASE}/print`, method: 'post', data })
}

/** 批量发货（平台回传 + 本地终态 + 备货单） */
export function shipWaybill(data: { orderIds: number[] }) {
  return request({ url: `${BASE}/ship`, method: 'post', data })
}

/** 手动发货兜底通道 */
export function manualShipWaybill(data: {
  orderId: number
  logisticsCode: string
  waybillCompany?: string
  waybillCode: string
}) {
  return request({ url: `${BASE}/manualShip`, method: 'post', data })
}

/** 分配/改派面单账号（主体+账号一步完成） */
export function distributeWaybill(data: { orderIds: number[]; accountId: number }) {
  return request({ url: `${BASE}/distribute`, method: 'post', data })
}

/** 可用面单账号集合 */
export function getWaybillAccountOptions(query?: { shopId?: number; shipperType?: number; shipperId?: number }) {
  return request({ url: `${BASE}/accountOptions`, method: 'get', params: query })
}

/** 平台面单动作能力 */
export function getWaybillCapabilities(shopType: number) {
  return request({ url: `${BASE}/capabilities`, method: 'get', params: { shopType } })
}
