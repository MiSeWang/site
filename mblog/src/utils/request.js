import axios from "axios";
import {Message, MessageBox} from 'element-ui';
import store from '@/store';
import {getToken} from "@/utils/token";
import Status from "@/utils/status";

//创建一个请求
const request = axios.create(
  {
    baseURL: process.env.BASE_API, // api的base_url
    // timeout: 5000, // request timeout
    withCredentials: true //使前台能够保存cookie
  }
);
// request 拦截器
request.interceptors.request.use(config => {
  //在请求前做一些处理
  if (store.getters.token) {
    //让每个请求携带token-- ['X-Token']为自定义key 请根据实际情况自行修改
    config.headers['mblog-Token'] = getToken()
  }
  return config;
}, error => {
  //处理错误的请求
  console.log(error);
  return Promise.reject(error);
});

// respone 拦截器
request.interceptors.response.use(res => {
    /**
     * 下面的注释为通过response自定义code来标示请求状态，当code返回如下情况为权限有问题，登出并返回到登录页
     * 如通过xmlhttprequest 状态码标识 逻辑可写在下面error中
     */
    if (res.data.succ) {
      //如果后台返回的json为1显示成功，pass
      return res;
    } else {
      // 否则判断错误码 UNAUTHEN 4401:未登录  SESSION_TIMOUT 4433:session超时退出了登录
      if (res.data.code == Status.UNAUTHEN || res.data.code == Status.SESSION_TIMOUT) {
        //处理登录相关的错误,创建一个错误弹窗
        MessageBox.confirm('你已被登出，可以取消继续留在该页面，或者重新登录', '确定登出',
          {confirmButtonText: '重新登录', cancelButtonText: '取消', type: 'warning'}).then(() => {
          store.dispatch('FedLogOut').then(() => {
            location.reload();// 为了重新实例化vue-router对象 避免bug
          });
        })
      } else {
        //其它错误弹出错误信息
        console.log("错误信息")
        Message({message: res.data.msg, type: 'error', duration: 5000});
      }
      return Promise.reject('error');
    }
    /**
     * 请求发生错误，一般都是服务器抛异常了
     */
      err => {
      console.error('请求错误，request err: %o', err)// for debug
      Message({message: error.message, type: 'error', duration: 5000})
      return Promise.reject(error)
    }
  }
)

export default request;

