<template>
  <div >
    <div class="pa-sm bg-white br-5">
      <div class="row justify-between">
        <div>TAG</div>
        <div class="fs-14 row items-center">
          <svg-icon icon-class="time" class="icon_size mx-xs text-999" /><span class="text-999">发表于{{$moment(data.createTime).format('YYYY年DD月MM日')}}</span>
          <svg-icon icon-class="eye" class="icon_size text-theme mx-xs" /><span class="text-theme">阅读 ({{data.hits}})</span>
          <svg-icon icon-class="comments" class="icon_size text-theme mx-xs" /><span class="text-theme">评论 (0)</span>
        </div>
      </div>
      <div class="public_border_bottom">
        <H2 class="py-md text-333">{{data.title}}</H2>
      </div>
      <div class="article_body py-md">
        <div v-highlight v-html="data.content" />
      </div>
      <div class="separate_line fs-14">
        <span class="px-sm text-theme">正文到此结束</span>
      </div>
      <div class="row justify-center mb-md text-999">
        <div class="row cursor-pointer click_btn fs-13 ">
          <div class="row items-center public_border_solid mr-md pl-md pr-lg cursor-theme">
            <svg-icon icon-class="fabulous" class="icon_size fabulous mr-xs" />
            赞 0
          </div>
          <div>
            <div class="rivet">
              <span class="radius-round bg-white"> </span>
            </div>
            <span class="public_border_solid radius-round cursor-theme fs-16">赏</span>
          </div>
          <div class="row items-center public_border_solid ml-md pr-md pl-lg cursor-theme">
            <svg-icon icon-class="share" class="icon_size share mr-xs" />
            分享
          </div>
        </div>
      </div>
    </div>
    <div class="br-5 bg-white mt-sm pa-sm tag_c">
      <div class="row">
        文本标签: <el-tag>标签一</el-tag>
      </div>
      <div class="row ">
        版权声明: <div></div>
      </div>
    </div>
    <div class="row br-5 bg-white mt-sm pa-sm tag_c">
      <div class="column items-center width_50">
        上一篇
        <div>标题</div>
      </div>
      <div class="column items-center width_50">
        上一篇
        <div>标题</div>
      </div>
    </div>
    <div class="br-5 bg-white mt-sm pa-sm tag_c">
      <div class="row ">
        标题:
        <div></div>
      </div>
      <div class="row">
        <div class="column width_50">
          <div class="row">
            文本标签:
            <div></div>
          </div>
          <div class="row ">
            版权声明 :
            <div></div>
          </div>
        </div>
        <div class="column width_50">
          <div class="row">
            文本标签:
            <div></div>
          </div>
          <div class="row ">
            版权声明 :
            <div></div>
          </div>
        </div>
      </div>
    </div>
    <div class="br-5 bg-white mt-sm pa-sm tag_c">
      <div class="row">
        相关文章:
        <div></div>
      </div>
      <div class="row ">
        <div class="column width_50">
          <div class="row">
            文本标签:
            <div></div>
          </div>
          <div class="row ">
            版权声明 :
            <div></div>
          </div>
        </div>
        <div class="column width_50">
          <div class="row">
            文本标签:
            <div></div>
          </div>
          <div class="row ">
            版权声明 :
            <div></div>
          </div>
        </div>
      </div>
    </div>
    <div class="br-5 bg-white mt-sm pa-sm tag_c">
      <div class="row">
        评论
        <div></div>
      </div>
      <div>
          暂无评论
      </div>
      <div>
      </div>
      <div class="br-5 py-sm" style="text-align: center; background-color: #59a1e9; color: white">
        评论
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'articleDetail',
    data() {
      return {
        id: this.$route.query.id,
        data: {}
      }
    },
    created(){
      this.getData();
    },
    methods:{
      getData(){
        this.$httpGet("/webArticle/queryById", { id:  this.id }).then((result) => {
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

  .cursor-theme:hover > .fabulous{
    color: #f56c6c;
  }
  .cursor-theme:hover > .share{
    color: #67c23a;
  }

  .tag_c > div{
    color: #999;
    font-size: 14px;
    font-weight: 600;
  }
  .click_btn > div {
    height: 35px;
  }
  .click_btn > div:hover,.click_btn > div:nth-child(2) > span:hover{
    background-color: #e1f5fe;
  }
  .click_btn > div:nth-child(2) {
    position: relative;
  }
  .rivet{
    position: absolute;
    height: 37px;
    width: 57px;
    left: -28px;
    top: -1px;
    overflow: hidden;
  }
  .rivet > span {
    position: absolute;
    height: 55px;
    width: 55px;
    border-left: #dddddd 1px solid;
    border-right: #dddddd 1px solid;
    margin-top: -9px;
  }

  .click_btn > div > span{
    position: absolute;
    width: 45px;
    line-height: 45px;
    left: -23px;
    top: -6px;
    text-align: center;
    background-color: white;
  }

  .separate_line {
    margin: 20px 0 20px 0;
    height: 1px;
    border-top: 1px #ccc dotted;
    text-align: center;
    overflow: initial!important;
  }
  .separate_line span{
    position: relative;
    top: -10px;
    background-color: #fff;;
  }
</style>
