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
    <!-- 添加用户 -->
      <!--<el-button type="primary" icon="el-icon-plus" size="mini" @click="handleCreate" v-perm="'b:user:add'">{{textMap.create}}</el-button>-->
      <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleCreate">{{textMap.create}}</el-button>

      <!--<el-button type="primary" icon="el-icon-delete" size="mini" @click="handleDelete(null, null)" v-perm="'b:user:delete'">{{textMap.delete}}</el-button>-->
      <el-button type="primary" icon="el-icon-delete" size="mini" @click="handleDelete(null, null)">{{textMap.delete}}</el-button>
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
      <el-table-column type="selection" width="50" align="center" v-model="ids"/>
      <el-table-column prop="id" label="用户id" align="center"/>
      <el-table-column prop="loginName" label="登陆账号" align="center"></el-table-column>
      <el-table-column prop="name" label="昵称" align="center"></el-table-column>
      <el-table-column label="角色" align="center">
        <!--template：自定义列模板，通过 Scoped slot 可以获取到 row, column, $index 和 store（table 内部的状态管理）的数据，用法参考 demo。-->
        <template slot-scope="scope">
          <!--<el-tag size="medium">{{ scope.row.roles }}</el-tag>-->
          <el-tag style="margin: 2px;" v-for="role in scope.row.roles" :key="role.id">{{role.name}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center">
        <template slot-scope="scope"><span v-text="parseTime(scope.row.createDate)"></span></template>
      </el-table-column>
      <el-table-column label="更新时间" align="center">
        <template slot-scope="scope"><span v-text="parseTime(scope.row.updateDate)"></span></template>
      </el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-tooltip content="查看" placement="top">
            <el-button @click="handleCheck(scope.row)" size="medium" type="primary" icon="el-icon-more-outline" circle plain />
          </el-tooltip>
          <el-tooltip content="编辑" placement="top" type="expand">
            <el-button @click="handleUpdate(scope.$index,scope.row)" size="medium" type="info" icon="el-icon-edit" circle plain />
          </el-tooltip>
          <!--<el-tooltip content="修改角色" placement="top" v-if="!hasAdminRole(scope.row)">-->
          <!--<el-button @click="handleUpdateUserRoles(scope.$index,scope.row)" size="medium" type="warning" icon="el-icon-star-off" circle plain />-->
          <!--</el-tooltip>-->
          <el-tooltip content="删除" placement="top" v-if="!hasAdminRole(scope.row)">
            <el-button @click="handleDelete(scope.row)" size="medium" type="danger" icon="el-icon-delete" circle plain />
          </el-tooltip>
          <!--如果是管理员则无法删除-->
          <el-popover trigger="hover" placement="top" v-else style="display: inline-block;">
            <el-alert type="warning" :closable="false" title="权限说明">
              <div>为保证管理员在系统中的最高权限</div>
              <div>不允许编辑管理员自身的角色</div>
              <div>不允许删除管理员账号</div>
            </el-alert>
            <div slot="reference">
              <el-tag style="margin-left: 10px;" type="info">权限说明</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>
      <!-- 查看详情 -->
      <el-table-column type="expand" width="1">
        <template slot-scope="props">
          <el-form label-position="left">
            <div class="el-col-4">
              <el-form-item style="align-content: center">
                <img style="height: 100px; width: 100px" :src="props.row.avatar==null ?  '/static/img/icon/avator.gif': props.row.avatar">
              </el-form-item>
            </div>
            <div class="el-col-20">
              <div class="el-row">
                <div class="el-col-8">
                  <el-form-item label="性别:">
                    <span>{{ props.row.gender == 1 ? "男" : "女"}}</span>
                  </el-form-item>
                </div>
                <div class="el-col-8">
                  <el-form-item  label="邮箱:" class="item">
                    <span>{{ props.row.email}}</span>
                  </el-form-item>
                </div>
                <div class="el-col-8">
                  <el-form-item  label="手机号码:" class="item">
                    <span>{{ props.row.phone }}</span>
                  </el-form-item>
                </div>
              </div>
              <div class="el-row">
                <div class="el-col-8">
                  <el-form-item label="用户类型:">
                    <span>{{ props.row.category }}</span>
                  </el-form-item>
                </div>
                <el-form-item label="备注:">
                  <textarea style="height: 45px; width: 300px" disabled="false">{{props.row.remarks}}</textarea>
                </el-form-item>
              </div>
            </div>
          </el-form>
        </template>
      </el-table-column>
    </el-table>
    <div style="margin-bottom: 30px;"></div>

    <!--弹出窗口：新增/编辑用户-->
    <!--:visible.sync 控制 dialog 是否显示-->
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible"  width="60%" :close-on-click-modal="false">
      <el-form :rules="rules" ref="dataForm" :model="userModel" label-position="left" label-width="80px" size="mini">
        <el-row>
          <el-col :span="10">
            <el-form-item label="登录名" prop="loginName" v-if="dialogStatus=='create'">
              <el-col :span="20">
                <el-input v-model="userModel.loginName"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="昵称" prop="name">
              <el-col :span="20">
                <el-input v-model="userModel.name"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-col :span="20">
                <el-input type="password" v-model="userModel.password"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="性别">
              <el-radio-group v-model="userModel.gender">
                <el-radio :label="1">男</el-radio>
                <el-radio :label="2">女</el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-col :span="20">
                <el-input v-model="userModel.email"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="手机号码" prop="phone">
              <el-col :span="20">
                <el-input v-model="userModel.phone"></el-input>
              </el-col>
            </el-form-item>
            <!--<el-form-item label="用户类型" prop="userType">-->
              <!--<el-input v-model="userModel.userType"></el-input>-->
            <!--</el-form-item>-->
            <el-form-item label="是否可用">
              <el-radio-group v-model="userModel.loginFlag">
                <el-radio :label="1">是</el-radio>
                <el-radio :label="0">否</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="14">
            <el-form-item label="角色">
              <template>
                <el-checkbox-group v-model="userModel.roleArray">
                  <el-checkbox v-for="item in roles" :label="item.id" :key="item.id">
                    {{item.roleName}}
                  </el-checkbox>
                </el-checkbox-group>
              </template>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <!--关闭弹出框-->
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button v-if="dialogStatus=='create'" type="primary" @click="saveData()">创建</el-button>
        <el-button v-else type="primary" @click="saveData()">确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import userApi from '@/api/user'
  import roleApi from '@/api/role'
  import {parseTime, resetTemp} from '@/utils'
  import {root} from '@/utils/constants'

  export default {
    name: 'UserManage',
    data() {
      let validateLoginName = (rule, value, callback) => {
        if (this.dialogStatus == 'create' && (value == null || value == '')) {
          callback(new Error('必填'));
        } else {
          callback();
        }
      };

      let validatePassword = (rule, value, callback) => {
        if (value == null || value == '') {
          callback(new Error('请输入密码'));
        } else {
          callback();
        }
      };
      return {
        textMap: {
          update: '编辑用户',
          create: '创建用户',
          delete: '删除用户',
        },
        //格式化时间方法
        parseTime: parseTime,
        //正在读取图标
        tableLoading: false,
        //列表数据
        tableData: [],
        ids: [],            //tableData复选款id中的下标
        roles: [],          //可选的角色数据
        userModel: {        //表单对象
          id: null,
          loginName: null,  //用户账号
          password: null,   //密码
          name: null,       //用户姓名
          gender: 1,        //用户性别
          email: null,      //邮箱
          phone: null,      //手机
          userType: null,   //用户类型
          loginFlag: 1,     //是否可登陆
          roleArray: [],        //角色
        },
        // 校验
        rules: {
          loginName: [{validator: validateLoginName, trigger: 'blur'}],
          password: [{validator: validatePassword, trigger: 'blur'}],
        },
        //弹窗状态
        dialogStatus: '',
        //弹窗开关
        dialogFormVisible: false,
      }
    },
    created() {
      this.initRoleData()
      this.getData()
    },
    methods: {
      //复选款选中用户
      handleSelectionChange(val){
        this.ids = val.map((item) => {
          return item.id
        })
      },
      initRoleData() {
        //获取角色数据
        roleApi.queryRole().then(response => {
          let  ls_role = []
          for (let index in response.data.page) {
            ls_role.push({id: response.data.page[index].id, roleName: response.data.page[index].name})
          }
          this.roles = ls_role;
        })
      },
      hasAdminRole(row) {
        if (row && row.roleList)
          return row.roleList.some(role => role.val == root.val)
      },
      //打开创建窗口
      handleCreate() {
        //清除对象所有属性
        this.cleanDialog();
        //对话框状态设置为创建
        this.dialogStatus = 'create'
        this.$nextTick(() => {
          //获取dataForm节点
          this.$refs['dataForm'].clearValidate()
        })
        this.dialogFormVisible = true
      },
      //打开更新弹框
      handleUpdate(scope,row){
        this.userModel = {
          id: row.id,
          loginName: row.loginName, //用户账号
          password: row.password,   //密码
          name: row.name,           //用户姓名
          gender: row.gender,       //性别
          email: row.email,         //邮箱
          phone: row.phone,         //手机
          loginFlag: row.loginFlag, //是否可登陆
          roleArray: row.roles.map(e=>{return e.id})  //角色
        }
        //对话框状态设置为创建
        this.dialogStatus = 'update'
        this.$nextTick(() => {
          //获取dataForm节点
          this.$refs['dataForm'].clearValidate()
        })
        this.dialogFormVisible = true
      },
      //保存数据
      saveData() {
        this.$refs['dataForm'].validate((valid) => {
          if (!valid) return;
          userApi.saveUser(this.userModel).then((response) => {
            if (response.data.code == 200) {
              this.getData()
              this.dialogFormVisible = false
              this.$message.success(response.data.msg)
            } else {
              this.$message.error("")
            }
          })
        })
      },
      //初始化表格数据
      getData() {
        //开始加载表格
        this.tableLoading = true
        userApi.queryUser().then(res => {
          this.tableData = res.data.page;
          //结束加载
          this.tableLoading = false
        })
      },
      //打开用户下拉
      handleCheck(row) {
        const $table = this.$refs.table
        $table.toggleRowSelection(row)
        this.tableData.map((item) => {
          if (row.id != item.id) {
            $table.toggleRowExpansion(item, false)
          }
        })
        $table.toggleRowExpansion(row)
      },
      //删除数据
      handleDelete(row){
        this.$confirm("您确认要永久删除用户吗?", "提示", confirm).then(() => {
          if (!row){
            if(this.ids == null || this.ids.length == 0){
              this.$message.warning("请选择")
              return;
            }
            userApi.deleteUser({id: this.ids, isBatch: true}).then(res => {
              this.dialogFormVisible = false
              this.$message.success("删除成功")
              this.getData()
            })
          } else {
            userApi.deleteUser({id: row.id, isBatch: false}).then(res => {
              this.dialogFormVisible = false
              this.$message.success("删除成功")
              this.getData()
            })
          }
        }).catch(() => {
        // this.$message.info("已取消删除")
        })
      },

      cleanDialog(){
        this.userModel =  {        //表单对象
          id: null,
          loginName: null,  //用户账号
          password: null,   //密码
          name: null,       //用户姓名
          gender: 1,        //用户性别
          email: null,      //邮箱
          phone: null,      //手机
          userType: null,   //用户类型
          loginFlag: 1,     //是否可登陆
          roleArray: [],    //角色
        }
      }
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

