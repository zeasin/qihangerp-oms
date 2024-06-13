import request from '@/utils/request'

// 查询拼多多订单列表
export function listOrder(query) {
  return request({
    url: '/pdd-api/order/list',
    method: 'get',
    params: query
  })
}

// 查询拼多多订单详细
export function getOrder(id) {
  return request({
    url: '/pdd-api/order/' + id,
    method: 'get'
  })
}


// 接口拉取淘宝订单
export function pullOrder(query) {
  return request({
    url: '/pdd-api/order/pull_order',
    method: 'get',
    params: query
  })
}
export function pushOms(data) {
  return request({
    url: '/pdd-api/order/push_oms',
    method: 'post',
    data: data
  })
}
