<template>
  <div class="">
    <detail :detailData="detailData"/>
  </div>
</template>

<script>
import detail from "@/components/detail";

export default {
  name: "scenic_detail",
  components: {
    detail
  },
  data() {
    return {
      detailData: {}
    }
  },
  created() {
    this.getDetail()
  },
  methods: {
    async getDetail(context) {
      let res = await context.app.$axios.get(`/scenic-spot/${this.$route.params.id}`)
      this.detailData = res.data
    }
  }
}
</script>

<style scoped>

</style>
