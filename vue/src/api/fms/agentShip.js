import request from '@/utils/request'

// 查询财务管理-应付款-代发账单列表
export function listAgentShip(query) {
  return request({
    url: '/fms/agentShip/list',
    method: 'get',
    params: query
  })
}

// 查询财务管理-应付款-代发账单详细
export function getAgentShip(id) {
  return request({
    url: '/fms/agentShip/' + id,
    method: 'get'
  })
}

// 新增财务管理-应付款-代发账单
export function addAgentShip(data) {
  return request({
    url: '/fms/agentShip',
    method: 'post',
    data: data
  })
}

// 修改财务管理-应付款-代发账单
export function updateAgentShip(data) {
  return request({
    url: '/fms/agentShip',
    method: 'put',
    data: data
  })
}

// 删除财务管理-应付款-代发账单
export function delAgentShip(id) {
  return request({
    url: '/fms/agentShip/' + id,
    method: 'delete'
  })
}
