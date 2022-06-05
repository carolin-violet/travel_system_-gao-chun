<template>
  <div class="relative w-screen h-screen bg-purple-200">
    <div class="absolute w-full h-auto mt-48 ml-48">
      <collapse/>
    </div>
  </div>
</template>

<script>
import collapse from "@/components/index/collapse";

export default {
  name: "test",
  components: {
    collapse
  }
}
</script>

<style scoped>

</style>
