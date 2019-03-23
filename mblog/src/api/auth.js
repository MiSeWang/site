/**
 * 登陆相关接口
 */
import request from '@/utils/request';

export default {
  login(loginName, password){
    const data = {
      loginName: loginName,
      password: password
    }
    return request({
      url: '/auth/login',
      method: 'post',
      data
    })
  },
  logout(){
    return request({
      url: '/auth/logout',
      method: 'get'
    })
  },
  getUserInfo(token){
    return request({
      url: '/auth/info',
      method: 'get',
      // params: {token}
    })
  }
}

