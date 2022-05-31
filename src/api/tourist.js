import request from '@/utils/request'

export default {
  /*
  * 分页查询游客
  * @current 当前页码
  * @limit 每页的记录数
  * */
  getPageTourist(current, limit) {
    return request({
      url: `/travel_system/tourist/findAll/${current}/${limit}`,
      method: 'get'
    })
  },

  // 根据id删除游客
  removeTourist(id) {
    return request({
      url: `/travel_system/tourist/${id}`,
      method: 'delete'
    })
  }
}
