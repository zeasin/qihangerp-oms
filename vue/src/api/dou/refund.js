import request from '@/utils/request'

// 查询抖店订单退款列表
export function listRefund(query) {
  return request({
    url: '/dou/refund/list',
    method: 'get',
    params: query
  })
}

// 查询抖店订单退款详细
export function getRefund(id) {
  return request({
    url: '/dou/refund/' + id,
    method: 'get'
  })
}

// 新增抖店订单退款
export function addRefund(data) {
  return request({
    url: '/dou/refund',
    method: 'post',
    data: data
  })
}

// 修改抖店订单退款
export function updateRefund(data) {
  return request({
    url: '/dou/refund',
    method: 'put',
    data: data
  })
}

// 删除抖店订单退款
export function delRefund(id) {
  return request({
    url: '/dou/refund/' + id,
    method: 'delete'
  })
}
