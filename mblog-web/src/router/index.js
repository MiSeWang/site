import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

//这里根据系统环境不同采用不同的载入方式，如果是开发环境，则不需要用懒加载。延迟加载太多页面会导致Webpack热更新太慢。所以只在生产中使用惰。
const _import = require('./_import_' + process.env.NODE_ENV)

export default new Router({
  // routes: [
  //   {
  //     path: '/',
  //     name: 'HelloWorld',
  //     component: HelloWorld
  //   }
  // ]
  routes: [
    {
      path: '/',
      name: '首页',
      component: _import('index'),
      redirect: 'articleList',      //设置默认首页
      children: [
        {
          path: 'articleList',
          name: 'articleList',
          component: _import('article/articleList'),
          // meta: 携带信息
        },
        {
          path: 'articleDetail',
          name: 'articleDetail',
          component: _import('article/articleDetail'),
        },
      ]
    },
  ]
})
