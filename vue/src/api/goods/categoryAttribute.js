import request from '@/utils/request'

// 查询商品分类属性列表
export function listCategoryAttribute(query) {
  return request({
    url: '/goods/categoryAttribute/list',
    method: 'get',
    params: query
  })
}

// 查询商品分类属性详细
export function getCategoryAttribute(id) {
  return request({
    url: '/goods/categoryAttribute/' + id,
    method: 'get'
  })
}

// 新增商品分类属性
export function addCategoryAttribute(data) {
  return request({
    url: '/goods/categoryAttribute',
    method: 'post',
    data: data
  })
}

// 修改商品分类属性
export function updateCategoryAttribute(data) {
  return request({
    url: '/goods/categoryAttribute',
    method: 'put',
    data: data
  })
}

// 删除商品分类属性
export function delCategoryAttribute(id) {
  return request({
    url: '/goods/categoryAttribute/' + id,
    method: 'delete'
  })
}
