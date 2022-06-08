<template>
  <div class="w-96 h-16 mx-auto">
    <span class="inline-block w-20 h-12 text-center rounded-2xl bg-indigo-300 bg-opacity-80 leading-10 cursor-pointer">上一页</span>
    <span class="inline-block w-12 h-12 text-center rounded-full bg-indigo-300 bg-opacity-80 leading-10 cursor-pointer">1</span>
    <span class="inline-block w-12 h-12 text-center rounded-full bg-indigo-300 bg-opacity-80 leading-10 cursor-pointer">2</span>
    <span class="inline-block w-12 h-12 text-center rounded-full bg-indigo-300 bg-opacity-80 leading-10 cursor-pointer">3</span>
    <span class="inline-block w-20 h-12 text-center rounded-2xl bg-indigo-300 bg-opacity-80 leading-10 cursor-pointer">下一页</span>
  </div>
</template>

<script>
export default {
  name: "pagination",
  props: ['total', 'cur', 'limit']
}
</script>

<style scoped>

</style>
