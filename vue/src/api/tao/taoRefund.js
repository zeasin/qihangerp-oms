import request from '@/utils/request'

// 查询淘宝退款订单列表
export function listTaoRefund(query) {
  return request({
    url: '/api/open-api/tao/refund/list',
    method: 'get',
    params: query
  })
}
export function pullRefund(data) {
  return request({
    url: '/api/open-api/tao/refund/pull_refund',
    method: 'post',
    data: data
  })
}


export function pullRefundDetail(data) {
  return request({
    url: '/api/open-api/tao/refund/pull_refund_detail',
    method: 'post',
    data: data
  })
}

export function pushOms(data) {
  return request({
    url: '/api/open-api/tao/refund/push_oms',
    method: 'post',
    data: data
  })
}
