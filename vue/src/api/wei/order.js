import request from '@/utils/request'

// 查询淘宝订单列表
export function listOrder(query) {
  return request({
    url: '/wei-api/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getOrder(id) {
  return request({
    url: '/wei-api/order/' + id,
    method: 'get'
  })
}



// 接口拉取订单
export function pullOrder(data) {
  return request({
    url: '/wei-api/order/pull_order',
    method: 'post',
    data: data
  })
}

export function pullOrderDetail(data) {
  return request({
    url: '/wei-api/order/pull_order_detail',
    method: 'post',
    data: data
  })
}


export function confirmOrder(data) {
  return request({
    url: '/wei-api/order/confirmOrder',
    method: 'post',
    data: data
  })
}
