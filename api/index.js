import request from "./request"

// 登录
export function login(data) {
  return request({
    url: "/login",
    method: "post",
    data
  })
}


// 注册
export function register(data) {
  return request({
    url: "/register",
    method: "post",
    data
  })
}

// 获取首屏数据
export function getIndexContent() {
  return request({
    url: "getIndexContent",
    method: 'get'
  })
}
