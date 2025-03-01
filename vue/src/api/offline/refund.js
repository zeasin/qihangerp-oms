import request from '@/utils/request'

// 查询列表
export function list(query) {
  return request({
    url: '/api/oms-api/offline_refund/list',
    method: 'get',
    params: query
  })
}



