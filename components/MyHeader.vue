<template>
<!--  整体头部部分-->
  <div class="w-full h-auto absolute z-50">
    <header class="relative w-auto h-14">
<!--      logo-->
      <section class="absolute w-1/5 h-12 transform -translate-y-1/2">
        <img class="h-32 w-32" src="logo.png" alt="">
      </section>
<!--      导航栏-->
      <section class="absolute w-3/5 h-14 left-1/2 transform -translate-x-1/2 inline-flex text-center items-center text-white  font-serif text-3xl font-black">
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/')">首页</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/hotel')">旅馆</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/delicacy')">美食</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/scenic')">景点</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/route')">旅游路线</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/notice')">公告</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/note')">游记</div>
        <div class="nav-item relative flex-1 cursor-pointer hover:text-indigo-200" @click="$router.push('/feedback')">反馈</div>
      </section>
<!--      个人头像信息-->
      <section class="absolute w-1/6 h-14  right-5 pt-2 pl-32">
        <span class="text-xl ml-2 text-white">游客***********</span>
        <img class="float-left h-10 w-10 rounded-full ring-2 ring-white" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
      </section>
    </header>
  </div>
</template>

<script>
export default {
  name: "MyHeader"
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
