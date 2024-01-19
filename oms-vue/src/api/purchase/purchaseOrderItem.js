import request from '@/utils/request'

// 查询采购订单明细列表
export function listPurchaseOrderItem(query) {
  return request({
    url: '/purchase/purchaseOrderItem/list',
    method: 'get',
    params: query
  })
}

// 查询采购订单明细详细
export function getPurchaseOrderItem(id) {
  return request({
    url: '/purchase/purchaseOrderItem/' + id,
    method: 'get'
  })
}

// 新增采购订单明细
export function addPurchaseOrderItem(data) {
  return request({
    url: '/purchase/purchaseOrderItem',
    method: 'post',
    data: data
  })
}

// 修改采购订单明细
export function updatePurchaseOrderItem(data) {
  return request({
    url: '/purchase/purchaseOrderItem',
    method: 'put',
    data: data
  })
}

// 删除采购订单明细
export function delPurchaseOrderItem(id) {
  return request({
    url: '/purchase/purchaseOrderItem/' + id,
    method: 'delete'
  })
}
