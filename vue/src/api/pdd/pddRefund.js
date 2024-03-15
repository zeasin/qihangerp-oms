import request from '@/utils/request'

// 查询拼多多订单退款列表
export function listPddRefund(query) {
  return request({
    url: '/pdd/pddRefund/list',
    method: 'get',
    params: query
  })
}

// 查询拼多多订单退款详细
export function getPddRefund(id) {
  return request({
    url: '/pdd/pddRefund/' + id,
    method: 'get'
  })
}

// 新增拼多多订单退款
export function addPddRefund(data) {
  return request({
    url: '/pdd/pddRefund',
    method: 'post',
    data: data
  })
}

// 修改拼多多订单退款
export function updatePddRefund(data) {
  return request({
    url: '/pdd/pddRefund',
    method: 'put',
    data: data
  })
}

// 删除拼多多订单退款
export function delPddRefund(id) {
  return request({
    url: '/pdd/pddRefund/' + id,
    method: 'delete'
  })
}
