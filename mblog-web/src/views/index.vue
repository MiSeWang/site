<template>
  <div class="main">
    <!--顶部-->
    <div class="navigation">
      <div style="font-size: 22px; margin-left: 10vw">
        蟲师的博客
      </div>
      <div class="tab_border">
        <div>
          <ul>
            <a>首页</a>
          </ul>
          <ul>
            <a>类型1</a>
            <li>
              类1
            </li>
            <li>
              类2
            </li>
            <li>
              类3
            </li>
            <li>
              类4
            </li>
            <li>
              类5
            </li>

          </ul>
          <ul>
            <a>类型1</a>
            <li>
              类1
            </li>
            <li>
              类2
            </li>
            <li>
              类3
            </li>
            <li>
              类4
            </li>
            <li>
              类5
            </li>

          </ul>
          <ul>
            <a>类型1</a>
            <li>
              类1
            </li>
            <li>
              类2
            </li>
            <li>
              类3
            </li>
            <li>
              类4
            </li>
            <li>
              类5
            </li>

          </ul>
          <ul>
            <a>类型1</a>
            <li>
              类1
            </li>
            <li>
              类2
            </li>
            <li>
              类3
            </li>
            <li>
              类4
            </li>
            <li>
              类5
            </li>

          </ul>
        </div>
        <!--<div>-->
          <!--<div class="">-->
            <!--<input type="text" v-model='msg' @keyup="get" @keyup.down='' @keyup.up=''>-->
            <!--<button >搜索</button>-->
          <!--</div>-->
        <!--</div>-->
      </div>
    </div>

    <div class="notice br-5 width_80 ">
      <div><svg-icon icon-class="sound-filling-fill" class="icon_size"></svg-icon>公告信息</div>
    </div>

    <!--<breadcrumb></breadcrumb>-->
    <!--内容-->
    <div class="main_home width_80">
      <!--左面内容-->
      <div class="main_list">
        <!--导航栏-->
        <!--<RotationComponent/>-->
        <!--内容列表-->
        <router-view/>
      </div>
      <!--右边内容-->
      <div class="main_more ml-md">
        <div class="bg-white pa-sm br-5">
          <div class="column items-center">
            <img src="../../static/img/top1.png" class="radius-round"/>
            <span class="py-sm">西行妖</span>
          </div>
          <div style="font-size: 13px" class="text-333">
            这是一个程序员的独立博客站，主要用于分享与编程技术相关的内容， 同时这里也是博主记录工作学习中遇到的问题及其解决方案的地方。
            PS:彭江毅:非著名程序员，IT界的一名小学生。目前在研究javaweb、mysql、算法基础等... 更多信息请点击： 关于本站.
            <hr class="my-sm">
            <div class="row justify-between">
              <a class="github" style="color:black"
              href="https://pengjiangyi.github.io" target="_blank"
              title="GitHub">
              <img class="small-img" src="../../static/icons/github.jpg"> github</a>
              <a class="xlwb" style="color:black"
                 href="http://weibo.com/5343552673/profile?rightmod=1&amp;wvr=6&amp;mod=personinfo&amp;is_all=1"
                 target="_blank" title="新浪微博"> <img class="small-img"
                                                    src="../../static/icons/weibo.jpg">
                新浪微博</a>
              <a class="github.io" href="https://pengjiangyi.github.io" style="color:black" target="_blank"
                 title="git博客"> <img class="small-img" src="../../static/icons/git.jpg"> git博客</a>
            </div>
          </div>
        </div>
        <!--热门标签-->
        <!--<div class="bg-white public_border_solid index_rigth_top2">-->
          <!--<div class="index_rigth_cen_picture">-->
            <!--最新评论-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
          <!--<div class="index_comment_item">-->
            <!--<div>wowowowowowoww....</div>-->
            <!--<div>一个月前</div>-->
          <!--</div>-->
        <!--</div>-->


        <!--点击排名-->
        <div class="bg-white br-5 my-md column">
          <div class="row justify-around recommend_tabs">
            <div class="check_recommend_tab">
              热度排名
            </div>
            <div class="recommend_tab">
              最新评论
            </div>
            <div class="recommend_tab">
              推荐
            </div>
          </div>
          <div class="column recommend_container pa-sm">
            <div class="row items-center fs-14 overflow-ellipsis">
              <span class="public_no">1</span>
              <div class="ml-sm">wowow啊，幻想乡owowowoww....</div>
            </div>
            <div class="index_comment_item">
              <div>wowowowowowoww....</div>
              <div>一个月前</div>
            </div>
            <div class="index_comment_item">
              <div>wowowowowowoww....</div>
              <div>一个月前</div>
            </div>
            <div class="index_comment_item">
              <div>wowowowowowoww....</div>
              <div>一个月前</div>
            </div>
            <div class="index_comment_item">
              <div>wowowowowowoww....</div>
              <div>一个月前</div>
            </div>
            <div class="index_comment_item">
              <div>wowowowowowoww....</div>
              <div>一个月前</div>
            </div>
          </div>
        </div>

        <!--最新评论-->
        <div class="bg-white br-5 my-md column  fs-14">
          <div class="column ma-sm text-bold" >
              网站信息
            <hr class="mt-sm">
          </div>

          <div class="column recommend_container pa-sm">
            <div class="row">
              <div></div>
              <div>文章总数</div>：
              <div>22 篇</div>
            </div>
            <div class="row">
              <div></div>
              <div>运行天数</div>：
              <div>1,382 天</div>
            </div>
            <div class="row">
              <div></div>
              <div>最后更新</div>：
              <div>2018年09月07日22点</div>
            </div>
            <div class="row">
              <div></div>
              <div>标签总数</div>：
              <div>26 个</div>
            </div>
            <div class="row">
              <div></div>
              <div>分类总数</div>：
              <div>6 个</div>
            </div>
            <div class="row">
              <div></div>
              <div>留言数量</div>：
              <div>6 条</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'index',
    data() {
      return {
      }
    },
    created(){
      this.getData();
    },
    methods:{
      getData(){
        this.$httpGet("https://www.baidu.com/", {}).then((e) => {
          console.log(e)
        });
      }
    },
    components: {
      Breadcrumb : () => import('./module/Breadcrumb.vue'),
      RotationComponent : () => import('./module/RotationComponent.vue')
    }
  }
