<template>
  <div class="notice-container w-screen h-auto pt-32 pb-6">
    <section class="w-full h-auto space-y-16">
      <noticeComponent v-for="notice in noticeList" :key="notice.id" :notice="notice"/>
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
  created() {
    this.getPageData()
  },
  data() {
    return {
      cur: 1,
      limit: 5,
      noticeList: []
    }
  },
  methods: {
    async getPageData() {
      let res = await getNotice(this.cur, this.limit)
      this.noticeList = res.data.items
    }
  }
}
</script>

<style scoped>
.notice-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
