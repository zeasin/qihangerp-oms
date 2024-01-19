import request from '@/utils/request'

// 查询采购订单费用确认列表
export function listPurchaseOrderCost(query) {
  return request({
    url: '/purchase/purchaseOrderCost/list',
    method: 'get',
    params: query
  })
}

// 查询采购订单费用确认详细
export function getPurchaseOrderCost(id) {
  return request({
    url: '/purchase/purchaseOrderCost/' + id,
    method: 'get'
  })
}

// 新增采购订单费用确认
export function addPurchaseOrderCost(data) {
  return request({
    url: '/purchase/purchaseOrderCost',
    method: 'post',
    data: data
  })
}

// 修改采购订单费用确认
export function updatePurchaseOrderCost(data) {
  return request({
    url: '/purchase/purchaseOrderCost',
    method: 'put',
    data: data
  })
}

// 删除采购订单费用确认
export function delPurchaseOrderCost(id) {
  return request({
    url: '/purchase/purchaseOrderCost/' + id,
    method: 'delete'
  })
}
