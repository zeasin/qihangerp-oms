import request from '@/utils/request'

// 查询订单收件人信息列表
export function listOrderReceiver(query) {
  return request({
    url: '/xhs/orderReceiver/list',
    method: 'get',
    params: query
  })
}

// 查询订单收件人信息详细
export function getOrderReceiver(id) {
  return request({
    url: '/xhs/orderReceiver/' + id,
    method: 'get'
  })
}

// 新增订单收件人信息
export function addOrderReceiver(data) {
  return request({
    url: '/xhs/orderReceiver',
    method: 'post',
    data: data
  })
}

// 修改订单收件人信息
export function updateOrderReceiver(data) {
  return request({
    url: '/xhs/orderReceiver',
    method: 'put',
    data: data
  })
}

// 删除订单收件人信息
export function delOrderReceiver(id) {
  return request({
    url: '/xhs/orderReceiver/' + id,
    method: 'delete'
  })
}
