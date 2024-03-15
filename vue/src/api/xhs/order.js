import request from '@/utils/request'

// 查询小红书订单列表
export function listOrder(query) {
  return request({
    url: '/xhs/order/list',
    method: 'get',
    params: query
  })
}

// 查询小红书订单详细
export function getOrder(id) {
  return request({
    url: '/xhs/order/' + id,
    method: 'get'
  })
}

// 新增小红书订单
export function addOrder(data) {
  return request({
    url: '/xhs/order',
    method: 'post',
    data: data
  })
}

// 修改小红书订单
export function confirmOrder(data) {
  return request({
    url: '/xhs/order/confirm',
    method: 'post',
    data: data
  })
}

// 删除小红书订单
export function delOrder(id) {
  return request({
    url: '/xhs/order/' + id,
    method: 'delete'
  })
}
