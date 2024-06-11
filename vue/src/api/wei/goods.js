import request from '@/utils/request'

// 查询列表
export function listGoods(query) {
  return request({
    url: '/wei-api/goods/list',
    method: 'get',
    params: query
  })
}

// 查询详细
export function getGoods(id) {
  return request({
    url: '/wei-api/goods/' + id,
    method: 'get'
  })
}
// 查询列表
export function listGoodsSku(query) {
  return request({
    url: '/wei-api/goods/skuList',
    method: 'get',
    params: query
  })
}


export function getGoodsSku(id) {
  return request({
    url: '/wei-api/goods/sku/'+id,
    method: 'get',
  })
}



// 接口拉取订单
export function pullGoodsList(data) {
  return request({
    url: '/wei-api/goods/pull_goods_list',
    method: 'post',
    data: data
  })
}

export function linkErpGoodsSkuId(data) {
  return request({
    url: '/wei-api/goods/sku/linkErp',
    method: 'post',
    data: data
  })
}
