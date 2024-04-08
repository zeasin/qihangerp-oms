import request from '@/utils/request'

// 查询列表
export function list(query) {
  return request({
    url: '/api/oms-api/afterSale/list',
    method: 'get',
    params: query
  })
}

// 新增补发
export function addShipAgain(data) {
  return request({
    url: '/afterSale/shipAgain',
    method: 'post',
    data: data
  })
}

// 完成
export function shipAgainComplete(id) {
  return request({
    url: '/afterSale/shipAgain/complete/'+id,
    method: 'put'
  })
}


