import authApi from '@/api/auth'
import {getToken, setToken, removeToken} from '@/utils/token'
import avatarImg from '../../../static/img/icon/avatar.gif'

const user = {
  //设置静态属性
  state: {
    user: '',
    status: '',
    code: '',
    token: getToken(),
    loginName: '',
    name: '',
    avatar: avatarImg,
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
    SET_STATUS: (state, status) => {
      state.status = status
    },
    //更改token
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    //更改简介
    SET_INTRODUCTION: (state, introduction) => {
      state.introduction = introduction
    },
    //更改设置
    SET_SETTING: (state, setting) => {
      state.setting = setting
    },
    //更改姓名
    SET_NAME: (state, name) => {
      state.name = name
    },
    //更改用户账号
    SET_LOGIN_NAME: (state, loginName) => {
      state.loginName = loginName
    },
    //更改用户头像
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    //更改所拥有的角色
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    //更改权限
    SET_PERMS: (state, perms) => {
      state.perms = perms
    },
    //是否是游客
    SET_VISITOR: (state, visitor) => {
      state.visitor = visitor
    }
  },

  actions: {
    // Test(context) {
    //   //context 官方给出的指定对象, 此处context可以理解为store对象
    //   context.commit('[setState]', value)
    // },
    //用户名登录
    LoginByUsername({commit}, userInfo) {
      const loginName = userInfo.loginName.trim();
      //Promise 对象用于表示一个异步操作的最终状态（完成或失败），以及该异步操作的结果值。
      return new Promise((resolve, reject) => {
        /** 当用户名是Test 密码是123456 跳过后台 */
        if (loginName == "Test" && userInfo.password == "123456"){
          commit('SET_TOKEN', "Test_Token")
          setToken("Test_Token")
          resolve()
        }
        authApi.login(loginName, userInfo.password).then(response => {
          const data = response.data
          //修改store中的token
          commit('SET_TOKEN', data.token)
          //修改cookie中的token
          setToken(data.token)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户详细信息
    GetUserInfo({commit, state}) {
      return new Promise((resolve, reject) => {
        /** 当用户名是Test 密码是123456 跳过后台 */
        if (state.token == "Test_Token") {
          commit('SET_VISITOR', false)
          commit('SET_ROLES', [{name: "测试管理员", val: "root"}])
          commit('SET_PERMS', [{name: "所有权限", val: "*"}])
          commit('SET_LOGIN_NAME', "测试用户名");
          commit('SET_NAME', "测试名字");
          resolve({data: {perms: [{name: "所有权限", val: "*"}]}})
        } else {
          authApi.getUserInfo(state.token).then(response => {
            if (!response) reject('response is null');
            if (!response.data) reject('response.data is null');
            //如果不在这里加判断，会陷入无限循环
            if (!response.data.perms || response.data.perms.length == 0
              || !response.data.perms || response.data.perms.length == 0) {
              commit('SET_VISITOR', true)   //给予游客身份
            } else {
              commit('SET_VISITOR', false)  //给予非游客身份
            }
            //赋予基本信息
            commit('SET_ROLES', response.data.roles)
            commit('SET_PERMS', response.data.perms)
            commit('SET_LOGIN_NAME', response.data.loginName);
            commit('SET_NAME', response.data.name);
            resolve(response)
          }).catch(error => {
            reject(error)
          })
        }
      })
    },

    // 登出
    Logout({commit, state}) {
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
    FedLogOut({commit}) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  }
}

export default user
