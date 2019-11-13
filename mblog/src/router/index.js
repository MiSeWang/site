import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

//这里根据系统环境不同采用不同的载入方式，如果是开发环境，则不需要用懒加载。延迟加载太多页面会导致Webpack热更新太慢。所以只在生产中使用惰。
const _import = require('./_import_' + process.env.NODE_ENV)

import Layout from '../views/layout/Layout'

//配置路由数组
export const constantRouterMap = [
  { path: '/login', component:_import('login/index'), hidden: true},
  { path: '/index', name: 'HelloWorld', component: _import('HelloWorld')},
  { path: '/test', name: 'test', component:_import('Test'), alias: '/t'},
  {
    path: '',
    component: Layout,
    redirect: 'dashboard',
    children: [{
      path: 'dashboard',
      component: _import('dashboard/index'),
      name: 'dashboard',
      meta: {title: '首页', icon: 'dashboard', noCache: true}
    }]
  }
]
/** 所有的异步请求路由 */
export const asyncRouterMap = [
  {
    path: '/system',
    component: Layout,
    meta: { perm:'m:sys', title: '系统', icon: 'chart' },
    children: [
      {
        path: 'user_manage',
        name: 'user_manage',
        component: _import('system/user/index'),
        meta: { perm: 'm:sys:user', title: '用户管理', icon: 'chart', noCache: true }
      },
      {
        path: 'role_manage',
        name: 'role_manage',
        component: _import('system/role/index'),
        meta: { perm: 'm:sys:role', title: '角色管理', icon: 'chart', noCache: true },
      },
      {
        hidden: true,
        path: 'role_manage/:roleId/assign_perm',
        name: 'role_manage_assign_perm',
        component: _import('system/user/index'),
        meta: { hiddenTag: true , title: '角色授权'},
      },
      {
        path: 'perm_manage',
        name: 'perm_manage',
        component: _import('system/perm/index'),
        meta: { perm: 'm:sys:perm', title: '权限管理', icon: 'chart', noCache: true }

      },
    ]
  },

  { path: '*', redirect: '/404', hidden: true }
]

//正确出口
export default new Router({
  routes: constantRouterMap
})
