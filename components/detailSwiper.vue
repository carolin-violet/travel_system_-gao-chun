<template>
<!--  我的轮播图组件，第一张和最后一张都是一样的-->
  <div class="w-full h-full overflow-x-hidden">
    <div class="image-container h-full">
      <img src="/固城湖.webp" alt="" class="w-1/5 h-full object-cover float-left">
      <img src="/高淳老街.jpg" alt="" class="w-1/5 h-full object-cover float-left ">
      <img src="/高淳老街.jpg" alt="" class="w-1/5 h-full object-cover float-left ">
      <img src="/高淳老街.jpg" alt="" class="w-1/5 h-full object-cover float-left">
      <img src="/固城湖.webp" alt="" class="w-1/5 h-full object-cover float-left">
    </div>
  </div>
</template>

<script>
export default {
  name: "detailSwiper"
}
</script>

<style scoped>
.image-container{
  width: calc(100% * 5);
  animation: swiper 10s infinite;
}

@keyframes swiper {
  0%{transform: translateX(0)}
  10%{transform: translateX(0)}
  25%{transform: translateX(-20%)}
  35%{transform: translateX(-20%)}
  50%{transform: translateX(-40%)}
  60%{transform: translateX(-40%)}
  75%{transform: translateX(-60%)}
  85%{transform: translateX(-60%)}
  100%{transform: translateX(-80%)}
}

</style>
