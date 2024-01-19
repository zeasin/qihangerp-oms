import request from '@/utils/request'

// 查询采购订单物流列表
export function listPurchaseOrderShip(query) {
  return request({
    url: '/purchase/PurchaseOrderShip/list',
    method: 'get',
    params: query
  })
}

// 查询采购订单物流详细
export function getPurchaseOrderShip(id) {
  return request({
    url: '/purchase/PurchaseOrderShip/' + id,
    method: 'get'
  })
}

// 新增采购订单物流
export function addPurchaseOrderShip(data) {
  return request({
    url: '/purchase/PurchaseOrderShip',
    method: 'post',
    data: data
  })
}

//创建入库单
export function createStockInEntry(data) {
  return request({
    url: '/purchase/PurchaseOrderShip/createStockInEntry',
    method: 'post',
    data: data
  })
}


// 修改采购订单物流
export function updatePurchaseOrderShip(data) {
  return request({
    url: '/purchase/PurchaseOrderShip',
    method: 'put',
    data: data
  })
}

// 删除采购订单物流
export function delPurchaseOrderShip(id) {
  return request({
    url: '/purchase/PurchaseOrderShip/' + id,
    method: 'delete'
  })
}
