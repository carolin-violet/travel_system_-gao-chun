import request from '@/utils/request'

export default {
  // 根据时间进行分页条件查询
  getOrder(cur, limit, data) {
    return request({
      url: `/travel_system/order/pageOrder/${cur}/${limit}`,
      method: 'post',
      data
    })
  },

  // 修改订单信息
  updateOrder(data) {
    return request({
      url: '/travel_system/order/updateOrder',
      method: 'post',
      data
    })
  },

  // 根据id删除订单信息
  removeOrder(id) {
    return request({
      url: `/travel_system/order/${id}`,
      method: 'delete'
    })
  }
}
