
export const state = () => ({
  // 这里是全局数据保存的地方
  token:'',
  userInfo: {},
})

export const mutations = {
  setUserInfo(state, data) {
    state.userInfo = data.info
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
    const token = $cookies.get('travel-system-front-token') || ''
    store.commit('', token)
  }
}

