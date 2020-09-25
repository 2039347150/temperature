<template>
  <div id="home">
    <snow :active='true'></snow>
    <vue-canvas-nest :config="{color:'47,135,193', zIndex: -2, count: 400, opacity: 1}">
    </vue-canvas-nest>
    <nav-bar class="home-nav">
      <div slot="center">个人信息</div>
    </nav-bar>
    <div class="welcome">
      <welcome></welcome>
    </div>
    <el-row>
      <el-col :span="12">
        <div class="cal">
          <calender :daylist="users[0].checked_days"></calender>
        </div>
      </el-col>
      <el-col :span="12">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <img :src="httpRequestUrl + users[0].picture" alt=""
                 style="width: 60px;height: 60px;border-radius:50%;vertical-align:middle;box-shadow:0 0 5px #666;margin-right:10px">
            <span style="font-weight: 700;font-size:20px;line-height:60px">个人详情</span>
            <el-button style="float: right; " type="primary"
                       @click="submit" :disabled='token==id?false:true'>打卡
            </el-button>
          </div>
          <div class="text item">
            <el-form>
              <el-form-item label="姓名:">
                <el-input v-model="users[0].username"></el-input>
              </el-form-item>
              <el-form-item label="学号:">
                <el-input v-model="users[0].id"></el-input>
              </el-form-item>
              <el-form-item label="密码:" v-if="token == id">
                <el-input v-model="users[0].password"></el-input>
              </el-form-item>
              <el-form-item label="年龄">
                <el-input v-model="users[0].age"></el-input>
              </el-form-item>
              <el-form-item label="性别">
                <el-input v-model="users[0].sex"></el-input>
              </el-form-item>
              <el-form-item label="打卡时间">
                <el-input :value="flag? `${value}`:''"></el-input>
              </el-form-item>
              <el-form-item label="打卡情况">
                <el-input :value="isCheck ? '已打卡':'未打卡'"></el-input>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
<script>
  import '../../hearts'
  import Snow from 'vue-niege';
  import vueCanvasNest from 'vue-canvas-nest'
  import NavBar from "components/common/navbar/NavBar"
  import Calender from 'views/profile/Calender'
  import Welcome from "./Welcome"
  import {request} from "network/request"
  import dayjs from 'dayjs'
  import {L2Dwidget} from 'live2d-widget'

  export default {
    name: "Home",
    components: {
      NavBar,
      Calender,
      vueCanvasNest,
      Snow,
      Welcome
    },
    data() {
      return {
        flag: false,
        value: dayjs(new Date).format('YYYY-MM-DD'),
        dd: dayjs(new Date).format('DD'),
        users: {},
        httpRequestUrl: 'http://127.0.0.1:3000/',
        token: window.sessionStorage.getItem("token")
      }
    },
    computed: {
      isCheck() {
        if (!this.users[0].checked_days.indexOf(',')) {
          return toNumber(this.users[0].checked_days) == this.dd
        } else {
          return [this.users[0].checked_days.split(',')][0].indexOf(this.dd) !== -1
        }
      }
    },
    mounted() {
      request({
        url: `/user_query/?id=${this.id}`
      }).then(res => {
        console.log(res)
        this.users = res
      }).catch(err => {
        // console.log(err)
      })
    },
    created() {
      setTimeout(function () {
        L2Dwidget.init({
          model: {
            jsonPath: 'https://cdn.jsdelivr.net/gh/wangsrGit119/wangsr-image-bucket/L2Dwidget/live2d-widget-model-hijiki/assets/hijiki.model.json',
          }
        });
      }, 100);
    },
    methods: {
      submit() {
        if (!this.flag) {
          this.flag = true
          request({
            url: `/is_checked/?id=${this.id}&checked_time=${this.value}&checked_days=${this.users[0].checked_days}`
          }).then(res => {
            console.log(res.data);
            this.users = res.data
            // if(res.status=='success'){
            //   this.$message.success('打卡成功!')
            // }else if (res.status=='failed'){
            //   this.$message.error('打卡失败!')
            // } else {
            //   this.$message.error('请勿重复打卡!')
            // }
            if (res.status == 'err') {
              this.$message.error('请勿重复打卡!')
            } else if (res.status == 'success') {
              this.$message.success('打卡成功!')
              this.$store.getters.students.forEach(item => {
                if (item.id == this.users[0].id) {
                  item.isChecked = true
                }
              })
            } else {
              this.$message.error('打卡失败!')
            }
          }).catch(err => {
          })
        } else {
          this.$message.error('请勿重复打卡!')
          this.$store.getters.students.forEach(item => {
            if (item.id == this.users[0].id) {
              item.isChecked = true
            }
          })
        }
      }
    },
    props: ['id']
  }
</script>

<style scoped>
  .home-nav {
    background-color: var(--color-tint);
    color: #FFF;
  }

  #home {
    height: 100%;
  }

  .main {
    width: 100px;
    background-color: #ccc;
    margin: 100px auto;
    margin-bottom: 0;
  }

  .text {
    font-size: 14px;
  }

  .item {
    margin-bottom: 18px;
  }

  .clearfix:before,
  .clearfix:after {
    display: table;
    content: "";
  }

  .clearfix:after {
    clear: both
  }

  .box-card {
    width: 480px;
    margin-top: 30px;
    margin-bottom: 30px;
  }

  .el-form-item {
    margin-bottom: 0;
    line-height: 10px;
  }

  .welcome {
    margin-left: 300px;
  }

</style>
