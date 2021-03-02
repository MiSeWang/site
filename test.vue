<template>
  <div>
    <!-- 顶部条 -->
    <div></div>
    <!-- 轮播图 -->
    <div class="banner">
      <div class="item">
        <img :src="slideshowImgList[currentIndex]">
      </div>
      <div class="page" v-if="slideshowImgList.length > 1">
        <ul>
          <li @click="toPage(prevIndex)">&lt;</li>
          <li v-for="(item,index) in slideshowImgList" @click="toPage(index)" :class="{'current':currentIndex == index}">
            {{ index + 1 }}
          </li>
          <li @click="toPage(nextIndex)">&gt;</li>
        </ul>
      </div>
    </div>
    <!-- 热门分类 -->
    <div>
      <div v-for="(item, index) in channelList" class="q-pl-md">
        <div class="row justify-between q-py-md q-pr-md">
          <span class="text-bold">{{item}}</span>
          <div>
            <span style="padding: 2px 4px; border: solid 1px #999; border-radius: 4px; color: #999; font-size: 13px">换一批</span>
            <span class="q-ml-sm" style="padding: 2px 4px; border: solid 1px #999; border-radius: 4px; color: #999; font-size: 13px">更多</span>
          </div>
        </div>
        <div class="row ">
          <div v-for="(item) in 5"  class="column q-mr-md q-mb-md" style="border: solid 1px #eee; border-radius: 4px; font-size: 13px">
            <div class="column justify-end" style="width: 180px; height: 80px; background-color: #333; border-radius: 4px 4px 0px 0px;">
              <!-- 图片底部白线 -->
              <div style="height: 12px; background-image:linear-gradient(180deg,hsla(0,0%,100%,.5),hsla(0,0%,100%,.8) 40%,#fff);"  />
            </div>
            <div class="q-px-sm q-py-xs">
              <div class="font-14">标题</div>
              <div class="font-12 text-grey-6">备注</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentIndex: 0,
      slideshowImgList: ["https://i1.mifile.cn/a4/xmad_15535933141925_ulkYv.jpg", "https://i1.mifile.cn/a4/xmad_15532384207972_iJXSx.jpg", "https://i1.mifile.cn/a4/xmad_15517939170939_oiXCK.jpg"],
      channelList: [
        '分区一',
        '分区二',
        '分区三'
      ],
      timer: null,
    }
  },
  watch: {},
  created() {
  },
  mounted() {
    this.runInv();
  },
  destroyed() {
    //清除setInterval
    clearInterval(this.timer);
  },
  methods: {
    toPage(index) {
      this.currentIndex = index;
    },
    //定时器
    runInv() {
      this.timer = setInterval(() => {
        this.toPage(this.nextIndex)
      }, 5000)
    }
  },
  computed: {
    //上一张
    prevIndex() {
      if (this.currentIndex == 0) {
        return this.slideshowImgList.length - 1;
      } else {
        return this.currentIndex - 1;
      }
    },
    //下一张
    nextIndex() {
      if (this.currentIndex == this.slideshowImgList.length - 1) {
        return 0;
      } else {
        return this.currentIndex + 1;
      }
    }
  },
  components: {},
};

</script>
<style scoped>
/** {*/
/*  margin: 0;*/
/*  padding: 0;*/
/*}*/

ul li {
  list-style: none;
  float: left;
  width: 30px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
  color: rgba(255, 255, 255, .8);
  font-size: 14px;
}

.banner {
  max-width: 1200px;
  margin: 0 auto;
  position: relative;
  margin-top: 60px;
}

.banner img {
  width: 100%;
  display: block;
}

.banner .page {
  background: rgba(0, 0, 0, .5);
  position: absolute;
  right: 0;
  bottom: 0;
  width: 100%;
}

.banner .page ul {
  float: right;
}

.current {
  color: #ff6700;
}

</style>
