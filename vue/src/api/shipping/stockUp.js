import request from '@/utils/request'

// 查询打包发货列表
export function listShipStockUp(query) {
  return request({
    url: '/oms-api/ship/stock_up_list',
    method: 'get',
    params: query
  })
}
