export default function({ app: { $axios } }) {

  $axios.defaults.baseURL = 'http://localhost:8091/travel_system/front'
  $axios.defaults.timeout = 30000

  $axios.interceptors.request.use(config => {
    return config
  })
  $axios.interceptors.response.use(response => {
    if (response.code === 20001) {
      return Promise.reject(response.statusText)
    }
    return response.data
  })
}
