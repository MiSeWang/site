<template>
  <div>
    <!--<el-tabs v-model="tabsModel" type="card" @tab-click="handleClick">-->
    <el-tabs v-model="tabsModel" type="card">
     <el-tab-pane label="全部文章" name="articleList">
       <div class="el-row">
         <el-input v-model="keyword" placeholder="根据标题搜索" style="width: 300px"></el-input>
         <el-button>搜索</el-button>
         <el-button @click="addArticle()">新增文章</el-button>
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
              <el-button size="mini">编辑</el-button>
              <el-button size="mini" type="danger">删除</el-button>
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
    <AddDialog ref="addDialog" title="新增文章" :isEditor="true" :callback="saveArticle" />
  </div>
</template>

<script>
  import articleApi from '@/api/article'
  import addDialog from '@/components/my/addDialog.vue'

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
      addArticle(){
        this.$refs.addDialog.open = true;
      },
      getData(){
        articleApi.queryArticle({}).then((response) => {
          if (response.data.code == 200) {
            this.tableData = response.data.data;
          } else {
            this.$message.error("获取数据失败");
          }
        })
      },
      saveArticle(){  //保存文章
        console.log("lalala")
      }
    },
    components: {
      'AddDialog': addDialog,
    }
  }
</script>
