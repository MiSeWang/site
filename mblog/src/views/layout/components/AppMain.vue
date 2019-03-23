<template>
  <section class="app-main" style="min-height: 100%">
    <!-- transition ：动画效果-->
    <transition name="fade" mode="out-in">
      <!-- keep-alive ：页面缓存-->
      <keep-alive :include="cachedViews">
        <router-view></router-view>
      </keep-alive>
    </transition>
  </section>
</template>
<script>
  // import VueEvent from '@/store/VueEvent.js';
  export default {
    name: 'AppMain',
    data() {
      return{
        cachedViews: []
      }
    },
    methods: {
      getCacheViews(){
        // VueEvent.$on('TagsView_cachedViews', function (data) {
        //   console.log("666");
        //   this.cachedViews = data;
        // });
      }
    },
    created() {
      this.getCacheViews();
    }
  }
</script>
