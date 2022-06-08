<template>
  <div class="notice-container w-screen h-auto pt-32 pb-6">
    <section class="w-full h-auto space-y-16">
      <noticeComponent/>
      <noticeComponent/>
      <noticeComponent/>
      <noticeComponent/>
      <noticeComponent/>
    </section>
    <section class="w-full h-auto mt-6">
      <pagination/>
    </section>
  </div>
</template>

<script>
import noticeComponent from "~/components/noticeComponent";
import pagination from "@/components/pagination";
import {getNotice} from "@/api";

export default {
  name: "index",
  components: {
    noticeComponent,
    pagination
  },
  async asyncData() {
    let res = await getNotice()
    console.log(res.data)
    return res.data
  }
}
</script>

<style scoped>
.notice-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
