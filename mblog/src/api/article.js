/**
 * “文章”相关接口
 */
import request from '@/utils/request';

export default {


  queryArticleById(queryParam){
    return request({
      url: 'cmsArticle/queryArticleById',
      method:'get',
      params: queryParam
    })
  },
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
      url: 'cmsArticle/saveArticle',
      method: 'post',
      data: data
    })
  },
  delArticle(data){
    return request({
      url: 'cmsArticle/delArticle',
      method: 'post',
      data: data
    })
  },
}
