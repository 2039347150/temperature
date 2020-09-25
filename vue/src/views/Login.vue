<!-- 模板-->
<template>

  <div class="login_container">
      <vue-canvas-nest></vue-canvas-nest>
    <div class="login_box">
      <!-- 头像区 -->
      <div class="avatar_box">
        <img src='../assets/img/doger.jpg' alt />
      </div>
      <!-- 登录表单区 -->
      <el-form
        :model="loginForm"
        :rules="loginFormRules"
        ref="loginFormRef"
        label-width="0px"
        class="login_form"
      >
        <el-form-item class="login_title">
          <el-link :underline="false" type="success">打卡通道</el-link>
        </el-form-item>
        <!-- 用户名 -->
        <el-form-item prop="username">
          <el-input v-model="loginForm.username" placeholder="用户名" prefix-icon="iconfont icon-user"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            type="password"
            v-model="loginForm.password"
            placeholder="密码"
            prefix-icon="iconfont icon-3702mima"
          ></el-input>
        </el-form-item>
        <el-form-item class="btns">
          <el-button type="primary" @click="login">登录</el-button>
          <el-button type="info" @click="resetLoginForm">重置</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<!-- 行为-->
<script>
import '../hearts'
import {request} from "network/request"
 import vueCanvasNest from 'vue-canvas-nest'
export default {
    components: {
        vueCanvasNest
    },
  data() {
    return {
      //登录表单的数据绑定对象
      loginForm: {
        username: '温子晗',
        password: '123'
      },
      loginFormRules: {
        username: [
          { required: true, message: '请输入登录名!', trigger: 'blur' },
          { min: 1, max: 7, message: '长度在 3 到 7 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码!', trigger: 'blur' },
          { min: 1, max: 7, message: '长度在 6 到 11 个字符', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    resetLoginForm() {
      this.$refs.loginFormRef.resetFields()
    },
    login() {
      request({
        url:  `/login/?username=${this.loginForm.username}&password=${this.loginForm.password}`
         }).then(res=>{
           console.log('登录数据' ,res.data);
           console.log('登录状态',res.token);
           if(res.status!=='success')
           {
                return this.$message.error('登录失败!')
           }else{
            this.$message.success('登录成功!')
            window.sessionStorage.setItem('token', res.token)//将token保存到sessionStorage
            this.$router.push('/home')//编程式导航,跳转页面
           }
         }).catch(err=>{})
    }
  }
}
</script>

<!-- 样式-->
<style lang="less" scoped>
.login_container {
  background-color: #274a6c;
  height: 100%;
}
.login_box {
  width: 450px;
  height: 325px;
  background-color: #fff;
  border-radius: 7px;
  position: absolute;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
  .avatar_box {
    position: absolute;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 10px;
    border: 1px solid #eee;
    border-radius: 50%;
    height: 130px;
    width: 130px;
    box-shadow: 0 0 10px #ddd;
    background-color: #fff;
    img {
      border-radius: 50%;
      width: 100%;
      height: 100%;
      background-color: #eee;
    }
  }
}
.btns {
  display: flex;
  justify-content: flex-end; //尾部对齐
}

.login_form {
  position: absolute;
  bottom: 0;
  width: 100%;
  box-sizing: border-box;
  padding: 0 20px;

  .login_title .el-link {
    font-size: 30px;
    font-weight: 700;
    // text-shadow: 5px -3px 7px #42b983;
    color: #42b983;
  }
  .login_title {
    text-align: center;
  }
}
</style>
