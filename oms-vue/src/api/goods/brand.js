import request from '@/utils/request'

// 查询商品品牌列表
export function listBrand(query) {
  return request({
    url: '/goods/brand/list',
    method: 'get',
    params: query
  })
}

// 查询商品品牌详细
export function getBrand(id) {
  return request({
    url: '/goods/brand/' + id,
    method: 'get'
  })
}

// 新增商品品牌
export function addBrand(data) {
  return request({
    url: '/goods/brand',
    method: 'post',
    data: data
  })
}

// 修改商品品牌
export function updateBrand(data) {
  return request({
    url: '/goods/brand',
    method: 'put',
    data: data
  })
}

// 删除商品品牌
export function delBrand(id) {
  return request({
    url: '/goods/brand/' + id,
    method: 'delete'
  })
}
