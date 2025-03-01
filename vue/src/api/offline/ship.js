import request from '@/utils/request'

// 填写物流单号
export function logisticsUpdate(data) {
  return request({
    url: '/api/oms-api/offline_ship/order_logistics',
    method: 'post',
    data: data
  })
}

// 批量发货
export function batchOrderSend(data) {
  return request({
    url: '/api/oms-api/offline_ship/order_batch_send',
    method: 'post',
    data: data
  })
}
