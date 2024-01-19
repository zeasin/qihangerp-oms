import request from '@/utils/request'

// 查询供应商代发货列表
export function listAgentShipping(query) {
  return request({
    url: '/scm/agentShipping/list',
    method: 'get',
    params: query
  })
}

// 查询供应商代发货详细
export function getAgentShipping(id) {
  return request({
    url: '/scm/agentShipping/' + id,
    method: 'get'
  })
}

// 新增供应商代发货
export function addAgentShipping(data) {
  return request({
    url: '/scm/agentShipping',
    method: 'post',
    data: data
  })
}

// 修改供应商代发货
export function updateAgentShipping(data) {
  return request({
    url: '/scm/agentShipping',
    method: 'put',
    data: data
  })
}

// 删除供应商代发货
export function delAgentShipping(id) {
  return request({
    url: '/scm/agentShipping/' + id,
    method: 'delete'
  })
}
