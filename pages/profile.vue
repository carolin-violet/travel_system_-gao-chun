<template>
  <div class="relative w-full min-h-screen bg-indigo-300 z-30">
<!--    主体部分-->
    <section class="w-2/3 absolute top-48 left-0 right-0 mx-auto flex rounded-2xl shadow-2xl" style="min-height: 600px">
<!--      左边侧边栏-->
      <aside class="text-left bg-gray-100 rounded-l-2xl" style="width: 150px">
        <div class="border-b-2" style="height: 48px; line-height: 48px; padding-left: 30px">
          <span class="text-gray-400 text-xl">个人中心</span>
        </div>
        <div class="cursor-pointer" style="height: 48px; line-height: 48px; padding-left: 30px" @click="changeNav(0, '/profile')" :class="{'bg-blue-300': curIndex===0, 'text-white': curIndex===0}">
          <i class="iconfont icon-home"></i>
          <nuxt-link to="/profile">首页</nuxt-link>
        </div>
        <div class="cursor-pointer" style="height: 48px; line-height: 48px; padding-left: 30px" @click="changeNav(1, '/profile/userInfo')" :class="{'bg-blue-300': curIndex===1, 'text-white': curIndex===1}">
          <i class="iconfont icon-user"></i>
          <nuxt-link to="/profile/userInfo">个人信息</nuxt-link>
        </div>
        <div class="cursor-pointer" style="height: 48px; line-height: 48px; padding-left: 30px" @click="changeNav(2, '/profile/order')" :class="{'bg-blue-300': curIndex===2, 'text-white': curIndex===2}">
          <i class="iconfont icon-yuding"></i>
          <nuxt-link to="/profile/order">历史订单</nuxt-link>
        </div>
      </aside>

<!--      右边主体部分-->
      <section class="flex-1 bg-white rounded-r-2xl">
        <div class="w-full flex items-center border-b-2" style="height: 48px; line-height: 48px; padding-left: 30px">
          <div class="bg-blue-300" style="width: 4px;height: 16px; border-radius: 4px"></div>
          <span class="ml-3 text-xl text-blue-300">{{ curTitle }}</span>
        </div>
        <nuxt-child></nuxt-child>
      </section>
    </section>
  </div>
</template>

<script>
export default {
  name: "profile",
  data () {
    return {
      curIndex: 0
    }
  },
  computed: {
    curTitle() {
      let title
      switch (this.curIndex) {
        case 0: title = '首页';break;
        case 1: title = '个人中心';break;
        case 2: title = '历史订单';break;
      }
      return title
    }
  },

  methods: {
    changeNav(index, url) {
      this.curIndex = index
      this.$router.push(url)
    }
  }
}
</script>

<style scoped>

</style>
