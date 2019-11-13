/**
 * 添加错误日志
 * @type {{mutations: {ADD_ERROR_LOG: errorLog.mutations.ADD_ERROR_LOG}, state: {logs: []}, actions: {addErrorLog({commit: *}, *=): void}}}
 */
const errorLog = {
  state: {
    logs: []
  },
  mutations: {
    ADD_ERROR_LOG: (state, log) => {
      state.logs.push(log)
    }
  },
  actions: {
    addErrorLog({ commit }, log) {
      commit('ADD_ERROR_LOG', log)
    }
  }
}

export default errorLog
