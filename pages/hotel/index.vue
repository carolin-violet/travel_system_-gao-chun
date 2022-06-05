<template>
  <div class="hotel-container relative w-full h-full">
    <photoPanel :image-list="imageList"/>
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
      imageList: ['固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp','固城湖.webp']
    }
  },
  methods: {
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
