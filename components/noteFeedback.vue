<template>
  <div class="w-full h-auto">
<!--    头像、昵称、时间信息-->
    <section class="w-full h-auto text-xl">
      <div class="w-full h-auto">
        <img class="inline-block w-12 h-12 rounded-full" src="/固城湖.webp" alt="">
        <span class="inline-block leading-10">昵称</span>
      </div>
      <div>
        时间
      </div>
    </section>
<!--    图片列表信息-->
    <section class="w-full h-auto space-x-5">
      <el-image
        v-for="(src, index) in srcList"
        :key="index"
        style="width: 100px; height: 100px"
        :src="src"
        :preview-src-list="srcList">
      </el-image>
    </section>
<!--    描述内容-->
    <section class="w-full h-auto">
      具体内容
    </section>
  </div>
</template>

<script>
export default {
  name: "noteFeedback",
  data() {
    return {
      srcList: ['/固城湖.webp', '/高淳老街.jpg', '/bg1.webp', '/固城湖.webp']
    }
  }
}
</script>

<style scoped>

</style>
