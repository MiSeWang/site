import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'

Vue.use(Router)

//这里根据系统环境不同采用不同的载入方式，如果是开发环境，则不需要用懒加载。延迟加载太多页面会导致Webpack热更新太慢。所以只在生产中使用惰。
const _import = require('./_import_' + process.env.NODE_ENV)

import Layout from '../views/layout/Layout'

//配置路由数组
export const constantRouterMap = [
  { path:'/login', component:_import('login/index'), hidden: true},
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
        component: _import('system/user/index'),
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
        component: _import('system/user/index'),
        meta: { perm: 'm:sys:perm', title: '权限管理', icon: 'chart', noCache: true }

      },
    ]
  },
  // {
  //   path: '/menu1',
  //   component: Layout,
  //   children: [{
  //     path: 'index',
  //     name: 'menu1',
  //     component: _import('menu/menu1'),
  //     meta: { perm:'m:menu1', title: '菜单1', icon: 'icon' }
  //   }]
  // },
  //
  //
  // {
  //   path: '/menu2',
  //   component: Layout,
  //   children: [{
  //     path: 'index',
  //     name: 'menu2',
  //     component: _import('menu/menu2'),
  //     meta: { perm:'m:menu2', title: '菜单2', icon: 'icon' }
  //   }]
  // },
  //
  // {
  //   path: '/menu3',
  //   component: Layout,
  //   meta: {
  //     perm:'m:menu3',
  //     title: '菜单3',
  //     icon: 'chart'
  //   },
  //   children: [
  //     { path: 'menu3_1', component: _import('menu/menu3_1'), name: 'menu3_1', meta: { perm:'m:menu3:1', title: '菜单3-1', icon: 'chart', noCache: true }},
  //     { path: 'menu3_2', component: _import('menu/menu3_2'), name: 'menu3_2', meta: { perm:'m:menu3:2', title: '菜单3-2', icon: 'chart', noCache: true }},
  //     { path: 'menu3_3', component: _import('menu/menu3_3'), name: 'menu3_3', meta: { perm:'m:menu3:3', title: '菜单3-3', icon: 'chart', noCache: true }}
  //   ]
  // },
  //
  //
  // {
  //   path: '/menu4',
  //   name: 'menu4',
  //   component: Layout,
  //   redirect: '/menu4/menu4_1/a',
  //   meta: {
  //     perm:'m:menu4',
  //     title: '菜单4',
  //     icon: 'example'
  //   },
  //   children: [
  //     {
  //       path: '/menu4/menu4_1',
  //       name: 'menu4_1',
  //       component: _import('menu/menu4_1/index'),
  //       redirect: '/menu4/menu4_1/a',
  //       meta: {
  //         perm:'m:menu4:1',
  //         title: '菜单4-1',
  //         icon: 'table'
  //       },
  //       children: [
  //         { path: 'a', name: 'menu4_1_a', component: _import('menu/menu4_1/a'), meta: { perm:'m:menu4:1:a', title: '菜单4-1-a' }},
  //         { path: 'b', name: 'menu4_1_b', component: _import('menu/menu4_1/b'), meta: { perm:'m:menu4:1:b', title: '菜单4-1-b' }},
  //         { path: 'c', name: 'menu4_1_c', component: _import('menu/menu4_1/c'), meta: { perm:'m:menu4:1:c', title: '菜单4-1-c' }}
  //       ]
  //     },
  //     { path: 'menu4/menu4_2', name: 'menu4_2', icon: 'tab', component: _import('menu/menu4_2/index'), meta: {perm:'m:menu4:2', title: '菜单4-2' }}
  //   ]
  // },

  { path: '*', redirect: '/404', hidden: true }
]

//正确出口
export default new Router({
  routes: constantRouterMap
})
