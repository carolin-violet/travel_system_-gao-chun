<template>
  <div class="hotel-container w-full h-full">
    <section class="bg-wrapper relative w-screen h-screen">
      <h1 class="absolute top-1/3 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-white text-9xl">欢迎浏览著名景点</h1>
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
.bg-wrapper{
  background: url("/bg3.webp") no-repeat center center/cover;
}
.photo-wrapper:before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  backdrop-filter: blur(6px);
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
