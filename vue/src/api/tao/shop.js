import request from '@/utils/request'

export function getTaoOAuthUrl(query) {
  return request({
    url: '/tao-api/getOauthUrl',
    method: 'get',
    params: query
  })
}

// 获取token
export function getTaoToken(data) {
  return request({
    url: '/tao-api/tokenCreate',
    method: 'post',
    data: data
  })
}
