<template>
  <div id="login" class="login-container">
    <el-form :model="loginForm" autoComplete="on" :rules="loginRules" ref="loginForm" label-position="left"
             class="login-form">
      <h3 class="title">后台管理系统登录</h3>
      <el-form-item prop="username">
        <span class="svg-container"><svg-icon icon-class="user" className="svg-size"/></span>
        <el-input name="username" type="text" v-model="loginForm.loginName" auto-complete="on"
                  placeholder="账号"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <span class="svg-container"><svg-icon icon-class="password"/></span>
        <el-input name="password" :type="passwordType" v-model="loginForm.password" autocomplete="on"
                  @keyup.enter.native="handleLogin" placeholder="密码"/>
        <span class="show-pwd" @click="showPwd"><svg-icon icon-class="eye"/></span>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width:100%" :loading="loading" @click.native.prevent="handleLogin">登录
        </el-button>
      </el-form-item>
      <div class="tips">
        <span style="margin-right:20px;">username: admin</span>
        <span> password: admin</span>
      </div>
    </el-form>
  </div>
</template>

<script>
    import {isvalidUsername} from '@/utils/validate';

    export default {
        name: 'login',
        data() {
            const validateUsername = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入用户账号'));
                } else if (!isvalidUsername(value)) {
                    callback(new Error('请输入正确的用户帐号'));
                } else {
                    callback();
                }
            };
            const validatePassword = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else if (value.length < 6) {
                    callback(new Error('密码不能少于6个字符'));
                } else {
                    callback();
                }
            };
            return {
                loginForm: {
                    loginName: 'admin',
                    password: '123456',
                },
                loginRules: {
                    loginName: [{required: true, trigger: 'blur', validator: validateUsername}],
                    password: [{required: true, trigger: 'blur', validator: validatePassword}]
                },
                passwordType: 'password',
                loading: false,
                showDialog: false
            };
        },
        methods: {
            showPwd() {
                if (this.passwordType == 'password') {
                    this.passwordType = '';
                } else {
                    this.passwordType = 'password';
                }
            },
            handleLogin() {
                //获取表单组件绑定的 loginFrom
                this.$refs.loginForm.validate(valid => {
                    if (valid) {
                        this.loading = true;
                        this.$store.dispatch('LoginByUsername', this.loginForm).then(() => {
                            this.loading = false;
                            this.$router.push({path: '/'})
                            console.log("登陆通过");
                        }).catch((err) => {
                            console.log("错误信息:" + err)
                            this.loading = false
                        })
                    }
                })
            }
        }
    }
</script>


<style rel="stylesheet/scss" lang="scss" scoped>
  $bg: #2d3a4b;
  $dark_gray: #889aa4;
  $light_gray: #eee;
  .login-container {
    position: fixed;
    height: 100vh;
    width: 100vw;
    /*background: url(/static/img/5a13f12e79635.jpg) left top no-repeat;*/
    background-size: 100% 100%;

    .el-input {
      display: inline-block;
      line-height: 48px;
      width: 85%;
      .el-input__inner {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 12px 5px 12px 5px;
        color: $light_gray;
        height: 40px !important;
        &:-webkit-autofill {
          -webkit-box-shadow: 0 0 0px 1000px $bg inset !important;
          -webkit-text-fill-color: #fff !important;
        }
      }
    }

    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      color: #454545;
    }

    .login-form {
      position: absolute;
      left: 0;
      right: 0;
      width: 520px;
      padding: 35px 35px 15px 35px;
      margin: 25vh auto;
    }

    .tips {
      font-size: 14px;
      color: #fff;
      margin-bottom: 10px;

      span {
        &:first-of-type {
          margin-right: 16px;
        }
      }
    }

    .svg-container {
      padding: 5px 10px 5px 10px;
      color: $dark_gray;
      vertical-align: middle;
      width: 30px;
      display: inline-block;
    }

    .title {
      font-size: 26px;
      font-weight: 400;
      color: $light_gray;
      margin: 0px auto 40px auto;
      text-align: center;
      font-weight: bold;
    }

    .show-pwd {
      position: absolute;
      right: 10px;
      top: 7px;
      font-size: 16px;
      color: $dark_gray;
      cursor: pointer;
      user-select: none;
    }
  }

  .svg-size {
    font-size: 18px;
  }
</style>
