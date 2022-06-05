<template>
  <div class="route-container w-screen h-screen overflow-scroll pt-48">
    <section class="w-4/5 h-auto mx-auto space-y-16">
      <collapse :route="route"/>
      <collapse :route="route1"/>
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
      route: {title: "hi", reason: '奥里给', sites: [{site: '游子山', sort: 1, description: "aaa", startTime: '12:23:12', endTime: '19:32:54'},{site: '游子山', sort: 2, description: "aaa", startTime: '12:23:12', endTime: '19:32:54'}], showContent: false},
      route1: {title: "hi", reason: '奥里给', sites: [{site: '游子山', sort: 1, description: "aaa", startTime: '12:23:12', endTime: '19:32:54'},{site: '游子山', sort: 2, description: "aaa", startTime: '12:23:12', endTime: '19:32:54'}], showContent: false}
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
