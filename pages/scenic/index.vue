<template>
  <div class="hotel-container w-full h-full">
    <section class="bg-wrapper relative w-screen h-screen overflow-hidden">
      <h1 class="scenic-title absolute top-1/3 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-white text-9xl z-10">欢迎浏览著名景点</h1>
      <i class="iconfont icon-rcd-angle-double-down  absolute bottom-8 left-1/2 transform -translate-x-1/2 text-9xl text-white cursor-pointer z-10" @click="moveBottom"></i>
      <img src="@/assets/images/bg3.webp" alt="" class="img-container object-cover">
    </section>
    <photoPanel class="photo-wrapper relative" :image-list="scenicSpotList"/>
  </div>
</template>

<script>
import photoPanel from "@/components/photoPanel";

export default {
  name: "scenic",
  components: {
    photoPanel
  },
  data() {
    return {
    }
  },
  methods: {
    moveBottom() {
      window.scroll({
        top: window.innerHeight,
        behavior: 'smooth'
      })
    }
  },
  async asyncData(context) {
    let res = await context.app.$axios.get("/scenic-spots")
    return res.data
  },
  head(){
    return{
      title:'高淳景点',
      meta:[{
        'name':'keywords',
        'content': '慢城、遗址、老街、古村落'
      }]
    }
  }

}
</script>

<style scoped>

.img-container{
  animation: move 4s infinite;
}
@keyframes move {
  0%{transform: scale(1)}
  45%{transform: scale(1.01)}
  55%{transform: scale(1.01)}
  100%{transform: scale(1)}
}


.scenic-title{
  font-family: "方正字迹-吕建德行楷繁体";
}

.photo-wrapper:before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  backdrop-filter: blur(6px);
  background-image: linear-gradient(180deg, rgb(44, 150, 120), rgb(229, 255, 199));
}
</style>
