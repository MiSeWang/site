<template>
  <div>
    <!--<el-tabs v-model="tabsModel" type="card" @tab-click="handleClick">-->
    <el-tabs v-model="tabsModel" type="card">
     <el-tab-pane label="全部文章" name="articleList">
       <div class="el-row">
         <el-input v-model="keyword" placeholder="根据标题搜索" style="width: 300px"></el-input>
         <el-button>搜索</el-button>
         <el-button @click="openArticleDialog()">新增文章</el-button>
       </div>
       <!--<el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">-->
        <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%">
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="title" label="标题" show-overflow-tooltip></el-table-column>
          <el-table-column prop="categoryName" label="所属分类" width="120" align="center"></el-table-column>
          <el-table-column prop="createBy" label="作者" width="120" align="center"></el-table-column>
          <el-table-column prop="createByDate" label="最近编辑时间" width="120" align="center"></el-table-column>
          <el-table-column prop="hits" label="点击数" width="120" align="center"></el-table-column>
          <el-table-column label="操作" width="150" align="center" >
            <template slot-scope="scope">
              <el-button size="mini" @click="openArticleDialog(scope.row)">编辑</el-button>
              <el-button size="mini" type="danger" @click="delArticle(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>



      <!--<el-tab-pane label="已发表" name="second">-->
        <!--<div class="el-row">-->
          <!--<el-input v-model="keyword" placeholder="根据标题搜索" style="width: 300px"></el-input>-->
          <!--<el-button>搜索</el-button>-->
        <!--</div>-->
        <!--<el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">-->
          <!--<el-table-column type="selection" width="55"></el-table-column>-->
          <!--<el-table-column label="标题" width="120"><template slot-scope="scope">{{ scope.row.date }}</template>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="name" label="最近编辑时间" width="120">-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="作者" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="所属分类" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="操作" show-overflow-tooltip>-->
          <!--</el-table-column>-->
        <!--</el-table>-->
      <!--</el-tab-pane>-->
      <!--<el-tab-pane label="草稿箱" name="third">-->
        <!--<div class="el-row">-->
          <!--<el-input v-model="keyword" placeholder="根据标题搜索" style="width: 300px"></el-input>-->
          <!--<el-button>搜索</el-button>-->
        <!--</div>-->
        <!--<el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">-->
          <!--<el-table-column type="selection" width="55"></el-table-column>-->
          <!--<el-table-column label="标题" width="120"><template slot-scope="scope">{{ scope.row.date }}</template>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="name" label="最近编辑时间" width="120">-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="作者" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="所属分类" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="操作" show-overflow-tooltip>-->
          <!--</el-table-column>-->
        <!--</el-table>-->
      <!--</el-tab-pane>-->
      <!--<el-tab-pane label="回收站" name="fourth">-->
        <!--<div class="el-row">-->
          <!--<el-input v-model="keyword" placeholder="根据标题搜索" style="width: 300px"></el-input>-->
          <!--<el-button>搜索</el-button>-->
        <!--</div>-->
        <!--<el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange">-->
          <!--<el-table-column type="selection" width="55"></el-table-column>-->
          <!--<el-table-column label="标题" width="120"><template slot-scope="scope">{{ scope.row.date }}</template>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="name" label="最近编辑时间" width="120">-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="作者" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="所属分类" show-overflow-tooltip>-->
          <!--</el-table-column>-->
          <!--<el-table-column prop="address" label="操作" show-overflow-tooltip>-->
          <!--</el-table-column>-->
        <!--</el-table>-->
      <!--</el-tab-pane>-->
      <!--<el-tab-pane label="博客管理" name="fourth">定时任务补偿</el-tab-pane>-->
      <!--<el-tab-pane label="博客配置" name="fourth">定时任务补偿</el-tab-pane>-->
    </el-tabs>
    <add-article-dialog ref="addDialog" title="新增文章" :isEditor="true" :callback="saveArticle" />
  </div>
</template>

<script>
  import articleApi from '@/api/article'

  export default {
    data() {
      return {
        opensadas: false,
        tabsModel: 'articleList',
        tableData: [],

        keyword:'',
        msg: 'Welcome to Your Vue.js App',
      }
    },
    created(){
      this.getData();
    },
    methods: {
      async openArticleDialog(val){
        if (val == null) {
          //新建
          this.$refs.addDialog.id = '';
          this.$refs.addDialog.editorTitle = '';
          this.$refs.addDialog.editorContent = '';
          this.$refs.addDialog.open = true;
        } else {
          //编辑
          let result = await articleApi.queryArticleById({'id': val.id});
          console.log(result)
          if (result.code == 200) {
            this.$refs.addDialog.id = result.data.id;
            this.$refs.addDialog.editorTitle = result.data.title;
            this.$refs.addDialog.editorContent = result.data.content;
            this.$refs.addDialog.open = true;
            console.log(this.$refs)
          } else {
            this.$message.error("获取数据失败")
          }

        }

      },
      getData(){
        articleApi.queryArticle({}).then((result) => {
          this.tableData = result.data;
        })
      },
      async saveArticle(saveData){  //保存文章
        console.log(saveData);
        let result = await articleApi.saveArticle(saveData);
        if (result.code == 200) {
          this.$message.info("保存成功");
          //更新数据页面
          this.getData();
          return true;
        } else {
          this.$message.error("保存失败");
          return false;
        }
      },
      async delArticle(val){
        let result = await articleApi.delArticle({id: val.id, rootDel: false });
        if (result.code == 200) {
          this.$message.info("删除成功");
          //更新数据页面
          this.getData();
          return true;
        } else {
          this.$message.error("删除失败");
          return false;
        }
      }
    },
    components: {
      AddArticleDialog: () => import('@/components/Dialog/AddArticleDialog.vue'),
    }
  }
</script>
