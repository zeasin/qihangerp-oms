import request from '@/utils/request'

// 列表
export function getDeliverList(data) {
  return request({
    url: '/api/wei-api/ewaybill/get_deliver_list',
    method: 'post',
    data: data
  })
}
