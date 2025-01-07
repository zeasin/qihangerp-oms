import request from '@/utils/request'

// 查询淘宝退款订单列表
export function listRefund(query) {
  return request({
    url: '/api/open-api/jd/after/list',
    method: 'get',
    params: query
  })
}

// 查询退款订单详细
export function getRefund(id) {
  return request({
    url: '/api/open-api/jd/after/' + id,
    method: 'get'
  })
}

export function pullRefund(data) {
  return request({
    url: '/api/open-api/jd/after/pull_after_list',
    method: 'post',
    data: data
  })
}

export function pushOms(data) {
  return request({
    url: '/api/open-api/jd/after/push_oms',
    method: 'post',
    data: data
  })
}
