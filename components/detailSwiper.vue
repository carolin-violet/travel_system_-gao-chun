<template>
<!--  我的轮播图组件，第一张和最后一张都是一样的-->
  <div class="w-full h-full overflow-x-hidden">
    <div class="image-container h-full">
      <img v-for="img in imageList" :src="img" alt="" class="w-1/5 h-full object-cover float-left">
    </div>
  </div>
</template>

<script>
import {getRandomList ,fillList} from "@/utils/arrayUtil";

export default {
  name: "detailSwiper",
  props: ['photosList'],
  computed: {
    imageList() {
      if (this.photosList === undefined) {
        return []
      }
      let list = []
      for (const photo of this.photosList) {
        list.push(photo.picture)
      }

      let newList = []

      // 多于4张照片就随机取4张
      if (list.length > 4) {
        newList = getRandomList(list, 4)
      } else if (list.length < 4) { //少于4张照片就补齐4张
        newList = fillList(list, 4)
      } else {
        newList = list
      }
      newList.push(newList[0])
      return newList
    }
  },
  methods: {
  }
}
</script>

<style scoped>
.image-container{
  width: calc(100% * 5);
  animation: swiper 10s infinite;
}

@keyframes swiper {
  0%{transform: translateX(0)}
  10%{transform: translateX(0)}
  25%{transform: translateX(-20%)}
  35%{transform: translateX(-20%)}
  50%{transform: translateX(-40%)}
  60%{transform: translateX(-40%)}
  75%{transform: translateX(-60%)}
  85%{transform: translateX(-60%)}
  100%{transform: translateX(-80%)}
}

</style>
