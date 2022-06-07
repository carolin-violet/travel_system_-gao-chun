<template>
  <div class="relative w-screen h-full min-h-screen pt-32 px-16 overflow-scroll">
    <div v-for="item in imageList" :key="item.id" @click="toDetail(item.id)" class="relative w-1/5 h-80 bg-blue-400 float-left ml-24 mt-8">
      <img :src="item.picture" alt="" class="absolute w-full h-full object-cover">
      <div class="absolute  bottom-0 w-full h-1/4 bg-black bg-opacity-50 text-white text-2xl truncate opacity-0 transition duration-700 hover:opacity-100 cursor-pointer">&nbsp;&nbsp;&nbsp;&nbsp;{{ item.name }}</div>
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
