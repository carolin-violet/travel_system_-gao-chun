<template>
<!--  一个折叠面板-->
  <div class="w-full h-auto shadow-2xl">
<!--    显示部分-->
    <section class="w-full h-36 bg-white text-3xl space-x-16 transition-all duration-500 hover:bg-indigo-400 transform hover:scale-y-105 hover:text-white" @click="route.showContent = !route.showContent">
      <div class="route-title relative float-left w-1/4 h-full pt-4 pl-4">
        <span>{{route.title}}</span>
      </div>
      <div class="float-left w-2/3 h-full overflow-scroll pt-4">
        <span>{{route.reason}}</span>
      </div>
    </section>
<!--    隐藏部分-->
    <section class="hidden-content w-full h-auto bg-white rounded-b-xl pb-6 pl-4 pt-4" v-show="route.showContent">
      <div class="" v-for="site in route.siteList" :key="site.sort">
        <div class="space-x-5 text-3xl">
          <i class="iconfont icon-flag text-4xl"></i>
          <span>{{site.site}}</span>
          <span>{{site.startTime}}—{{site.endTime}}</span>
        </div>
        <div class="w-4/5 ml-16 text-2xl">详情：{{site.description}}</div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: "collapse",
  props: ['route'],
  data() {
    return {
    }
  }
}
</script>

<style scoped>

.route-title::after{
  content: "";
  position: absolute;
  top: 50%;
  right: 0;
  width: 3px;
  height: 80%;
  transform: translateY(-50%);
  background-color: #a5b4fc;
}

.hidden-content{
  border-top: 1px solid #a5b4fc;
}
</style>
