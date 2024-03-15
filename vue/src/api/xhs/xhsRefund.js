import request from '@/utils/request'

// 查询小红书订单退款列表
export function listXhsRefund(query) {
  return request({
    url: '/xhs/xhsRefund/list',
    method: 'get',
    params: query
  })
}

// 查询小红书订单退款详细
export function getXhsRefund(id) {
  return request({
    url: '/xhs/xhsRefund/' + id,
    method: 'get'
  })
}

// 新增小红书订单退款
export function addXhsRefund(data) {
  return request({
    url: '/xhs/xhsRefund',
    method: 'post',
    data: data
  })
}

// 修改小红书订单退款
export function updateXhsRefund(data) {
  return request({
    url: '/xhs/xhsRefund',
    method: 'put',
    data: data
  })
}

// 删除小红书订单退款
export function delXhsRefund(id) {
  return request({
    url: '/xhs/xhsRefund/' + id,
    method: 'delete'
  })
}
