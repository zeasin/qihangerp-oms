import request from '@/utils/request'

export function listTask(query) {
  return request({
    url: '/api/sys-api/system/task/list',
    method: 'get',
    params: query
  })
}

export function getTask(taskId) {
  return request({
    url: '/api/sys-api/system/task/' + taskId,
    method: 'get'
  })
}

export function getTaskLogs(taskId) {
  return request({
    url: '/api/sys-api/system/task/logs/' + taskId,
    method: 'get'
  })
}


// 修改
export function updateTask(data) {
  return request({
    url: '/api/sys-api/system/task',
    method: 'put',
    data: data
  })
}

