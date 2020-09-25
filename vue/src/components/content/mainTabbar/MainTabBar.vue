<template>
  <tab-bar>
    <tab-bar-item path="/home" activeColor="#00adb5">
      <img slot="item-icon" src="~assets/img/tabbar/防疫.svg" alt="">
      <img slot="item-icon-active" src="~assets/img/tabbar/防疫_active.svg" alt="">
      <div slot="item-text">主页</div>
    </tab-bar-item>
    <tab-bar-item path="/profile" activeColor="#00adb5">
      <img slot="item-icon" src="~assets/img/tabbar/体温计.svg" alt="">
      <img slot="item-icon-active" src="~assets/img/tabbar/体温计_active.svg" alt="">
      <div slot="item-text">详情</div>
    </tab-bar-item>
  </tab-bar>
</template>

<script>
  import TabBar from "components/common/tabbar/TabBar"
  import TabBarItem from "components/common/tabbar/TabBarItem"

  export default {
    name: "MainTabBar",
    components: {
      TabBar,
      TabBarItem
    }
  }
</script>

<style scoped>

</style>