</script>

<style scoped>
  @import '../css/index.css';

  /*顶部样式 */
  .navigation {
    /*background: rgba(255,255,255, 0.8);*/
    background: rgba(255,255,255, 1);

    position:fixed;
    z-index:1001;
    height: 10vh;
    width: 100%;
    box-shadow: #989898 0px 0px 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    top: 0px;
  }

  .tab_border{
    color: white;
    font-size: 14px;
    /*border: #006bad solid 1px;*/
    height: 30px;
    box-shadow: -5px 5px 5px #bedeff;
    display: flex;
    margin-right: 10vw;
  }
  .tab_border > div{
    display: flex;
    justify-content: right;
  }
  .tab_border ul{
    height: 30px;
    overflow: hidden;
  }
  .tab_border ul:hover{
    background-color: #338ce6;
    height: auto;
    overflow: visible;
    opacity: 0.6;
  }
  .tab_border ul li, .tab_border ul a{
    background-color: #59a1e9;
    height: 30px;
    display: flex;
    width: 100px;
    justify-content: center;
    align-items: center;
  }
  .tab_border ul li:hover{
    font-weight: bold;
    text-decoration: underline;
  }

  /* 公告 */
  .notice{
    margin: 11vh 10vw 1vh 10vw;
    background-color: white;
    border: #eee 1px solid;
  }
  .notice > div{
    padding: 12px;
  }

  /*正文样式*/
  .main_home {
    /*background-color: white;*/
    display: flex;
    justify-content: space-between;
  }

  /* 主题列表 */
  .main_list {
    width: 80%;
    max-width: 1000px;
  }
  /* 在这里写小屏幕设备的样式 */
  /*@media screen and (min-width: 320px) and (max-width: 480px){*/
    /*.index_main {*/
      /*margin-left: 10vw;*/
      /*margin-right: 10vw;*/
      /*background-color: #f5f5f5;*/
      /*float: left;*/
    /*}*/
  /*}*/

  /* 更多额外信息 */
  .main_more {
    width: 300px;
    background-color: #f5f5f5;
  }

  .recommend_tabs{
    width: 100%;
  }
  .recommend_tabs > div{
    width: 33.33%;
    color: white;
    background-color: #59a1e9;
    font-size: 12px;
    min-width: 80px;
    height: 30px;
    line-height: 30px;
    text-align: center;
  }
  .recommend_tabs > .recommend_tab:hover{
    background-color: #3C84E9;
    cursor: pointer;
  }
  .check_recommend_tab {
    background-color: transparent!important;
    color: black!important;
  }
  .recommend_container{
  }
</style>
