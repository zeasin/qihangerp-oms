import request from '@/utils/request'

// 查询退款列表
export function listRefund(query) {
  return request({
    url: '/api/pdd-api/refund/list',
    method: 'get',
    params: query
  })
}


export function pullRefund(data) {
  return request({
    url: '/api/pdd-api/refund/pull_list',
    method: 'post',
    data: data
  })
}

export function pushOms(data) {
  return request({
    url: '/api/pdd-api/refund/push_oms',
    method: 'post',
    data: data
  })
}
