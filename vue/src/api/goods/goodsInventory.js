import request from '@/utils/request'

// 查询商品库存列表
export function listGoodsInventory(query) {
  return request({
    url: '/api/goodsInventory/list',
    method: 'get',
    params: query
  })
}

// 查询商品库存详细
export function getGoodsInventory(id) {
  return request({
    url: '/api/goodsInventory/' + id,
    method: 'get'
  })
}

// 新增商品库存
export function addGoodsInventory(data) {
  return request({
    url: '/api/goodsInventory',
    method: 'post',
    data: data
  })
}

// 修改商品库存
export function updateGoodsInventory(data) {
  return request({
    url: '/api/goodsInventory',
    method: 'put',
    data: data
  })
}

// 删除商品库存
export function delGoodsInventory(id) {
  return request({
    url: '/api/goodsInventory/' + id,
    method: 'delete'
  })
}
