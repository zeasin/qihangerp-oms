import request from '@/utils/request'

// 查询拼多多订单退款列表
export function listOrderRefund(query) {
  return request({
    url: '/pdd/orderRefund/list',
    method: 'get',
    params: query
  })
}

// 查询拼多多订单退款详细
export function getOrderRefund(id) {
  return request({
    url: '/pdd/orderRefund/' + id,
    method: 'get'
  })
}

// 新增拼多多订单退款
export function addOrderRefund(data) {
  return request({
    url: '/pdd/orderRefund',
    method: 'post',
    data: data
  })
}

// 修改拼多多订单退款
export function updateOrderRefund(data) {
  return request({
    url: '/pdd/orderRefund',
    method: 'put',
    data: data
  })
}

// 删除拼多多订单退款
export function delOrderRefund(id) {
  return request({
    url: '/pdd/orderRefund/' + id,
    method: 'delete'
  })
}
