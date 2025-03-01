import request from '@/utils/request'

// 查询商品规格库存管理列表
export function listGoodsSku(query) {
  return request({
    url: '/api/oms-api/offline_goods/sku_list',
    method: 'get',
    params: query
  })
}

// 查询商品规格库存管理详细
export function getGoodsSku(id) {
  return request({
    url: '/api/oms-api/offline_goods/sku/' + id,
    method: 'get'
  })
}

// 新增商品规格库存管理
export function addGoodsSku(data) {
  return request({
    url: '/api/oms-api/offline_goods/sku',
    method: 'post',
    data: data
  })
}

// 修改商品规格库存管理
export function updateGoodsSku(data) {
  return request({
    url: '/api/oms-api/offline_goods/sku',
    method: 'put',
    data: data
  })
}

// 删除商品规格库存管理
export function delGoodsSku(id) {
  return request({
    url: '/api/oms-api/offline_goods/sku/' + id,
    method: 'delete'
  })
}

// 查询商品规格列表
export function searchSku(query) {
  return request({
    url: '/api/oms-api/offline_goods/searchSku',
    method: 'get',
    params: query
  })
}
