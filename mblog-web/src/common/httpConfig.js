import { request, get, post } from '@/utils/request.js';


export default {
  httpPost(url, param){
    return get(url, params);
  },

  httpGet(url, param){
    return post(url, params);
  }
}
