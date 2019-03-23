import { asyncRouterMap, constantRouterMap, testRouterMap } from '@/router'

/**
 * 通过meta.perm判断是否与当前用户权限匹配
 * @param perms 登录用户的权限
 * @param route 路由对象
 */
function hasPermission(perms, route) {
  //如果没有声明meta或者meta.perm，都视为可以公共访问的路由
  if (!route.meta || !route.meta.perm) {
    return true;
  }
  return perms.some(p=>p.val==route.meta.perm)
}

/**
 * 递归过滤异步路由表，返回符合用户角色权限的路由表
 * @param asyncRouterMap
 * @param roles
 */
function filterAsyncRouter(asyncRouterMap, perms) {
  const accessedRouters = asyncRouterMap.filter(route => {
    if (hasPermission(perms, route)) {
      if (route.children && route.children.length) {
        route.children = filterAsyncRouter(route.children, perms)
      }
      return true
    }
    return false
  })
  return accessedRouters
}

const permission = {
  state: {
    //测试版
    // routers: [{
    //   path: '/system',
    //   component: '../views/layout/Layout',
    //   meta: { perm:'m:sys', title: '系统', icon: 'chart' },
    //   children: [
    //     {
    //       path: 'user_manage',
    //       name: 'user_manage',
    //       component: '../views/system/user/index',
    //       meta: { perm: 'm:sys:user', title: '用户管理', icon: 'chart', noCache: true }
    //     },
    //     {
    //       path: 'role_manage',
    //       name: 'role_manage',
    //       component: '../views/system/user/index',
    //       meta: { perm: 'm:sys:role', title: '角色管理', icon: 'chart', noCache: true },
    //     },
    //     {
    //       hidden: true,
    //       path: 'role_manage/:roleId/assign_perm',
    //       name: 'role_manage_assign_perm',
    //       component: '../views/system/user/index',
    //       meta: { hiddenTag: true , title: '角色授权'},
    //     },
    //     {
    //       path: 'perm_manage',
    //       name: 'perm_manage',
    //       component: '../views/system/user/index',
    //       meta: { perm: 'm:sys:perm', title: '权限管理', icon: 'chart', noCache: true }
    //
    //     },
    //   ]
    // }],
    //routers: constantRouterMap
    routers: constantRouterMap,
    addRouters: []
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = routers
      //将routers连接起来
      state.routers = constantRouterMap.concat(routers)
    }
  },
  actions: {
    //这里根据permission中获取到的用户权限json，生成可访问路由
    //[{name:'菜单1',val:'menu:1'}]
    GenerateRoutes({ commit }, data) {
      return new Promise(resolve => {

        let accessedRouters
        let perms = data.perms

        if(perms.some(p=>p.val=="*")) {
          //如果权限级别：*，赋予全部权限
          accessedRouters = asyncRouterMap
        } else {
          //过滤权限
          accessedRouters = filterAsyncRouter(asyncRouterMap, perms)
        }
        //修改ROUTERS
        commit('SET_ROUTERS', accessedRouters)
        resolve()
      })
    }
  }
}

export default permission
