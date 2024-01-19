import request from '@/utils/request'

// 查询出库明细详情列表
export function listStockOutEntryItemDetail(query) {
  return request({
    url: '/wms/stockOutEntryItemDetail/list',
    method: 'get',
    params: query
  })
}

// 查询出库明细详情详细
export function getStockOutEntryItemDetail(id) {
  return request({
    url: '/wms/stockOutEntryItemDetail/' + id,
    method: 'get'
  })
}

// 新增出库明细详情
export function addStockOutEntryItemDetail(data) {
  return request({
    url: '/wms/stockOutEntryItemDetail',
    method: 'post',
    data: data
  })
}

// 修改出库明细详情
export function updateStockOutEntryItemDetail(data) {
  return request({
    url: '/wms/stockOutEntryItemDetail',
    method: 'put',
    data: data
  })
}

// 删除出库明细详情
export function delStockOutEntryItemDetail(id) {
  return request({
    url: '/wms/stockOutEntryItemDetail/' + id,
    method: 'delete'
  })
}
