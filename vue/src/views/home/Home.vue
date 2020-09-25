<template>
  <div id="home">
    <vue-canvas-nest :config="{color:'47,135,193', zIndex: -2, count: 400, opacity: 1}"></vue-canvas-nest>
    <nav-bar class="home-nav">
      <div slot="center">主页</div>
    </nav-bar>
    <div class="justify">
      <home-item v-for="item in users" class="middle">
        <router-link :to="'/home/userinfo/'+item.id" tag="div" slot="left">
          <img :src="httpRequestUrl + item.picture" alt=""
               style="width: 60px;height: 60px;">
        </router-link>
        <div slot="center">
          <p>{{item.username}}</p>
          <p>{{item.sex}}</p>
          <p>{{item.age}}岁</p>
        </div>
        <div slot="right">
          <p>{{item.id}}</p>
<!--          <p>打卡情况：{{isChecked(item.id) ? '已打卡' : '未打卡'}}</p>-->
          <p v-if="isChecked(item.id)">打卡情况：已打卡</p>
          <p v-else>打卡情况：未打卡</p>
        </div>
      </home-item>
    </div>
  </div>
</template>

<script>
  import NavBar from "components/common/navbar/NavBar"
  import HomeItem from "./HomeItem"
  import Welcome from "./Welcome"
  import vueCanvasNest from 'vue-canvas-nest'
  import {request} from "network/request"

  export default {
    name: "Home",
    components: {
      Welcome,
      NavBar,
      HomeItem,
      vueCanvasNest
    },
    methods: {
      isChecked (id) {
        this.$store.state.students.forEach(val => {
          if (val.id == id) {
            console.log(val.isChecked)
            return val.isChecked
          }
        })
      }
    },
    data() {
      return {
        users: {},
        httpRequestUrl: 'http://127.0.0.1:3000/'
      }
    },
    mounted() {
      request({
        url: '/users'
      }).then(res => {
        console.log(res)
        this.users = res
      }).catch(err => {
        // console.log(err)
      })
    }
  }
</script>

<style scoped>
  .home-nav {
    background-color: var(--color-tint);
    color: #FFF;
  }

  .justify {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .middle {
    display: flex;
    justify-content: center;
    border: 2px solid #ccc;
    width: 40%;
    border-radius: 10px;
    margin: 10px;
    padding: 5px;
  }

</style>
