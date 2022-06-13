<template>
  <div class="hotel-container w-full h-full">
    <section class="show-container relative w-screen h-screen flex justify-center items-center">
      <div class="show-item absolute border-white transform hover:scale-110 transition-transform duration-500 z-10"><img src="/delicacy1.webp" alt="" class="w-full h-full object-cover"></div>
      <div class="show-item absolute border-white transform hover:scale-110 transition-transform duration-500 translate-x-1/3 translate-y-1/3 origin-top-right -rotate-12"><img src="/delicacy2.webp" alt="" class="w-full h-full object-cover"></div>
      <div class="show-item absolute border-white transform hover:scale-110 transition-transform duration-500 translate-x-1/2 -translate-y-1/2 origin-bottom-left rotate-6"><img src="/delicacy3.webp" alt="" class="w-full h-full object-cover"></div>
      <div class="show-item absolute border-white transform hover:scale-110 transition-transform duration-500 -translate-x-1/2 translate-y-1/2 rotate-12"><img src="/delicacy4.webp" alt="" class="w-full h-full object-cover"></div>
      <div class="show-item absolute border-white transform hover:scale-110 transition-transform duration-500 -translate-x-1/2 -translate-y-1/3 origin-top-left -rotate-12"><img src="/delicacy5.webp" alt="" class="w-full h-full object-cover"></div>
    </section>
    <photoPanel class="photo-container relative" :image-list="delicacyList"/>

    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#fda085" fill-opacity="1" d="M0,64L34.3,80C68.6,96,137,128,206,117.3C274.3,107,343,53,411,32C480,11,549,21,617,48C685.7,75,754,117,823,154.7C891.4,192,960,224,1029,224C1097.1,224,1166,192,1234,176C1302.9,160,1371,160,1406,160L1440,160L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path></svg>
  </div>
</template>

<script>
import photoPanel from "@/components/photoPanel";

export default {
  name: "delicacy",
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
    let res = await context.app.$axios.get("/delicacies")
    return res.data
  },
  head(){
    return{
      title:'高淳美食',
      meta:[{
        'name':'keywords',
        'content': '大闸蟹、蟹黄汤包、固城湖水八仙'
      }]
    }
  }
}
</script>

<style scoped>

.show-container{
  background-image: linear-gradient(to bottom, #e2d1c3 0%, #fda085 100%);
}

.show-item{
  width: 600px;
  height: 400px;
}
.show-item:hover{
  z-index: 20;
}


.photo-container:before{
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  backdrop-filter: blur(6px);
  background-image: linear-gradient(to bottom, #fda085 0%, #fff 100%);
}

</style>
