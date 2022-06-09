export default function({ $axios, store }) {

  $axios.defaults.baseURL = 'http://localhost:8091/travel_system/front'
  $axios.defaults.timeout = 30000

  $axios.interceptors.request.use(config => {
    if (store.state.token) {
      config.headers['token'] = store.state.token
    }
    return config
  })
  $axios.interceptors.response.use(response => {
    if (response.code === 20001) {
      return Promise.reject(response.statusText)
    }
    return response.data
  })
}
