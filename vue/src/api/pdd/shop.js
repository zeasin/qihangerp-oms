import request from '@/utils/request'


export function getPddOAuthUrl(query) {
  return request({
    url: '/pdd-api/getOauthUrl',
    method: 'get',
    params: query
  })
}
export function getPddToken(data) {
  return request({
    url: '/pdd-api/getToken',
    method: 'post',
    data: data
  })
}
