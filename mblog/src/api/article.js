/**
 * “文章”相关接口
 */
import request from '@/utils/request';

export default {

  queryArticle(queryParam, pageParam){
    return request({
      url: 'cmsArticle/queryArticles',
      method:'get',
      data:{
      }
    })
  },
  saveArticle(data){
    return request({
      url: 'sysUser/saveUser',
      method: 'post',
      data
    })
  },
}
