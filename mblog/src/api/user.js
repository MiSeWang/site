/**
 * “用户管理”相关接口
 */
import request from '@/utils/request';

export default {

  queryUser(queryParam, pageParam){
    return request({
      url: '/sys_user/query',
      method:'post',
      data:{

      }
    })
  },

  addUser(data){
    return request({
      url: '/sys_user',
      method: 'post',
      data
    })
  }

}
