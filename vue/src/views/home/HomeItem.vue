<template>
  <div id="homeItem">
    <div>
      <slot name="left">left</slot>
    </div>
    <div>
      <slot name="center">center</slot>
    </div>
    <div>
      <slot name="right">right</slot>
    </div>
  </div>
</template>
<script>
  export default {
    name: "HomeItem"
  }
</script>

<style scoped>
  #homeItem {
    display: flex;
    margin-top: 10px;
  }
  #homeItem div:first-child {
    width: 100px;
    margin:0 10px 0 5px;
  }
  #homeItem div:first-child img {
    width: 100%;
    border-radius: 20px;
  }
</style>
