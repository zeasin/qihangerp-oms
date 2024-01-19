import request from '@/utils/request'

// 查询仓库订单发货列表
export function listShipping(query) {
  return request({
    url: '/wms/shipping/list',
    method: 'get',
    params: query
  })
}

// 查询仓库订单发货详细
export function getShipping(id) {
  return request({
    url: '/wms/shipping/' + id,
    method: 'get'
  })
}

// 新增仓库订单发货
export function stockingAdd(data) {
  return request({
    url: '/wms/shipping/stockingAdd',
    method: 'post',
    data: data
  })
}

// 修改仓库订单发货
export function updateShipping(data) {
  return request({
    url: '/wms/shipping',
    method: 'put',
    data: data
  })
}

// 删除仓库订单发货
export function delShipping(id) {
  return request({
    url: '/wms/shipping/' + id,
    method: 'delete'
  })
}
