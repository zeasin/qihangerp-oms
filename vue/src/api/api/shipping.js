import request from '@/utils/request'

// 查询
export function listShipping(query) {
  return request({
    url: '/api/oms-api/shipping/list',
    method: 'get',
    params: query
  })
}

export function getLogistics(id) {
  return request({
    url: '/api/logistics/' + id,
    method: 'get'
  })
}

// 新增
export function handShip(data) {
  return request({
    url: '/api/oms-api/shipping/handShip',
    method: 'post',
    data: data
  })
}

