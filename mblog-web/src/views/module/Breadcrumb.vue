<template>
  <div>
      <span v-for="(item, index) in breadList" :key="index" @click="">{{item.name}}/</span>
  </div>
</template>

<script>
  export default {
    name: "Breadcrumb",
    data() {
      return {
        levelList: null,
        breadList: [{
          name: "首页",
          path: "/home"
        }, {
          name: "系统设置",
          path: "/setting"
        }, {
          name: "用户管理",
          path: "/setting/usermanage"
        }]
      }
    },
    created() {
      this.getBreadcrumb()
    },
    watch: {
      $route() {
        this.getBreadcrumb()
      }
    },
    methods: {
      //这里获取面包屑
      getBreadcrumb() {
        // //获取当前的this.$route.matched属性，然后过滤掉没有name属性为空的路径
        // let matched = this.$route.matched.filter(item => {
        //   // console.log("t1:" + item)
        //   return item.name})
        // // console.log(this.$route)
        // console.log(matched)
        // const first = matched[0]
        // if (first && first.name !== 'dashboard') {
        //   matched = [{ path: '/dashboard', meta: { title: '首页' }}].concat(matched)
        // }
        // this.levelList = matched
      }
    }
  }
</script>

<style scoped>

</style>
