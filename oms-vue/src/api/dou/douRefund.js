import request from '@/utils/request'

// 查询抖店订单退款列表
export function listDouRefund(query) {
  return request({
    url: '/dou/douRefund/list',
    method: 'get',
    params: query
  })
}

// 查询抖店订单退款详细
export function getDouRefund(id) {
  return request({
    url: '/dou/douRefund/' + id,
    method: 'get'
  })
}

// 新增抖店订单退款
export function addDouRefund(data) {
  return request({
    url: '/dou/douRefund',
    method: 'post',
    data: data
  })
}

// 修改抖店订单退款
export function updateDouRefund(data) {
  return request({
    url: '/dou/douRefund',
    method: 'put',
    data: data
  })
}

// 删除抖店订单退款
export function delDouRefund(id) {
  return request({
    url: '/dou/douRefund/' + id,
    method: 'delete'
  })
}
