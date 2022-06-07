<template>
<!--  首页景点轮播图-->
  <div v-swiper:mySwiper="swiperOption" style="width: 100%">
    <div class="swiper-wrapper">
      <div class="swiper-slide relative" v-for="item in list" :key="item.id">
        <div @click="toDetail(item.id)" class="absolute w-full h-1/4 top-2/3  transform -translate-y-10 bg-gray-600 bg-opacity-0 text-center text-4xl text-white pt-10 opacity-0 transition-all hover:opacity-100 hover:bg-opacity-40 cursor-pointer">{{item.name}}</div>
        <div>
          <img
            :src="item.picture"
            class="w-full mb-20 object-cover"
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
        on: {
          mouseover() {
            console.log("a")
          },
          mouseout() {
            console.log("b")
          }
        }
      },
    };
  },
  props: ["list", "mark"],
  methods: {
    // 查看详情
    toDetail(id) {
      console.log(this.mark)
      this.$router.push({
        path: `/${this.mark}/${id}`
      })
    },

  }
};
</script>


<style scoped>

</style>
