<template>
  <div id="app">
    <router-view></router-view>
    <!-- <main-tab-bar></main-tab-bar> -->
  </div>
</template>

<script>
import MainTabBar from "./components/content/mainTabbar/MainTabBar"

export default {
  name: 'App',
  components: {
    MainTabBar
  }
}
</script>

<style>
  @import "assets/css/base.css";
  .vue-particle-line .canvas[data-v-06727b55]{
    z-index: -1;
  }
</style>
