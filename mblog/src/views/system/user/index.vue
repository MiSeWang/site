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
    <!-- 添加用户 -->
    <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleCreate" v-perm="'b:user:add'">
      {{textMap.create}}
    </el-button>

    <div style="margin-bottom: 30px;"></div>
    <!--列表-->
    <!--highlight-current-row：设置选中高光； border fit：设置边框 -->
    <el-table ref="table"
              style="width: 100%"
              v-loading.body="tableLoading"
              element-loading-text="加载中"
              :data="tableData"
              border fit
              highlight-current-row>
      <!--复选框-->
      <el-table-column type="selection" width="55" align="center"/>
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
            <el-button @click="handleDelete(scope.$index,scope.row)" size="medium" type="danger" icon="el-icon-delete" circle plain />
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
                    <span>{{ props.row.sex == 1 ? "男" : "女"}}</span>
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
                  <textarea style="height: 45px; width: 300px" ></textarea>
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
    <el-dialog :title="textMap[dialogStatus]" :visible.sync="dialogFormVisible">
      <el-form :rules="rules" ref="dataForm" :model="temp" label-position="left" label-width="80px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="登录名" prop="loginName" v-if="dialogStatus=='create'">
              <el-col :span="20">
                <el-input v-model="temp.loginName"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="昵称" prop="name">
              <el-col :span="20">
                <el-input v-model="temp.name"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="密码" prop="password">
              <el-col :span="20">
                <el-input type="password" v-model="temp.password"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="确认密码" prop="password2">
              <el-col :span="20">
                <el-input type="password" v-model="temp.password2"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="性别" v-model="temp.sex" prop="sex">
              <el-radio label="男" content="1"></el-radio>
              <el-radio label="女" content="2"></el-radio>
            </el-form-item>
            <el-form-item label="邮箱" prop="email">
              <el-col :span="20">
                <el-input v-model="temp.email"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="手机号码" prop="phone">
              <el-col :span="20">
                <el-input v-model="temp.phone"></el-input>
              </el-col>
            </el-form-item>
            <el-form-item label="用户类型" prop="phone">
              <el-input v-model="temp.userType"></el-input>
            </el-form-item>
            <el-form-item label="是否可用" prop="phone" v-model="temp.loginFlag">
              <el-radio label="是" content="1"></el-radio>
              <el-radio label="否" content="2"></el-radio>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="角色">
              <template>
                <el-checkbox-group v-model="roles" @change="handleCheckedRoleChange">
                  <el-checkbox v-for="item in rolesTest" :label="item.id" :key="item.id">{{item.roleName}}</el-checkbox>
                </el-checkbox-group>
              </template>
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
  import userApi from '@/api/user'
  import {parseTime, resetTemp} from '@/utils'
  import {root} from '@/utils/constants'

  export default {
    name: 'UserManage',
    data() {
      let validateLoginName = (rule, value, callback) => {
        if (this.dialogStatus == 'create' && value === '') {
          callback(new Error('必填'));
        } else {
          callback();
        }
      };

      let validatePassword = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.temp.password2 !== '') {
            this.$refs.dataForm.validateField('password2');
          }
          callback();
        }
      };

      let validatePassword2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value != this.temp.password) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        //测试数据roles
        rolesTest: [
          {id: 1, roleName: "测试一"},
          {id: 2, roleName: "测试二"},
          {id: 3, roleName: "测试三"},
        ],
        //格式化时间方法
        parseTime: parseTime,
        //正在读取图标
        tableLoading: false,
        tableData: [],
        roles: [],          //角色
        temp: {             //表单对象
          idx: null,        //tableData中的下标
          id: null,
          loginName: null,  //用户账号
          name: null,       //用户姓名
          sex: null,        //用户性别
          email: null,      //邮箱
          phone: null,      //手机
          userType: null,   //用户类型
          loginFlag: null,  //是否可登陆
          password: null,   //密码
          password2: null,
          createDate: null,
          updateDate: null,
          roles: null       //用户角色
        },
        textMap: {
          update: '编辑用户',
          create: '创建用户'
        },
        // 校验
        rules: {
          loginName: [{validator: validateLoginName, trigger: 'blur'}],
          password: [{validator: validatePassword, trigger: 'blur'}],
          password2: [{validator: validatePassword2, trigger: 'change'}]
        },
        dialogStatus: '',
        dialogFormVisible: false,
      }
    },
    created() {
      this.initData()
      this.fetchData()
    },
    methods: {
      //角色复选框值复制到tem中
      handleCheckedRoleChange(value) {
        this.temp.roles = this.roles;
        console.log(this.temp)
        // let checkedCount = value.length;
        // this.checkAll = checkedCount === this.rolesTest.length;
        // this.isIndeterminate = checkedCount > 0 && checkedCount < this.rolesTest.length;
      },
      handleCreate() {
        //清除对象所有属性
        resetTemp(this.temp)
        //对话框状态设置为创建
        this.dialogStatus = 'create'
        //开启对话框表单验证
        this.dialogFormVisible = true
        this.$nextTick(() => {
          //获取dataForm节点
          this.$refs['dataForm'].clearValidate()
        })
      },
      initData() {

      },

      hasAdminRole(row) {
        if (row && row.roleList)
          return row.roleList.some(role => role.val == root.val)
      },
      createData() {
        this.$refs['dataForm'].validate((valid) => {
          if (!valid) return;
          userApi.addUser(this.temp).then((res) => {
            this.temp.id = res.data.id;                 //后台传回来新增记录的id
            this.temp.createDate = res.date.createDate; //后台传回来新增记录的时间
            this.temp.rolesList = [];
            this.tableData.unshift(Object.assign({}, this.temp))
            // ++this.tablePage.total
            this.dialogFormVisible = false
            this.$message.success("添加成功")
          })
        })
      },
      //初始化表格数据
      fetchData() {
        //开始加载
        this.tableLoading = true
        userApi.queryUser().then(res => {
          this.tableData = res.data.page;
          //结束加载
          this.tableLoading = false
          console.log(JSON.stringify(this.tableData))
          console.log(this.tableData)
        })
      },
      //打开单行数据详情
      handleCheck(row) {
        const $table = this.$refs.table
        // $table.toggleRowExpansion(row)
        $table.toggleRowSelection(row)
        this.tableData.map((item) => {
          if (row.id != item.id) {
            $table.toggleRowExpansion(item, false)
          }
        })
        $table.toggleRowExpansion(row)
      },
      //删除数据
      handleDelete(){

      },
      //更新数据
      handleUpdate(){

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

