import request from '@/utils/request'

// 查询商品分类属性值列表
export function listCategoryAttributeValue(query) {
  return request({
    url: '/goods/categoryAttributeValue/list',
    method: 'get',
    params: query
  })
}

// 查询商品分类属性值详细
export function getCategoryAttributeValue(id) {
  return request({
    url: '/goods/categoryAttributeValue/' + id,
    method: 'get'
  })
}

// 新增商品分类属性值
export function addCategoryAttributeValue(data) {
  return request({
    url: '/goods/categoryAttributeValue',
    method: 'post',
    data: data
  })
}

// 修改商品分类属性值
export function updateCategoryAttributeValue(data) {
  return request({
    url: '/goods/categoryAttributeValue',
    method: 'put',
    data: data
  })
}

// 删除商品分类属性值
export function delCategoryAttributeValue(id) {
  return request({
    url: '/goods/categoryAttributeValue/' + id,
    method: 'delete'
  })
}
