import request from '@/utils/request'

// 查询财务管理-应收款-订单收入列表
export function listReceivableOrder(query) {
  return request({
    url: '/fms/receivableOrder/list',
    method: 'get',
    params: query
  })
}

// 查询财务管理-应收款-订单收入详细
export function getReceivableOrder(id) {
  return request({
    url: '/fms/receivableOrder/' + id,
    method: 'get'
  })
}

// 新增财务管理-应收款-订单收入
export function addReceivableOrder(data) {
  return request({
    url: '/fms/receivableOrder',
    method: 'post',
    data: data
  })
}

// 修改财务管理-应收款-订单收入
export function updateReceivableOrder(data) {
  return request({
    url: '/fms/receivableOrder',
    method: 'put',
    data: data
  })
}

// 删除财务管理-应收款-订单收入
export function delReceivableOrder(id) {
  return request({
    url: '/fms/receivableOrder/' + id,
    method: 'delete'
  })
}
