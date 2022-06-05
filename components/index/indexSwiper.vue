<template>
<!--  首页景点轮播图-->
  <div v-swiper:mySwiper="swiperOption" style="width: 100%">
    <div class="swiper-wrapper">
      <div class="swiper-slide relative" v-for="item in list">
        <div class="absolute w-4/5 h-1/4 top-2/3 left-1/2 transform -translate-x-1/2 -translate-y-10 bg-gray-600 bg-opacity-0 text-center text-4xl text-white pt-10 opacity-0 transition-all hover:opacity-100 hover:bg-opacity-40 cursor-pointer">草堂</div>
        <div>
          <img
            :src="item"
            class="w100 mb-20"
            style="height: 352px; border-radius: 8px"
            alt=""
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      swiperOption: {
        loop: true,
        slidesPerView: 3,
        centeredSlides: false,
        spaceBetween: 20,
        autoplay: true,
        speed: 3000,
        parallax: true,
      },
    };
  },
  props: ["list"],
  mounted() {},
};
</script>


<style scoped>

</style>
