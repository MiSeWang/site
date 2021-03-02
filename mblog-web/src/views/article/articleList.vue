<template>
  <div>
    <div class="pb-md" @click="$router.push({ name: 'articleDetail', query: {id: ''}})">
      <div class="bg-white br-5">
        <div class="row pa-md">
          <div>
            <a @click.stop="" href="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg">
              <img class ="item_img"
                   src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg" alt="如何建立个人博客？"></a>
          </div>
          <div class="px-md">
            <span class="item_title">迪杰斯特拉算法</span>
            <div class="item_subtitle">
              <!--头像-->
              <div class="row">
                <img style="height: 35px; width: 35px; border-radius:50%"
                     src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=681250487,3142495041&fm=26&gp=0.jpg"/>
                <div style="margin: 0px 10px">西行妖</div>
              </div>
              <div class="item_subtitle">
                摘要: 前面分别通过C和C++实现了迪杰斯特拉算法，本文介绍迪杰斯特拉算法的Java实现。目录 1. 迪杰斯特拉算法介绍 2. 迪杰斯特拉算法图解 3. 迪杰斯特拉算法的代码说明 4.
                迪杰斯特拉算法的源码
              </div>
              <div style="position: relative; bottom: -8px;">
                发布时间: 2014-05-28 09:35
                阅读(5785) 评论(3)
                <a href="https://i.cnblogs.com/EditPosts.aspx?postid=3711526">编辑</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="pb-md">
      <div class="bg-white br-5">
        <div class="row pa-md">
          <div>
            <a href="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg">
              <img class ="item_img"
                   src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg" alt="如何建立个人博客？"></a>
          </div>
          <div class="px-md">
            <span class="item_title">迪杰斯特拉算法</span>
            <div class="item_subtitle">
              <!--头像-->
              <div class="row">
                <img style="height: 35px; width: 35px; border-radius:50%"
                     src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=681250487,3142495041&fm=26&gp=0.jpg"/>
                <div style="margin: 0px 10px">西行妖</div>
              </div>
              <div class="item_subtitle">
                摘要: 前面分别通过C和C++实现了迪杰斯特拉算法，本文介绍迪杰斯特拉算法的Java实现。目录 1. 迪杰斯特拉算法介绍 2. 迪杰斯特拉算法图解 3. 迪杰斯特拉算法的代码说明 4.
                迪杰斯特拉算法的源码
              </div>
              <div style="position: relative; bottom: -8px;">
                发布时间: 2014-05-28 09:35
                阅读(5785) 评论(3)
                <a href="https://i.cnblogs.com/EditPosts.aspx?postid=3711526">编辑</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="pb-md">
      <div class="bg-white br-5">
        <div class="row pa-md">
          <div>
            <a href="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg">
              <img class ="item_img"
                   src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg" alt="如何建立个人博客？"></a>
          </div>
          <div class="px-md">
            <span class="item_title">迪杰斯特拉算法</span>
            <div class="item_subtitle">
              <!--头像-->
              <div class="row">
                <img style="height: 35px; width: 35px; border-radius:50%"
                     src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=681250487,3142495041&fm=26&gp=0.jpg"/>
                <div style="margin: 0px 10px">西行妖</div>
              </div>
              <div class="item_subtitle">
                摘要: 前面分别通过C和C++实现了迪杰斯特拉算法，本文介绍迪杰斯特拉算法的Java实现。
              </div>
              <div style="position: relative; bottom: -8px;">
                发布时间: 2014-05-28 09:35
                阅读(5785) 评论(3)
                <a href="https://i.cnblogs.com/EditPosts.aspx?postid=3711526">编辑</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div v-for="(item) in data" :key="item.id" class="pb-md" @click="$router.push({ name: 'articleDetail', query: {id: item.id}})">
      <div class="bg-white br-5">
        <div class="row pa-md items-start">
          <div>
            <a href="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg">
              <img class ="item_img"
                   src="https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1434165480,1127209498&fm=26&gp=0.jpg" alt="如何建立个人博客？"></a>
          </div>
          <div class="item_main pl-md column justify-between full-width">
            <div>
              <span class="item_title">{{item.title}}</span>
              <div class="item_subtitle py-xs">
                <!--头像-->
                <!--<div class="row">-->
                  <!--<img style="height: 35px; width: 35px; border-radius:50%"-->
                       <!--src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=681250487,3142495041&fm=26&gp=0.jpg"/>-->
                  <!--<div style="margin: 0px 10px">西行妖</div>-->
                <!--</div>-->
                <div class="item_subtitle">
                  摘要: {{item.description}}
                </div>
              </div>
            </div>
            <div class="item_subtitle row flex-wrap">
              <span class="mr-sm">发布时间: {{$moment(item.createTime).format('YYYY-MM-DD HH:mm')}}</span>
              <div class="row items-center">
                <span class="mr-sm"><svg-icon icon-class="eye" class="icon_size mx-xs" />阅读({{item.hits}})</span>
                <span class="text-theme"><svg-icon icon-class="comments" class="icon_size mx-xs" />评论(0)</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--<div style="margin-top: 30px">-->
    <!--<span>首页</span>-->
    <!--<span class="curr">1</span>-->
    <!--<a href="http:/index-2.html" title="第2页">2</a>-->
    <!--<span class="normalsize">共2页&nbsp;/&nbsp;9条数据</span>&nbsp;转到-->
    <!--<span id="go_page_wrap" style="display:inline-block;width:44px;height:18px;border:1px solid #DFDFDF;margin:0px 1px;padding:0px;position:relative;left:0px;top:5px;">-->
    <!--<input type="button" id="btn_go" onclick="kkpager.gopage();" style="width:44px;height:20px;line-height:20px;padding:0px;font-family:arial,宋体,sans-serif;text-align:center;border:0px;background-color:#0063DC;color:#FFF;position:absolute;left:0px;top:-1px;display:none;" value="确定">-->
    <!--<input type="text" id="btn_go_input" onfocus="kkpager.focus_gopage()"-->
    <!--onkeypress="if(event.keyCode<48 || event.keyCode>57)return false;"-->
    <!--onblur="kkpager.blur_gopage()"-->
    <!--style="width:42px;height:16px;text-align:center;border:0px;position:absolute;left:0px;top:0px;outline:none;"-->
    <!--value="2"></span>页-->
    <!--</div>-->
  </div>
</template>

<script>
  export default {
    name: 'articleList',
    data() {
      return {
        data: []
      }
    },
    created(){
      this.getData();
    },
    methods:{
      getData(){
        this.$httpGet("/webArticle/query", {}).then((result) => {
          this.data = result.data;
        });
      }
    },
    components: {
    }
  }
</script>

<style scoped>
  @import '../../css/index.css';

  .item_main{
    height: 150px;
  }

  .item_img{
    width: 150px;
  }
  .item_title{
    font-size: 15px;
    font-weight: bold;
    color: #555;
  }
  .item_subtitle{
    font-size: 13px;
    color: #777;
  }
  .item_subtitle > div {

  }
  .item_subtitle > div svg {
    font-size: 15px;
  }
</style>
