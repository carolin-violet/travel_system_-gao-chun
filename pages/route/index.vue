<template>
  <div class="route-container w-screen h-auto pt-48">
    <section class="w-4/5 h-auto mx-auto space-y-16 pb-16">
      <collapse v-for="(route, index) in items" :key='index'  :route="route"/>
    </section>
  </div>
</template>

<script>
import collapse from "@/components/index/collapse";

export default {
  name: "route",
  components: {
    collapse
  },
  data() {
    return {

    }
  },
  async asyncData(context) {
    let res = await context.app.$axios.get('/getRouteInfo')
    console.log(res.data)
    return res.data
  },
  head(){
    return{
      title:'推荐旅游线路',
      meta:[{
        'name':'keywords',
        'content': '固城湖、老街、慢城'
      }]
    }
  }

}
</script>

<style scoped>
.route-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);

}
</style>
