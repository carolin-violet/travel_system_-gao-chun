import axios from "axios";

const service = axios.create({
  baseURL: 'http://localhost:8091/travel_system/front',

  timeout: 30000
})

service.interceptors.response.use (
  response => {
    const res = response.data
    return res
  },
  error => {
    console.log("error:",error)
    return Promise.reject(error)
  }
)

export default service
