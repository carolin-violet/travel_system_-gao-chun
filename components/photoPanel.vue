<template>
  <div class="relative w-screen h-screen pt-32 px-16 overflow-scroll">
    <div v-for="(src, index) in imageList" :key="index" @click="toDetail(src)" class="relative w-1/5 h-80 bg-blue-400 float-left ml-24 mt-8">
      <img :src="src" alt="" class="absolute w-full h-full object-cover">
      <div class="absolute  bottom-0 w-full h-1/4 bg-black bg-opacity-50 text-white text-2xl truncate opacity-0 transition duration-700 hover:opacity-100 cursor-pointer">&nbsp;&nbsp;&nbsp;&nbsp;奥里给埃及克</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "photoPanel",
  props: ["imageList"],
  data() {
    return {

    }
  },
  methods:{
    toDetail(id) {
      this.$router.push({
        path: `${this.$route.fullPath}/${id}`
      })
    }
  }
}
</script>

<style scoped>

</style>
