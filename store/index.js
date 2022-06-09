

export const state = () => ({
  token:'',
  userInfo: {}
})

export const mutations = {
  setUserInfo(state, data) {
    state.userInfo = {...data.info}
    state.token = data.token
  },
  logout(state){
    state.userInfo = {}
    state.token = ''
  }
}
export const actions = {
  nuxtServerInit(store, { app: { $cookies } }) {
    // ...
    // 初始化相关数据存到 store 中
    const userInfo = $cookies.get('travel_gaochun_store') || ''
    store.commit('setUserInfo', userInfo)
  }
}
