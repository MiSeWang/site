import Vue from 'vue'
import Vuex from 'vuex'
import breadcumb from './modules/breadcumb'

import getters from './getters'

Vue.use(Vuex)


//初始化一个 store Vuex主配置文件
const store = new Vuex.Store({
  modules: {
    breadcumb,
  },
  getters
})

export default store
