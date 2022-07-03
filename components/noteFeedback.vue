<template>
  <div class="w-full h-auto bg-white my-6 rounded-2xl shadow-2xl p-4">
<!--    头像、昵称、时间信息-->
    <section class="w-full h-auto text-xl flex">
      <div class="w-16 h-20">
        <img class="inline-block w-12 h-12 rounded-full" src="@/assets/images/avatar.webp" alt="">
      </div>
      <div class="w-auto h-20 flex flex-col">
        <span class="">{{ item.nickName }}</span>
        <span class="">{{ item.time }}</span>
      </div>
    </section>
<!--    图片列表信息-->
    <section class="w-full h-auto space-x-5">
      <el-image
        v-for="photo in item.photos"
        :key="photo.id"
        style="width: 100px; height: 100px"
        :src="photo.picture"
        :preview-src-list="[photo.picture]">
      </el-image>
    </section>
<!--    描述内容-->
    <section class="w-full h-auto">
      {{ item.content }}
    </section>
  </div>
</template>

<script>
export default {
  name: "noteFeedback",
  props: ['item'],
  data() {
    return {
    }
  }
}
</script>

<style scoped>

</style>
