<template>
  <div class="overflow-x-hidden">
    <!--  公共头-->
    <MyHeader/>

    <nuxt/>

    <!--  公共底-->
    <MyFooter/>
    <aPlayer/>
  </div>
</template>

<script>
import MyHeader from "@/components/MyHeader";
import MyFooter from "@/components/MyFooter";
import aPlayer from "@/components/aPlayer"

export default {
  name: "default",
  components: {
    MyHeader,
    MyFooter,
    aPlayer
  },
  mounted() {
    ((window.gitter = {}).chat = {}).options = {
      room: 'carolin-violet/travel_gaochun'
    };
  }
}
</script>

<style scoped lang="sass">

</style>
