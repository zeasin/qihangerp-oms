import request from '@/utils/request'

// 查询财务管理-应付款-物流费用列表
export function listShipFee(query) {
  return request({
    url: '/fms/shipFee/list',
    method: 'get',
    params: query
  })
}

// 查询财务管理-应付款-物流费用详细
export function getShipFee(id) {
  return request({
    url: '/fms/shipFee/' + id,
    method: 'get'
  })
}

// 新增财务管理-应付款-物流费用
export function addShipFee(data) {
  return request({
    url: '/fms/shipFee',
    method: 'post',
    data: data
  })
}

// 修改财务管理-应付款-物流费用
export function updateShipFee(data) {
  return request({
    url: '/fms/shipFee',
    method: 'put',
    data: data
  })
}

// 删除财务管理-应付款-物流费用
export function delShipFee(id) {
  return request({
    url: '/fms/shipFee/' + id,
    method: 'delete'
  })
}
