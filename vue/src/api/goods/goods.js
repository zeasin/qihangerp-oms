import request from '@/utils/request'

// 查询商品管理列表
export function listGoods(query) {
  return request({
    url: '/api/oms-api/goods/list',
    method: 'get',
    params: query
  })
}

// 查询商品规格列表
export function searchSku(query) {
  return request({
    url: '/api/oms-api/goods/searchSku',
    method: 'get',
    params: query
  })
}
// 查询商品管理详细
export function getGoods(id) {
  return request({
    url: '/api/oms-api/goods/' + id,
    method: 'get'
  })
}

// 新增商品管理
export function addGoods(data) {
  return request({
    url: '/api/oms-api/goods/add',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateGoods(data) {
  return request({
    url: '/api/oms-api/goods',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delGoods(id) {
  return request({
    url: '/api/oms-api/goods/del/' + id,
    method: 'delete'
  })
}
