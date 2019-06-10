import router from './router'
import store from './store'
import {Message} from 'element-ui'

//导入nprogress是页面跳转是出现在浏览器顶部的进度条组件，同时导入样式。
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css'// progress bar style
//将token中的获取cookie内的token方法引入，用于校验
import {getToken} from '@/utils/token' // getToken from cookie

// NProgress.configure({ showSpinner: false })// NProgress Configuration

/**
 * 匹配权限
 * @param userPerms 用户拥有的权限集合，后台返回来，存在vuex，数据类型是数组
 * @param routerPerm 定义的src/router/index.js的路由表asyncRouterMap中
 * @returns {*}
 */
function hasPermission(userPerms, routerPerm) {
  //特殊值，*代表所有资源权限
  if (userPerms.some(p => p.val == "*")) return true;
  //如果菜单路由上没有声明perm属性，默认显示该菜单，代表所有人可以访问
  if (!routerPerm) return true;
  //判断用户的资源权限集合中是否包含该菜单路由声明的资源权限
  return userPerms.some(p => p.val == routerPerm)
}

//登陆页面
const loginRoute = "/login"
//白名单
const whiteList = new Set([loginRoute, '/authredirect'])// no redirect whitelist

/**
 *  router.beforeEach() 生命周期函数，加载之前执行这个方法。
 */
router.beforeEach((to, from, next) => {
  NProgress.start()
  //取到本地的token
  let token = getToken();
  let hasToken = token != 'undefined' && token != undefined && token != null && token != '';
  if (hasToken) {
    // 1.有token
    if (to.path == loginRoute) {
      // 1.1 如果是去登录页，有token视为已登录，直接跳到首页
      next({path: '/'})
      //如果当前页是首页，则afterEach钩子不会触发，需要手动处理进度条
      NProgress.done() // if current page is dashboard will not trigger	afterEach hook, so manually handle it
    } else {
      // 1.2 如果不是去登录页，首先去获取用户详细信息，判断是否有访问权限
      if (store.getters.visitor) {
        // 1.2.1 若该标记为true,是因为GetUserInfo返回结果发现用户信息中roles或perms为空数组，即未配置任何角色或权限，
        // 所以视为游客visitor给放行，放行后游客只能看到公共可以访问的菜单(即src/router/index.js中没有配置perm属性的路由)。
        next()
      } else if (!store.getters.perms || store.getters.perms.length === 0) {
        // 1.2.2 检查发现不是游客且未加载用户权限信息，应该调用接口加载用户权限信息
        // 用户刷新页面会导致vuex状态清空，或者用户首次登录，vuex中还没有权限信息。都要调用后台接口获得用户信息
        store.dispatch('GetUserInfo').then(res => {
          // 注意:角色必须是数组! such as: [{name:'菜单1',val:'menu:1'}]
          const perms = res.data.perms
          // 根据roles权限生成可访问的路由表
          store.dispatch('GenerateRoutes', {perms}).then(() => {
            // 动态添加可访问路由表
            router.addRoutes(store.getters.addRouters);
            // hack方法 确保addRoutes已完成 ,s设置replace: true，这样导航将不会留下历史记录
            next({...to, replace: true});
          })
        }).catch((err) => {
          store.dispatch('FedLogOut').then(() => {
            console.log(err);
            Message.error(err || '获取用户信息失败，请重试')
            next({path: '/'})
          })
        })
      } else {
        // 1.2.3 如果vuex中有权限信息，匹配权限信息，匹配ok则放行
        if (hasPermission(store.getters.perms, to.meta.perm)) {
          next()
        } else {
          //跳转到401
          next({path: '/401', replace: true, query: {noGoBack: true}})
        }
      }
    }
  } else {
    // 2.没有token
    // 如果要访问的路由在白名单中，直接进入；否则，重定向到登录页面
    whiteList.has(to.path) ? next() : next(loginRoute);
    NProgress.done();
  }
})
//这是个生命周期函数。
router.afterEach(() => {
  NProgress.done(); // finish progress bar
})
