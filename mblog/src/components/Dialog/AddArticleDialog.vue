<!--添加窗口-->
<template>
  <el-dialog
    fullscreen
    :title="title"
    :visible.sync="open">
    <!--:before-close="handleClose"-->
    <!--说明插槽-->
    <slot name="explain" >
      <div v-show="isEditor">
        <el-input v-model="editorTitle" placeholder="文章标题"  />
      </div>
    </slot>
    <!--富文本插槽-->
    <slot name="editor" >
      <editor v-show="isEditor" :content="editorContent" :catchData="catchData"/>
    </slot>
      <div style="margin-top: 10px;">
        <span style="font-size: 0.8rem">文章标签:</span>
        <el-tag size="":key="index" v-for="(tag, index) in tags" closable :disable-transitions="false"  @close="closeTag(tag)">
          {{tag}}
        </el-tag>
        <el-input class="input-new-tag" v-if="inputVisibleTag"  v-model="inputValue" ref="saveTagInput" size="small"
                  @keyup.enter.native="confirmTagInputConfirm"
                  @blur="confirmTagInputConfirm">
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showTagInput">添加标签</el-button>
        <span style="color: #99a9bf; font-size: 0.7rem">最多添加5个标签</span>
      </div>
      <div style="margin-top: 10px;">
        <span style="font-size: 0.8rem;">文章分类:</span>
        <el-select v-model="value1" multiple placeholder="请选择">
          <el-option
            v-for="item in options"
            :key="item.value"
            :label="item.label"
            :value="item.value">
          </el-option>
        </el-select>

        <el-input class="input-new-tag" v-if="inputVisibleTag"  v-model="inputValue" ref="saveTagInput" size="small"
                  @keyup.enter.native="confirmTagInputConfirm"
                  @blur="confirmTagInputConfirm">
        </el-input>
        <el-button v-else class="button-new-tag" size="small" @click="showTagInput">添加分类</el-button>

      </div>

    <span slot="footer" class="dialog-footer" >
      <!--<el-button @click="open = false">取 消</el-button>-->
      <el-button type="primary" @click="saveArticle">保 存</el-button>
    </span>
  </el-dialog>
</template>
<script>
  import editor from '@/components/WangEditor/editor.vue'

  export default {
    data() {
      return {
        id: '',
        keyword:'',
        open: false,
        editorContent: '',
        editorTitle: '',

        tags: ['标签一', '标签二', '标签三'],
        inputVisibleTag: false,  //是否添加新的标签
        inputValue: '',  //新的标签value

        options: [{
          value: '选项1',
          label: '黄金糕'
        }, {
          value: '选项2',
          label: '双皮奶'
        }, {
          value: '选项3',
          label: '蚵仔煎'
        }, {
          value: '选项4',
          label: '龙须面'
        }, {
          value: '选项5',
          label: '北京烤鸭'
        }],
        value1: [],
        value2: []
      }
    },
    props: {
      title: {
        required: true
      },
      isEditor: {
        type: Boolean,
        default: false
      },
      callback: {
        type: Function,
        required: true
      }
    },
    created(){
    },
    methods: {
      //保存
      saveArticle(){
        let result = this.callback({'title':this.editorTitle, 'content':this.editorContent, 'tag':''} )
        if (result) {
          this.open = false;
        }
      },
      //回调方法,获取富文本中的html
      catchData(editorContent){
        this.editorContent = editorContent
        console.log(this.editorContent)
      },
      /** ----------------------tag------------------------*/
      closeTag(tag) {  //移除标签
        this.tags.splice(this.tags.indexOf(tag), 1);
      },
      showTagInput() { //添加标签
        this.inputVisibleTag = true;
        this.$nextTick(_ => {
          this.$refs.saveTagInput.$refs.input.focus();
        });
      },
      confirmTagInputConfirm() {  //确认提交标签
        let inputValue = this.inputValue;
        if (inputValue) {
          this.tags.push(inputValue);
        }
        this.inputVisibleTag = false;
        this.inputValue = '';
      }
      /** ------------------------------------------------*/
    },
    components: {
      'editor': editor
    }
  }
</script>
<style>
  .el-tag + .el-tag {
    margin-left: 10px;
  }
  .button-new-tag {
    margin-left: 10px;
    height: 28px;
    line-height: 27px;
    padding-top: 0;
    padding-bottom: 0;
  }
  .input-new-tag {
    width: 90px;
    margin-left: 10px;
    vertical-align: bottom;
  }
</style>
