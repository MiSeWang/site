/**
 * “用户管理”相关接口
 */
import request from '@/utils/request';

export default {

  queryUser(queryParam, pageParam) {
    return request({
      url: 'sysUser/queryUsers',
      method: 'get',
      data: {}
    })
  },

  saveUser(data) {
    return request({
      url: 'sysUser/saveUser',
      method: 'post',
      data
    })
  },

  deleteUser(data) {
    return request({
      url: 'sysUser/delUser',
      method: 'post',
      data
    })
  },

  queryRoleIdsByUserId(queryParam) {
    return request({
      url: 'sysUser/queryRoleIdsByUserId',
      method: 'get',
      params: queryParam
    })
  }

}
