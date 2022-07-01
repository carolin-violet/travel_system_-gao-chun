<template>
<!--  整体头部部分-->
  <div class="w-full h-auto absolute z-50">
    <header class="relative w-auto h-14">
<!--      logo-->
      <section class="absolute w-1/5 h-12 transform -translate-y-1/2">
        <h1><img class="h-32 w-32" src="/logo.png" alt="美丽高淳-南京后花园" title="美丽高淳-南京后花园"></h1>
      </section>
<!--      导航栏-->
      <section class="absolute w-3/5 h-14 left-1/2 transform -translate-x-1/2 inline-flex text-center items-center text-black font-serif text-3xl font-black">
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/" title="游高淳-首页">首页</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/hotel" title="游高淳-旅馆">旅馆</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/delicacy" title="游高淳-美食">美食</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/scenic" title="游高淳-景点">景点</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/route" title="游高淳-旅游线路">旅游路线</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/notice')">
          <a href="/notice" title="游高淳-公告">公告</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/note" title="游高淳-游记">游记</a>
        </div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200">
          <a href="/feedback" title="游高淳-反馈">反馈</a>
        </div>
      </section>
<!--      个人头像信息-->
      <section class="absolute w-1/6 h-14  right-5 pt-2 pl-32">
        <nuxt-link class="absolute left-16 " rel="nofollow" to="/shoppingCart"><i class="iconfont icon-gouwuchekong text-3xl"></i></nuxt-link>
        <span class="text-xl ml-3 text-white leading-10" v-if="userInfo.nickName">{{ userInfo.nickName }}</span>
        <a href="/login" class="text-xl text-white ml-3 leading-10" v-else>登录</a>
        <div class="relative float-left h-10 w-10 group">
          <img class="tourist-avatar h-10 w-10 rounded-full ring-2 ring-white" src="@/assets/images/avatar.webp" alt="">
          <div class="avatar-nav absolute w-24 h-18 pt-2 space-y-2 text-indigo-300 text-xl mt-1 pl-1 opacity-0 transition-all duration-300 group-hover:opacity-100">
            <div class="cursor-pointer"><a rel="nofollow" href="/profile" class="hover:underline">个人信息</a></div>
            <div class="cursor-pointer"><a href="/" class="hover:underline" @click="handleLogout">退出登录</a></div>
          </div>
        </div>
      </section>
    </header>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  name: "MyHeader",
  computed: {
    ...mapState({
      userInfo: state => state.userInfo
    })
  },
  methods: {
    handleLogout() {
      this.$store.commit('logout')
    }
  }
}
</script>

<style scoped>
.app-container{
  width: 100vw;
  height: auto;
}

.nav-item:after{
  position: absolute;
  content: "";
  width: 0;
  height: 2px;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  background-color: #c7d2fe;
  transition: all 0.5s;
  transition-delay: 0.2s;
}
.nav-item:hover:after{
  width: 60%;
}

</style>
