<template>
  <div class="notice-container relative w-screen h-auto pt-32 pb-6">
    <section class="w-full h-auto min-h-screen space-y-16">
      <noticeComponent v-for="notice in noticeList" :key="notice.id" :notice="notice"/>
    </section>
    <section class=" w-full h-auto mt-6">
      <pagination :cur="cur" :limit="limit" :total="total" :continueNum="continueNum" @changePage="changePage" class="mx-auto w-1/4"/>
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
      continueNum: 3,
      total: null,
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
      this.total = res.data.total
    },
    changePage(page) {
      this.cur = page
      this.getPageData()
    },
    head(){
      return{
        title:'慢城咨询',
        meta:[{
          'name':'keywords',
          'content': '公告、咨询、高淳国际慢城'
        }]
      }
    }

  },
}
</script>

<style scoped>
.notice-container{
  position: absolute;
  content: "";
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-image: url("assets/images/notice.webp");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: cover;
  background-position: center center;
}
</style>
