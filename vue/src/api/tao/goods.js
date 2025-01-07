import request from '@/utils/request'

// 查询淘宝订单列表
export function listGoodsSku(query) {
  return request({
    url: '/api/open-api/tao/goods/skuList',
    method: 'get',
    params: query
  })
}


export function getGoodsSku(id) {
  return request({
    url: '/api/open-api/tao/goods/sku/'+id,
    method: 'get',
  })
}


export function linkErpGoodsSkuId(data) {
  return request({
    url: '/api/open-api/tao/goods/sku/linkErp',
    method: 'post',
    data: data
  })
}

// 接口拉取淘宝商品
export function pullGoodsList(data) {
  return request({
    url: '/api/open-api/tao/goods/pull_goods',
    method: 'post',
    data: data
  })
}
