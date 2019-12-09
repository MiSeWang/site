/**
 * “角色管理”相关接口
 */

import request from '@/utils/request';

export default {
  /** 查询角色 */
  queryRole(queryParam, pageParam) {
    return request({
      url: '/sys_role/query',
      method: 'get',
      params: queryParam
    })
  },
  /** 添加角色 */
  addRole(data) {
    return request({
      url: '/sys_role/save',
      method: 'post',
      data
    })
  },
  /** 更新角色 */
  updateRole(data) {
    return request({
      url: '/sys_role/update',
      method: 'post',
      data
    })
  },
  /** 删除角色 */
  deleteRole(data) {
    return request({
      url: '/sys_role/delete',
      method: 'post',
      data
    })
  },
  /** 根据角色id获取对应菜单那权限 */
  queryPermIdsByRoleId(queryParam) {
    return request({
      url: 'sys_role/queryPermIdsByRoleId',
      method: 'get',
      params: queryParam
    })
  }
}
