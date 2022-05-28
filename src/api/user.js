import request from '@/utils/request'

export function login(data) {
  return request({
    url: '/travel_system/login',
    method: 'post',
    data
  })
}

export function getInfo(token) {
  return request({
    url: '/travel_system/manager/getInfo',
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: '/travel_system/logout',
    method: 'post'
  })
}

export function getCode(phone) {
  return request({
    url: `/travel_system/msm/send/${phone}`,
    method: 'get'
  })
}
