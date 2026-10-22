import request from '@/utils/request'

// ==================== 状态池/订单域（/orderWorkbench/order） ====================

// 主订单分页查询
export function orderList(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/list', method: 'get', params: query })
}

// 状态池分页查询（主订单行与子订单行平铺，含 canRelease）
export function poolPage(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/page', method: 'get', params: query })
}

// 状态池计数（页签角标）
export function poolCounts(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/poolCounts', method: 'get', params: query })
}

// 异常池分类计数（bind_pool=2 标签聚合 + 未分类兜底）
export function exceptionTagCounts(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/exceptionTagCounts', method: 'get', params: query })
}

// 批量转异常/转正常（target：0转正常 2转异常）
export function toException(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/exception', method: 'post', data })
}

// 批量审核放行（逐单返回结果，部分失败留池）
export function releaseOrders(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/release', method: 'post', data })
}

// 已放行订单撤回异常池（未发货前置）
export function withdrawToException(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/withdrawException', method: 'post', data })
}

// 取消订单（主订单级，未发货前置）
export function cancelWorkOrder(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/cancel', method: 'post', data })
}

// 修改卖家备注
export function updateOrderMemo(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/memo', method: 'post', data })
}

// 修改收货地址
export function updateOrderAddress(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/order/address', method: 'post', data })
}

// 订单树（主订单 + 子订单 + 商品行）
export function getOrderTree(id: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/order/tree/' + id, method: 'get' })
}

// 订单商品明细
export function getWorkbenchItems(orderId: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/item/list/' + orderId, method: 'get' })
}

// ==================== 标签（/orderWorkbench/tag） ====================

export function listTags(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/tag/list', method: 'get', params: query })
}

export function tagOptions() {
  return request({ url: '/api/erp-api/orderWorkbench/tag/options', method: 'get' })
}

// 状态池分类标签下拉（转异常弹窗：bind_pool 匹配 + 启用）
export function poolTagOptions(bindPool: number) {
  return request({ url: '/api/erp-api/orderWorkbench/tag/poolOptions', method: 'get', params: { bindPool } })
}

export function addTag(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/tag', method: 'post', data })
}

export function editTag(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/tag', method: 'put', data })
}

export function setTagStatus(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/tag/status', method: 'put', data })
}

export function deleteTag(id: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/tag/' + id, method: 'delete' })
}

// 批量打标/撤标（action：1打标 0撤标；orderIds 为字符串ID列表）
export function applyTags(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/tag/apply', method: 'post', data })
}

// ==================== 组合条件方案（/orderWorkbench/scheme） ====================

export function listSchemes(query?: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme/list', method: 'get', params: query })
}

export function schemeOptions() {
  return request({ url: '/api/erp-api/orderWorkbench/scheme/options', method: 'get' })
}

export function getScheme(id: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme/' + id, method: 'get' })
}

export function addScheme(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme', method: 'post', data })
}

export function editScheme(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme', method: 'put', data })
}

export function deleteScheme(id: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme/' + id, method: 'delete' })
}

export function setSchemeStatus(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/scheme/status', method: 'put', data })
}

// ==================== 拆单（/orderWorkbench/split） ====================

// 拆单预览（含已拆出数量）
export function splitPreview(orderId: number | string) {
  return request({ url: '/api/erp-api/orderWorkbench/split/preview', method: 'get', params: { orderId } })
}

// 提交拆单
export function splitSubmit(data: Record<string, any>) {
  return request({ url: '/api/erp-api/orderWorkbench/split/submit', method: 'post', data })
}
