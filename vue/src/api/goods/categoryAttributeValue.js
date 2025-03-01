import request from '@/utils/request'

// 查询商品分类属性值列表
export function listCategoryAttributeValue(query) {
  return request({
    url: '/api/oms-api/goods_category/attribute_value_list',
    method: 'get',
    params: query
  })
}

// 查询商品分类属性值详细
export function getCategoryAttributeValue(id) {
  return request({
    url: '/api/oms-api/goods_category/attribute_value/' + id,
    method: 'get'
  })
}

// 新增商品分类属性值
export function addCategoryAttributeValue(data) {
  return request({
    url: '/api/oms-api/goods_category/attribute_value',
    method: 'post',
    data: data
  })
}

// 修改商品分类属性值
export function updateCategoryAttributeValue(data) {
  return request({
    url: '/api/oms-api/goods_category/attribute_value',
    method: 'put',
    data: data
  })
}

// 删除商品分类属性值
export function delCategoryAttributeValue(id) {
  return request({
    url: '/api/oms-api/goods_category/attribute_value/' + id,
    method: 'delete'
  })
}
