<template>
  <div class="w-4/5 h-96 bg-blue-400 mx-auto">
    <section class="float-left w-1/4 h-full overflow-hidden">
      <img class="w-full h-full transition duration-300 transform hover:scale-105" :src="notice.picture || '/固城湖.webp'" alt="">
    </section>

    <section class="float-left w-3/4 h-full text-2xl">
      <h1 class="text-center">{{ notice.name }}</h1>
      <h2 class="text-center">{{ notice.createTime }}</h2>
      <article>&nbsp;&nbsp;{{ notice.description }}</article>
    </section>
  </div>
</template>

<script>

export default {
  name: "noticeComponent",
  props:['notice']
}
</script>

<style scoped>

</style>
