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
    url: "/getIndexContent",
    method: 'get'
  })
}

// 旅馆页数据
export function getHotels() {
  return request({
    url: "/hotels",
    method: 'get'
  })
}

// 景点页数据
export function getScenicSpots() {
  return request({
    url: "/scenic-spots",
    method: 'get'
  })
}

// 美食页数据
export function getDelicacies() {
  return request({
    url: "/delicacies",
    method: 'get'
  })
}

// 获取旅馆详情
export function getHotelDetail(id) {
  return request({
    url: `/hotel/${id}`,
    method: 'get'
  })
}

// 获取景点详情
export function getScenicSpotDetail(id) {
  return request({
    url: `/scenic-spot/${id}`,
    method: 'get'
  })
}

// 获取美食详情
export function getDelicacyDetail(id) {
  return request({
    url: `/delicacy/${id}`,
    method: 'get'
  })
}

// 获取评论
export function getComment(markId, cur, limit) {
  return request({
    url: `comment/${markId}/${cur}/${limit}`,
    method: 'get'
  })
}


// 获取所有线路及站点相关信息
export function getRouteInfo() {
  return request({
    url: '/getRouteInfo',
    method: 'get'
  })
}

// 分页查询公告信息
export function getNotice(cur, limit) {
  return request({
    url: `notice/${cur}/${limit}`,
    method: 'get'
  })
}
