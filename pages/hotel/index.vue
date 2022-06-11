<template>
  <div class="hotel-container relative w-full h-full">
    <photoPanel :image-list="hotelList"/>
  </div>
</template>

<script>
import photoPanel from "@/components/photoPanel";

export default {
  name: "hotel",
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
    let res = await context.app.$axios.get('/hotels')
    return res.data
  },
  head(){
    return{
      title:'高淳旅馆',
      meta:[{
        'name':'keywords',
        'content': '民宿、酒店、度假村'
      }]
    }
  }

}
</script>

<style scoped>
.hotel-container:before{
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
