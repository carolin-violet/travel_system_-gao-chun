<template>
  <div class="hotel-container relative w-full h-full">
    <photoPanel :image-list="delicacyList"/>
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
