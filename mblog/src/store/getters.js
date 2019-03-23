/**
 * 使用vuex中的getter
 * 在改变 state 中的数据的时候，会触发 getter 里面的方法
 * @type {{sidebar: (function(*): (getters.sidebar|(function(*))|app.state.sidebar|{opened, withoutAnimation}|default.computed.sidebar)), device: (function(*): (getters.device|(function(*))|default.computed.device|string)), token: (function(*): (getters.token|(function(*))|string|CancelToken)), avatar: (function(*): (getters.avatar|(function(*))|string)), name: (function(*): *), roles: (function(*): (getters.roles|(function(*))|Array)), visitedViews: (function(*): (getters.visitedViews|(function(*))|default.computed.visitedViews|Array|*))}}
 */
const getters = {
  sidebar: (state) => state.app.sidebar,
  device: (state)  => state.app.device,
  token: (state) => state.user.token,
  avatar: (state)  => state.user.avatar,
  name: (state)  => state.user.name,
  roles: (state)  => state.user.roles,
  perms: (state) => state.user.perms,
  visitedViews: (state)  => state.tagsView.visitedViews,
  permission_routers: (state) => state.permission.routers,
  addRouters: (state) => state.permission.addRouters,
  errorLogs: (state) => state.errorLog.logs,
  visitor: (state) => state.user.visitor,
}
export default getters
