import Vue from 'vue'
import App from './App'
import router from './router'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
Vue.use(ElementUI, {
  size: 'medium', // set element-ui default size
})

// 导入vuex
import store from './store'
// 导入icon
import '@/icons'
import { get, post } from '@/utils/request.js'
//引入moment
import moment from 'moment'
// highlight.js代码高亮插件
import Highlight from './utils/highlight'; // from 路径是highlight.js的路径，纯属自定义

Vue.config.productionTip = false


Vue.prototype.$httpPost = post;
Vue.prototype.$httpGet = get;
Vue.prototype.$moment = moment

Vue.use(Highlight);


new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
