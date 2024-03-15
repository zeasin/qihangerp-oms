import request from '@/utils/request'

// 查询生成表数据
export function listAll(query) {
  return request({
    url: '/keyword/list',
    method: 'get',
    params: query
  })
}

export function saveData(data) {
  return request({
    url: '/keyword/save',
    method: 'post',
    data: data
  })
}

export function delData(id) {
  return request({
    url: '/keyword/del/' + id,
    method: 'delete'
  })
}

export function updateData(data) {
  return request({
    url: '/keyword/edit',
    method: 'put',
    data: data
  })
}
