import request from '@/utils/request'

// 查询打包发货列表
export function listShipOrder(query) {
  return request({
    url: '/shipping/ship_order',
    method: 'get',
    params: query
  })
}

export function getShipOrderItemList(id) {
  return request({
    url: '/shipping/ship_order/' + id,
    method: 'get'
  })
}

export function supplierShipOrder(data) {
  return request({
    url: '/shipping/ship_order/supplier_ship',
    method: 'post',
    data: data
  })
}

export function wmsShipOrder(data) {
  return request({
    url: '/shipping/ship_order/wms_ship',
    method: 'post',
    data: data
  })
}

