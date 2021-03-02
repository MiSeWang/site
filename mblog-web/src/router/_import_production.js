// 生产环境配置
module.exports = file => () => import('@/views/' + file + '.vue')
