import request from '@/utils/request'

// 查询淘宝订单列表
export function listLogisticsCompanies(query) {
  return request({
    url: '/api/tao-api/goods/skuList',
    method: 'get',
    params: query
  })
}

// 接口拉取淘宝
export function pullLogisticsTao(data) {
  return request({
    url: '/api/tao-api/shopApi/pull_logistics_companies',
    method: 'post',
    data: data
  })
}
export function pullLogisticsJd(data) {
  return request({
    url: '/api/jd-api/shopApi/pull_logistics_companies',
    method: 'post',
    data: data
  })
}

