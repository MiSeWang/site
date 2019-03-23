import authApi from '@/api/auth'
import { getToken, setToken, removeToken } from '@/utils/token'
import avatorImg from '../../../static/img/icon/avator.gif'

const user = {
  //设置静态属性
  state: {
    user: '',
    status: '',
    code: '',
    token: getToken,
    loginName: '',
    name: '',
    avatar: avatorImg,
    introduction: '',
    visitor: false,
    roles: [],
    perms: [],
    setting: {
      articlePlatform: []
    }
  },

  //设置静态方法
  mutations: {
    //更改状态
    SET_STATUS:(state, status)=>{
      state.status = status
    },
    //更改token
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_INTRODUCTION: (state, introduction) => {
      state.introduction = introduction
    },
    SET_SETTING: (state, setting) => {
      state.setting = setting
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_LOGIN_NAME: (state, loginName) => {
      state.loginName = loginName
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_PERMS: (state, perms) => {
      state.perms = perms
    },
    SET_VISITOR: (state, visitor) => {
      state.visitor = visitor
    }
  },

  actions: {
    //用户名登录
    LoginByUsername({ commit }, userInfo) {
      const loginName = userInfo.loginName.trim();
      return new Promise((resolve, reject) => {
        authApi.login(loginName, userInfo.password).then(response => {
          const data = response.data
          commit('SET_TOKEN', data.token)
          setToken(data.token)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户详细信息
    GetUserInfo({ commit, state }) {
      return new Promise((resolve, reject) => {
        authApi.getUserInfo(state.token).then(response => {
          if (!response) reject('response is null');
          if (!response.data) reject('response.data is null');
          //如果不在这里加判断，会陷入无限循环
          if (!response.data.perms
            ||response.data.perms.length==0
            ||!response.data.perms
            ||response.data.perms.length==0){
            commit('SET_VISITOR', true)
          } else {
            commit('SET_VISITOR', false)
          }
          commit('SET_ROLES', response.data.roles)
          commit('SET_PERMS', response.data.perms)
          commit('SET_LOGIN_NAME', response.data.loginName);
          commit('SET_NAME', response.data.name);
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 登出
    Logout({ commit, state }) {
      return new Promise((resolve, reject) => {
        authApi.logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          removeToken()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端登出：当刷新页面后请求接口获取用户数据失败
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  }
}

export default user
