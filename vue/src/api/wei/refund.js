import request from '@/utils/request'

// 查询店铺订单列表
export function listShopRefund(query) {
  return request({
    url: '/wei-api/refund/list',
    method: 'get',
    params: query
  })
}

// 接口拉取订单
export function pullRefund(data) {
  return request({
    url: '/wei-api/refund/pull_list',
    method: 'post',
    data: data
  })
}

// 拉取订单详情
export function pullOrderDetail(data) {
  return request({
    url: '/wei-api/refund/pull_detail',
    method: 'post',
    data: data
  })
}


