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

export default {
  name: "index",
  components: {
    noticeComponent,
    pagination
  },
  data() {
    return {
      cur: 1,
      limit: 5,
      noticeList: []
    }
  },
  created() {
    this.getPageData()
  },
  methods: {
    async getPageData() {
      let res = await this.$axios.get(`notice/${this.cur}/${this.limit}`)
      this.noticeList = res.data.items
    }
  },
}
</script>

<style scoped>
.notice-container{
  background-color: #8EC5FC;
  background-image: linear-gradient(156deg, #8EC5FC 0%, #E0C3FC 50%, #a5b4fc 100%);
}
</style>
