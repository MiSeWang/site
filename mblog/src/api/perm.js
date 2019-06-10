/**
 * “权限管理”相关接口
 */
import request from '@/utils/request'

export default {

  queryPerm(queryParam){
    return request({
      url: '/sys_perm',
      method:'get',
      params: queryParam
    })
  },
}
