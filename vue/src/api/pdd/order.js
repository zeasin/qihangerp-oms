import request from '@/utils/request'

// 查询拼多多订单列表
export function listOrder(query) {
  return request({
    url: '/pdd/order/list',
    method: 'get',
    params: query
  })
}

// 查询拼多多订单详细
export function getOrder(id) {
  return request({
    url: '/pdd/order/' + id,
    method: 'get'
  })
}

// 新增拼多多订单
export function addOrder(data) {
  return request({
    url: '/pdd/order',
    method: 'post',
    data: data
  })
}

// 修改拼多多订单
export function confirmOrder(data) {
  return request({
    url: '/pdd/order/confirm',
    method: 'post',
    data: data
  })
}

// 删除拼多多订单
export function delOrder(id) {
  return request({
    url: '/pdd/order/' + id,
    method: 'delete'
  })
}


// 接口拉取淘宝订单
export function pullOrder(query) {
  return request({
    url: '/pdd_api/order/pull_order',
    method: 'get',
    params: query
  })
}
