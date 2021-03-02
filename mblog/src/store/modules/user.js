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
    },


    webSocket: null,        //socket实例
    lockReconnect: null,    //锁
    timeoutObj: null,
    reconnectData: null,
    timeout: 60000,         //60s一次心跳检测
    serverTimeoutObj: null,
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
    },

    /** socket */
    //初始化连接
    INIT_SOCKET: (state, loginName) => {
      let wsUri = "ws://172.16.5.32:9220/webSocket/" + "CW6477"; //测试环境
      state.webSocket = new WebSocket(wsUri);
    },

    //发送消息
    SEND_SOCKET: () => {

    },
    //断开连接
    COLOR_SOCKET: (state) => {
      state.lockReconnect = true;
      state.webSocket.close()                 //离开路由之后断开websocket连接
      clearTimeout(state.reconnectData);      //离开清除 timeout
      clearTimeout(state.timeoutObj);         //离开清除 timeout
      clearTimeout(state.serverTimeoutObj);   //离开清除 timeout
    },
    //绑定属性
    SET_SOCKET_FUN: (state, name) => {
      state.webSocket[name.name] = name.fun;
    },
    //心跳测试
    HEAT_BEAT: (state, loginName) => {
      state.timeoutObj && clearTimeout(state.timeoutObj);
      state.serverTimeoutObj && clearTimeout(state.serverTimeoutObj);
      state.timeoutObj = setTimeout(() => {
        if (state.webSocket.readyState == 1) {  //如果可发送则发送，不可发送，则重连
          state.webSocket.send(JSON.stringify({
            code: 6000,
            loginName: loginName
          })) //连接成功，发送一个工号到服务端
        }
        state.serverTimeoutObj = setTimeout(() => {
          state.webSocket.close();       //如果  5秒之后我们没有收到 后台返回的心跳检测数据 断开socket，断开后会启动重连机制
        }, 5000);
      }, state.timeout)
    },
    //断线重连
    RECONNECT: (state, initWebSocket) => {
      if (state.lockReconnect) {       //这里很关键，因为连接失败之后之后会相继触发 连接关闭，不然会连接上两个 WebSocket
        return
      }
      state.lockReconnect = true;
      state.reconnectData && clearTimeout(state.reconnectData);
      state.reconnectData = setTimeout(() => { //断线重连，每5秒连一次
        initWebSocket();
        state.lockReconnect = false;
        // console.log("断线重连reconnect ： " + this.lockReconnect)
      }, 5000)
    },
  },

  actions: {
    // Test(context) {
    //   //context 官方给出的指定对象, 此处context可以理解为store对象
    //   context.commit('[setState]', value)
    // },
    //初始化Socket


    InitSocket({commit, dispatch}, loginName) {
      //初始化实例
      commit("INIT_SOCKET", loginName);
      //绑定属性
      commit("SET_SOCKET_FUN", {
        name: "onopen", fun: () => {
          //连接建立之后开始心跳
          commit("HEAT_BEAT", loginName)
        }
      });
      commit("SET_SOCKET_FUN", {
        name: "onerror", fun: () => {
          //连接建立失败重连
          commit("RECONNECT", dispatch('InitSocket', loginName));
        }
      });
      commit("SET_SOCKET_FUN", {
        name: "onclose", fun: () => {
          //关闭连接,各种问题导致的 连接关闭
          commit("RECONNECT", dispatch('InitSocket', loginName));
        }
      });
      commit("SET_SOCKET_FUN", {
        name: "onmessage", fun: (evt) => {
          //解决接收的方法
          commit("HEAT_BEAT");
          let result = JSON.parse(evt.data);
          console.log(result);
        }
      });
    },

    //用户名登录
    LoginByUsername({commit}, userInfo) {
      const loginName = userInfo.loginName.trim();
      //Promise 对象用于表示一个异步操作的最终状态（完成或失败），以及该异步操作的结果值。
      return new Promise((resolve, reject) => {
        /** 当用户名是Test 密码是123456 跳过后台 */
        if (loginName == "Test" && userInfo.password == "123456") {
          commit('SET_TOKEN', "Test_Token")
          setToken("Test_Token")
          resolve()
        }
        authApi.login(loginName, userInfo.password).then((result) => {
          //修改store中的token
          commit('SET_TOKEN', result.token)
          //修改cookie中的token
          setToken(result.token)
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户详细信息
    GetUserInfo({commit, state, dispatch}) {
      return new Promise((resolve, reject) => {
        /** 当用户名是Test 密码是123456 跳过后台 */
        if (state.token == "Test_Token") {
          commit('SET_VISITOR', false);
          commit('SET_ROLES', [{name: "测试管理员", val: "root"}]);
          commit('SET_PERMS', [{name: "所有权限", val: "*"}]);
          commit('SET_LOGIN_NAME', "测试用户名");
          commit('SET_NAME', "测试名字");
          // dispatch('InitSocket', "Test");
          resolve({data: {perms: [{name: "所有权限", val: "*"}]}})
        } else {
          authApi.getUserInfo(state.token).then((result) => {
            console.log(result)
            if (!result) reject('response is null');
            //如果不在这里加判断，会陷入无限循环
            if (!result.perms || result.perms.length == 0
              || !result.perms || result.perms.length == 0) {
              commit('SET_VISITOR', true)   //给予游客身份
            } else {
              commit('SET_VISITOR', false)  //给予非游客身份
            }
            //赋予基本信息
            commit('SET_ROLES', result.roles)
            commit('SET_PERMS', result.perms)
            commit('SET_LOGIN_NAME', result.loginName);
            commit('SET_NAME', result.name);
            // dispatch('InitSocket', response.data.loginName);
            resolve(result)
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
          // commit('COLOR_SOCKET');//关闭
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
        // commit('COLOR_SOCKET');//关闭
        removeToken()
        resolve()
      })
    }
  }
}

export default user
