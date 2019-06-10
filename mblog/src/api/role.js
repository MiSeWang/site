/**
 * “角色管理”相关接口
 */

import request from '@/utils/request';

export default {

  queryRole(queryParam, pageParam){
    return request({
      url: '/sys_role/query',
      method:'get',
      params: queryParam
    })
  },
  addRole(data){
    return request({
      url: '/sys_role/save',
      method: 'post',
      data
    })
  },
  updateRole(data){
    return request({
      url:'/sys_role/update',
      method: 'post',
      data
    })
  },
  deleteRole(data){
    return request({
      url: '/sys_role/delete',
      method:'post',
      data
    })
  },
  queryPermIdsByRoleId(queryParam){
    return request({
      url: 'sys_role/queryPermIdsByRoleId',
      method: 'get',
      params: queryParam
    })
  }
}
