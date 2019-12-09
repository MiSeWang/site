/**
 * 登陆相关接口
 */
import request from '@/utils/request';

export default {
  /** 登陆用户 */
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
  /** 退出登陆 */
  logout(){
    return request({
      url: '/auth/logout',
      method: 'get'
    })
  },
  /** 获取用户详细信息 */
  getUserInfo(token){
    return request({
      url: '/auth/info',
      method: 'get',
      // params: {token}
    })
  }
}

