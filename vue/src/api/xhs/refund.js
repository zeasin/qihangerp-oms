import request from '@/utils/request'

// 查询小红书订单退款列表
export function listRefund(query) {
  return request({
    url: '/xhs/refund/list',
    method: 'get',
    params: query
  })
}

// 查询小红书订单退款详细
export function getRefund(id) {
  return request({
    url: '/xhs/refund/' + id,
    method: 'get'
  })
}

// 新增小红书订单退款
export function addRefund(data) {
  return request({
    url: '/xhs/refund',
    method: 'post',
    data: data
  })
}

// 修改小红书订单退款
export function updateRefund(data) {
  return request({
    url: '/xhs/refund',
    method: 'put',
    data: data
  })
}

// 删除小红书订单退款
export function delRefund(id) {
  return request({
    url: '/xhs/refund/' + id,
    method: 'delete'
  })
}
