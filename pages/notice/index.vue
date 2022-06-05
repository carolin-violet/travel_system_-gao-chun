<template>
  <div class="notice-container w-screen h-auto pt-32 pb-6">
    <section class="w-full h-auto space-y-16">
      <notice/>
      <notice/>
      <notice/>
      <notice/>
      <notice/>
    </section>
    <section class="w-full h-auto mt-6">
      <pagination/>
    </section>
  </div>
</template>

<script>
import notice from "@/components/notice";
import pagination from "@/components/pagination";

export default {
  name: "index",
  components: {
    notice,
    pagination
  }
}
</script>

<style scoped>
.notice-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
