import request from '@/utils/request'

// 查询退换货列表
export function listReturned(query) {
  return request({
    url: '/api/oms-api/refund/list',
    method: 'get',
    params: query
  })
}

// 查询退换货详细
export function getReturned(id) {
  return request({
    url: '/api/returned/' + id,
    method: 'get'
  })
}

// 新增退换货
export function addReturned(data) {
  return request({
    url: '/api/returned',
    method: 'post',
    data: data
  })
}

// 修改退换货
export function updateReturned(data) {
  return request({
    url: '/api/returned',
    method: 'put',
    data: data
  })
}

// 删除退换货
export function delReturned(id) {
  return request({
    url: '/api/returned/' + id,
    method: 'delete'
  })
}
