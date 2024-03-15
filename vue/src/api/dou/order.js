import request from '@/utils/request'

// 查询抖店订单列表
export function listOrder(query) {
  return request({
    url: '/dou/order/list',
    method: 'get',
    params: query
  })
}

// 查询抖店订单详细
export function getOrder(id) {
  return request({
    url: '/dou/order/' + id,
    method: 'get'
  })
}

// 新增抖店订单
export function addOrder(data) {
  return request({
    url: '/dou/order',
    method: 'post',
    data: data
  })
}

// 修改抖店订单
export function confirmOrder(data) {
  return request({
    url: '/dou/order/confirm',
    method: 'post',
    data: data
  })
}

// 删除抖店订单
export function delOrder(id) {
  return request({
    url: '/dou/order/' + id,
    method: 'delete'
  })
}

// 接口拉取淘宝订单
export function pullOrder(query) {
  return request({
    url: '/douapi/order/pull_order',
    method: 'get',
    params: query
  })
}
