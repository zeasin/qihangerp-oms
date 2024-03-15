import request from '@/utils/request'

// 查询出库单列表
export function listStockOutEntry(query) {
  return request({
    url: '/wms/stockOutEntry/list',
    method: 'get',
    params: query
  })
}

// 查询出库单详细
export function getStockOutEntry(id) {
  return request({
    url: '/wms/stockOutEntry/' + id,
    method: 'get'
  })
}

// 出库
export function stockOut(data) {
  return request({
    url: '/wms/stockOutEntry/stockOut',
    method: 'post',
    data: data
  })
}

