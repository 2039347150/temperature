<template>
<div id="detail">
  <nav-bar class="profile-nav">
    <div slot="left" class="left">
      <img src="~assets/img/navbar/向左.svg" alt="">
    </div>
    <div slot="center">详情</div>
  </nav-bar>
  </div>
</template>

<script>
  import NavBar from "components/common/navbar/NavBar"

  export default {
    name: "Home",
    components: {
      NavBar
    }
  }
</script>

<style scoped>
  .left img{
    margin-top: 6px;
  }
  .profile-nav{
     background-color: var(--color-tint);
    color: #FFF;
  }
  #detail{
    height: 700px;
  }
</style>
