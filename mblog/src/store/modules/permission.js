import { asyncRouterMap, constantRouterMap } from '@/router'

const permission = {
  state: {
    routers: constantRouterMap, //常量路由
    addRouters: []              //添加的路由
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = routers;
      //将routers连接起来
      state.routers = constantRouterMap.concat(routers)
    }
  },
  actions: {
    //这里根据permission中获取到的用户权限json，生成可访问路由
    //[{name:'菜单1',val:'menu:1'}]
    GenerateRoutes({ commit }, data) {
      return new Promise(resolve => {
        let accessedRouters;
        //获取权限
        let perms = data.perms;
        //some() 方法用于检测数组中的元素是否满足指定条件, 如果有一个满足，则返回true
        if(perms.some(p => p.val == "*")) {
          //如果权限级别：*，赋予全部权限，所有异步请求路由畅通无阻
          accessedRouters = asyncRouterMap;
        } else {
          //根据权限过滤路由
          accessedRouters = filterAsyncRouter(asyncRouterMap, perms)
        }
        //修改ROUTERS 可见路由
        commit('SET_ROUTERS', accessedRouters)
        resolve()
      })
    }
  }
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
  return perms.some(p=>p.val == route.meta.perm)
}

export default permission
