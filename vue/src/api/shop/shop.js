import request from '@/utils/request'

// 查询店铺列表
export function listShop(query) {
  return request({
    url: '/api/oms-api/shop/list',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getShop(id) {
  return request({
    url: '/api/oms-api/shop/shop/' + id,
    method: 'get'
  })
}

// 新增店铺
export function addShop(data) {
  return request({
    url: '/api/oms-api/shop/shop',
    method: 'post',
    data: data
  })
}

// 修改店铺
export function updateShop(data) {
  return request({
    url: '/api/oms-api/shop/shop',
    method: 'put',
    data: data
  })
}

// 删除店铺
export function delShop(id) {
  return request({
    url: '/api/oms-api/shop/shop/' + id,
    method: 'delete'
  })
}

// 查询店铺平台列表
export function listPlatform(query) {
  return request({
    url: '/api/oms-api/shop/platformList',
    method: 'get',
    params: query
  })
}

// 查询店铺详细
export function getPlatform(id) {
  return request({
    url: '/api/oms-api/shop/platform/' + id,
    method: 'get'
  })
}

// 修改店铺
export function updatePlatform(data) {
  return request({
    url: '/api/oms-api/shop/platform',
    method: 'put',
    data: data
  })
}

export function listLogistics(query) {
  return request({
    url: '/api/oms-api/shop/logistics',
    method: 'get',
    params: query
  })
}

export function listShopPullLogs(query) {
  return request({
    url: '/api/oms-api/shop/pull_logs_list',
    method: 'get',
    params: query
  })
}
