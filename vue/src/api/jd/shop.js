import request from '@/utils/request'

// 获取京东授权url
export function getJdOAuthUrl(query) {
  return request({
    url: '/jd-api/getOauthUrl',
    method: 'get',
    params: query
  })
}

// 获取京东token
export function getJdToken(data) {
  return request({
    url: '/jd-api/tokenCreate',
    method: 'post',
    data: data
  })
}

