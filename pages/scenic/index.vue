<template>
  <div class="hotel-container relative w-full h-full">
    <photoPanel :image-list="scenicSpotList"/>
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
