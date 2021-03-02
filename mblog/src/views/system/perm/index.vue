<template>
  <div class="app-container">
    <!--<el-row class="" style="height: 500px; border: 1px solid #eee">-->
    <!--<el-col style="border: 1px solid #eee; background-color: rgb(238, 241, 246)">-->

    <!--</el-col>-->
    <!--<el-col style="height: 500px; border: 1px solid #eee">-->
    <el-menu style="border: 1px solid #eee" default-active="1" @select="changePermType" mode="horizontal">
      <el-menu-item v-for="val, index in typeList" :key="index" :index="val.value">
        <i class="el-icon-message"></i><span slot="title">{{val.name}}</span>
      </el-menu-item>
    </el-menu>
    <!--<el-menu style="border: 1px solid #eee" default-active="1" @select="changePermType" mode="horizontal">-->
      <!--<el-menu-item index="1">-->
        <!--<i class="el-icon-message"></i><span slot="title">菜单</span>-->
      <!--</el-menu-item>-->
      <!--<el-menu-item index="2">-->
        <!--<i class="el-icon-menu"></i><span slot="title">按钮</span>-->
      <!--</el-menu-item>-->
      <!--<el-menu-item index="3">-->
        <!--<i class="el-icon-setting"></i><span slot="title">接口</span>-->
      <!--</el-menu-item>-->
    <!--</el-menu>-->
    <el-card>
      <div slot="header">
        <div class="title-box">
          <span><el-tag type="success">菜单</el-tag>&nbsp;权限元数据</span>
        </div>
        <span class="tips-text">提示：菜单权限由页面路由定义，不提供任何编辑功能，只能执行将权限数据同步到数据库的操作。
            菜单权限值建议使用前缀&nbsp;<el-tag size="mini" type="success">m:</el-tag>
          </span>
      </div>
      <el-input
        style="width: 15rem; margin-bottom: 15px;"
        :placeholder="filterPlaceholderText"
        v-model="filterText">
      </el-input>
      <!--<el-tree ref="menuPermTreeRef" :filter-node-method="filterNode" :data="menuPermissionTree"-->
      <!--:props="treeProps" node-key="pval" default-expand-all :expand-on-click-node="false">-->
      <!--<span class="custom-tree-node" slot-scope="{ node, data }">-->
      <!--<span>-->
      <!--<span class="mgl-10">{{ data.pname }}</span>-->
      <!--<span class="mgl-10 tips-text">{{ data.pval }}</span>-->
      <!--<el-tag class="mgl-10" type="success" size="mini">菜单</el-tag>-->
      <!--<el-tag v-if="!menuPermValSet.has(data.pval)" class="mgl-10" type="danger" size="mini">未同步</el-tag>-->
      <!--</span>-->
      <!--</span>-->
      <!--</el-tree>-->
      <el-tree
        class="filter-tree"
        :data="treeDate"
        :props="treeProps"
        default-expand-all
        :filter-node-method="filterNode"
        ref="menuTree">
        <span class="custom-tree-node" slot-scope="{ node, data }">
          <span>{{ node.label }}</span>
          <span>
            <el-tooltip content="添加下级权限" placement="top">-->
              <el-button type="text" size="mini" icon="el-icon-plus" @click="handleAdd(data)"></el-button>
            </el-tooltip>
            <el-tooltip content="更新" placement="top">
              <el-button class="update-btn" type="text" size="mini" icon="el-icon-edit"
                         @click="handleUpdate(data)"></el-button>
            </el-tooltip>
            <el-tooltip style="margin-right: 80px;" content="删除" placement="top">
              <el-button class="delete-btn" type="text" size="mini" icon="el-icon-delete"
                         @click="handleDelete(data)"></el-button>
            </el-tooltip>
          </span>
        </span>
      </el-tree>
    </el-card>
  </div>
</template>

<script>
  import permApi from '@/api/perm'
  import {parseTime, resetTemp} from '@/utils'
  import {root, CodeType} from '@/utils/constants'

  export default {
    data() {
      return {
        typeList: [ //Tab数组
          {
            name: '菜单',
            value: '1',
          },
          {
            name: '按钮',
            value: '2',
          },
          {
            name: '接口',
            value: '3',
          }],
        filterText: '', //输入的过滤文本
        filterPlaceholderText: '输入关键字进行过滤', //过滤文本框提示
        treeDate: [],   //数据源
        permType: '1',
        treeProps: {    //这个树带的参数
          children: 'children',
          label: 'label'
        },
      };
    },
    watch: {
      filterText(val) {
        this.$refs.menuTree.filter(val);
      }
    },
    created(){
      this.getData();
    },
    methods: {
      getData(){
        let permType = { permType: this.permType }
        permApi.queryPerm(permType).then(result => {
          if (result.code == CodeType.DEFAULT_SUCC_CODE){
            this.treeDate = result.data;
          }
        })
      },
      filterNode(value, data) { //过滤方法，每个节点都经过
        if (!value) return true;
        return data.label.indexOf(value) !== -1;
      },
      changePermType(key, keyPath) {  //更改Tab
        this.permType = key;
        this.getData()
      },
      handleAdd(){  //添加下级

      },
      handleUpdate(){

      },
      handleDelete(){

      }
    },
  };
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style rel="stylesheet/scss" lang="scss" scoped>
  .role-checkbox {
    margin-left: 0px;
    margin-right: 15px;
  }

  .el-table__expand-column .cell {
    display: none;
  }

  .update-btn {
    margin-left: 20px;
  }

  .delete-btn {
    margin-left: 20px;
    color: #F56C6C;
  }

  .custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
  }
</style>

