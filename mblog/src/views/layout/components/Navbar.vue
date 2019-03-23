<template>
  <el-menu class="navbar" mode="horizontal">
    <!-- 收放菜单栏 -->
    <v-hamburger class="hamburger-container" :toggleClick="toggleSideBar" :isActive="sidebar.opened"></v-hamburger>
    <!-- 面包屑 -->
    <v-breadcrumb class="breadcrumb-container"></v-breadcrumb>
    <div class="right-menu">
      <v-errorLog class="errLog-container right-menu-item"></v-errorLog>
      <div style="display: inline-block;">
        <span>用户名：</span><el-tag style="margin-right: 20px;">{{name}}</el-tag>
        <span>角色：</span>
        <el-tag style="margin-right: 5px;" type="danger" v-if="roles.length==0" >游客（未配置任何角色）</el-tag>
        <el-tag style="margin-right: 5px;" type="success" v-else v-for="r in roles" :key="r.val">{{r.name}}</el-tag>
      </div>
      <el-dropdown class="avatar-container right-menu-item" trigger="click">
        <div class="avatar-wrapper">
          <img class="user-avatar" :src="avatar">
          <i class="el-icon-caret-bottom"></i>
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/">
            <el-dropdown-item>首页</el-dropdown-item>
          </router-link>
          <el-dropdown-item>
            <span @click="handleUpdatePwd" style="display:block;">修改密码</span>
          </el-dropdown-item>
          <el-dropdown-item divided>
            <span @click="logout" style="display:block;">退出</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
    <!--弹出窗口：修改密码-->
    <el-dialog title="修改密码" :visible.sync="dialogVisible" width="20%">
      <el-form :rules="rules" ref="dataForm" :model="temp" label-position="left" label-width="120px">
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="temp.password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码" prop="password2">
          <el-input type="password" v-model="temp.password2"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" >确定</el-button>
      </div>
    </el-dialog>
  </el-menu>
</template>
<script>
  import { mapGetters } from 'vuex';
  import Breadcrumb from "@/components/Breadcrumb";
  import Hamburger from "@/components/Hamburger";
  import ErrorLog from '@/components/ErrorLog'

  export default {
    data() {
      return {
        dialogVisible: false,
        temp: {
          password: null,
          password2: null
        },
        rules:{
          password:[{validator: validatePass, trigger: 'blur'}],
          password2:[{validator: validatePass2, trigger: 'change'}]
        }
      }
      //定义一个validate
      let validatePass = (rule, value, callback) => {
        //当第一个输入框为空
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          //当第二个输入框不为空
          if (this.temp.password2 !== '') {
            //调用另一个validate
            this.$refs.dataForm.validateField('password2');
          }
        }
        callback();
      };
      //定义一个validate
      let validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value != this.temp.password) {
          callback(new Error('两次输入密码不一致!'));
        }
        callback();
      };
    },
    methods: {
      //收放菜单栏
      toggleSideBar() {
        this.$store.dispatch('toggleSideBar')
      },
      //收放修改密码框
      handleUpdatePwd(){
        this.dialogVisible = true
        this.$nextTick(() => this.$refs['dataForm'].clearValidate())
      },
      updatePwd(){
        // this.$refs['dataForm'].validate((valid) => {
        //   if (!valid) return
        //   const tempData = Object.assign({}, this.temp)//copy obj
        //   userApi.updatePwd(tempData).then(res => {
        //     this.dialogVisible = false
        //     this.$message.success("更新密码成功")
        //   })
        // })
      },
      logout() {
        this.$store.dispatch('Logout').then(() => {
          location.reload()//为了重新实例化vue-router对象以避免bug
        })
      },
    },
    components: {
      'v-breadcrumb' : Breadcrumb,
      'v-hamburger' : Hamburger,
      'v-errorLog' : ErrorLog,
    },
    //sidebar:获取全局中的侧面兰状态 name:从全局中获取当前用户名 roles:获取当前用户的角色
    computed: {
      ...mapGetters([
        'sidebar',
        'name',
        'avatar',
        'roles',
      ])
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
  .navbar {
    height: 50px;
    line-height: 50px;
    border-radius: 0px !important;
    .hamburger-container {
      line-height: 58px;
      height: 50px;
      float: left;
      padding: 0 10px;
    }
    .breadcrumb-container{
      float: left;
    }
    .errLog-container {
      display: inline-block;
      vertical-align: top;
    }
    .right-menu {
      float: right;
      height: 100%;
      &:focus{
        outline: none;
      }
      .right-menu-item {
        display: inline-block;
        margin: 0 8px;
      }
      .screenfull {
        height: 20px;
      }
      .international{
        vertical-align: top;
      }
      .theme-switch {
        vertical-align: 15px;
      }
      .avatar-container {
        height: 50px;
        margin-right: 30px;
        .avatar-wrapper {
          cursor: pointer;
          margin-top: 5px;
          position: relative;
          .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 10px;
          }
          .el-icon-caret-bottom {
            position: absolute;
            right: -20px;
            top: 25px;
            font-size: 12px;
          }
        }
      }
    }
  }
</style>
