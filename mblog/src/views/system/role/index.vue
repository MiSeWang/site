<template>
  <div class="app-container">
    <!--查询  -->
    <el-row>
      <el-input style="width: 200px" placeholder="昵称"></el-input>
      <span style="margin-right: 15px;"></span>
      <!-- el-tooltip：创建一个提示 -->
      <el-tooltip class="" content="搜索" placement="top">
        <!-- circle：圆 -->
        <el-button icon="el-icon-search" circle></el-button>
      </el-tooltip>
    </el-row>
    <div style="margin-bottom: 30px;"></div>
    <el-row>
      <!-- 添加角色 -->
      <!--<el-button type="primary" icon="el-icon-plus" size="mini" @click="handleCreate" v-perm="'b:user:add'">{{textMap.create}}</el-button>-->
      <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleCreate">{{textMap.create}}</el-button>

      <!--<el-button type="primary" icon="el-icon-delete" size="mini" @click="handleDelete(null, null)" v-perm="'b:user:delete'">{{textMap.delete}}</el-button>-->
      <el-button type="primary" icon="el-icon-delete" size="mini" @click="handleDelete(null)">{{textMap.delete}}
      </el-button>
    </el-row>
    <div style="margin-bottom: 30px;"></div>
    <!--列表-->
    <!--highlight-current-row：设置选中高光； border fit：设置边框 -->
    <el-table ref="table"
              style="width: 100%"
              v-loading.body="tableLoading"
              element-loading-text="加载中"
              :data="tableData"
              @selection-change="handleSelectionChange"
              border fit
              highlight-current-row>
      <!--复选框-->
      <el-table-column type="selection" width="50" align="center" v-model="ids"  :selectable='selectInit'/>
      <el-table-column prop="id" label="角色id" align="center"/>
      <el-table-column prop="name" label="角色昵称" align="center"></el-table-column>
      <el-table-column prop="remarks" label="说明" align="center"></el-table-column>
      <el-table-column label="创建时间" align="center">
        <template slot-scope="scope"><span v-text="parseTime(scope.row.createDate)"></span></template>
      </el-table-column>
      <el-table-column label="更新时间" align="center">
        <template slot-scope="scope"><span v-text="parseTime(scope.row.updateDate)"></span></template>
      </el-table-column>
      <el-table-column label="是否可用" align="center">
        <!--template：自定义列模板，通过 Scoped slot 可以获取到 row, column, $index 和 store（table 内部的状态管理）的数据，用法参考 demo。-->
        <template slot-scope="scope">
          <el-tag size="medium" type="danger" v-if="scope.row.useable == 1">已启用</el-tag>
          <el-tag size="medium" type="success" v-else>启用</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-tooltip content="编辑" placement="top" type="expand" v-if="scope.row.isSys != 1">
            <el-button @click="handleUpdate(scope.$index,scope.row)" size="medium" type="info" icon="el-icon-edit"
                       circle plain/>
          </el-tooltip>
          <!--<el-tooltip content="修改角色" placement="top" v-if="!hasAdminRole(scope.row)">-->
          <!--<el-button @click="handleUpdateUserRoles(scope.$index,scope.row)" size="medium" type="warning" icon="el-icon-star-off" circle plain />-->
          <!--</el-tooltip>-->
          <el-tooltip content="删除" placement="top" v-if="scope.row.isSys != 1">
            <el-button @click="handleDelete(scope.row)" size="medium" type="danger" icon="el-icon-delete" circle plain/>
          </el-tooltip>
          <!--如果是系统数据则无法变更-->
          <el-popover trigger="hover" placement="top" v-else style="display: inline-block;">
            <el-alert type="warning" :closable="false" title="系统数据说明">
              <div>系统数据不允许变更</div>
            </el-alert>
            <div slot="reference">
              <el-tag style="margin-left: 10px;" type="info">系统数据</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
    </el-table>
    <div style="margin-bottom: 30px;"></div>

    <!--弹出窗口：新增/编辑用户-->
    <!--:visible.sync 控制 dialog 是否显示-->
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible" width="50%">
      <el-form :rules="rules" ref="dataForm" :model="roleModel" label-position="left" label-width="80px" size="mini">
        <el-row>
          <el-col :span="15">
            <el-form-item label="昵称" prop="name">
              <el-col :span="20">
                <el-input v-model="roleModel.name"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="角色说明" porp="remarks">
              <el-col :span="20">
                <el-input type="textarea" v-model="roleModel.remarks"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="是否启用">
              <el-radio-group v-model="roleModel.useable">
                <el-radio :label="1">是</el-radio>
                <el-radio :label="2">否</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <!--组件权限树-->
            <el-form-item label="组件权限">
              <el-tree
                ref="createRolesTree"
                class="filter-tree"
                show-checkbox
                :data="treeDate"
                :props="treeProps"
                default-expand-all
                node-key="id"
                :default-checked-keys="roleModel.perms"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <!--接口权限数-->
            <el-form-item label="接口权限" :span="12">
              <el-tree
                ref="createRolesTreeInterface"
                class="filter-tree"
                show-checkbox
                :data="treeDateInterface"
                :props="treeProps"
                default-expand-all
                node-key="id"
                :default-checked-keys="roleModel.perms"/>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <!--关闭弹出框-->
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus=='create'" type="primary" @click="createData">创建</el-button>
        <el-button v-else type="primary" @click="updateData">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import roleApi from '@/api/role'
  import permApi from '@/api/perm'
  import {parseTime, resetTemp} from '@/utils'
  import {root, CodeType} from '@/utils/constants'
  import role from "../../../api/role";

  export default {
    name: 'RoleManage',
    data() {
      let validateName = (rule, value, callback) => { //验证Name
        // if (this.dialogStatus == 'create' && value === '') {
        if (value === '') {
          callback(new Error('必填'));
        } else {
          callback();
        }
      };
      return {
        //测试数据roles
        textMap: {
          update: '编辑角色',
          create: '创建角色',
          delete: '删除角色',
        },
        treeDate: [],  //组件权限树的数据源
        treeDateInterface: [], //接口权限树的数据
        treeProps: {    //树带的架构参数
          children: 'children',
          label: 'label'
        },
        roleModel: {    //角色模型
          id: '',
          name: '',
          remarks: '',
          useable: null,   //默认为1
          perms: []
        },
        parseTime: parseTime,    //格式化时间方法
        tableLoading: false,    //是否正在读取图标
        tableData: [],          //表格数据
        ids: [],                //复选款选中的数据
        //弹窗状态
        dialogStatus: '',
        //弹窗开关
        dialogFormVisible: false,
        rules: {                //校验规则
          name: [{validator: validateName, trigger: 'blur'}],
        },
      }
    },
    created() {
      this.getData()
    },
    methods: {
      //初始化表格数据
      getData() {
        this.tableLoading = true        //开始加载状态
        roleApi.queryRole().then(res => {
          this.tableData = res.data.page;
          this.tableLoading = false  // 结束加载状态
        })
      },
      //初始化表格，系统数据不可选
      selectInit(row){
        if(row.isSys != 1){
          return true  //不可勾选
        }else{
          return false  //可勾选
        }
      },
      //弹出创建窗口
      handleCreate() {
        //清除对象属性
        this.roleModel.name = '', this.roleModel.remarks = '', this.roleModel.useable = 1, this.roleModel.perms = [];
        this.dialogStatus = 'create'; //对话框状态设置为创建
        this.dialogFormVisible = true //打开弹框
        permApi.queryPerm({permType: '1,2'}).then((res) => {    //获取Tree数据，只获取菜单和按钮
          if (res.data.code == CodeType.DEFAULT_SUCC_CODE) {
            this.treeDate = res.data.data;
          }
        })
        permApi.queryPerm({permType: '3'}).then((res) => {    //获取Tree数据，只获取菜单和按钮
          if (res.data.code == CodeType.DEFAULT_SUCC_CODE) {
            this.treeDateInterface = res.data.data;
          }
        })
        this.$nextTick(() => {        //立刻更新DOM
          //获取dataForm节点
          this.$refs['dataForm'].clearValidate()
        })
      },
      //弹出编辑窗口
      handleUpdate(scop, row) {
        //获取该角色的数据
        this.roleModel.id = row.id;
        this.roleModel.name = row.name, this.roleModel.remarks = row.remarks, this.roleModel.useable = row.useable;
        this.dialogStatus = 'update'; //对话框状态设置为创建
        permApi.queryPerm({permType: '1,2'}).then((result) => {    //获取Tree数据，只获取菜单和按钮
          if (result.data.code == CodeType.DEFAULT_SUCC_CODE) {
            this.treeDate = result.data.data;
          }
        })
        permApi.queryPerm({permType: '3'}).then((result) => {     //获取Tree数据，只获取菜单和按钮
          if (result.data.code == CodeType.DEFAULT_SUCC_CODE) {
            this.treeDateInterface = result.data.data;
          }
        })
        roleApi.queryPermIdsByRoleId({roleId: row.id}).then((result) => {  //获取角色基本信息
          if (result.data.code == CodeType.DEFAULT_SUCC_CODE) {
            this.roleModel.perms = result.data.data;
          }
        })
        this.$nextTick(() => {        //立刻更新DOM
          //获取dataForm节点
          this.$refs['dataForm'].clearValidate()
        })
        this.dialogFormVisible = true //打开弹框
      },
      //复选款选中用户
      handleSelectionChange(val) {
        this.ids = val.map((item) => {
          return item.id
        })
      },
      //新建角色
      createData() {
        this.$refs['dataForm'].validate((valid) => {
          if (!valid) return;
          let treeNode = this.$refs.createRolesTree.getCheckedNodes();                         //获取组件权限树中选中节点数据
          this.roleModel.perms = treeNode.map(value => {
            return value.id
          })
          let treeNodeInterface = this.$refs.createRolesTreeInterface.getCheckedNodes();
          this.roleModel.perms = this.roleModel.perms.concat(treeNodeInterface.map(value => {  //加上接口权限树中选中节点数据
            return value.id
          }))
          roleApi.addRole(this.roleModel).then((res) => {
            if (res.data.code == CodeType.DEFAULT_SUCC_CODE) {
              this.$message.success(res.data.msg)
            } else {
              this.$message.error(res.data.msg)
            }
            this.dialogFormVisible = false  //关闭对话框验证
            this.getData()
          })
        })
      },
      //更新角色
      updateData() {
        this.$refs['dataForm'].validate((valid) => {
          if (!valid) return;
          //获取组件权限树中选中节点数据
          let treeNode = this.$refs.createRolesTree.getCheckedNodes();
          this.roleModel.perms = treeNode.map(value => {
            return value.id
          })
          //加上接口权限树中选中节点数据
          let treeNodeInterface = this.$refs.createRolesTreeInterface.getCheckedNodes();
          this.roleModel.perms = this.roleModel.perms.concat(treeNodeInterface.map(value => {
            return value.id
          }))
          roleApi.updateRole(this.roleModel).then((res) => {
            if (res.data.code == CodeType.DEFAULT_SUCC_CODE) {
              this.$message.success(res.data.msg)
            } else {
              this.$message.error(res.data.msg)
            }
            this.dialogFormVisible = false  //关闭对话框验证
            this.getData()
          })
        })
      },
      //删除数据
      handleDelete(row) {
        this.$confirm("您确认要永久删除吗?", "提示", confirm).then(() => {
          let data = null;
          if (!row) {
            data = {ids: this.ids, isBatch: true}
          } else {
            data = {id: row.id, isBatch: false}
          }
          roleApi.deleteRole(data).then(response => {
            if(response.data.code == 200) {
              this.$message.success(response.data.msg)
            } else {
              this.$message.error(response.data.msg)
            }
            this.getData()
          })
        }).catch(() => {
          this.$message.info("已取消删除")
        })
      },
      //判断是否是管理员
      hasAdminRole(row) {
        if (row && row.roleList)
          return row.roleList.some(role => role.val == root.val)
      },
    }
  }
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

</style>

