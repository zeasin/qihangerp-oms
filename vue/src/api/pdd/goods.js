import request from '@/utils/request'

// 查询列表
export function listGoodsSku(query) {
  return request({
    url: '/api/pdd-api/goods/skuList',
    method: 'get',
    params: query
  })
}


export function getGoodsSku(id) {
  return request({
    url: '/api/pdd-api/goods/sku/'+id,
    method: 'get',
  })
}


export function linkErpGoodsSkuId(data) {
  return request({
    url: '/api/pdd-api/goods/sku/linkErp',
    method: 'post',
    data: data
  })
}

// 接口拉取商品
export function pullGoodsList(data) {
  return request({
    url: '/api/pdd-api/goods/pull_goods',
    method: 'post',
    data: data
  })
}
