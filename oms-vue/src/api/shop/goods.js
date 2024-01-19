import request from '@/utils/request'

// 查询店铺商品列表
export function listGoods(query) {
  return request({
    url: '/shop/goods/list',
    method: 'get',
    params: query
  })
}

// 查询店铺商品详细
export function getGoods(id) {
  return request({
    url: '/shop/goods/' + id,
    method: 'get'
  })
}

// 新增店铺商品
export function addGoods(data) {
  return request({
    url: '/shop/goods',
    method: 'post',
    data: data
  })
}

// 修改店铺商品
export function updateGoods(data) {
  return request({
    url: '/shop/goods',
    method: 'put',
    data: data
  })
}

// 删除店铺商品
export function delGoods(id) {
  return request({
    url: '/shop/goods/' + id,
    method: 'delete'
  })
}
