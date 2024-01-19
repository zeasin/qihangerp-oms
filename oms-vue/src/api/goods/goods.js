import request from '@/utils/request'

// 查询商品管理列表
export function listGoods(query) {
  return request({
    url: '/goods/goods/list',
    method: 'get',
    params: query
  })
}

// 查询商品规格列表
export function searchSku(query) {
  return request({
    url: '/goods/goods/searchSku',
    method: 'get',
    params: query
  })
}

// 查询商品管理详细
export function getGoods(id) {
  return request({
    url: '/goods/goods/' + id,
    method: 'get'
  })
}

// 新增商品管理
export function addGoods(data) {
  return request({
    url: '/goods/goods',
    method: 'post',
    data: data
  })
}

// 修改商品管理
export function updateGoods(data) {
  return request({
    url: '/goods/goods',
    method: 'put',
    data: data
  })
}

// 删除商品管理
export function delGoods(id) {
  return request({
    url: '/goods/goods/' + id,
    method: 'delete'
  })
}
