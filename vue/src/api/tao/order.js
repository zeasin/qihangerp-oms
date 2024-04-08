import request from '@/utils/request'

// 查询淘宝订单列表
export function listOrder(query) {
  return request({
    url: '/api/tao-api/order/list',
    method: 'get',
    params: query
  })
}

// 查询淘宝订单详细
export function getOrder(id) {
  return request({
    url: '/api/tao-api/order/' + id,
    method: 'get'
  })
}


// 接口拉取淘宝订单
export function pullOrder(data) {
  return request({
    url: '/api/tao-api/order/pull_order_tao',
    method: 'post',
    data: data
  })
}

export function pullOrderDetail(data) {
  return request({
    url: '/api/tao-api/order/pull_order_detail',
    method: 'post',
    data: data
  })
}

export function pushOms(data) {
  return request({
    url: '/api/tao-api/order/push_oms',
    method: 'post',
    data: data
  })
}
