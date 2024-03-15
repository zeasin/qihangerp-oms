import request from '@/utils/request'

// 查询淘宝退款订单列表
export function listTaoRefund(query) {
  return request({
    url: '/tao/taoRefund/list',
    method: 'get',
    params: query
  })
}

// 查询淘宝退款订单详细
export function getTaoRefund(id) {
  return request({
    url: '/tao/taoRefund/' + id,
    method: 'get'
  })
}

// 新增淘宝退款订单
export function addTaoRefund(data) {
  return request({
    url: '/tao/taoRefund',
    method: 'post',
    data: data
  })
}

// 修改淘宝退款订单
export function updateTaoRefund(data) {
  return request({
    url: '/tao/taoRefund',
    method: 'put',
    data: data
  })
}

// 删除淘宝退款订单
export function delTaoRefund(id) {
  return request({
    url: '/tao/taoRefund/' + id,
    method: 'delete'
  })
}
