import request from '@/utils/request'

// 查询库存存货报列表
export function listInventoryReport(query) {
  return request({
    url: '/fms/inventoryReport/list',
    method: 'get',
    params: query
  })
}

// 查询库存存货报详细
export function getInventoryReport(id) {
  return request({
    url: '/fms/inventoryReport/' + id,
    method: 'get'
  })
}

// 新增库存存货报
export function addInventoryReport(data) {
  return request({
    url: '/fms/inventoryReport',
    method: 'post',
    data: data
  })
}

// 修改库存存货报
export function updateInventoryReport(data) {
  return request({
    url: '/fms/inventoryReport',
    method: 'put',
    data: data
  })
}

// 删除库存存货报
export function delInventoryReport(id) {
  return request({
    url: '/fms/inventoryReport/' + id,
    method: 'delete'
  })
}
