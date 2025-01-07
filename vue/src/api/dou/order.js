import request from '@/utils/request'

// 查询抖店订单列表
export function listOrder(query) {
  return request({
    url: '/api/open-api/dou/order/list',
    method: 'get',
    params: query
  })
}

// 查询抖店订单详细
export function getOrder(id) {
  return request({
    url: '/api/open-api/dou/order/' + id,
    method: 'get'
  })
}

// 新增抖店订单
export function addOrder(data) {
  return request({
    url: '/api/open-api/dou/order',
    method: 'post',
    data: data
  })
}


// 接口拉取订单
export function pullOrder(data) {
  return request({
    url: '/api/open-api/dou/order/pull_order',
    method: 'post',
    data: data
  })
}

export function pushOms(data) {
  return request({
    url: '/api/open-api/dou/order/push_oms',
    method: 'post',
    data: data
  })
}
