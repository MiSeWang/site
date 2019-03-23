<!-- 菜单栏组件 -->
<template>
  <el-breadcrumb class="app-breadcrumb" separator="/">
    <transition-group name="breadcrumb">
      <el-breadcrumb-item v-for="(item,index)  in levelList" :key="item.path" v-if='item.meta.title'>
        <span v-if="item.redirect==='noredirect'||index==levelList.length-1" class="no-redirect">{{ item.meta.title }}</span>
        <router-link v-else :to="item.redirect||item.path">{{item.meta.title}}</router-link>
      </el-breadcrumb-item>
    </transition-group>
  </el-breadcrumb>
</template>

<script>
  export default {
    created() {
      this.getBreadcrumb()
    },
    data() {
      return {
        levelList: null
      }
    },
    //相当于一个检测器
    watch: {
      $route() {
        this.getBreadcrumb()
      }
    },
    methods: {
      //这里获取面包屑
      getBreadcrumb() {
        //获取当前的this.$route.matched属性，然后过滤掉没有name属性为空的路径
        let matched = this.$route.matched.filter(item => {
          // console.log("t1:" + item)
          return item.name})
        // console.log(this.$route)
        // console.log(matched)
        const first = matched[0]
        if (first && first.name !== 'dashboard') {
          matched = [{ path: '/dashboard', meta: { title: '首页' }}].concat(matched)
        }
        this.levelList = matched
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .app-breadcrumb.el-breadcrumb {
    display: inline-block;
    font-size: 14px;
    line-height: 50px;
    margin-left: 10px;
    .no-redirect {
      color: #97a8be;
      cursor: text;
    }
  }
</style>
