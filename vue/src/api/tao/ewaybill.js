import request from '@/utils/request'
// 获取电子面单账户list
export function getWaybillAccountList(data) {
  return request({
    url: '/api/tao-api/ewaybill/get_waybill_account_list',
    method: 'post',
    data: data
  })
}


// 更新电子面单账户
export function pullWaybillAccount(data) {
  return request({
    url: '/api/tao-api/ewaybill/pull_waybill_account',
    method: 'post',
    data: data
  })
}

// 取号
export function getWaybillCode(data) {
  return request({
    url: '/api/tao-api/ewaybill/get_waybill_code',
    method: 'post',
    data: data
  })
}

// 获取打印的数据
export function getWaybillPrintData(data) {
  return request({
    url: '/api/tao-api/ewaybill/get_print_data',
    method: 'post',
    data: data
  })
}

// 打印成功
export function pushWaybillPrintSuccess(data) {
  return request({
    url: '/api/tao-api/ewaybill/push_print_success',
    method: 'post',
    data: data
  })
}


export function pushShipSend(data) {
  return request({
    url: '/api/tao-api/ewaybill/push_ship_send',
    method: 'post',
    data: data
  })
}
