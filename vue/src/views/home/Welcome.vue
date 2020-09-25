<template>
    <div class="wel-page" v-show="isShow==true">
      <img src="~assets/img/huanying.svg" alt="">
      <span>欢迎回来，今天打卡了吗</span>
      <p @click="isShow=!isShow">
        <router-link tag="button" to="/home">知道啦！</router-link>
      </p>
    </div>
</template>
<script>
export default {
    name:'Welcome',
    data(){
        return {
            isShow:true
        }
    }
}
</script>
<style scoped>
    img{
        font-size:24px;
        width:60px;
        height:60px;
        color:skyblue;
    }
    .wel-page{
        position:fixed;
        padding:20px;
        line-height:30px;
        /* border:1px solid red; */
    }
    p{
        margin-top:10px;
        margin-left:180px;
    }
    button{
        padding:8px 15px;
        border-radius:8px;
        border:none;
        outline:none;
        background-color:rgba(42, 164, 201, 0.3);
        cursor:pointer;
    }
</style>
