// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'

// 重置css
import 'normalize.css/normalize.css';
// 导入ElementUI组件
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// 添加全局样式，也就是style里的scss文件
import '@/styles/index.scss';
// 导入路由
import router from './router';
// 导入vuex
import store from './store';
// 导入icon
import '@/icons';
// 导入error log
// import '@/errorLog';
// 导入permission control
import './permission'


Vue.config.productionTip = false

Vue.use(ElementUI, {
  size: 'medium', // set element-ui default size
});


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
  // render: h => h(App)
})
